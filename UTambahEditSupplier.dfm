object FTambahEditSupplier: TFTambahEditSupplier
  Left = 0
  Top = 0
  Caption = 'TambahEditSupplier'
  ClientHeight = 410
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 35
    Width = 65
    Height = 13
    Caption = 'Kode Supplier'
  end
  object Label2: TLabel
    Left = 48
    Top = 75
    Width = 67
    Height = 13
    Caption = 'Nama supplier'
  end
  object Label3: TLabel
    Left = 48
    Top = 115
    Width = 33
    Height = 13
    Caption = 'Alamat'
  end
  object Label4: TLabel
    Left = 48
    Top = 299
    Width = 36
    Height = 13
    Caption = 'No Telp'
  end
  object Ed_kode_supplier: TEdit
    Left = 160
    Top = 32
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object Ed_nama_supplier: TEdit
    Left = 160
    Top = 72
    Width = 225
    Height = 21
    TabOrder = 1
  end
  object Ed_noTelp: TEdit
    Left = 160
    Top = 296
    Width = 225
    Height = 21
    TabOrder = 2
  end
  object Memo_Alamat: TMemo
    Left = 160
    Top = 112
    Width = 225
    Height = 153
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 360
    Width = 394
    Height = 50
    Align = alBottom
    TabOrder = 4
    object BtnSimpan: TBitBtn
      Left = 223
      Top = 8
      Width = 73
      Height = 33
      Caption = 'SIMPAN'
      TabOrder = 0
      OnClick = BtnSimpanClick
    end
    object BtnBtl: TBitBtn
      Left = 302
      Top = 8
      Width = 73
      Height = 33
      Caption = 'BATAL'
      TabOrder = 1
    end
  end
end
