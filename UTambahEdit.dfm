object FtambahEdit: TFtambahEdit
  Left = 0
  Top = 0
  Caption = 'Tambah/Edit Barang'
  ClientHeight = 352
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -2
    Top = 0
    Width = 390
    Height = 296
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 9
      Width = 82
      Height = 16
      Caption = 'Kode Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 39
      Width = 85
      Height = 16
      Caption = 'Nama Barang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 69
      Width = 58
      Height = 16
      Caption = 'Deskripsi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 4
      Top = 99
      Width = 46
      Height = 16
      Caption = 'Satuan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 4
      Top = 145
      Width = 65
      Height = 16
      Caption = 'Stok Awal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 4
      Top = 175
      Width = 55
      Height = 16
      Caption = 'Stok Min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 4
      Top = 205
      Width = 68
      Height = 16
      Caption = 'Harga Jual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Ed_kode: TEdit
      Left = 105
      Top = 6
      Width = 145
      Height = 24
      TabOrder = 0
    end
    object Ed_nama_barang: TEdit
      Left = 105
      Top = 36
      Width = 241
      Height = 24
      TabOrder = 1
    end
    object Ed_desk: TEdit
      Left = 105
      Top = 66
      Width = 241
      Height = 24
      TabOrder = 2
    end
    object Ed_stok_awal: TEdit
      Left = 105
      Top = 142
      Width = 145
      Height = 24
      TabOrder = 3
    end
    object Cb_satuan: TComboBox
      Left = 105
      Top = 96
      Width = 97
      Height = 24
      TabOrder = 4
      Items.Strings = (
        'PCS'
        'Kiloan')
    end
    object Ed_stok_min: TEdit
      Left = 105
      Top = 172
      Width = 145
      Height = 24
      TabOrder = 5
    end
    object Ed_harga: TEdit
      Left = 105
      Top = 202
      Width = 145
      Height = 24
      TabOrder = 6
    end
    object flg_check: TCheckBox
      Left = 105
      Top = 232
      Width = 97
      Height = 17
      Caption = 'FLG Aktif'
      TabOrder = 7
      OnClick = flg_checkClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 302
    Width = 385
    Height = 50
    Align = alBottom
    TabOrder = 1
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
