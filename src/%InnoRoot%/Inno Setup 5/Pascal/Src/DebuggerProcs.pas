unit DebuggerProcs;

{
  Inno Pascal
  Copyright (C) 2000 Jordan Russell

  www:    http://www.jrsoftware.org/
          or http://www.jordanr.cjb.net/
  email:  jr@jrsoftware.org

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

// created 2000-09-27 by Michael Hieke, mghie@gmx.net,
// based on code Copyright Matt Pietrek 1995

interface

uses
  Windows;

function DebugReadProcessMemory(AProcess: THandle; const ABaseAddress: Pointer;
  ABuffer: Pointer; ASize: DWORD): boolean;
function DebugProcessGetModuleName(AProcess: THandle;
  AModuleAsPtr: Pointer): string;
function DebugGetPreferredLoadAddress(AProcess: THandle;
  AModuleAsPtr: Pointer): Pointer;

implementation

function DebugReadProcessMemory(AProcess: THandle; const ABaseAddress: Pointer;
  ABuffer: Pointer; ASize: DWORD): boolean;
var
  BytesRead: DWORD;
begin
  Result := ReadProcessMemory(AProcess, ABaseAddress, ABuffer, ASize, BytesRead) and
    (BytesRead = ASize);
end;

function GetModuleHeader(AProcess: THandle; AModuleAsPtr: Pointer;
  AImageNTHeaders: PImageNtHeaders): boolean;
var
  DH: TImageDosHeader;
begin
  if DebugReadProcessMemory(AProcess, AModuleAsPtr, @DH, SizeOf(TImageDosHeader)) then
    Result := DebugReadProcessMemory(AProcess, Pointer(DWORD(AModuleAsPtr) +
      DWORD(DH._lfanew)), AImageNTHeaders, SizeOf(TImageNTHeaders))
  else
    Result := FALSE;
end;

function DebugProcessGetModuleName(AProcess: THandle; AModuleAsPtr: Pointer): string;
var
  IH: TImageNtHeaders;
  IED: TImageExportDirectory;
  ExportsRVA: DWORD;
  s: string;
begin
  Result := '<unknown>';
  if GetModuleHeader(AProcess, AModuleAsPtr, @IH) then begin
    ExportsRVA := IH.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress;
    if (ExportsRVA <> 0) and DebugReadProcessMemory(AProcess,
       Pointer(DWORD(AModuleAsPtr) + ExportsRVA), @IED, SizeOf(TImageExportDirectory)) then
    begin
      SetLength(s, 64);
      if DebugReadProcessMemory(AProcess, Pointer(DWORD(AModuleAsPtr) + IED.Name), @s[1], 64) then
        Result := PChar(s);
    end;
  end;
end;

function DebugGetPreferredLoadAddress(AProcess: THandle; AModuleAsPtr: Pointer): Pointer;
var
  IH: TImageNtHeaders;
begin
  if GetModuleHeader(AProcess, AModuleAsPtr, @IH) then
    Result := Pointer(IH.OptionalHeader.ImageBase)
  else
    Result := nil;
end;

end.
