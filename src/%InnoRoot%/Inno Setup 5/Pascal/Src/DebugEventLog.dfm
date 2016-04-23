object DebugEventLogForm: TDebugEventLogForm
  Left = 460
  Top = 293
  Width = 462
  Height = 179
  BorderStyle = bsSizeToolWin
  Caption = 'Event Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object List: TListView
    Left = 0
    Top = 0
    Width = 454
    Height = 152
    Align = alClient
    Columns = <
      item
        Caption = 'Type'
        Width = 96
      end
      item
        Caption = 'Details'
        Width = 336
      end>
    ColumnClick = False
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu
    TabOrder = 0
    ViewStyle = vsReport
  end
  object PopupMenu: TPopupMenu
    Left = 344
    Top = 64
    object Clear1: TMenuItem
      Caption = '&Clear'
      OnClick = Clear1Click
    end
  end
end
