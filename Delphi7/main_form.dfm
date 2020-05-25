object MainForm: TMainForm
  Left = 604
  Top = 244
  Width = 496
  Height = 356
  Caption = #1048#1075#1088#1072' '#1074' '#1089#1083#1086#1074#1072'!'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 63
    Height = 13
    Caption = #1042#1072#1096#1077' '#1089#1083#1086#1074#1086':'
  end
  object Edit1: TEdit
    Left = 80
    Top = 8
    Width = 185
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 8
    Top = 40
    Width = 65
    Height = 25
    Caption = #1054#1090#1074#1077#1090#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 40
    Width = 113
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1083#1086#1074#1072#1088#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 40
    Width = 65
    Height = 25
    Caption = #1057#1076#1072#1090#1100#1089#1103
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 80
    Width = 257
    Height = 217
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      #1055#1088#1072#1074#1080#1083#1072':'
      #1042#1099' '#1076#1086#1083#1078#1085#1099' '#1087#1088#1080#1076#1091#1084#1072#1090#1100' '#1089#1083#1086#1074#1086','
      #1082#1086#1090#1086#1088#1086#1077' '#1085#1072#1095#1080#1085#1072#1077#1090#1100#1089#1103' '#1085#1072' '#1090#1091' '#1089#1072#1084#1091#1102' '#1073#1091#1082#1074#1091','
      #1085#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1079#1072#1082#1072#1085#1095#1080#1074#1072#1083#1086#1089#1100' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1077
      #1089#1083#1086#1074#1086'. '#1045#1089#1083#1080' '#1089#1083#1086#1074#1086' '#1079#1072#1082#1072#1085#1095#1080#1074#1072#1077#1090#1100#1089#1103' '#1085#1072' "'#1099'",'
      '"'#1100'" '#1080#1083#1080' "'#1098'", '#1090#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1077' '#1089#1083#1086#1074#1086' '#1089#1083#1077#1076#1091#1077#1090#39
      #1087#1088#1080#1076#1091#1084#1099#1074#1072#1090#1100' '#1089' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1073#1091#1082#1074#1099'.'
      ''
      #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1086#1076#1077#1088#1078#1080#1090' '#1087#1086#1083#1085#1099#1081
      #1089#1083#1086#1074#1072#1088#1100' '#1089#1091#1097#1077#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1093' '#1088#1091#1089#1089#1082#1086#1075#1086' '#1103#1079#1099#1082#1072'!'
      ''
      #1057#1083#1086#1074#1072#1088#1100' '#1089#1086#1076#1077#1088#1078#1080#1090' '#1086#1082#1086#1083#1086' 900 '#1089#1090#1088#1072#1085#1080#1094)
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 299
    Width = 480
    Height = 19
    Panels = <>
  end
  object ListBox1: TListBox
    Left = 272
    Top = 8
    Width = 206
    Height = 289
    ItemHeight = 13
    TabOrder = 4
    OnDblClick = ListBox1DblClick
    OnKeyPress = ListBox1KeyPress
  end
end
