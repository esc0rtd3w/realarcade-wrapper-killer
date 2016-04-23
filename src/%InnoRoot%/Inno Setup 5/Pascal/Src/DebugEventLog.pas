unit DebugEventLog;

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

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus;

type
  TDebugEventLogForm = class(TForm)
    List: TListView;
    PopupMenu: TPopupMenu;
    Clear1: TMenuItem;
    procedure Clear1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Log (const AType, ADetails: String);
  end;

var
  DebugEventLogForm: TDebugEventLogForm;

implementation

{$R *.DFM}

procedure TDebugEventLogForm.Log (const AType, ADetails: String);
var
  I: TListItem;
begin
  if not Visible then
    Exit;
  I := List.Items.Add;
  I.Caption := AType;
  I.Subitems.Add (ADetails);
  I.Selected := True;
  I.MakeVisible (False);
end;

procedure TDebugEventLogForm.Clear1Click(Sender: TObject);
begin
  List.Items.Clear;
end;

end.

