unit Linker;

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

{$I+}

interface

uses
  Compiler;

type
  PLineNumberInfoArray = ^TLineNumberInfoArray;
  TLineNumberInfoArray = array[1..$1FFFFFFF] of Cardinal;

  TIPLinker = class
  private
    FOutFile: String;
    procedure WritePEHeader (const Compiler: TIPCompiler;
      const LineNumberInfo: PLineNumberInfoArray; var F: File);
    function DoLink (const Compiler: TIPCompiler;
      const LineNumberInfo: PLineNumberInfoArray): Cardinal;
  end;

function IPCompileAndLink (const Filename: String; const Src: PChar;
  const OutFile: String; TotalLines: Integer;
  var LineNumberInfo: PLineNumberInfoArray;
  const StatusProc: TCompilerStatusProc): Cardinal;

implementation

uses
  Windows, SysUtils, Common, CodeX86;

type
  PImageImportDescriptor = ^TImageImportDescriptor;
  TImageImportDescriptor = packed record
    Characteristics: DWORD;
     { ^ union OriginalFirstThunk: DWORD;}
    TimeDateStamp: DWORD;
    ForwarderChain: DWORD;
    Name: DWORD;
    FirstThunk: DWORD;
  end;

const
  xFileAlignment = $200;


procedure WriteZeroes (var F: File; Count: Cardinal);
var
  Buf: array[0..4095] of Byte;
  C: Cardinal;
begin
  FillChar (Buf, SizeOf(Buf), 0);
  while Count <> 0 do begin
    C := Count;
    if C > SizeOf(Buf) then C := SizeOf(Buf);
    BlockWrite (F, Buf, C);
  end;
end;

function IPCompileAndLink (const Filename: String; const Src: PChar;
  const OutFile: String; TotalLines: Integer;
  var LineNumberInfo: PLineNumberInfoArray;
  const StatusProc: TCompilerStatusProc): Cardinal;
var
  Linker: TIPLinker;
  Comp: TIPCompiler;
begin
  GetMem (LineNumberInfo, TotalLines * SizeOf(Cardinal));
  try
    FillChar (LineNumberInfo^, TotalLines * SizeOf(Cardinal), $FF);  { fill with -1 }
    Comp := TIPCompiler.Create;
    try
      Comp.DoCompile (Filename, Src, StatusProc);
      Linker := TIPLinker.Create;
      try
        Linker.FOutFile := OutFile;
        Result := Linker.DoLink(Comp, LineNumberInfo);
      finally
        Linker.Free;
      end;
    finally
      Comp.Free;
    end;
  except
    FreeMem (LineNumberInfo);
    LineNumberInfo := nil;
    raise;
  end;
end;


{ TIPLinker }

function TIPLinker.DoLink (const Compiler: TIPCompiler;
  const LineNumberInfo: PLineNumberInfoArray): Cardinal;
var
  F: File;
begin
  AssignFile (F, FOutFile);
  FileMode := fmOpenReadWrite or fmShareExclusive;
  {$I-}
  Rewrite (F, 1);
  {$I+}
  if IOResult <> 0 then begin
    { Sometimes the EXE is still in use if it was terminated right before
      DoLink was called again. Delay 100 msec and try again. }
    Sleep (100);
    Rewrite (F, 1);
  end;
  try
    WritePEHeader (Compiler, LineNumberInfo, F);
    Result := FileSize(F);
  finally
    CloseFile (F);
  end;
end;

procedure TIPLinker.WritePEHeader (const Compiler: TIPCompiler;
  const LineNumberInfo: PLineNumberInfoArray; var F: File);

  procedure PadForFileAlignment;
  var
    I: Integer;
    Slack: array[0..xFileAlignment-1] of Byte;
  begin
    I := xFileAlignment - (FilePos(F) mod xFileAlignment);
    if I > 0 then begin
      FillChar (Slack, I, 0);
      BlockWrite (F, Slack, I);
    end;
  end;

