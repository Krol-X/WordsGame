object StartForm: TStartForm
  Left = 772
  Top = 259
  Width = 256
  Height = 102
  Caption = #1048#1075#1088#1072' '#1074' '#1089#1083#1086#1074#1072'!'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 77
    Height = 13
    Caption = #1060#1072#1081#1083' '#1089#1083#1086#1074#1072#1088#1103':'
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 8
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 32
    Width = 225
    Height = 25
    Caption = #1048#1075#1088#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 209
    Top = 6
    Width = 24
    Height = 24
    Caption = 'P'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Wingdings 3'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end
