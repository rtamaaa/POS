object Flogin: TFlogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 170
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 29
    Width = 78
    Height = 18
    Caption = 'UserName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 34
    Top = 63
    Width = 78
    Height = 19
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdUser: TEdit
    Left = 130
    Top = 30
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdPassword: TEdit
    Left = 130
    Top = 65
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object TLogin: TButton
    Left = 168
    Top = 100
    Width = 83
    Height = 33
    Caption = 'Login'
    TabOrder = 2
    OnClick = TLoginClick
  end
end
