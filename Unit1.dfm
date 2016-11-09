object Form1: TForm1
  Left = 260
  Top = 105
  BorderStyle = bsDialog
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1076#1080#1086#1092#1072#1085#1090#1086#1074#1072' '#1091#1088#1072#1074#1085#1077#1085#1080#1103' '#1074' '#1057#1054#1050
  ClientHeight = 573
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label_koeff: TLabel
    Left = 16
    Top = 8
    Width = 192
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1077#1085#1090#1099' '#1076#1080#1086#1092#1072#1085#1090#1086#1074#1072' '#1091#1088#1072#1074#1085#1077#1085#1080#1103
  end
  object Label_A: TLabel
    Left = 376
    Top = 8
    Width = 83
    Height = 13
    Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1095#1083#1077#1085
  end
  object Label_SOK_koeff: TLabel
    Left = 16
    Top = 128
    Width = 168
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1091#1088#1072#1074#1085#1077#1085#1080#1103' '#1074' '#1057#1054#1050
  end
  object Label_SOK_A: TLabel
    Left = 16
    Top = 288
    Width = 117
    Height = 13
    Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1095#1083#1077#1085' '#1074' '#1057#1054#1050
  end
  object Label_SOK_X: TLabel
    Left = 16
    Top = 344
    Width = 121
    Height = 13
    Caption = #1050#1086#1088#1085#1080' '#1091#1088#1072#1074#1085#1077#1085#1080#1103' '#1074' '#1057#1054#1050
  end
  object Label_msg: TLabel
    Left = 376
    Top = 128
    Width = 150
    Height = 13
    Caption = #1044#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  end
  object Label_PP: TLabel
    Left = 376
    Top = 64
    Width = 76
    Height = 13
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1057#1054#1050
  end
  object Label_basis: TLabel
    Left = 16
    Top = 64
    Width = 124
    Height = 13
    Caption = #1054#1088#1090#1086#1075#1086#1085#1072#1083#1100#1085#1099#1077'  '#1073#1072#1079#1080#1089#1099
  end
  object Label_X: TLabel
    Left = 16
    Top = 512
    Width = 121
    Height = 13
    Caption = #1050#1086#1088#1085#1080' '#1091#1088#1072#1074#1085#1077#1085#1080#1103' '#1074' '#1055#1057#1057
  end
  object Edit_A: TEdit
    Left = 376
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Grid_koeff: TStringGrid
    Left = 16
    Top = 24
    Width = 337
    Height = 33
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
    ScrollBars = ssNone
    TabOrder = 1
  end
  object Grid_SOK_koeff: TStringGrid
    Left = 16
    Top = 144
    Width = 337
    Height = 137
    FixedCols = 0
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 2
  end
  object Grid_SOK_A: TStringGrid
    Left = 16
    Top = 304
    Width = 337
    Height = 33
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 3
  end
  object Grid_basis: TStringGrid
    Left = 16
    Top = 80
    Width = 337
    Height = 33
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 4
  end
  object Memo_msg: TMemo
    Left = 376
    Top = 144
    Width = 209
    Height = 89
    ReadOnly = True
    TabOrder = 5
  end
  object BtnExit: TButton
    Left = 480
    Top = 528
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 6
    OnClick = BtnExitClick
  end
  object BtnStart: TButton
    Left = 376
    Top = 528
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 7
    OnClick = BtnStartClick
  end
  object Edit_PP: TEdit
    Left = 376
    Top = 80
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object Grid_SOK_X: TStringGrid
    Left = 16
    Top = 360
    Width = 337
    Height = 137
    FixedCols = 0
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 9
  end
  object Grid_X: TStringGrid
    Left = 16
    Top = 528
    Width = 337
    Height = 33
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 10
  end
end
