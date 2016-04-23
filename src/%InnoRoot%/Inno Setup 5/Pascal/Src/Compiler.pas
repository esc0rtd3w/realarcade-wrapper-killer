unit Compiler;

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

{ TIPCompiler }

{
  Yes, I know some of the code in this unit is downright ugly & unoptimized
  and should be rewritten.
}

uses
  Windows, SysUtils, Classes, IPBase, Common;

type
  TIPCompiler = class;
  TIPCompilerClass = class of TIPCompiler;

  TIdentList = class(TList)
  private
    FRefCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function DecRefCount: Boolean;
    procedure DeleteAllAt (const First: Integer);
    procedure IncRefCount;
  end;

  THash = Word;
  TIdentType = (idType, idTypeAlias, idUnitName, idProc, idConst, idVar);
  TTypeFlags = set of ({tfUnsigned,} tfPacked);
  TCallingConvention = (ccStdcall);

  PIdentData = ^TIdentData;
  TIdentData = record
    IdentType: TIdentType;
    Hash: THash;
    Name: String;
  end;

  PType = ^TType;
  TType = record
    IdentType: TIdentType;  { = idType }
    Hash: THash;
    Name: String;
    Size: TSize;
    BoundLower, BoundUpper: THugeint;
    RecordFields: TIdentList;
    Kind: TTypeKind;
    Flags: TTypeFlags;
  end;

  PTypeAlias = ^TTypeAlias;
  TTypeAlias = record
    IdentType: TIdentType;  { = idTypeAlias }
    Hash: THash;
    Name: String;
    OrigType: PType;
  end;

  PProcData = ^TProcData;
  TProcData = record
    IdentType: TIdentType;  { = idProc }
    Hash: THash;
    Name: String;
    FuncIndex: Integer;
    Convention: TCallingConvention;
    ParamCount: Integer;
    ParamType: array[0..MaxParams-1] of PType;
    ParamIsVar: array[0..MaxParams-1] of Boolean;
    IsFunction: Boolean;
    ResultType: PType;
  end;

  PConst = ^TConst;
  TConst = record
    IdentType: TIdentType;  { = idConst }
    Hash: THash;
    Name: String;
    Kind: TTypeKind;
    ValueStr: String;
    AddressOfStr: TConstAddr;
    Value: TExprValue;
  end;

  PVar = ^TVar;
  TVar = record
    IdentType: TIdentType;  { = idVar }
    Hash: THash;
    Name: String;
    Typ: PType;
    Address: TVarAddr;
  end;

  PUnitName = ^TUnitName;
  TUnitName = record
    IdentType: TIdentType;  { = idUnitName }
    Hash: THash;
    Name: String;
  end;

  TTokenType = (tkEof, tkSemicolon, tkColon, tkComma, tkIdent, tkOpenParen,
    tkCloseParen, tkNumber, tkString, tkBegin, tkEnd, tkPeriod, tkProcedure,
    tkVar, tkConst, tkAssignment, tkEqual, tkFunction, tkProgram, tkType,
    tkPlus, tkRecord, tkPacked, tkMinus, tkMultiply, tkDivide, tkMod, tkRange);
  TTokenTypeSet = set of TTokenType;

  TParserState = record
    Filename: String;
    CurLine, LinePos, CurPos: Cardinal;
    CurChar: PChar;
  end;

  PIncludeInfo = ^TIncludeInfo;
  TIncludeInfo = record
    Prev: PIncludeInfo;
    IncludeStream: TMemoryStream;
    LastParserState: TParserState;
  end;

  PCardinal = ^Cardinal;

  TIPCompiler = class
  private
    { Scanner }
    ParserState: TParserState;
    TokenFilename: String;
    Token: TTokenType;
    TokenLine, TokenCh: Cardinal;
    TokenData: String;
    IncludeStack: PIncludeInfo;
    KnowFollowingToken: Boolean;
    FollowingTokenFilename: String;
    FollowingTokenLine, FollowingTokenCh: Cardinal;
    FollowingToken: TTokenType;
    FollowingTokenData: String;
    { Parser }
    Idents: TIdentList;
    CurScope: Integer;
    CodeGen: TIPCustomCodeGen;
    { Other }
    Linker: TIPCustomLinker;
    CodeGenClass: TIPCodeGenClass;
    StatusProc: TCompilerStatusProc;

    procedure AllocStrConst (var Data: PConst);
    procedure AllocVar (const Data: PVar; var StartAddr: TVarAddr;
      const Align: Boolean);
    procedure CheckImmIntRange (const Typ: PType; const Value: TExprValue);
    procedure CheckTypeCompatibility (const ExpectedType, FoundType: TTypeKind);
    procedure DisposeExpression (var AExpr: TExpression);
    procedure Error (const S: String);
    procedure ErrorFmt (const S: String; const Args: array of const);
    procedure ErrorRedeclared (const Ident: String);
    procedure ErrorUndeclared (const Ident: String);
    function FindIdent (const FirstIdent: Integer;
      const AName: String): Integer;
    function FindType (const AName: String): PType;
    procedure HandleConstSection;
    procedure HandleDeclarations (const IsMain: Boolean;
      const FuncIndex: Integer);
    procedure HandleProcedureBlock (const IsMain: Boolean);
    procedure HandleProcedureCall (const ProcIndex: Integer);
    procedure HandleProcedureDeclaration (const IsFunction: Boolean);
    procedure HandleProgram;
    procedure HandleTypeSection;
    procedure HandleVarAssignment (const I: Integer; const VarName: String);
    procedure HandleVarSection;
    function InternalNextToken (var Data: String): TTokenType;
    procedure LeaveScope;
    function NewExprRec (var AExpr: TExpression; AKind: TTypeKind;
      AOp: TExprOp): PExprRec;
    function NewStringConst (const S: String): TConstAddr;
    function NextChar: Char;
    function NextToken: TTokenType;
    function NextTokenExpect (const Expected: TTokenTypeSet): TTokenType;
    function NextTokenExpectMsg (const Expected: TTokenTypeSet;
      const AMsg: String): TTokenType;
    procedure ParseExpression (var Kind: TTypeKind; var AExpr: TExpression;
      const ConstantExpr: Boolean);
    function ParseFuncSizeOf: TSize;
    procedure ParseQualifiedVar (var VarData: PVar; const VarAddr: PVarAddr;
      const ExpectInited: Boolean);
    procedure ParseProcedureCall (const ProcIndex: Integer; var CallData: TCallData);
    function ParseIntConstExpression: THugeint;
    function ParseStringConstExpression: String;
    function PeekAtNextChar: Char;
    function PeekAtNextToken: TTokenType;
    procedure ShowHints;
    procedure WarningFmt (const S: String; const Args: array of const);
  public
    constructor Create;
    destructor Destroy; override;
    procedure DoCompile (const ALinker: TIPCustomLinker;
      const ACodeGenClass: TIPCodeGenClass; const AFilename: String;
      const Src: PChar; const AStatusProc: TCompilerStatusProc);
  end;

implementation

const
  TokenTypeText: array[TTokenType] of String = ('end of file', ''';''',
    ''':''', ''',''', 'identifier', '''(''', ''')''', 'number', 'string',
    '''begin''', '''end''', '''.''', '''procedure''', '''var''', '''const''',
    ''':=''', '''=''', '''function''', '''program''', '''type''', '''+''',
    '''record''', '''packed''', '''-''', '''*''', '''div''',
    '''mod''', '''..''');
  TypeKindNames: array[TTypeKind] of String = ('Integer', 'String', 'Record');

  adUnallocated = $FFFFFFFF;

