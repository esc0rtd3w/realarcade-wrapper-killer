unit DebugRegisters;

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
  ComCtrls;

type
  TDebugRegistersForm = class(TForm)
    List: TListView;
    procedure ListCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NewContext (const Context: TContext);
    procedure NoContext;
  end;

var
  DebugRegistersForm: TDebugRegistersForm;

implementation

{$R *.DFM}

procedure TDebugRegistersForm.NewContext (const Context: TContext);
var
  CW0, CW1: integer; // widths of listview columns
  IsVisible: Boolean;

  procedure UpdateSubitemData(AIndex: integer; AText: string);
  var
    B: boolean;
    RC: TRect;
  begin
    with List.Items[AIndex] do begin
      B := Subitems[0] <> AText;
      if B then
        Subitems[0] := AText;
      // reset change mark
      if Data <> pointer(B) then begin
        Data := pointer(B);
        B := TRUE;
      end;
      if IsVisible and B then begin
        // get minimum update rect for column 1
        RC := DisplayRect(drBounds);
        RC.Left := CW0;
        RC.Right := RC.Left + CW1;
        // invalidate and update immediately, so that small rects won't be
        // combined into one big rect (else lines 1 and 8 would invalidate 1..8)
        InvalidateRect(List.Handle, @RC, TRUE);
        List.Update;
      end;
    end;
  end;

begin
  Caption := 'Registers';
  List.HandleNeeded;  { required or else accessing the list items will cause an AV }
  CW0 := List.Columns[0].Width;
  CW1 := List.Columns[1].Width;
  IsVisible := IsWindowVisible(List.Handle);
  // BeginUpdate/EndUpdate is a bad idea, since it will always invalidate
  // the whole client area of the listview, even if nothing has changed
  UpdateSubitemData(0, IntToHex(Context.Eax, 8));
  UpdateSubitemData(1, IntToHex(Context.Ebx, 8));
  UpdateSubitemData(2, IntToHex(Context.Ecx, 8));
  UpdateSubitemData(3, IntToHex(Context.Edx, 8));
  UpdateSubitemData(4, IntToHex(Context.Esi, 8));
  UpdateSubitemData(5, IntToHex(Context.Edi, 8));
  UpdateSubitemData(6, IntToHex(Context.Ebp, 8));
  UpdateSubitemData(7, IntToHex(Context.Esp, 8));
  UpdateSubitemData(8, IntToHex(Context.Eip, 8));
  UpdateSubitemData(9, IntToHex(Context.EFlags, 8));
  UpdateSubitemData(10, IntToHex(Context.SegCS, 4));
  UpdateSubitemData(11, IntToHex(Context.SegDS, 4));
  UpdateSubitemData(12, IntToHex(Context.SegSS, 4));
  UpdateSubitemData(13, IntToHex(Context.SegES, 4));
end;

procedure TDebugRegistersForm.NoContext;
{var
  I: Integer;}
begin
  Caption := 'Last Registers';
  (*
  List.HandleNeeded;  { required or else accessing the list items will cause an AV }
  List.Items.BeginUpdate;
  try
    for I := 0 to 13 do
      List.Items[I].Subitems[0] := '?';
  finally
    List.Items.EndUpdate;
  end;
  *)
end;

procedure TDebugRegistersForm.ListCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if (SubItem = 1) and not (cdsSelected in State) then begin
    if Item.Data <> nil then
      Sender.Canvas.Font.Color := clRed
    else
      Sender.Canvas.Font.Color := clWindowText;
  end;
end;

end.

