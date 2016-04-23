unit IPBase;

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

{ Declarations for applications }

uses
  SysUtils, Classes;

type
  EIPCompilerError = class(Exception)
  public
    Filename: String;
    Line, Ch: Integer;
    ErrorText: String;
  end;

  PLineNumberInfoArray = ^TLineNumberInfoArray;
  TLineNumberInfoArray = array[1..$1FFFFFFF] of Cardinal;

  TCompilerStatusType = (stWarning, stHint);
  TCompilerStatusProc = procedure(AType: TCompilerStatusType;
    const AFilename: String; ALine, ACh: Integer; const AMsg: String) of object;

implementation

end.
