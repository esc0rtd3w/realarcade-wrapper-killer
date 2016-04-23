object MainForm: TMainForm
  Left = 206
  Top = 97
  Width = 369
  Height = 311
  Caption = '*'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TopDock: TDock97
    Left = 0
    Top = 0
    Width = 361
    Height = 27
    BoundLines = [blTop]
    object MainToolbar: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Main'
      DefaultDock = TopDock
      DockPos = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object NewButton: TToolbarButton97
        Left = 0
        Top = 0
        Width = 23
        Height = 22
        Hint = 'New'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000C6C7C6C6C7C6
          C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7
          C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          0000000000000000000000000000000000000000000000000000000000000000
          00C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000000000000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C6C7
          C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6
          000000000000000000000000000000000000000000000000C6C7C6C6C7C6C6C7
          C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6}
        OnClick = FNewClick
      end
      object OpenButton: TToolbarButton97
        Left = 23
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Open'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000C6C7C6C6C7C6
          C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7
          C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000000000
          000000000000000000000000000000000000000000000000000000C6C7C6C6C7
          C6C6C7C6C6C7C6C6C7C600000000000000868400868400868400868400868400
          8684008684008684008684000000C6C7C6C6C7C6C6C7C6C6C7C600000000FFFF
          0000000086840086840086840086840086840086840086840086840086840000
          00C6C7C6C6C7C6C6C7C6000000FFFFFF00FFFF00000000868400868400868400
          8684008684008684008684008684008684000000C6C7C6C6C7C600000000FFFF
          FFFFFF00FFFF0000000086840086840086840086840086840086840086840086
          84008684000000C6C7C6000000FFFFFF00FFFFFFFFFF00FFFF00000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000C6C7C6C6C7
          C6C6C7C6C6C7C6C6C7C6000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C600000000FFFF
          FFFFFF00FFFF000000000000000000000000000000000000000000C6C7C6C6C7
          C6C6C7C6C6C7C6C6C7C6C6C7C6000000000000000000C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000000000000000C6C7C6C6C7C6C6C7C6
          C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7
          C6000000000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6
          C7C6000000C6C7C6C6C7C6C6C7C6000000C6C7C6000000C6C7C6C6C7C6C6C7C6
          C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000000000000000C6C7
          C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6}
        OnClick = FOpenClick
      end
      object SaveButton: TToolbarButton97
        Left = 46
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Save'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000008600008600
          0086000086000086000086000086000086000086000086000086000086000086
          0000860000860000860000860000860000000000000000000000000000000000
          0000000000000000000000000000000000000000000000008600008600000000
          008684008684000000000000000000000000000000000000C6C7C6C6C7C60000
          0000868400000000860000860000000000868400868400000000000000000000
          0000000000000000C6C7C6C6C7C6000000008684000000008600008600000000
          008684008684000000000000000000000000000000000000C6C7C6C6C7C60000
          0000868400000000860000860000000000868400868400000000000000000000
          0000000000000000000000000000000000008684000000008600008600000000
          0086840086840086840086840086840086840086840086840086840086840086
          8400868400000000860000860000000000868400868400000000000000000000
          0000000000000000000000000000008684008684000000008600008600000000
          008684000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C60000
          00008684000000008600008600000000008684000000C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000008684000000008600008600000000
          008684000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C60000
          00008684000000008600008600000000008684000000C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000008684000000008600008600000000
          008684000000C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C6C6C7C60000
          00000000000000008600008600000000008684000000C6C7C6C6C7C6C6C7C6C6
          C7C6C6C7C6C6C7C6C6C7C6C6C7C6000000C6C7C6000000008600008600000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000860000860000860000860000860000860000860000860000
          8600008600008600008600008600008600008600008600008600}
        OnClick = FSaveClick
      end
      object MainSep1: TToolbarSep97
        Left = 69
        Top = 0
      end
      object CompileButton: TToolbarButton97
        Left = 75
        Top = 0
        Width = 23
        Height = 22
        Action = actCompile
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000080FFFFFFFFFFFFF080F0F0F0F0F0
          F0F080FFFFFFFFFFFFF080F0F0F0F0F0F0F080FFFFFFFFFFFFF0800000000000
          0000884888884888884884448884448884448848484848484848884888884888
          8848888888888888888888488888488888488888888888888888}
      end
      object RunButton: TToolbarButton97
        Left = 104
        Top = 0
        Width = 23
        Height = 22
        Action = actRun
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000026000000120000000100
          04000000000068010000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333300333333333333333333333333333333333333
          330033333333333333333333333333333333333333003338F333333333333333
          3333333333333333330033380FF33333333333333333FF333333333333003338
          077FF3333333333333388FFF33333333330033380AA77FF3333333333338888F
          FF333333330033380AAAA77FF3333333333888888FFF3333330033380AAAAAA7
          7F33333333388888888FFF33330033380AAAAAAAA00333333338888888888333
          330033380AAAAAA0088333333338888888833333330033380AAAA00883333333
          3338888883333333330033380AA0088333333333333888833333333333003338
          0008833333333333333883333333333333003338088333333333333333333333
          3333333333003338833333333333333333333333333333333300333333333333
          3333333333333333333333333300333333333333333333333333333333333333
          3300}
        NumGlyphs = 2
      end
      object StopButton: TToolbarButton97
        Left = 127
        Top = 0
        Width = 23
        Height = 22
        Action = actStop
        DisplayMode = dmGlyphOnly
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000026000000120000000100
          04000000000068010000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333300333333333333333333333333333333333333
          330033333333333333333333333333333333333333003333FFFFFFFFFFF33333
          333FFFFFFFFFF333330033380777777777F33333338888888888F33333003338
          0999999997F33333338888888888F333330033380999999997F3333333888888
          8888F333330033380999999997F33333338888888888F3333300333809999999
          97F33333338888888888F333330033380999999997F33333338888888888F333
          330033380999999997F33333338888888888F333330033380999999997F33333
          338888888888F333330033380999999997F33333338888888888F33333003338
          0000000007F33333338888888888333333003338888888888833333333333333
          3333333333003333333333333333333333333333333333333300333333333333
          3333333333333333333333333300333333333333333333333333333333333333
          3300}
        NumGlyphs = 2
      end
      object ToolbarSep971: TToolbarSep97
        Left = 98
        Top = 0
      end
    end
  end
  object RightDock: TDock97
    Left = 352
    Top = 27
    Width = 9
    Height = 209
    Position = dpRight
  end
  object BottomDock: TDock97
    Left = 0
    Top = 236
    Width = 361
    Height = 9
    Position = dpBottom
  end
  object LeftDock: TDock97
    Left = 0
    Top = 27
    Width = 9
    Height = 209
    Position = dpLeft
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 245
    Width = 361
    Height = 20
    Panels = <
      item
        Alignment = taCenter
        Text = '   1:   1'
        Width = 64
      end
      item
        Alignment = taCenter
        Width = 64
      end
      item
        Alignment = taCenter
        Text = 'Insert'
        Width = 64
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object OuterPanel: TPanel
    Left = 9
    Top = 27
    Width = 343
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter: TSplitter
      Left = 0
      Top = 158
      Width = 343
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
    end
    object Memo: TSynMemo
      Left = 0
      Top = 0
      Width = 343
      Height = 158
      Cursor = crIBeam
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      PopupMenu = MemoPopup
      TabOrder = 0
      Highlighter = Highlighter
      Keystrokes = <
        item
          Command = ecUp
          ShortCut = 38
          ShortCut2 = 0
        end
        item
          Command = ecSelUp
          ShortCut = 8230
          ShortCut2 = 0
        end
        item
          Command = ecScrollUp
          ShortCut = 16422
          ShortCut2 = 0
        end
        item
          Command = ecDown
          ShortCut = 40
          ShortCut2 = 0
        end
        item
          Command = ecSelDown
          ShortCut = 8232
          ShortCut2 = 0
        end
        item
          Command = ecScrollDown
          ShortCut = 16424
          ShortCut2 = 0
        end
        item
          Command = ecLeft
          ShortCut = 37
          ShortCut2 = 0
        end
        item
          Command = ecSelLeft
          ShortCut = 8229
          ShortCut2 = 0
        end
        item
          Command = ecWordLeft
          ShortCut = 16421
          ShortCut2 = 0
        end
        item
          Command = ecSelWordLeft
          ShortCut = 24613
          ShortCut2 = 0
        end
        item
          Command = ecRight
          ShortCut = 39
          ShortCut2 = 0
        end
        item
          Command = ecSelRight
          ShortCut = 8231
          ShortCut2 = 0
        end
        item
          Command = ecWordRight
          ShortCut = 16423
          ShortCut2 = 0
        end
        item
          Command = ecSelWordRight
          ShortCut = 24615
          ShortCut2 = 0
        end
        item
          Command = ecPageDown
          ShortCut = 34
          ShortCut2 = 0
        end
        item
          Command = ecSelPageDown
          ShortCut = 8226
          ShortCut2 = 0
        end
        item
          Command = ecPageBottom
          ShortCut = 16418
          ShortCut2 = 0
        end
        item
          Command = ecSelPageBottom
          ShortCut = 24610
          ShortCut2 = 0
        end
        item
          Command = ecPageUp
          ShortCut = 33
          ShortCut2 = 0
        end
        item
          Command = ecSelPageUp
          ShortCut = 8225
          ShortCut2 = 0
        end
        item
          Command = ecPageTop
          ShortCut = 16417
          ShortCut2 = 0
        end
        item
          Command = ecSelPageTop
          ShortCut = 24609
          ShortCut2 = 0
        end
        item
          Command = ecLineStart
          ShortCut = 36
          ShortCut2 = 0
        end
        item
          Command = ecSelLineStart
          ShortCut = 8228
          ShortCut2 = 0
        end
        item
          Command = ecEditorTop
          ShortCut = 16420
          ShortCut2 = 0
        end
        item
          Command = ecSelEditorTop
          ShortCut = 24612
          ShortCut2 = 0
        end
        item
          Command = ecLineEnd
          ShortCut = 35
          ShortCut2 = 0
        end
        item
          Command = ecSelLineEnd
          ShortCut = 8227
          ShortCut2 = 0
        end
        item
          Command = ecEditorBottom
          ShortCut = 16419
          ShortCut2 = 0
        end
        item
          Command = ecSelEditorBottom
          ShortCut = 24611
          ShortCut2 = 0
        end
        item
          Command = ecToggleMode
          ShortCut = 45
          ShortCut2 = 0
        end
        item
          Command = ecCopy
          ShortCut = 16429
          ShortCut2 = 0
        end
        item
          Command = ecPaste
          ShortCut = 8237
          ShortCut2 = 0
        end
        item
          Command = ecDeleteChar
          ShortCut = 46
          ShortCut2 = 0
        end
        item
          Command = ecCut
          ShortCut = 8238
          ShortCut2 = 0
        end
        item
          Command = ecDeleteLastChar
          ShortCut = 8
          ShortCut2 = 0
        end
        item
          Command = ecDeleteLastChar
          ShortCut = 8200
          ShortCut2 = 0
        end
        item
          Command = ecDeleteLastWord
          ShortCut = 16392
          ShortCut2 = 0
        end
        item
          Command = ecUndo
          ShortCut = 32776
          ShortCut2 = 0
        end
        item
          Command = ecRedo
          ShortCut = 40968
          ShortCut2 = 0
        end
        item
          Command = ecLineBreak
          ShortCut = 13
          ShortCut2 = 0
        end
        item
          Command = ecSelectAll
          ShortCut = 16449
          ShortCut2 = 0
        end
        item
          Command = ecCopy
          ShortCut = 16451
          ShortCut2 = 0
        end
        item
          Command = ecBlockIndent
          ShortCut = 24649
          ShortCut2 = 0
        end
        item
          Command = ecLineBreak
          ShortCut = 16461
          ShortCut2 = 0
        end
        item
          Command = ecInsertLine
          ShortCut = 16462
          ShortCut2 = 0
        end
        item
          Command = ecDeleteWord
          ShortCut = 16468
          ShortCut2 = 0
        end
        item
          Command = ecBlockUnindent
          ShortCut = 24661
          ShortCut2 = 0
        end
        item
          Command = ecPaste
          ShortCut = 16470
          ShortCut2 = 0
        end
        item
          Command = ecCut
          ShortCut = 16472
          ShortCut2 = 0
        end
        item
          Command = ecDeleteLine
          ShortCut = 16473
          ShortCut2 = 0
        end
        item
          Command = ecDeleteEOL
          ShortCut = 24665
          ShortCut2 = 0
        end
        item
          Command = ecUndo
          ShortCut = 16474
          ShortCut2 = 0
        end
        item
          Command = ecRedo
          ShortCut = 24666
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker0
          ShortCut = 16432
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker1
          ShortCut = 16433
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker2
          ShortCut = 16434
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker3
          ShortCut = 16435
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker4
          ShortCut = 16436
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker5
          ShortCut = 16437
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker6
          ShortCut = 16438
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker7
          ShortCut = 16439
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker8
          ShortCut = 16440
          ShortCut2 = 0
        end
        item
          Command = ecGotoMarker9
          ShortCut = 16441
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker0
          ShortCut = 24624
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker1
          ShortCut = 24625
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker2
          ShortCut = 24626
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker3
          ShortCut = 24627
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker4
          ShortCut = 24628
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker5
          ShortCut = 24629
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker6
          ShortCut = 24630
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker7
          ShortCut = 24631
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker8
          ShortCut = 24632
          ShortCut2 = 0
        end
        item
          Command = ecSetMarker9
          ShortCut = 24633
          ShortCut2 = 0
        end
        item
          Command = ecNormalSelect
          ShortCut = 24654
          ShortCut2 = 0
        end
        item
          Command = ecColumnSelect
          ShortCut = 24643
          ShortCut2 = 0
        end
        item
          Command = ecLineSelect
          ShortCut = 24652
          ShortCut2 = 0
        end
        item
          Command = ecTab
          ShortCut = 9
          ShortCut2 = 0
        end
        item
          Command = ecShiftTab
          ShortCut = 8201
          ShortCut2 = 0
        end
        item
          Command = ecMatchBracket
          ShortCut = 24642
          ShortCut2 = 0
        end>
      WantTabs = True
      OnChange = MemoChange
      OnPaint = MemoPaint
      OnSpecialLineColors = MemoSpecialLineColors
      OnStatusChange = MemoStatusChange
    end
    object MessageList: TListBox
      Left = 0
      Top = 161
      Width = 343
      Height = 48
      Align = alBottom
      ItemHeight = 13
      TabOrder = 1
      OnDblClick = MessageListDblClick
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'pas'
    Filter = 'Inno Pascal unit (*.pas)|*.pas'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 40
    Top = 48
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 48
    object FMenu: TMenuItem
      Caption = '&File'
      OnClick = FMenuClick
      object FNew: TMenuItem
        Caption = '&New'
        ShortCut = 16462
        OnClick = FNewClick
      end
      object FOpen: TMenuItem
        Caption = '&Open...'
        ShortCut = 16463
        OnClick = FOpenClick
      end
      object FSave: TMenuItem
        Caption = '&Save'
        ShortCut = 16467
        OnClick = FSaveClick
      end
      object FSaveAs: TMenuItem
        Caption = 'Save &As...'
        OnClick = FSaveAsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FMRUSep: TMenuItem
        Caption = '-'
        Visible = False
      end
      object FExit: TMenuItem
        Caption = 'E&xit'
        OnClick = FExitClick
      end
    end
    object EMenu: TMenuItem
      Caption = '&Edit'
      OnClick = EMenuClick
      object EUndo: TMenuItem
        Action = actUndo
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ECut: TMenuItem
        Action = actCut
      end
      object ECopy: TMenuItem
        Action = actCopy
      end
      object EPaste: TMenuItem
        Action = actPaste
      end
      object EDelete: TMenuItem
        Caption = 'De&lete'
        OnClick = actDeleteClick
      end
      object ESelectAll: TMenuItem
        Caption = 'Select &All'
        ShortCut = 16449
        OnClick = ESelectAllClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object EFind: TMenuItem
        Caption = '&Find...'
        ShortCut = 16454
        OnClick = EFindClick
      end
      object EFindNext: TMenuItem
        Caption = 'Find &Next'
        ShortCut = 114
        OnClick = EFindNextClick
      end
      object EReplace: TMenuItem
        Caption = '&Replace...'
        ShortCut = 16456
        OnClick = EReplaceClick
      end
    end
    object VMenu: TMenuItem
      Caption = '&View'
      OnClick = VMenuClick
      object VToolbar: TMenuItem
        Caption = '&Toolbar'
        OnClick = VToolbarClick
      end
      object VCompilerMessages: TMenuItem
        Caption = 'Compiler &Messages'
        OnClick = VCompilerMessagesClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object VD: TMenuItem
        Caption = '&Debug Windows'
        object VDEventLog: TMenuItem
          Caption = '&Event Log'
          OnClick = VDEventLogClick
        end
        object VDRegisters: TMenuItem
          Caption = '&Registers'
          OnClick = VDRegistersClick
        end
      end
      object VEditorOptions: TMenuItem
        Caption = '&Editor Options'
        Visible = False
        OnClick = VEditorOptionsClick
        object VEHorizCaret: TMenuItem
          Caption = 'Horizontal Caret Shape'
          OnClick = VEHorizCaretClick
        end
      end
    end
    object Project1: TMenuItem
      Caption = '&Project'
      object PCompile: TMenuItem
        Action = actCompile
      end
      object PBuild: TMenuItem
        Action = actBuild
      end
    end
    object Run1: TMenuItem
      Caption = '&Run'
      object RRun: TMenuItem
        Action = actRun
      end
      object RStop: TMenuItem
        Action = actStop
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object RStepOver: TMenuItem
        Action = actStepOver
      end
      object RRunToCursor: TMenuItem
        Action = actRunToCursor
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object RParameters: TMenuItem
        Caption = '&Parameters...'
        OnClick = RParametersClick
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object HReadme: TMenuItem
        Caption = '&Readme.txt'
        OnClick = HReadmeClick
      end
      object HLicense: TMenuItem
        Caption = '&License.txt'
        OnClick = HLicenseClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object HAbout: TMenuItem
        Caption = '&About...'
        OnClick = HAboutClick
      end
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'pas'
    Filter = 'Inno Pascal unit (*.pas)|*.pas'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 72
    Top = 48
  end
  object FindDialog: TFindDialog
    OnFind = FindDialogFind
    Left = 104
    Top = 48
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = FindDialogFind
    OnReplace = ReplaceDialogReplace
    Left = 136
    Top = 48
  end
  object Highlighter: TSynPasSyn
    DefaultFilter = 'Pascal files (*.pas,*.dpr,*.dpk,*.inc)|*.pas;*.dpr;*.dpk;*.inc'
    CommentAttri.Foreground = clNavy
    CommentAttri.Style = [fsItalic]
    KeyAttri.Style = [fsBold]
    Left = 264
    Top = 32
  end
  object ActionList: TActionList
    Left = 136
    Top = 80
    object actRun: TAction
      Category = 'Run'
      Caption = '&Run'
      Hint = 'Run'
      ShortCut = 120
      OnExecute = actRunClick
    end
    object actStop: TAction
      Category = 'Run'
      Caption = '&Stop'
      Enabled = False
      Hint = 'Stop'
      ShortCut = 16497
      OnExecute = actStopClick
    end
    object actStepOver: TAction
      Category = 'Run'
      Caption = 'Step &Over'
      Hint = 'Step Over'
      ShortCut = 119
      OnExecute = actStepOverClick
    end
    object actCompile: TAction
      Category = 'Project'
      Caption = '&Compile'
      Hint = 'Compile'
      ShortCut = 16504
      OnExecute = actCompileClick
    end
    object actBuild: TAction
      Category = 'Project'
      Caption = '&Build'
      Hint = 'Build'
      OnExecute = actBuildClick
    end
    object actRunToCursor: TAction
      Category = 'Run'
      Caption = 'Run to &Cursor'
      Hint = 'Run to Cursor'
      ShortCut = 115
      OnExecute = actRunToCursorExecute
    end
    object actUndo: TAction
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo'
      ShortCut = 16474
      OnExecute = actUndoClick
    end
    object actCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut'
      ShortCut = 16472
      OnExecute = actCutClick
    end
    object actCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy'
      ShortCut = 16451
      OnExecute = actCopyClick
    end
    object actPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste'
      ShortCut = 16470
      OnExecute = actPasteClick
    end
    object actDelete: TAction
      Category = 'Edit'
      Caption = 'De&lete'
      Hint = 'Delete'
      OnExecute = actDeleteClick
    end
  end
  object MemoPopup: TPopupMenu
    Left = 8
    Top = 80
    object MPUndo: TMenuItem
      Action = actUndo
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object MPCut: TMenuItem
      Action = actCut
    end
    object MPCopy: TMenuItem
      Action = actCopy
    end
    object MPPaste: TMenuItem
      Action = actPaste
    end
    object MPDelete: TMenuItem
      Action = actDelete
    end
  end
end
