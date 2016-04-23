unit CodeX86;

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

{ x86 code generator }

uses
  Windows, Classes, Common, IPBase;

type
  TX86Register = (rgEAX, rgECX, rgEDX, rgEBX, rgESP, rgEBP, rgESI, rgEDI,
    rgAX, rgCX, rgDX, rgBX, rgSP, rgBP, rgSI, rgDI,
    rgAL, rgCL, rgDL, rgBL, rgAH, rgCH, rgDH, rgBH);

  TX86CodeGen = class(TIPCustomCodeGen)
  private
    ConstAddrFixupList, DataAddrFixupList, FuncAddrFixupList: TList;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure ApplyFixups (Funcs: TList; FuncAddress: TCodeAddr;
      CodeVA, ConstVA, BSSVA: TVirtualAddress); override;
    procedure AsgRegImm (Reg: TX86Register; Value: Longint);
    procedure AsgVarAddrOfConst (Addr: TVarAddr; ConstAddr: TConstAddr);
      override;
    procedure AsgVarFuncResult (Addr: TVarAddr; Size: TSize); override;
    procedure AsgVarImm (Addr: TVarAddr; Size: TSize; Value: Longint); override;
    procedure AsgVarPop (Addr: TVarAddr; Size: TSize); override;
    procedure AsgVarVar (DestAddr: TVarAddr; DestSize: TSize;
      SourceAddr: TVarAddr; SourceSize: TSize); override;
    procedure CallFunc (const CallData: TCallData); override;
    procedure Expression (const Expr: TExpression); override;
    procedure FuncEnd; override;
    procedure ImportThunk (ImportAddressVA: TVirtualAddress); override;
    procedure PopIntoReg (Reg: TX86Register);
    procedure PushAddrOfConst (Addr: TConstAddr);
    procedure PushAddrOfVar (Addr: TVarAddr);
    procedure PushImm (Value: Longint);
    procedure PushReg (Reg: TX86Register);
    procedure PushVarAtAddr (Addr: TVarAddr);
  end;

implementation

type
  PFuncAddrFixupRec = ^TFuncAddrFixupRec;
  TFuncAddrFixupRec = record
    FuncIndex: Integer;
    CodeAddress: TCodeAddr;
  end;

const
  opOperandSizePrefix = $66;

constructor TX86CodeGen.Create;
begin
  inherited;
  ConstAddrFixupList := TList.Create;
  DataAddrFixupList := TList.Create;
  FuncAddrFixupList := TList.Create;
end;

destructor TX86CodeGen.Destroy;
begin
  FuncAddrFixupList.Free;  {}{mem leak; needs to free individual items}
  ConstAddrFixupList.Free;
  DataAddrFixupList.Free;
  inherited;
end;

(*procedure TX86CodeGen.AsgEAXZero;
const
  X: array[0..1] of Byte = ($31, $C0);  { xor eax, eax }
begin
  EmitCode (X, 2);
end;*)

procedure TX86CodeGen.AsgRegImm (Reg: TX86Register; Value: Longint);
var
  X: array[0..4] of Byte;
begin
  if Reg in [rgEAX..rgEDI] then begin
    { 32-bit reg }
    if Value <> 0 then begin
      X[0] := $B8 + Ord(Reg);  { mov reg32, xxxxxxxx }
      Longint((@X[1])^) := Value;
      EmitCode (X, 5);
    end
    else begin
      { use a more optimized XOR instruction to assign zero }
      X[0] := $31;
      X[1] := $C0 or (Ord(Reg) shl 3) or Ord(Reg);
      EmitCode (X, 2);
    end;
  end
  else if Reg in [rgAX..rgDI] then begin
    { 16-bit reg }
    X[0] := opOperandSizePrefix;
    Dec (Reg, Ord(rgAX));
    if Value <> 0 then begin
      X[1] := $B8 + Ord(Reg);  { mov reg32, xxxxxxxx }
      Word((@X[2])^) := Value;
      EmitCode (X, 4);
    end
    else begin
      { use a more optimized XOR instruction to assign zero }
      X[1] := $31;
      X[2] := $C0 or (Ord(Reg) shl 3) or Ord(Reg);
      EmitCode (X, 3);
    end;
  end
  else begin
    { 8-bit reg }
    Dec (Reg, Ord(rgAL));
    if Value <> 0 then begin
      X[0] := $B0 + Ord(Reg);
      X[1] := Byte(Value);
      EmitCode (X, 2);
    end
    else begin
      { use a more optimized XOR instruction to assign zero }
      X[0] := $30;
      X[1] := $C0 or (Ord(Reg) shl 3) or Ord(Reg);
      EmitCode (X, 2);
    end;
  end;