const
  PESig: DWORD = $00004550;

  DOSStub: array[0..111] of Byte = (
    $4D, $5A, $6C, $00, $01, $00, $00, $00, $04, $00, $11, $00, $FF, $FF,
    $03, $00, $00, $01, $00, $00, $00, $00, $00, $00, $40, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $70, $00, $00, $00, $0E, $1F, $BA, $0E, $00, $B4,
    $09, $CD, $21, $B8, $00, $4C, $CD, $21, $54, $68, $69, $73, $20, $70,
    $72, $6F, $67, $72, $61, $6D, $20, $72, $65, $71, $75, $69, $72, $65,
    $73, $20, $57, $69, $6E, $33, $32, $0D, $0A, $24, $2D, $49, $50, $2D);

  IDataRVA = $1000;
  CodeRVA = $2000;
  BSSRVA = $3000;
var
  PEHeader: TImageFileHeader;
  OptHeader: TImageOptionalHeader;
  Sec: TImageSectionHeader;
  ImportDir: array of TImageImportDescriptor;
  LookupTableRVA, AddressTableRVA, NameTableRVA: DWORD;
  LookupTable: array of DWORD;
  NameTable: String;

  function AllocName (const IsFuncName: Boolean; const S: String): DWORD;
  begin
    Result := NameTableRVA + DWORD(Length(NameTable));
    if not IsFuncName then
      NameTable := NameTable + S + #0
    else
      NameTable := NameTable + #0#0 + S + #0;
    if Length(NameTable) and 1 <> 0 then  { need word alignment }
      NameTable := NameTable + #0;
  end;

label 1;
var
  I, J, D: Integer;
  L: Cardinal;
  TotalCode, OptHeaderOfs, IDataOfs, IDataSize: Cardinal;
  HasCalledProcs: Boolean;
  FuncData: PFuncData;
  ConstSectionOffset: Cardinal;
  LineNumberRec: PLineNumberRec;
begin
  BlockWrite (F, DOSStub, SizeOf(DOSStub));

  BlockWrite (F, PESig, SizeOf(PESig));

  FillChar (PEHeader, SizeOf(PEHeader), 0);
  PEHeader.Machine := IMAGE_FILE_MACHINE_I386;
  PEHeader.NumberOfSections := 3; {FIXME}
  PEHeader.TimeDateStamp := 0;
  PEHeader.PointerToSymbolTable := 0;
  PEHeader.NumberOfSymbols := 0;
  PEHeader.SizeOfOptionalHeader := SizeOf(OptHeader);
  PEHeader.Characteristics := $818E or IMAGE_FILE_RELOCS_STRIPPED;
  BlockWrite (F, PEHeader, SizeOf(PEHeader));

  FillChar (OptHeader, SizeOf(OptHeader), 0);
  OptHeader.Magic := $010B;
  OptHeader.MajorLinkerVersion := 0;
  OptHeader.MinorLinkerVersion := 0;
  OptHeader.SizeOfCode := 0;  { set later }
  OptHeader.SizeOfInitializedData := 0;
  OptHeader.SizeOfUninitializedData := 0;
  OptHeader.AddressOfEntryPoint := CodeRVA; {FIXME}
  OptHeader.BaseOfCode := CodeRVA; {FIXME}
  OptHeader.BaseOfData := 0;//$1000; {FIXME}
  OptHeader.ImageBase := $400000;
  OptHeader.SectionAlignment := $1000;
  OptHeader.FileAlignment := xFileAlignment;
  OptHeader.MajorOperatingSystemVersion := 1;
  OptHeader.MinorOperatingSystemVersion := 0;
  OptHeader.MajorImageVersion := 0;
  OptHeader.MajorImageVersion := 0;
  OptHeader.MajorSubsystemVersion := 4;
  OptHeader.Win32VersionValue := 0;
  OptHeader.SizeOfImage := $1000 {address of first section} +
   $3000;
