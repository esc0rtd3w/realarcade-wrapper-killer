unit Common;

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

{ Common declarations for compiler, linker, and code generator }

uses
  SysUtils, Classes, IPBase;

const
  MaxParams = 10;

type
  TSize = type Cardinal;

  PVarAddr = ^TVarAddr;
  TVarAddr = type Cardinal;         { address relative to start of data section }
  TConstAddr = type Cardinal;       { address relative to start of constant section }
  TCodeAddr = type Cardinal;        { address relative to start of code section }
  TFuncCodeAddr = type Cardinal;    { address relative to start of a function }
  TVirtualAddress = type Cardinal;  { absolute address }

  THugeint = Int64;

  PLineNumberRec = ^TLineNumberRec;
  TLineNumberRec = record
    LineNum: Cardinal;
    CodeAddr: TFuncCodeAddr;
  end;

  TTypeKind = (kdInteger, kdString, kdRecord);

  TExprValue = record
    case Integer of
      0: (AsInteger: THugeint);
      1: (AsConstAddress: TConstAddr);
      2: (AsVarAddress: TVarAddr);
  end;

  TExprOp = (eoPushImm, eoPushVar, eoPushStrConst, eoPushAddrOfVar, eoPushCall,
    eoAdd, eoSubtract, eoMultiply, eoDivide, eoMod);

  PCallData = ^TCallData;

  { A TExprRec specifies either an operand or an operator in an expression.
    If Op is eoPush*, it is an operand, otherwise it is an operator. } 
  PExprRec = ^TExprRec;
  TExprRec = record
    Next, Prev: PExprRec;
    Kind: TTypeKind;  { not applicable to eoPush* }
    Op: TExprOp;
    Flags: set of (efNegate);  { efNegate is only valid for eoPushVar and eoPushCall }
    ValueStr: String;
    CallData: PCallData;
    Value: TExprValue;
  end;

  TExpression = record
    First, Last: PExprRec;
  end;

  TCallData = record
    FuncIndex: Integer;
    ParamCount: Integer;
    ParamExpr: array[0..MaxParams-1] of TExpression;
  end;

  TIPCustomCodeGen = class;

  PFuncData = ^TFuncData;
  TFuncData = record
    DLLIndex: Integer;   { -1 if the function isn't external }
    ImportName: String;
    CodeGen: TIPCustomCodeGen;
    Address: TCodeAddr;
    Called: Boolean;
  end;

  TMyStringList = class(TStringList)
  public
    function IndexOf (const S: String): Integer; override;
  end;

  TIPLinkerClass = class of TIPCustomLinker;
  TIPCustomLinker = class
  protected
    ConstSection: AnsiString;
  public
    LinkOptions: record
      ConsoleApp: Boolean;
    end;
    DataSectionSize: TSize;
    DLLList: TMyStringList;
    Funcs: TList;
    constructor Create;
    destructor Destroy; override;
    function DoLink (const OutFile: String;
      const LineNumberInfo: PLineNumberInfoArray): TSize; virtual; abstract;
    function NewStringConst (const S: String): TConstAddr;
  end;

  TIPCodeGenClass = class of TIPCustomCodeGen;
  TIPCustomCodeGen = class
  public
    Code: AnsiString;
    LineNumbers: TList;
    constructor Create; virtual;
    destructor Destroy; override;
    procedure EmitCode (var X; const Bytes: TSize);
    procedure StatementBegin (const LineNum: Cardinal);
    { abstract methods: }
    procedure ApplyFixups (Funcs: TList; FuncAddress: TCodeAddr;
      CodeVA, ConstVA, BSSVA: TVirtualAddress); virtual; abstract;
    procedure AsgVarAddrOfConst (Addr: TVarAddr; ConstAddr: TConstAddr); virtual; abstract;
    procedure AsgVarFuncResult (Addr: TVarAddr; Size: TSize); virtual; abstract;
    procedure AsgVarImm (Addr: TVarAddr; Size: TSize; Value: Longint); virtual; abstract;
    procedure AsgVarPop (Addr: TVarAddr; Size: TSize); virtual; abstract;
    procedure AsgVarVar (DestAddr: TVarAddr; DestSize: TSize;
      SourceAddr: TVarAddr; SourceSize: TSize); virtual; abstract;
    procedure CallFunc (const CallData: TCallData); virtual; abstract;
    procedure Expression (const Expr: TExpression); virtual; abstract;
    procedure FuncEnd; virtual; abstract;
    procedure ImportThunk (ImportAddressVA: TVirtualAddress); virtual; abstract;
  end;

implementation

{ TMyStringList }

function TMyStringList.IndexOf (const S: string): Integer;
{ Same as TStrings.IndexOf, but uses SameText instead of AnsiCompareText. We
  don't want/need ANSI comparison. }
begin
  for Result := 0 to GetCount - 1 do
    if SameText(Get(Result), S) then Exit;
  Result := -1;
end;


{ TIPCustomCodeGen }

constructor TIPCustomCodeGen.Create;
begin
  inherited;
  LineNumbers := TList.Create;
end;

destructor TIPCustomCodeGen.Destroy;
begin
  LineNumbers.Free;  {}{mem leak}
  inherited;
end;

procedure TIPCustomCodeGen.EmitCode (var X; const Bytes: TSize);
var
  S: AnsiString;
begin
  SetString (S, PChar(@X), Bytes);
  Code := Code + S;
end;

procedure TIPCustomCodeGen.StatementBegin (const LineNum: Cardinal);
var
  Rec: PLineNumberRec;
begin
  New (Rec);
  Rec.LineNum := LineNum;
  Rec.CodeAddr := Length(Code);
  LineNumbers.Add (Rec);
end;


{ TIPCustomLinker }

constructor TIPCustomLinker.Create;
begin
  inherited;
  DLLList := TMyStringList.Create;
  Funcs := TList.Create;
end;

destructor TIPCustomLinker.Destroy;
begin
  Funcs.Free;    {}{memory leak! need to free each individual item's data}
  DLLList.Free;
  inherited;
end;

function TIPCustomLinker.NewStringConst (const S: String): TConstAddr;
{ Adds S to the ConstSection and returns the address of it }
begin
  Result := Length(ConstSection);
  ConstSection := ConstSection + S + #0;
end;

end.