end;

procedure TX86CodeGen.PushReg (Reg: TX86Register);
var
  X: Byte;
begin
  Assert (Reg in [rgEAX..rgEDI]); {}{currently there's no support for 8/16-bit regs}
  X := $50 + Ord(Reg);
  EmitCode (X, 1);
end;

procedure TX86CodeGen.PopIntoReg (Reg: TX86Register);
var
  X: Byte;
begin
  Assert (Reg in [rgEAX..rgEDI]); {}{currently there's no support for 8/16-bit regs}
  X := $58 + Ord(Reg);
  EmitCode (X, 1);
end;

procedure TX86CodeGen.AsgVarImm (Addr: TVarAddr; Size: TSize; Value: Longint);
{ regs used: none }
var
  X: array[0..9] of Byte;
begin
  case Size of
    4: begin
         X[0] := $C7;   { mov [xxxxxxxx], yyyyyyyy }
         X[1] := $05;
         LongWord((@X[2])^) := Addr;
         Longint((@X[6])^) := Value;
         DataAddrFixupList.Add (Pointer(Length(Code) + 2));
         EmitCode (X, 10);
       end;
    2: begin
         X[0] := $66;   { mov [xxxxxxxx], yyyy }
         X[1] := $C7;
         X[2] := $05;
         LongWord((@X[3])^) := Addr;
         Word((@X[7])^) := Word(Value);
         DataAddrFixupList.Add (Pointer(Length(Code) + 3));
         EmitCode (X, 9);
       end;
    1: begin
         X[0] := $C6;   { mov [xxxxxxxx], yy }
         X[1] := $05;
         LongWord((@X[2])^) := Addr;
         Byte((@X[6])^) := Byte(Value);
         DataAddrFixupList.Add (Pointer(Length(Code) + 2));
         EmitCode (X, 7);
       end;
  else
    Assert (False);
  end;
end;

procedure TX86CodeGen.AsgVarAddrOfConst (Addr: TVarAddr;
  ConstAddr: TConstAddr);
{ regs used: none }
var
  X: array[0..9] of Byte;
begin
  X[0] := $C7;   { mov [xxxxxxxx], yyyyyyyy }
  X[1] := $05;
  LongWord((@X[2])^) := Addr;
  LongWord((@X[6])^) := ConstAddr;
  DataAddrFixupList.Add (Pointer(Length(Code) + 2));
  ConstAddrFixupList.Add (Pointer(Length(Code) + 6));
  EmitCode (X, 10);
end;

procedure TX86CodeGen.AsgVarVar (DestAddr: TVarAddr; DestSize: TSize;
  SourceAddr: TVarAddr; SourceSize: TSize);
{ regs used: eax }
var
  X: array[0..11] of Byte;
begin
  {}{only supports 4-byte types for now!}
  Assert ((DestSize = 4) and (SourceSize = 4)); 
  X[0] := $8B;   { mov eax, [xxxxxxxx] }
  X[1] := $05;
  LongWord((@X[2])^) := SourceAddr;
  X[6] := $89;   { mov [xxxxxxxx], eax }
  X[7] := $05;
  LongWord((@X[8])^) := DestAddr;
  DataAddrFixupList.Add (Pointer(Length(Code) + 2));
  DataAddrFixupList.Add (Pointer(Length(Code) + 8));
  EmitCode (X, 12);
end;

procedure TX86CodeGen.AsgVarFuncResult (Addr: TVarAddr; Size: TSize);
{ regs used: none }
var
  X: array[0..5] of Byte;
begin
  {}{only supports 4-byte types for now!}
  Assert (Size = 4);
  X[0] := $89;   { mov [xxxxxxxx], eax }
  X[1] := $05;
  LongWord((@X[2])^) := Addr;
  DataAddrFixupList.Add (Pointer(Length(Code) + 2));
  EmitCode (X, 6);
end;

procedure TX86CodeGen.AsgVarPop (Addr: TVarAddr; Size: TSize);
{ pop into EAX; store EAX in Addr }
begin
  {}{only supports 4-byte types for now!}
  Assert (Size = 4);
  PopIntoReg (rgEAX);
  { though the function is named AsgVarFuncResult, what it really does is
    assign EAX to a memory location. It will work for our purposes here. }
  AsgVarFuncResult (Addr, Size);
end;

procedure TX86CodeGen.FuncEnd;
{ regs used: none }
const
  X: Byte = $C3;  { ret }
begin
  EmitCode (X, 1);
end;

procedure TX86CodeGen.PushImm (Value: Longint);
var
  X: array[0..4] of Byte;
begin
  if (Value >= -128) and (Value <= 127) then begin
    { If Value is in the range of a signed byte, use a smaller instruction }
    X[0] := $6A;  { push xx (sign-extended to 32 bits) }
    Byte((@X[1])^) := Byte(Value);
    EmitCode (X, 2);
  end
  else begin
    X[0] := $68;  { push xxxxxxxx }
    Longint((@X[1])^) := Value;
    EmitCode (X, 5);
  end;
end;

procedure TX86CodeGen.PushAddrOfConst (Addr: TConstAddr);
var
  X: array[0..4] of Byte;
begin
  Assert (Addr <> $FFFFFFFF);
  X[0] := $68;  { push xxxxxxxx }
  LongWord((@X[1])^) := Addr;
  ConstAddrFixupList.Add (Pointer(Length(Code) + 1));
  EmitCode (X, 5);
end;

procedure TX86CodeGen.PushAddrOfVar (Addr: TVarAddr);
var
  X: array[0..4] of Byte;
begin
  X[0] := $68;  { push xxxxxxxx }
  LongWord((@X[1])^) := Addr;
  DataAddrFixupList.Add (Pointer(Length(Code) + 1));
  EmitCode (X, 5);
end;

procedure TX86CodeGen.PushVarAtAddr (Addr: TVarAddr);
var
  X: array[0..5] of Byte;
begin
  X[0] := $FF;  { push [xxxxxxxx] }
  X[1] := $35;
  LongWord((@X[2])^) := Addr;
  DataAddrFixupList.Add (Pointer(Length(Code) + 2));
  EmitCode (X, 6);
end;

procedure TX86CodeGen.CallFunc (const CallData: TCallData);
var
  J: Integer;
  X: array[0..4] of Byte;
  FixupRec: PFuncAddrFixupRec;
begin
  { stdcall - push parameters from right to left }
  for J := CallData.ParamCount-1 downto 0 do
    Expression (CallData.ParamExpr[J]);

  X[0] := $E8;  { call xxxxxxxx (relative address) }
  Longint((@X[1])^) := 0;     { xxxxxxxx is zero for now }
  New (FixupRec);
  FixupRec.FuncIndex := CallData.FuncIndex;
  FixupRec.CodeAddress := Length(Code) + 1;
  FuncAddrFixupList.Add (FixupRec);
  EmitCode (X, 5);
end;

procedure TX86CodeGen.ImportThunk (ImportAddressVA: TVirtualAddress);
var
  X: array[0..5] of Byte;
begin
  X[0] := $FF;  { jmp [xxxxxxxx] }
  X[1] := $25;
  LongWord((@X[2])^) := ImportAddressVA;
  EmitCode (X, 6);
end;

procedure TX86CodeGen.ApplyFixups (Funcs: TList; FuncAddress: TCodeAddr;
  CodeVA, ConstVA, BSSVA: TVirtualAddress);
var
  I: Integer;
  Diff, Addr: Longint;
  FixupRec: PFuncAddrFixupRec;
  FixupOffset: PLongint;
begin
  for I := 0 to FuncAddrFixupList.Count-1 do begin
    FixupRec := FuncAddrFixupList[I];
    Addr := PFuncData(Funcs[FixupRec.FuncIndex]).Address;
    Assert (Addr <> -1);
    Diff := Addr - Longint(FuncAddress + FixupRec.CodeAddress + 4);
    Longint((@Code[FixupRec.CodeAddress+1])^) := Diff;
  end;
  for I := 0 to ConstAddrFixupList.Count-1 do
    Inc (Longint((@Code[Cardinal(ConstAddrFixupList[I])+1])^),
      ConstVA);
  for I := 0 to DataAddrFixupList.Count-1 do begin
    FixupOffset := @Code[Cardinal(DataAddrFixupList[I])+1];
    Assert (FixupOffset^ <> -1);
    Inc (FixupOffset^, BSSVA);
  end;
end;

procedure TX86CodeGen.Expression (const Expr: TExpression);
{ regs used: eax, ecx, edx.
  Result of expression is currently left at the top of the stack }
const
  AddEAXtoMESP: array[0..2] of Byte = ($01, $04, $24);         { add [esp], eax }
  AddECXtoEAX: array[0..1] of Byte = ($01, $C8);               { add eax, ecx }
  AddMESPtoEAX: array[0..2] of Byte = ($03, $04, $24);         { add eax, [esp] }
  DivideEAXbyECX: array[0..2] of Byte = ($99,{;} $F7, $F9);    { cdq; idiv ecx }
  SubtractEAXfromMESP: array[0..2] of Byte = ($29, $04, $24);  { sub [esp], eax }
  SubtractECXfromEAX: array[0..1] of Byte = ($29, $C8);        { sub eax, ecx }
  SubtractMESPfromEAX: array[0..2] of Byte = ($2B, $04, $24);  { sub eax, [esp] }
  MultiplyEAXbyECX: array[0..2] of Byte = ($0F, $AF, $C1);     { imul eax, ecx }
  MultiplyEAXbyMESP: array[0..3] of Byte = ($0F, $AF, $04, $24);  { imul eax, [esp] }
  MultiplyECXbyEAX: array[0..2] of Byte = ($0F, $AF, $C8);     { imul ecx, eax }
  MovEAX_MESP: array[0..2] of Byte = ($8B, $04, $24);          { mov eax, [esp] }
  MovEAX_MESP4: array[0..3] of Byte = ($8B, $44, $24, $04);    { mov eax, [esp+4] }
  MovECX_MESP: array[0..2] of Byte = ($8B, $0C, $24);          { mov ecx, [esp] }
  MovMESP_EAX: array[0..2] of Byte = ($89, $04, $24);          { mov [esp], eax }
  MovMESP_ECX: array[0..2] of Byte = ($89, $0C, $24);          { mov [esp], ecx }
  MovMESP_EDX: array[0..2] of Byte = ($89, $14, $24);          { mov [esp], edx }
  MovMESP4_EAX: array[0..3] of Byte = ($89, $44, $24, $04);    { mov [esp+4], eax }
  NegEAX: array[0..1] of Byte = ($F7, $D8);                    { neg eax }
var
  P: PExprRec;
begin
  P := Expr.First;
  while Assigned(P) do begin
    case P.Op of
      eoPushImm: PushImm (P.Value.AsInteger);
      eoPushVar: begin
          PushVarAtAddr (P.Value.AsVarAddress);
          if efNegate in P.Flags then begin
            { quick & ugly hack: pop the var off the stack and push it
              back negated }
            PopIntoReg (rgEAX);
            EmitCode (NegEAX, SizeOf(NegEAX));
            PushReg (rgEAX);
          end;
        end;
      eoPushStrConst: PushAddrOfConst (P.Value.AsConstAddress);
      eoPushAddrOfVar: PushAddrOfVar (P.Value.AsVarAddress);
      eoPushCall: begin
          CallFunc (P.CallData^);
          { result of function is in EAX }
          if efNegate in P.Flags then
            EmitCode (NegEAX, SizeOf(NegEAX));
          PushReg (rgEAX);
        end;
      eoAdd: begin
          PopIntoReg (rgEAX);
          EmitCode (AddEAXtoMESP, SizeOf(AddEAXtoMESP));
        end;
      eoSubtract: begin
          PopIntoReg (rgEAX);
          EmitCode (SubtractEAXfromMESP, SizeOf(SubtractEAXfromMESP));
        end;
      eoMultiply: begin
          PopIntoReg (rgEAX);
          EmitCode (MovECX_MESP, SizeOf(MovECX_MESP));
          EmitCode (MultiplyECXbyEAX, SizeOf(MultiplyECXbyEAX));
          EmitCode (MovMESP_ECX, SizeOf(MovMESP_ECX));
        end;
      eoDivide: begin
          PopIntoReg (rgECX);
          EmitCode (MovEAX_MESP, SizeOf(MovEAX_MESP));
          EmitCode (DivideEAXbyECX, SizeOf(DivideEAXbyECX));
          { DivideEAXbyECX saves quotient in EAX, and remainder in EDX }
          EmitCode (MovMESP_EAX, SizeOf(MovMESP_EAX));
        end;
      eoMod: begin
          { eoMod is identical to eoDivide except for the last line }
          PopIntoReg (rgECX);
          EmitCode (MovEAX_MESP, SizeOf(MovEAX_MESP));
          EmitCode (DivideEAXbyECX, SizeOf(DivideEAXbyECX));
          { DivideEAXbyECX saves quotient in EAX, and remainder in EDX }
          EmitCode (MovMESP_EDX, SizeOf(MovMESP_EDX));
        end;
    else
      Assert (False);
    end;
    P := P.Next;
  end;
end;

end.