//    (DWORD(PEHeader.NumberOfSections) * OptHeader.SectionAlignment); {FIXME}
    { ^ won't handle sections with size > OptHeader.SectionAlignment properly }
  OptHeader.SizeOfHeaders := $200; //FilePos(F) + SizeOf(OptHeader); {test}
  OptHeader.CheckSum := 0;
  if not Compiler.LinkOptions.ConsoleApp then
    OptHeader.Subsystem := IMAGE_SUBSYSTEM_WINDOWS_GUI
  else
    OptHeader.Subsystem := IMAGE_SUBSYSTEM_WINDOWS_CUI;
  OptHeader.DllCharacteristics := 0;
  OptHeader.SizeOfStackReserve := $100000;
  OptHeader.SizeOfStackCommit := $4000;
  OptHeader.SizeOfHeapReserve := $100000;
  OptHeader.SizeOfHeapCommit := $1000;
  OptHeader.LoaderFlags := 0;
  OptHeader.NumberOfRvaAndSizes := IMAGE_NUMBEROF_DIRECTORY_ENTRIES;
  OptHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress := IDataRVA;
  OptHeaderOfs := FilePos(F);
  BlockWrite (F, OptHeader, SizeOf(OptHeader));

  FillChar (Sec, SizeOf(Sec), 0);
  StrPCopy (@Sec.Name, '.idata');
  Sec.Misc.VirtualSize := $1000;
  Sec.VirtualAddress := IDataRVA;
  Sec.SizeOfRawData := $200;  { must be multiple of file alignment }
  Sec.PointerToRawData := $200;
  Sec.Characteristics := IMAGE_SCN_CNT_INITIALIZED_DATA or IMAGE_SCN_MEM_READ or
    IMAGE_SCN_MEM_WRITE;
  BlockWrite (F, Sec, SizeOf(Sec));

  FillChar (Sec, SizeOf(Sec), 0);
  StrPCopy (@Sec.Name, '.text');
  Sec.Misc.VirtualSize := $1000;
  Sec.VirtualAddress := CodeRVA;
  Sec.SizeOfRawData := $200;  { must be multiple of file alignment }
  Sec.PointerToRawData := $400;
  Sec.Characteristics := IMAGE_SCN_CNT_CODE or IMAGE_SCN_MEM_EXECUTE or
    IMAGE_SCN_MEM_READ;
  BlockWrite (F, Sec, SizeOf(Sec));

  (*FillChar (Sec, SizeOf(Sec), 0);
  StrPCopy (@Sec.Name, '.reloc');
  Sec.Misc.VirtualSize := $1000;
  Sec.VirtualAddress := $2000;
  Sec.SizeOfRawData := $200;  { must be multiple of file alignment }
  Sec.PointerToRawData := 0;
  Sec.Characteristics := //$50000040  <- wrong?
    IMAGE_SCN_CNT_INITIALIZED_DATA or IMAGE_SCN_MEM_READ or IMAGE_SCN_MEM_DISCARDABLE;
  BlockWrite (F, Sec, SizeOf(Sec));*)

  FillChar (Sec, SizeOf(Sec), 0);
  StrPCopy (@Sec.Name, '.bss');
  Sec.Misc.VirtualSize := Compiler.DataSectionSize; //$1000;
  Sec.VirtualAddress := BSSRVA;
  Sec.SizeOfRawData := 0;  { must be multiple of file alignment }
  Sec.PointerToRawData := $400;
  Sec.Characteristics := IMAGE_SCN_CNT_UNINITIALIZED_DATA or IMAGE_SCN_MEM_READ or
    IMAGE_SCN_MEM_WRITE;
  BlockWrite (F, Sec, SizeOf(Sec));

  PadForFileAlignment;

  { -- IMPORT TABLE -- }

  NameTable := '';
  D := 0;
  L := 0;
  for I := 0 to Compiler.DLLList.Count-1 do begin
    HasCalledProcs := False;
    for J := 0 to Compiler.Funcs.Count-1 do begin
      FuncData := Compiler.Funcs[J];
      if (FuncData.DLLIndex = I) and FuncData.Called then begin
        HasCalledProcs := True;
        Inc (L);
      end;
    end;
    if HasCalledProcs then begin
      Inc (L);
      Compiler.DLLList.Objects[I] := Pointer(1);  { non-zero means the DLL is used }
      Inc (D);
    end;
  end;
  SetLength (ImportDir, D + 1);
  SetLength (LookupTable, L);

  LookupTableRVA := IDataRVA + (Length(ImportDir) * SizeOf(ImportDir[0]));
  AddressTableRVA := LookupTableRVA + (Cardinal(Length(LookupTable)) * SizeOf(LookupTable[0]));
  NameTableRVA := AddressTableRVA + (Cardinal(Length(LookupTable)) * SizeOf(LookupTable[0]));

  FillChar (ImportDir[0], Length(ImportDir) * SizeOf(ImportDir[0]), 0);
  L := 0;
  D := 0;
  for I := 0 to Compiler.DLLList.Count-1 do begin
    if Compiler.DLLList.Objects[I] = nil then   { Objects[I] will be zero if DLL isn't used }
      Continue;
    ImportDir[D].Characteristics := LookupTableRVA + (L * SizeOf(DWORD));
    ImportDir[D].Name := AllocName(False, Compiler.DLLList[I]);
    ImportDir[D].FirstThunk := AddressTableRVA + (L * SizeOf(DWORD));
    for J := 0 to Compiler.Funcs.Count-1 do begin
      FuncData := PFuncData(Compiler.Funcs[J]);
      if (FuncData.DLLIndex = I) and FuncData.Called then begin
        LookupTable[L] := AllocName(True, FuncData.ImportName);
        FuncData.CodeGen := TX86CodeGen.Create;
        FuncData.CodeGen.ImportThunk (OptHeader.ImageBase + AddressTableRVA +
          (L * SizeOf(DWORD)));
        Inc (L);
      end;
    end;
    LookupTable[L] := 0;
    Inc (L);
    Inc (D);
  end;

  IDataOfs := FilePos(F);
  BlockWrite (F, ImportDir[0], Length(ImportDir) * SizeOf(ImportDir[0]));
  BlockWrite (F, LookupTable[0], Length(LookupTable) * SizeOf(LookupTable[0]));
  BlockWrite (F, LookupTable[0], Length(LookupTable) * SizeOf(LookupTable[0]));
  BlockWrite (F, PChar(NameTable)^, Length(NameTable));
  IDataSize := Cardinal(FilePos(F)) - IDataOfs;
  if IDataSize > $200 then
    raise Exception.Create('Too many imports'); {}
  PadForFileAlignment;

  { -- CODE -- }

  { Calculate total size of code section, and assign each used function a
    relative address }
  TotalCode := 0;
  for I := 0 to Compiler.Funcs.Count-1 do begin
    FuncData := Compiler.Funcs[I];
    if FuncData.Called and Assigned(FuncData.CodeGen) then begin
      FuncData.Address := TotalCode;
      Inc (TotalCode, Length(FuncData.CodeGen.Code));
      for J := 0 to FuncData.CodeGen.LineNumbers.Count-1 do begin
        LineNumberRec := FuncData.CodeGen.LineNumbers[J];
        if LineNumberInfo[LineNumberRec.LineNum] = $FFFFFFFF then
          LineNumberInfo[LineNumberRec.LineNum] := CodeRVA + FuncData.Address +
            LineNumberRec.CodeAddr;
      end;
    end;
  end;
  ConstSectionOffset := TotalCode;
  Inc (TotalCode, Length(Compiler.ConstSection));
  if TotalCode > $200 then
    raise Exception.Create('Too much code'); {}

  { Apply fixups }
  for I := Compiler.Funcs.Count-1 downto 0 do begin
    FuncData := Compiler.Funcs[I];
    if FuncData.Called and Assigned(FuncData.CodeGen) then begin
      FuncData.CodeGen.ApplyFixups (Compiler.Funcs,
        FuncData.Address,
        OptHeader.ImageBase + CodeRVA,
        OptHeader.ImageBase + CodeRVA + ConstSectionOffset,
        OptHeader.ImageBase + BSSRVA);
    end;
  end;

  { Write out all functions, then constants }
  for I := 0 to Compiler.Funcs.Count-1 do begin
    FuncData := Compiler.Funcs[I];
    if FuncData.Called and Assigned(FuncData.CodeGen) then
      BlockWrite (F, PChar(FuncData.CodeGen.Code)^, Length(FuncData.CodeGen.Code));
  end;
  BlockWrite (F, PChar(Compiler.ConstSection)^, Length(Compiler.ConstSection));
  PadForFileAlignment;

  { -- FINALIZE -- }

  { Go back and rewrite opt header with correct section sizes }

  OptHeader.SizeOfCode := TotalCode;
  OptHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size := IDataSize;
  Seek (F, OptHeaderOfs);
  BlockWrite (F, OptHeader, SizeOf(OptHeader));
end;

end.
