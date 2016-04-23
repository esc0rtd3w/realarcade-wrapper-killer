unit IPascal;

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

interface

{ Main application interface }

uses
  Compiler, Common, IPBase;

const
  InnoPascalVersion = '0.1.5';

function IPCompileAndLink (const Filename: String; const Src: PChar;
  const OutFile: String; TotalLines: Integer;
  var LineNumberInfo: PLineNumberInfoArray;
  const StatusProc: TCompilerStatusProc; const LinkerClass: TIPLinkerClass;
  const CodeGenClass: TIPCodeGenClass): Cardinal;

implementation

function IPCompileAndLink (const Filename: String; const Src: PChar;
  const OutFile: String; TotalLines: Integer;
  var LineNumberInfo: PLineNumberInfoArray;
  const StatusProc: TCompilerStatusProc; const LinkerClass: TIPLinkerClass;
  const CodeGenClass: TIPCodeGenClass): Cardinal;
var
  Linker: TIPCustomLinker;
  Comp: TIPCompiler;
begin
  GetMem (LineNumberInfo, TotalLines * SizeOf(Cardinal));
  try
    FillChar (LineNumberInfo^, TotalLines * SizeOf(Cardinal), $FF);  { fill with -1 }
    Linker := LinkerClass.Create;
    try
      Comp := TIPCompiler.Create;
      try
        Comp.DoCompile (Linker, CodeGenClass, Filename, Src, StatusProc);
        Result := Linker.DoLink(OutFile, LineNumberInfo);
      finally
        Comp.Free;
      end;
    finally
      Linker.Free;
    end;
  except
    FreeMem (LineNumberInfo);
    LineNumberInfo := nil;
    raise;
  end;
end;

end.