function CalcHash (const S: AnsiString): THash;
asm
  test eax, eax
  jz   @@exit
  mov  ecx, [eax-4]  // ecx = Length(S)
  xor  edx, edx
  test ecx, ecx
  jz   @@exit
  push esi
  mov  esi, eax
  @@loop:
  mov  al, [esi]
  cmp  al, 'a'
  jb   @@doxor
  cmp  al, 'z'
  ja   @@doxor
  sub  al, 'a'-'A'
  @@doxor:
  rol  dx, 5
  inc  esi
  xor  dl, al
  dec  ecx
  jnz  @@loop
  pop  esi
  mov  eax, edx
@@exit:
end;

function IsRelativePath (const Filename: String): Boolean;
var
  L: Integer;
begin
  Result := True;
  L := Length(Filename);
  if ((L >= 1) and (Filename[1] = '\')) or
     ((L >= 2) and (Filename[1] in ['A'..'Z', 'a'..'z']) and (Filename[2] = ':')) then
    Result := False;
end;


{ TIdentList }

constructor TIdentList.Create;
begin
  inherited;
  FRefCount := 1;
end;

destructor TIdentList.Destroy;
begin
  DeleteAllAt (0);
  inherited;
end;

procedure TIdentList.IncRefCount;
begin
  Inc (FRefCount);
end;

function TIdentList.DecRefCount: Boolean;
begin
  Dec (FRefCount);
  Result := FRefCount <= 0;
end;

procedure TIdentList.DeleteAllAt (const First: Integer);
{ Deletes all identifiers in the list starting with First }
var
  I: Integer;
  Data: PIdentData;
begin
  for I := Count-1 downto First do begin
    Data := List[I];
    Delete (I);
    case Data.IdentType of
      idType: begin
          if Assigned(PType(Data).RecordFields) and
             PType(Data).RecordFields.DecRefCount then
            PType(Data).RecordFields.Free;
          Dispose (PType(Data));
        end;
      idTypeAlias: Dispose (PTypeAlias(Data));
      idUnitName: Dispose (PUnitName(Data));
      idProc: Dispose (PProcData(Data));
      idConst: Dispose (PConst(Data));
      idVar: Dispose (PVar(Data));
    else
      Assert (False);
    end;
  end;
end;


{ TIPCompiler }

constructor TIPCompiler.Create;
begin
  inherited;
  Idents := TIdentList.Create;
end;

destructor TIPCompiler.Destroy;
begin
  Idents.Free;  { LeaveScope frees the items }
  inherited;
end;

procedure TIPCompiler.DoCompile (const ALinker: TIPCustomLinker;
  const ACodeGenClass: TIPCodeGenClass; const AFilename: String;
  const Src: PChar; const AStatusProc: TCompilerStatusProc);

  procedure PrepareTypes;
  { Prepare built-in types. For fastest ident lookup time, most commonly used
    types should be added last. }

    function AddIntType (const AName: String; const ASize: Integer;
      const ALower, AUpper: THugeint): PType;
    begin
      New (Result);
      Result.IdentType := idType;
      Result.Hash := CalcHash(AName);
      Result.Name := AName;
      Result.Size := ASize;
      Result.BoundLower := ALower;
      Result.BoundUpper := AUpper;
      Result.RecordFields := nil;
      Result.Kind := kdInteger;
      Result.Flags := [];
      Idents.Add (Result);
    end;

    function AddTypeAlias (const AName: String; const AOrigType: PType): PTypeAlias;
    begin
      New (Result);
      Result.IdentType := idTypeAlias;
      Result.Hash := CalcHash(AName);
      Result.Name := AName;
      Result.OrigType := AOrigType;
      Idents.Add (Result);
    end;

    function AddPCharType (const AName: String): PType;
    begin
      New (Result);
      Result.IdentType := idType;
      Result.Hash := CalcHash(AName);
      Result.Name := AName;
      Result.Size := 4;
      Result.BoundLower := 0;
      Result.BoundUpper := 0;
      Result.RecordFields := nil;
      Result.Kind := kdString;
      Result.Flags := [];
      Idents.Add (Result);
    end;

  var
    T: PType;
  begin
    AddIntType ('Shortint', 1, -128, 127);
    AddIntType ('Byte', 1, 0, $FF);
    AddIntType ('Smallint', 2, -32768, 32767);
    AddIntType ('Word', 2, 0, $FFFF);
    T := AddIntType('Cardinal', 4, 0, $FFFFFFFF);
    AddTypeAlias ('LongWord', T);
    T := AddIntType('Integer', 4, -2147483647 - 1, 2147483647);
    { ^ Delphi doesn't allow a -2147483648 constant, that's why there's a -1 }
    AddTypeAlias ('Longint', T);

    AddPCharType ('PChar');
  end;

var
  MainFuncData: PFuncData;
begin
  Linker := ALinker;
  CodeGenClass := ACodeGenClass;
  ParserState.Filename := AFilename;
  ParserState.CurLine := 1;
  ParserState.LinePos := 0;
  ParserState.CurPos := 0;
  ParserState.CurChar := Src;
  TokenFilename := ParserState.Filename;
  TokenLine := 1;
  TokenCh := 1;
  StatusProc := AStatusProc;

  PrepareTypes;

  { Prepare the 'main' function }
  New (MainFuncData);
  MainFuncData.DLLIndex := -1;
  MainFuncData.CodeGen := CodeGenClass.Create;
  MainFuncData.Address := adUnallocated;
  MainFuncData.Called := True;
  Linker.Funcs.Add (MainFuncData);

  if PeekAtNextToken = tkProgram then begin
    NextTokenExpect ([tkProgram]);
    HandleProgram;
  end;

  HandleDeclarations (True, 0);

  { See if there are any non-space characters left. If so, generate a warning }
  while True do begin
    case NextChar of
      #0: Break;
      #1..' ': ;
    else
      TokenFilename := ParserState.Filename;
      TokenLine := ParserState.CurLine;
      TokenCh := ParserState.CurPos - ParserState.LinePos;
      WarningFmt ('Text after ''end.'' ignored', ['']);
      Break;
    end;
  end;
end;

procedure TIPCompiler.Error (const S: String);
var
  E: EIPCompilerError;
begin
  E := EIPCompilerError.CreateFmt('File %s'#13#10'Line %d char %d:'#13#10#13#10'%s',
    [TokenFilename, TokenLine, TokenCh, S]);
  E.Filename := TokenFilename;
  E.Line := TokenLine;
  E.Ch := TokenCh;
  E.ErrorText := S;
  raise E;
end;

procedure TIPCompiler.ErrorFmt (const S: String; const Args: array of const);
begin
  Error (Format(S, Args));
end;

procedure TIPCompiler.ErrorRedeclared (const Ident: String);
begin
  ErrorFmt ('Identifier redeclared: ''%s''', [Ident]);
end;

procedure TIPCompiler.ErrorUndeclared (const Ident: String);
begin
  ErrorFmt ('Undeclared identifier: ''%s''', [Ident]);
end;

procedure TIPCompiler.WarningFmt (const S: String; const Args: array of const);
begin
  if Assigned(StatusProc) then
    StatusProc (stWarning, TokenFilename, TokenLine, TokenCh,
      Format(S, Args));
end;

procedure TIPCompiler.CheckTypeCompatibility (const ExpectedType, FoundType: TTypeKind);
begin
  if ExpectedType <> FoundType then
    ErrorFmt ('Incompatible types: ''%s'' and ''%s''',
      [TypeKindNames[ExpectedType], TypeKindNames[FoundType]]);
end;

{var
  totalmatches: longint = 0;
  totalcomps: longint = 0;}

function TIPCompiler.FindIdent (const FirstIdent: Integer; const AName: String): Integer;
{ Returns the index of the most recently declared identifier by the name of AName }
var
  Hash: THash;
  I: Integer;
  Data: PIdentData;
begin
  Hash := CalcHash(AName);
  for I := Idents.Count-1 downto FirstIdent do begin
    Data := Idents.List[I];
    {inc (totalcomps);
    if Data.Hash = Hash then
      inc (totalmatches);}
    if (Data.Hash = Hash) and SameText(Data.Name, AName) then begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

function TIPCompiler.FindType (const AName: String): PType;
var
  I: Integer;
  Ident: PIdentData;
begin
  I := FindIdent(0, AName);
  if I = -1 then
    ErrorUndeclared (TokenData);
  Ident := Idents[I];
  if Ident.IdentType = idTypeAlias then
    Result := PTypeAlias(Ident).OrigType
  else begin
    if Ident.IdentType <> idType then
      Error ('Type expression expected');
    Result := PType(Ident);
  end;
end;

procedure TIPCompiler.LeaveScope;
{ Deletes all identifiers in the Ident list starting with Scope }
begin
  Idents.DeleteAllAt (CurScope);
end;

function TIPCompiler.PeekAtNextChar: Char;
begin
  if ParserState.CurChar^ = #0 then begin
    Result := #0;
    Exit;
  end;
  Result := ParserState.CurChar^;
end;

function TIPCompiler.NextChar: Char;
begin
  if ParserState.CurChar^ = #0 then begin
    Result := #0;
    Exit;
  end;
  Result := ParserState.CurChar^;
  Inc (ParserState.CurPos);
  Inc (ParserState.CurChar);
  if Result = #10 then begin
    Inc (ParserState.CurLine);
    ParserState.LinePos := ParserState.CurPos;
  end;
end;

function TIPCompiler.InternalNextToken (var Data: String): TTokenType;
var
  IsCompilerDirective: Boolean;
  Directive: String;
  CharConst: Integer;

  procedure HandleInclude (AFilename: String);
  var
    II: PIncludeInfo;
    F: String;
    M: TMemoryStream;
  begin
    { If the include filename is not fully qualified, prepend the path
      of the current file to it }
    if IsRelativePath(AFilename) then
      AFilename := ExtractFilePath(ParserState.Filename) + AFilename;
    { Don't allow recursive includes }
    II := IncludeStack;
    F := ParserState.Filename;
    while II <> nil do begin
      if AnsiCompareFileName(F, AFilename) = 0 then
        ErrorFmt ('Recursive include of %s', [AFilename]);
      F := II.LastParserState.Filename;
      II := II.Prev;
    end;
    M := TMemoryStream.Create;
    try
      try
        M.LoadFromFile (AFilename);
      except
        ErrorFmt ('Could not open include file %s', [AFilename]);
      end;
      M.Seek (0, soFromEnd);
      M.WriteBuffer (PChar('')^, 1);  { append a null terminator }
    except
      M.Free;
      raise;
    end;
    New (II);
    II.Prev := IncludeStack;
    II.IncludeStream := M;
    II.LastParserState := ParserState;
    IncludeStack := II;
    ParserState.Filename := AFilename;
    ParserState.CurLine := 1;
    ParserState.LinePos := 0;
    ParserState.CurPos := 0;
    ParserState.CurChar := M.Memory;
  end;

  procedure ExitInclude;
  var
    II: PIncludeInfo;
  begin
    II := IncludeStack;
    IncludeStack := II.Prev;
    ParserState := II.LastParserState;
    II.IncludeStream.Free;
  end;

  procedure DirectiveSpace;
  begin
    if IsCompilerDirective and
       ((Directive = '') or (Directive[Length(Directive)] <> ' ')) then
      Directive := Directive + ' ';
  end;

  procedure HandleCompilerDirective;
  begin
    if not IsCompilerDirective then
      Exit;
    Directive := TrimRight(Directive);
    if SameText(Directive, 'APPTYPE CONSOLE') then
      Linker.LinkOptions.ConsoleApp := True
    else if SameText(Directive, 'APPTYPE GUI') then
      Linker.LinkOptions.ConsoleApp := False
    else if SameText(Copy(Directive, 1, 2), 'I ') then
      HandleInclude (Copy(Directive, 3, Maxint))
    else
      ErrorFmt ('Invalid compiler directive: ''%s''', [Directive]);
  end;

label Redo;
var
  C: Char;
begin
  { If we already know what the next token will be (due to a call to
    PeekAtNextToken), return that token and exit }
  if KnowFollowingToken then begin
    KnowFollowingToken := False;
    TokenFilename := FollowingTokenFilename;
    TokenLine := FollowingTokenLine;
    TokenCh := FollowingTokenCh;
    Result := FollowingToken;
    Data := FollowingTokenData;
    Exit;
  end;
  Data := '';
Redo:
  repeat
    C := NextChar;
  until not(C in [#1..' ']);  { skip past any spaces or control characters }
  TokenFilename := ParserState.Filename;
  TokenLine := ParserState.CurLine;
  TokenCh := ParserState.CurPos - ParserState.LinePos;
    { ^ don't use '+ 1' since CurPos is already one past C }
  case C of
    #0: begin
        if IncludeStack = nil then
          { Not inside an include file; we're finished }
          Result := tkEof
        else begin
          ExitInclude;
          goto Redo;
        end;
      end;
    ';': begin
        Result := tkSemicolon;
      end;
    ':': begin
        if PeekAtNextChar = '=' then begin
          Result := tkAssignment;
          NextChar;
        end
        else begin
          Result := tkColon;
        end;
      end;
    ',': begin
        Result := tkComma;
      end;
    '.': begin
        if PeekAtNextChar = '.' then begin
          Result := tkRange;
          NextChar;
        end
        else
          Result := tkPeriod;
      end;
    '(': begin
        if PeekAtNextChar = '*' then begin  { handle (* *)-style comments }
          NextChar;
          Directive := '';
          IsCompilerDirective := PeekAtNextChar = '$';
          if IsCompilerDirective then
            NextChar;
          { search for end of comment }
          while True do begin
            C := NextChar;
            case C of
              #0:  Error ('Unterminated comment');
              #1..' ': DirectiveSpace;
              '*': if PeekAtNextChar = ')' then begin
                     NextChar;
                     Break;
                   end;
            else
              Directive := Directive + C;
            end;
          end;
          HandleCompilerDirective;
          goto Redo;
        end;
        Result := tkOpenParen;
      end;
    ')': begin
        Result := tkCloseParen;
      end;
    '{': begin  { '{' comment }
        Directive := '';
        IsCompilerDirective := PeekAtNextChar = '$';
        if IsCompilerDirective then
          NextChar;
        { search for end of comment }
        while True do begin
          C := NextChar;
          case C of
            #0:  Error ('Unterminated comment');
            #1..' ': DirectiveSpace;
            '}': Break;
          else
            Directive := Directive + C;
          end;
        end;
        HandleCompilerDirective;
        goto Redo;
      end;
    '=': begin
        Result := tkEqual;
      end;
    '+': begin
        Result := tkPlus;
      end;
    '-': begin
        Result := tkMinus;
      end;
    '''', '#', '^': begin
        Result := tkString;
        while True do begin
          case C of
            '''': begin
                while True do begin
                  C := NextChar;
                  case C of
                    #0: Error ('Unexpected EOF while reading string constant');
                    #10, #13: Error ('Unterminated string constant');
                  else
                    if C = '''' then begin
                      if PeekAtNextChar <> '''' then
                        { If we've encountered a "'" character that isn't
                          followed by another "'", we've reached the end }
                        Break;
                    end;
                    Data := Data + C;
                  end;
                end;
              end;
            '#': begin
                {TODO: needs to support '#$xx' for hex chars}
                CharConst := 0;
                C := NextChar;
                while C in ['0'..'9'] do begin
                  CharConst := CharConst * 10 + Ord(C) - Ord('0');
                  if CharConst > $FF then
                    Error ('Char constant out of range');
                  C := NextChar;
                end;
                Data := Data + Chr(CharConst);
              end;
          else
            Break;
          end;
          if not(PeekAtNextChar in ['''', '#']) then
            Break;
          C := NextChar;
        end;
      end;
    '*': Result := tkMultiply;
    '/': begin
        if PeekAtNextChar <> '/' then begin
          Error ('''/'' not supported; use ''div'' instead');
          Result := tkDivide;  { prevent warning }
        end
        else begin
          { handle // comments }
          { stop on next line or EOF }
          repeat until NextChar in [#0, #10];
          goto Redo;
        end;
      end;
    '0'..'9': begin
        Result := tkNumber;
        while True do begin
          Data := Data + C;
          if not(PeekAtNextChar in ['0'..'9']) then
            Break;
          C := NextChar;
        end;
      end;
    '$': begin  { hex number }
        Result := tkNumber;
        while True do begin
          Data := Data + C;
          if not(PeekAtNextChar in ['0'..'9', 'A'..'F', 'a'..'f']) then
            Break;
          C := NextChar;
        end;
        if Data = '$' then
          { If there were no numbers after '$' }
          Error ('Invalid hex integer constant');
      end;
    'A'..'Z', 'a'..'z': begin
        while True do begin
          Data := Data + C;
          if not(PeekAtNextChar in ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
            Break;
          C := NextChar;
        end;
        if SameText(Data, 'begin') then
          Result := tkBegin
        else if SameText(Data, 'end') then
          Result := tkEnd
        else if SameText(Data, 'procedure') then
          Result := tkProcedure
        else if SameText(Data, 'function') then
          Result := tkFunction
        else if SameText(Data, 'type') then
          Result := tkType
        else if SameText(Data, 'var') then
          Result := tkVar
        else if SameText(Data, 'const') then
          Result := tkConst
        else if SameText(Data, 'program') then
          Result := tkProgram
        else if SameText(Data, 'record') then
          Result := tkRecord
        else if SameText(Data, 'packed') then
          Result := tkPacked
        else if SameText(Data, 'div') then
          Result := tkDivide
        else if SameText(Data, 'mod') then
          Result := tkMod
        else
          Result := tkIdent;
      end;
  else
    ErrorFmt ('Illegal character ''%s''', [C]);
    Result := tkEof;  { suppress compiler warning }
  end;
end;

function TIPCompiler.PeekAtNextToken: TTokenType;
var
  SaveTokenFilename: String;
  SaveTokenLine, SaveTokenCh: Cardinal;
begin
  if KnowFollowingToken then begin
    Result := FollowingToken;
    Exit;
  end;
  { Allow InternalNextToken to change LastToken* so that any error messages
    during parsing will be in the correct file and at the correct cursor
    position }
  SaveTokenFilename := TokenFilename;
  SaveTokenLine := TokenLine;
  SaveTokenCh := TokenCh;
  try
    FollowingToken := InternalNextToken(FollowingTokenData);
    Result := FollowingToken;
    FollowingTokenFilename := TokenFilename;
    FollowingTokenLine := TokenLine;
    FollowingTokenCh := TokenCh;
    KnowFollowingToken := True;
  finally
    { restore old LastToken* }
    TokenFilename := SaveTokenFilename;
    TokenLine := SaveTokenLine;
    TokenCh := SaveTokenCh;
  end;
end;

function TIPCompiler.NextToken: TTokenType;
begin
  Result := InternalNextToken(TokenData);
  Token := Result;
end;

function TIPCompiler.NextTokenExpect (const Expected: TTokenTypeSet): TTokenType;
var
  S: String;
  T: TTokenType;
begin
  Result := NextToken;
  if not(Result in Expected) then begin
    for T := Low(T) to High(T) do
      if T in Expected then begin
        if S <> '' then S := S + ' or ';
        S := S + TokenTypeText[T];
      end;
    ErrorFmt ('Expected %s but found %s', [S, TokenTypeText[Result]]);
  end;
end;

function TIPCompiler.NextTokenExpectMsg (const Expected: TTokenTypeSet;
  const AMsg: String): TTokenType;
{ Same as NextTokenExpect, but uses a custom error message }
begin
  Result := NextToken;
  if not(Result in Expected) then
    ErrorFmt (AMsg, [TokenTypeText[Result]]);
end;

function TIPCompiler.ParseFuncSizeOf: TSize;
{ Parses a 'SizeOf()' call, and returns the size }
var
  J: Integer;
  Data2: PVar;
begin
  NextTokenExpect ([tkOpenParen]);
  NextTokenExpect ([tkIdent]);
  J := FindIdent(0, TokenData);
  if J = -1 then
    ErrorUndeclared (TokenData);
  case PIdentData(Idents[J]).IdentType of
    idType: begin
        { Maybe in the future it could support record fields inside types,
          for example, SizeOf(TFileTime.dwLowDateTime). Delphi doesn't support
          this. }
        Result := PType(Idents[J]).Size;
      end;
    idVar: begin
        Data2 := Idents[J];
        ParseQualifiedVar (Data2, nil, False);
        Result := Data2.Typ.Size;
      end;
  else
    Error ('Type or variable name expected');
    Result := 0;  { prevent warning }
  end;
  NextTokenExpect ([tkCloseParen]);
end;

function TIPCompiler.NewExprRec (var AExpr: TExpression; AKind: TTypeKind;
  AOp: TExprOp): PExprRec;
begin
  New (Result);
  Result.Next := nil;
  Result.Prev := AExpr.Last;
  Result.Kind := AKind;
  Result.Op := AOp;
  Result.Flags := [];
  Result.CallData := nil;
  if AExpr.First = nil then
    AExpr.First := Result;
  if Assigned(AExpr.Last) then
    AExpr.Last.Next := Result;
  AExpr.Last := Result;
end;

procedure TIPCompiler.ParseExpression (var Kind: TTypeKind; var AExpr: TExpression;
  const ConstantExpr: Boolean);
var
  DeterminedKind: Boolean;

  procedure Expr; forward;

  function LastTwoAreConsts (var F1, F2: PExprRec; const Op: TExprOp): Boolean;
  { Returns True if the last two ExprRecs are constants. (Useful for constant
    folding.)
    Returns False if not. However if ConstantExpr is True it will raise an
    error. }
  var
    C: Integer;
    P: PExprRec;
  begin
    C := 0;
    P := AExpr.Last;
    while Assigned(P) do begin
      if P.Op <> Op then
        Break;
      Inc (C);
      if C = 1 then
        F2 := P
      else begin
        F1 := P;
        Break;
      end;
      P := P.Prev;
    end;
    Result := C = 2;
    if not Result and ConstantExpr then
      Error ('Constant expression expected');
  end;

  function NewRec (AOp: TExprOp): PExprRec;
  begin
    Result := NewExprRec(AExpr, Kind, AOp);
  end;

  procedure RemoveLastRec;
  var
    P: PExprRec;
  begin
    P := AExpr.Last;
    AExpr.Last := P.Prev;
    AExpr.Last.Next := nil;
    if AExpr.First = P then
      AExpr.First := nil;
    Dispose (P);
  end;

  procedure SetKind (const AKind: TTypeKind);
  begin
    if DeterminedKind then
      CheckTypeCompatibility (Kind, AKind)
    else begin
      Kind := AKind;
      DeterminedKind := True;
    end;
  end;

  procedure Factor;
  var
    Negate: Boolean;
    J: Integer;
    ConstData: PConst;
    Data2: PVar;
    Data2Addr: TVarAddr;
    ProcData: PProcData;
    X: THugeint;
    ExprRec: PExprRec;
  begin
    Negate := False;
    while True do
      case NextTokenExpectMsg([tkMinus, tkPlus, tkOpenParen, tkNumber,
           tkString, tkIdent], 'Expression expected but %s found') of
        tkMinus: begin
            SetKind (kdInteger);
            Negate := not Negate;  { toggle Negate so that two '-' cancel out }
          end;
        tkPlus: begin
            SetKind (kdInteger);
            { ignore plus signs }
          end;
        tkOpenParen: begin
            Expr;
            NextTokenExpect ([tkCloseParen]);
            Break;
          end;
        tkNumber: begin
            SetKind (kdInteger);
            Val (TokenData, X, J);
            if J <> 0 then
              Error ('Integer out of range');
            if Negate then
              X := -X;
            ExprRec := NewRec(eoPushImm);
            ExprRec.Value.AsInteger := X;
            Break;
          end;
        tkString: begin
            SetKind (kdString);
            ExprRec := NewRec(eoPushStrConst);
            ExprRec.Value.AsConstAddress := adUnallocated;
            ExprRec.Kind := kdString;
            ExprRec.ValueStr := TokenData;
            Break;
          end;
        tkIdent: begin
            J := FindIdent(0, TokenData);
            if J = -1 then begin
              { Handle built-in functions }
              if SameText(TokenData, 'SizeOf') then begin
                SetKind (kdInteger);
                NewRec(eoPushImm).Value.AsInteger := ParseFuncSizeOf;
              end
              else
                ErrorUndeclared (TokenData);
            end
            else
              case PIdentData(Idents[J]).IdentType of
                idConst: begin
                    ConstData := Idents[J];
                    SetKind (ConstData.Kind);
                    case ConstData.Kind of
                      kdInteger: begin
                          X := ConstData.Value.AsInteger;
                          if Negate then
                            X := -X;
                          NewRec(eoPushImm).Value.AsInteger := X;
                        end;
                      kdString: begin
                          ExprRec := NewRec(eoPushStrConst);
                          ExprRec.Value.AsConstAddress := adUnallocated;
                          ExprRec.Kind := kdString;
                          ExprRec.ValueStr := ConstData.ValueStr;
                        end;
                    else
                      Assert (False);
                    end;
                  end;
                idVar: begin
                    Data2 := Idents[J];
                    ParseQualifiedVar (Data2, @Data2Addr, True);
                    SetKind (Data2.Typ.Kind);
                    ExprRec := NewRec(eoPushVar);
                    ExprRec.Value.AsVarAddress := Data2Addr;
                    if Negate then
                      Include (ExprRec.Flags, efNegate);
                  end;
                idProc: begin
                    //Error ('Currently, you cannot call functions in expressions');
                    ProcData := Idents[J];
                    if not ProcData.IsFunction then
                      Error ('Cannot call a ''procedure'' in an expression');
                    SetKind (ProcData.ResultType.Kind);
                    ExprRec := NewRec(eoPushCall);
                    New (ExprRec.CallData);
                    ParseProcedureCall (J, ExprRec.CallData^);
                    if Negate then
                      Include (ExprRec.Flags, efNegate);
                  end;
              else
                Error ('Cannot use that type of identifier in an expression');
              end;
            Break;
          end;
      end;
  end;

  procedure Term;
  var
    F1, F2: PExprRec;
  begin
    Factor;
    while True do begin
      case PeekAtNextToken of
        tkMultiply: begin
            NextToken;
            if Kind <> kdInteger then
              Error ('Operand not applicable to this operand type');
            Factor;
            if not LastTwoAreConsts(F1, F2, eoPushImm) then
              NewRec (eoMultiply)
            else begin
              F1.Value.AsInteger := F1.Value.AsInteger * F2.Value.AsInteger;
              RemoveLastRec;
            end;
          end;
        tkDivide: begin
            NextToken;
            if Kind <> kdInteger then
              Error ('Operand not applicable to this operand type');
            Factor;
            if not LastTwoAreConsts(F1, F2, eoPushImm) then
              NewRec (eoDivide)
            else begin
              F1.Value.AsInteger := F1.Value.AsInteger div F2.Value.AsInteger;
              RemoveLastRec;
            end;
          end;
        tkMod: begin
            NextToken;
            if Kind <> kdInteger then
              Error ('Operand not applicable to this operand type');
            Factor;
            if not LastTwoAreConsts(F1, F2, eoPushImm) then
              NewRec (eoMod)
            else begin
              F1.Value.AsInteger := F1.Value.AsInteger mod F2.Value.AsInteger;
              RemoveLastRec;
            end;
          end;
      else
        Break;
      end;
    end;
  end;

  procedure Expr;
  var
    F1, F2: PExprRec;
  begin
    Term;
    while True do begin
      case PeekAtNextToken of
        tkPlus: begin
            NextToken;
            if not(Kind in [kdInteger, kdString]) then
              Error ('Operand not applicable to this operand type');
            Term;
            if Kind = kdInteger then begin
              if not LastTwoAreConsts(F1, F2, eoPushImm) then
                NewRec (eoAdd)
              else begin
                Inc (F1.Value.AsInteger, F2.Value.AsInteger);
                RemoveLastRec;
              end;
            end
            else begin
              if not LastTwoAreConsts(F1, F2, eoPushStrConst) then
                Error ('Both operands must be constants in order to append');
              F1.ValueStr := F1.ValueStr + F2.ValueStr;
              RemoveLastRec;
            end;
          end;
        tkMinus: begin
            NextToken;
            if Kind <> kdInteger then
              Error ('Operand not applicable to this operand type');
            Term;
            if not LastTwoAreConsts(F1, F2, eoPushImm) then
              NewRec (eoSubtract)
            else begin
              Dec (F1.Value.AsInteger, F2.Value.AsInteger);
              RemoveLastRec;
            end;
          end;
      else
        Break;
      end;
    end;
  end;

var
  P: PExprRec;
begin
  DeterminedKind := False;
  AExpr.First := nil;
  AExpr.Last := nil;
  Expr;
  { Now give each string constant in a string expression an address }
  if not ConstantExpr then begin
    P := AExpr.First;
    while Assigned(P) do begin
      if P.Op = eoPushStrConst then
        P.Value.AsConstAddress := NewStringConst(P.ValueStr);
      P := P.Next;
    end;
  end;
end;

procedure TIPCompiler.DisposeExpression (var AExpr: TExpression);
var
  P, P2: PExprRec;
  J: Integer;
begin
  P := AExpr.Last;
  AExpr.First := nil;
  AExpr.Last := nil;
  while Assigned(P) do begin
    P2 := P.Prev;
    if Assigned(P.CallData) then begin
      for J := P.CallData.ParamCount-1 downto 0 do
        DisposeExpression (P.CallData.ParamExpr[J]);
      Dispose (P.CallData);
    end;
    Dispose (P);
    P := P2;
  end;
end;

function TIPCompiler.ParseIntConstExpression: THugeint;
var
  Kind: TTypeKind;
  Expr: TExpression;
begin
  ParseExpression (Kind, Expr, False);
  try
    CheckTypeCompatibility (kdInteger, Kind);
    Result := Expr.First.Value.AsInteger;
  finally
    DisposeExpression (Expr);
  end;
end;

function TIPCompiler.ParseStringConstExpression: String;
var
  Kind: TTypeKind;
  Expr: TExpression;
begin
  ParseExpression (Kind, Expr, True);
  try
    CheckTypeCompatibility (kdString, Kind);
    Result := Expr.First.ValueStr;
  finally
    DisposeExpression (Expr);
  end;
end;

procedure TIPCompiler.HandleProcedureDeclaration (const IsFunction: Boolean);
var
  ProcName: String;
  Data: PProcData;
  FuncData: PFuncData;
  First, I, J: Integer;
  T: PType;
  IsVar, HasBlock: Boolean;
begin
  NextTokenExpect ([tkIdent]);
  ProcName := TokenData;
  if FindIdent(CurScope, TokenData) <> -1 then
    ErrorRedeclared (TokenData);
  FuncData := nil;
  New (Data);
  try
    New (FuncData);
    Data.IdentType := idProc;
    Data.Hash := CalcHash(ProcName);
    Data.Name := ProcName;
    Data.Convention := ccStdcall;
    Data.IsFunction := IsFunction;
    FuncData.DLLIndex := -1;
    FuncData.CodeGen := nil;
    FuncData.Address := adUnallocated;
    FuncData.Called := False;

    J := 0;
    if PeekAtNextToken = tkOpenParen then begin  { any parameters? }
      NextTokenExpect ([tkOpenParen]);

      First := 0;
      while True do begin
        IsVar := False;
        if J = 0 then begin
          case NextTokenExpect([tkVar, tkIdent, tkCloseParen]) of
            tkVar: begin
                IsVar := True;
                NextTokenExpect ([tkIdent]);
              end;
            tkCloseParen: Break;
          end;
        end
        else begin
          case NextTokenExpect([tkSemicolon, tkCloseParen]) of
            tkSemicolon: begin
                if NextTokenExpect([tkVar, tkIdent]) = tkVar then begin
                  IsVar := True;
                  NextTokenExpect ([tkIdent]);
                end;
              end;
            tkCloseParen: Break;
          end;
        end;
        while True do begin
          if J >= MaxParams then
            Error ('Too many parameters; limit is currently 10');
          if NextTokenExpect([tkComma, tkColon]) = tkColon then begin
            NextTokenExpect ([tkIdent]);  { type }
            T := FindType(TokenData);
            for I := First to J do begin
              Data.ParamType[I] := T;
              Data.ParamIsVar[I] := IsVar;
            end;
            Inc (J);
            First := J;
            Break;
          end
          else begin
            NextTokenExpect ([tkIdent]);  { next parameter name in list }
            Inc (J);
          end;
        end;
      end;
    end;
    Data.ParamCount := J;

    if IsFunction then begin
      NextTokenExpect ([tkColon]);
      NextTokenExpect ([tkIdent]);
      Data.ResultType := FindType(TokenData);
    end;

    NextTokenExpect ([tkSemicolon]);

    if PeekAtNextToken <> tkIdent then
      Error ('Currently ''stdcall;'' is required at the end of all procedure declarations');
    NextTokenExpect ([tkIdent]);
    if not SameText(TokenData, 'stdcall') then
      ErrorFmt ('Expected ''stdcall'' but instead found ''%s''', [TokenData]);
    NextTokenExpect ([tkSemicolon]);

    if PeekAtNextToken = tkIdent then begin
      { there's an identifier after the procedure declaration; must be external }
      NextTokenExpect ([tkIdent]);
      if not SameText(TokenData, 'external') then
        ErrorFmt ('Expected ''external'' but instead found ''%s''', [TokenData]);

      TokenData := ParseStringConstExpression;
      J := Linker.DLLList.IndexOf(TokenData);
      if J = -1 then  { is the DLL name not already in the list? }
        J := Linker.DLLList.Add(TokenData);
      FuncData.DLLIndex := J;

      if NextTokenExpect([tkSemicolon, tkIdent]) = tkSemicolon then
        { No 'name'. Import under declared name }
        FuncData.ImportName := ProcName
      else begin
        if not SameText(TokenData, 'name') then
          ErrorFmt ('Expected ''name'' but instead found ''%s''', [TokenData]);
        FuncData.ImportName := ParseStringConstExpression;
        NextTokenExpect ([tkSemicolon]);
      end;

      HasBlock := False;
    end
    else begin
      if Data.ParamCount <> 0 then
        Error ('Currently only ''external'' procedures can have parameters');{}
      HasBlock := True;
    end;
  except
    if Assigned(FuncData) then
      Dispose (FuncData);
    Dispose (Data);
    raise;
  end;
  Data.FuncIndex := Linker.Funcs.Add(FuncData);
  Idents.Add (Data);
  if HasBlock then begin
    FuncData.CodeGen := CodeGenClass.Create;
    HandleDeclarations (False, Data.FuncIndex);
  end;
end;

procedure TIPCompiler.HandleTypeSection;

  function HandleRecordDeclaration (const FieldList: TIdentList;
    const IsPacked: Boolean): TSize;
  var
    FieldNames: TMyStringList;
    VarData: PVar;
    Typ: PType;
    I: Integer;
  begin
    Result := 0;
    FieldNames := TMyStringList.Create;
    try
      repeat
        FieldNames.Clear;
        repeat
          NextTokenExpect ([tkIdent]);  { field name }
          if FieldNames.IndexOf(TokenData) <> -1 then
            ErrorRedeclared (TokenData);
          FieldNames.Add (TokenData);
        until NextTokenExpect([tkComma, tkColon]) = tkColon;
        NextTokenExpect ([tkIdent]);  { type }
        Typ := FindType(TokenData);
        NextTokenExpect ([tkSemicolon]);

        for I := 0 to FieldNames.Count-1 do begin
          New (VarData);
          try
            VarData.IdentType := idVar;
            VarData.Hash := CalcHash(FieldNames[I]);
            VarData.Name := FieldNames[I];
            VarData.Typ := Typ;
            VarData.Address := adUnallocated;
            AllocVar (VarData, TVarAddr(Result), not IsPacked);
          except
            Dispose (VarData);
            raise;
          end;
          FieldList.Add (VarData);
        end;
      until PeekAtNextToken <> tkIdent;
    finally
      FieldNames.Free;
    end;
  end;

var
  TypeName: String;
  Data, OrigType: PType;
  I: Integer;
  Ident: PIdentData;
  AliasData: PTypeAlias;
  Clone, IsRangeType: Boolean;
begin
  repeat
    NextTokenExpect ([tkIdent]);
    TypeName := TokenData;
    if FindIdent(CurScope, TypeName) <> -1 then
      ErrorRedeclared (TypeName);
    NextTokenExpect ([tkEqual]);
    Data := nil;
    AliasData := nil;
    try
      Clone := False;
      IsRangeType := False;
      OrigType := nil;
      case PeekAtNextToken of
        tkIdent: begin
            { If an identifier follows, see if it's a 'type' or a 'constant' }
            I := FindIdent(0, FollowingTokenData);
            if I = -1 then begin
              NextToken;
              ErrorUndeclared (TokenData);
            end;
            Ident := Idents[I];
            case Ident.IdentType of
              idTypeAlias: OrigType := PTypeAlias(Ident).OrigType;
              idType: OrigType := PType(Ident);
            else
              { not a 'type'; assume it's a constant expression starting a range type }
              IsRangeType := True;
            end;
          end;
        tkNumber: IsRangeType := True;
      end;
      if IsRangeType then begin
        { ordinal range type }
        New (Data);
        Data.IdentType := idType;
        Data.Hash := CalcHash(TypeName);
        Data.Name := TypeName;
        Data.Size := 4;
        Data.RecordFields := nil;
        Data.Kind := kdInteger;
        Data.Flags := [];
        Data.BoundLower := ParseIntConstExpression;
        NextTokenExpect ([tkRange]);
        Data.BoundUpper := ParseIntConstExpression;
        if Data.BoundUpper < Data.BoundLower then
          Error ('Upper bound is less than lower bound');
      end
      else begin
        if NextTokenExpectMsg([tkType, tkIdent, tkPacked, tkRecord],
             'Type expected but %s found') = tkType then begin
          Clone := True;
          NextTokenExpect ([tkIdent]);
        end;
        if Token = tkIdent then begin
          if not Clone then begin
            { alias for existing type }
            New (AliasData);
            AliasData.IdentType := idTypeAlias;
            AliasData.Hash := CalcHash(TypeName);
            AliasData.Name := TypeName;
            AliasData.OrigType := OrigType;
          end
          else begin
            { clone of existing type }
            New (Data);
            Data.IdentType := idType;
            Data.Hash := CalcHash(TypeName);
            Data.Name := TypeName;
            Data.Size := OrigType.Size;
            Data.BoundLower := OrigType.BoundLower;
            Data.BoundUpper := OrigType.BoundUpper;
            Data.RecordFields := OrigType.RecordFields;
            if Assigned(Data.RecordFields) then
              Data.RecordFields.IncRefCount;
            Data.Kind := OrigType.Kind;
            Data.Flags := OrigType.Flags;
          end;
        end
        else begin
          { 'record' }
          New (Data);
          Data.IdentType := idType;
          Data.Hash := CalcHash(TypeName);
          Data.Name := TypeName;
          Data.Kind := kdRecord;
          Data.Flags := [];
          Data.BoundLower := 0;
          Data.BoundUpper := 0;
          if Token = tkPacked then begin  { 'packed record'? }
            Include (Data.Flags, tfPacked);
            NextTokenExpect ([tkRecord]);
          end;
          Data.RecordFields := TIdentList.Create;
          Data.Size := HandleRecordDeclaration(Data.RecordFields,
            tfPacked in Data.Flags);
          NextTokenExpect ([tkEnd]);
        end;
      end;
      NextTokenExpect ([tkSemicolon]);
    except
      if Assigned(AliasData) then
        Dispose (AliasData);
      if Assigned(Data) then begin
        if Assigned(Data.RecordFields) and Data.RecordFields.DecRefCount then
          Data.RecordFields.Free;
        Dispose (Data);
      end;
      raise;
    end;
    if Assigned(Data) then
      Idents.Add (Data)
    else
      Idents.Add (AliasData);
  until PeekAtNextToken <> tkIdent;
end;

procedure TIPCompiler.HandleConstSection;
var
  ConstName: String;
  Data: PConst;
  Expr: TExpression;
begin
  repeat
    NextTokenExpect ([tkIdent]);
    ConstName := TokenData;
    if FindIdent(CurScope, ConstName) <> -1 then
      ErrorRedeclared (ConstName);
    if NextTokenExpect([tkColon, tkEqual]) = tkColon then
      Error ('Typed constants aren''t currently supported');
    New (Data);
    try
      Data.IdentType := idConst;
      Data.Hash := CalcHash(ConstName);
      Data.Name := ConstName;
      Data.AddressOfStr := adUnallocated;
      ParseExpression (Data.Kind, Expr, True);
      try
        case Data.Kind of
          kdString: Data.ValueStr := Expr.First.ValueStr;
          kdInteger: Data.Value.AsInteger := Expr.First.Value.AsInteger;
        else
          Assert (False);
        end;
      finally
        DisposeExpression (Expr);
      end;
      NextTokenExpect ([tkSemicolon]);
    except
      Dispose (Data);
      raise;
    end;
    Idents.Add (Data);
  until PeekAtNextToken <> tkIdent;
end;

procedure TIPCompiler.HandleVarSection;
var
  VarNames: TMyStringList;
  I: Integer;
  Data: PVar;
  Typ: PType;
begin
  VarNames := TMyStringList.Create;
  try
    repeat
      VarNames.Clear;
      repeat
        NextTokenExpect ([tkIdent]);  { variable name }
        if (FindIdent(CurScope, TokenData) <> -1) or
           (VarNames.IndexOf(TokenData) <> -1) then
          ErrorRedeclared (TokenData);
        VarNames.Add (TokenData);
      until NextTokenExpect([tkComma, tkColon]) = tkColon;
      NextTokenExpect ([tkIdent]);  { type }
      Typ := FindType(TokenData);
      NextTokenExpect ([tkSemicolon]);

      for I := 0 to VarNames.Count-1 do begin
        New (Data);
        try
          Data.IdentType := idVar;
          Data.Hash := CalcHash(VarNames[I]);
          Data.Name := VarNames[I];
          Data.Typ := Typ;
          Data.Address := adUnallocated;
        except
          Dispose (Data);
          raise;
        end;
        Idents.Add (Data);
      end;
    until PeekAtNextToken <> tkIdent;
  finally
    VarNames.Free;
  end;
end;

procedure TIPCompiler.AllocVar (const Data: PVar; var StartAddr: TVarAddr;
  const Align: Boolean);
{ Ensure actual memory for the specified variable is allocated, i.e. give
  it an address if it doesn't already have one. (Memory isn't allocated
  until a variable is first referenced.) }
var
  Size, Alignment, A: TVarAddr;
begin
  if Data.Address <> adUnallocated then
    Exit;
  Size := Data.Typ.Size;
  if Align then begin
    { Align on qword, dword, or word boundary if necessary }
    if Size > 4 then
      Alignment := 8
    else if Size > 2 then
      Alignment := 4
    else if Size > 1 then
      Alignment := 2
    else
      Alignment := 1;
    A := StartAddr mod Alignment;
    if A <> 0 then
      Inc (StartAddr, Alignment - A);
  end;
  Data.Address := StartAddr;
  Inc (StartAddr, Size);
end;

function TIPCompiler.NewStringConst (const S: String): TConstAddr;
{ Allocates storage for S and returns the address relative to the start of the
  constant section }
begin
  Result := Linker.NewStringConst(S);
end;

procedure TIPCompiler.AllocStrConst (var Data: PConst);
{ Ensure actual memory for the specified constant is allocated, i.e. give
  it an address if it doesn't already have one. (Memory isn't allocated
  until a constant is first referenced.) }
begin
  if Data.AddressOfStr = adUnallocated then
    Data.AddressOfStr := NewStringConst(Data.ValueStr);
end;

procedure TIPCompiler.CheckImmIntRange (const Typ: PType; const Value: TExprValue);
begin
  if (Value.AsInteger < Typ.BoundLower) or (Value.AsInteger > Typ.BoundUpper) then
    Error ('Constant expression out of bounds');
end;

procedure TIPCompiler.ParseQualifiedVar (var VarData: PVar;
  const VarAddr: PVarAddr; const ExpectInited: Boolean);
var
  Hash: THash;
  FieldList: TList;
  I: Integer;
  V: PVar;
begin
  if ExpectInited and (VarData.Address = adUnallocated) then
    WarningFmt ('Variable ''%s'' might not have been initialized', [VarData.Name]);

  if Assigned(VarAddr) then begin
    AllocVar (VarData, TVarAddr(Linker.DataSectionSize), True);
    VarAddr^ := VarData.Address;
  end;
  
  { Now look for '.' for acccessing record fields }
  while PeekAtNextToken = tkPeriod do begin
    NextTokenExpect ([tkPeriod]);
    if VarData.Typ.Kind <> kdRecord then
      Error ('''Record'', ''object'', or ''class'' type required');
    { Find the field name in the type's RecordFields list, then increment
      RecordOffset by the offset of the field }
    NextTokenExpect ([tkIdent]);
    Hash := CalcHash(TokenData);
    FieldList := VarData.Typ.RecordFields;
    VarData := nil;
    for I := 0 to FieldList.Count-1 do begin
      V := FieldList[I];
      if (V.Hash = Hash) and SameText(V.Name, TokenData) then begin
        VarData := V;
        Break;
      end;
    end;
    if VarData = nil then
      ErrorUndeclared (TokenData);
    if Assigned(VarAddr) then
      Inc (VarAddr^, VarData.Address);
  end;
end;

procedure TIPCompiler.HandleVarAssignment (const I: Integer;
  const VarName: String);
var
  Data: PVar;
  DataAddr: TVarAddr;
  Kind: TTypeKind;
  Expr: TExpression;
begin
  Data := PVar(Idents[I]);
  ParseQualifiedVar (Data, @DataAddr, False);
  NextTokenExpect ([tkAssignment]);

  if Data.Typ.Kind = kdRecord then
    Error ('Cannot assign to a record');{}

  ParseExpression (Kind, Expr, False);
  try
    CheckTypeCompatibility (Data.Typ.Kind, Kind);
    case Data.Typ.Kind of
      kdInteger: begin
          if (Expr.First.Op = eoPushImm) and (Expr.First.Next = nil) then begin
            { It's an immediate constant expression }
            CheckImmIntRange (Data.Typ, Expr.First.Value);
            CodeGen.AsgVarImm (DataAddr, Data.Typ.Size, Expr.First.Value.AsInteger);
          end
          else begin
            CodeGen.Expression (Expr);
            { CodeGen.Expression leaves the result at the top of the stack }
            CodeGen.AsgVarPop (DataAddr, Data.Typ.Size);
          end;
        end;
      kdString: begin
          if (Expr.First.Op = eoPushStrConst) and (Expr.First.Next = nil) then begin
            { It's a constant expression }
            {}{this is allocating multiple copies of constants. needs to merge
               duplicates.}
            CodeGen.AsgVarAddrOfConst (DataAddr, Expr.First.Value.AsConstAddress);
          end
          else begin
            CodeGen.Expression (Expr);
            { CodeGen.Expression leaves the result at the top of the stack }
            CodeGen.AsgVarPop (DataAddr, Data.Typ.Size);
          end;
        end;
    else
      Assert (False);
    end;
  finally
    DisposeExpression (Expr);
  end;
end;

procedure TIPCompiler.ParseProcedureCall (const ProcIndex: Integer;
  var CallData: TCallData);
var
  J, K: Integer;
  Data: PProcData;
  ParamType: PType;
  VarData: PVar;
  VarDataAddr: TVarAddr;
  Kind: TTypeKind;
  E: PExprRec;
begin
  Data := PProcData(Idents[ProcIndex]);
  CallData.FuncIndex := Data.FuncIndex;
  CallData.ParamCount := Data.ParamCount;
  PFuncData(Linker.Funcs[Data.FuncIndex]).Called := True;

  { initialize all ParamExprs to nil }
  FillChar (CallData.ParamExpr, SizeOf(CallData.ParamExpr), 0);
  try
    if Data.ParamCount <> 0 then begin
      NextTokenExpect ([tkOpenParen]);

      for J := 0 to Data.ParamCount-1 do begin
        if J > 0 then
          NextTokenExpect ([tkComma]);

        ParamType := Data.ParamType[J];

        if not Data.ParamIsVar[J] then begin
          ParseExpression (Kind, CallData.ParamExpr[J], False);
          CheckTypeCompatibility (ParamType.Kind, Kind);
          E := CallData.ParamExpr[J].First;
          if (ParamType.Kind = kdInteger) and (E.Op = eoPushImm) and
             (E.Next = nil) then
            CheckImmIntRange (ParamType, E.Value);
        end
        else begin
          NextTokenExpect ([tkIdent]);
          K := FindIdent(0, TokenData);
          if K = -1 then
            ErrorUndeclared (TokenData);
          if PIdentData(Idents[K]).IdentType <> idVar then
            Error ('A variable must be passed in a ''var''-type parameter');
          VarData := Idents[K];
          ParseQualifiedVar (VarData, @VarDataAddr, False);
          if ParamType <> VarData.Typ then
            Error ('Types must match exactly');
          E := NewExprRec(CallData.ParamExpr[J], kdInteger, eoPushAddrOfVar);
          E.Value.AsVarAddress := VarDataAddr;
        end;
      end;

      NextTokenExpect ([tkCloseParen]);
    end
    else begin
      { Proc takes no parameters, but allow '()' after the proc name }
      if PeekAtNextToken = tkOpenParen then begin
        NextTokenExpect ([tkOpenParen]);
        NextTokenExpect ([tkCloseParen]);
      end;
    end;
  except
    for J := Data.ParamCount-1 downto 0 do
      DisposeExpression (CallData.ParamExpr[J]);
    raise;
  end;
end;

procedure TIPCompiler.HandleProcedureCall (const ProcIndex: Integer);
var
  CallData: TCallData;
  J: Integer;
begin
  ParseProcedureCall (ProcIndex, CallData);
  try
    CodeGen.CallFunc (CallData);
  finally
    for J := CallData.ParamCount-1 downto 0 do
      DisposeExpression (CallData.ParamExpr[J]);
  end;
end;

procedure TIPCompiler.HandleProcedureBlock (const IsMain: Boolean);
{ Returns True if end of unit reached }
var
  Level, I: Integer;
label Redo;
begin
  Level := 0;
  while True do begin
    NextToken;
  Redo:
    case Token of
      tkEof: Error ('Statement expected but end of file encountered');
      tkSemicolon: ;  { ignore extra semicolons }
      tkIdent: begin
          CodeGen.StatementBegin (TokenLine);
          I := FindIdent(0, TokenData);
          if I = -1 then
            ErrorUndeclared (TokenData);
          case PIdentData(Idents[I]).IdentType of
            idConst: Error ('Cannot assign to or call a constant');
            idVar: HandleVarAssignment (I, TokenData);
            idProc: HandleProcedureCall (I);
          else
            Error ('Statement expected but something else was encountered');
          end;
          NextTokenExpect ([tkSemicolon, tkEnd]);
          goto Redo;
        end;
      tkBegin: Inc (Level);
      tkEnd: begin
          if (Level > 0) or not IsMain then begin  { in a sub-block? }
            NextTokenExpect ([tkSemicolon]);
            if Level = 0 then
              Break;  { reached end of procedure }
            Dec (Level);
          end
          else begin
            NextTokenExpect ([tkPeriod]);
            Break;
          end;
        end;
    else
      Error ('Statement expected but something else was encountered');
    end;
  end;
  CodeGen.StatementBegin (TokenLine);
  CodeGen.FuncEnd;
end;

procedure TIPCompiler.HandleDeclarations (const IsMain: Boolean;
  const FuncIndex: Integer);
var
  PrevScope: Integer;
  PrevCodeGen: TIPCustomCodeGen;
begin
  PrevScope := CurScope;
  PrevCodeGen := CodeGen;
  CurScope := Idents.Count;
  try
    CodeGen := PFuncData(Linker.Funcs[FuncIndex]).CodeGen;
    while True do begin
      if PeekAtNextToken = tkEnd then begin
        { Did we encounter an 'end' with no 'begin'? }
        if IsMain then begin
          HandleProcedureBlock (IsMain);
          Break;
        end
        else
          { Generate an error if not in the main procedure }
          NextTokenExpect ([tkBegin]);
      end;
      NextToken;
      case Token of
        tkEof: Error ('Declaration expected but end of file encountered');
        tkProcedure: HandleProcedureDeclaration (False);
        tkFunction: HandleProcedureDeclaration (True);
        tkType: HandleTypeSection;
        tkConst: HandleConstSection;
        tkVar: HandleVarSection;
        tkBegin: begin
            HandleProcedureBlock (IsMain);
            Break;
          end;
      else
        Error ('Declaration expected but found something else');
      end;
    end;
    ShowHints;
  finally
    CodeGen := PrevCodeGen;
    LeaveScope;
    CurScope := PrevScope;
  end;
end;

procedure TIPCompiler.HandleProgram;
var
  Data: PUnitName;
begin
  NextTokenExpect ([tkIdent]);
  New (Data);
  try
    Data.IdentType := idUnitName;
    Data.Hash := CalcHash(TokenData);
    Data.Name := TokenData;
  except
    Dispose (Data);
    raise;
  end;
  Idents.Add (Data);
  NextTokenExpect ([tkSemicolon]);
end;

procedure TIPCompiler.ShowHints;
var
  I: Integer;
  Ident: PIdentData;
begin
  if Assigned(StatusProc) then
    for I := CurScope to Idents.Count-1 do begin
      Ident := Idents[I];
      if Ident.IdentType <> idVar then
        Continue;
      if PVar(Ident).Address = adUnallocated then
        {}{needs to show correct line & character position of the variable declaration}  
        StatusProc (stHint, TokenFilename, 1, 1,
          Format('Variable ''%s'' declared but never used', [Ident.Name]));
    end;
end;

end.
