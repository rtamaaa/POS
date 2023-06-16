object FLIstBarang: TFLIstBarang
  Left = 0
  Top = 0
  Caption = 'Stok Barang'
  ClientHeight = 430
  ClientWidth = 690
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
    Left = 0
    Top = 376
    Width = 689
    Height = 57
    TabOrder = 0
    object BtnEdit: TBitBtn
      Left = 451
      Top = 7
      Width = 73
      Height = 33
      Caption = 'UBAH'
      TabOrder = 0
      OnClick = BtnEditClick
    end
    object BtnTambah: TBitBtn
      Left = 372
      Top = 7
      Width = 73
      Height = 33
      Caption = 'TAMBAH'
      TabOrder = 1
      OnClick = BtnTambahClick
    end
    object BtnHapus: TBitBtn
      Left = 530
      Top = 7
      Width = 73
      Height = 33
      Caption = 'HAPUS'
      TabOrder = 2
      OnClick = BtnHapusClick
    end
    object BtnRefresh: TBitBtn
      Left = 609
      Top = 7
      Width = 73
      Height = 33
      Caption = 'REFRESH'
      TabOrder = 3
      OnClick = BtnRefreshClick
    end
    object BtnClose: TBitBtn
      Left = 8
      Top = 8
      Width = 73
      Height = 33
      Caption = 'KEMBALI'
      TabOrder = 4
      OnClick = BtnCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 49
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 138
      Height = 23
      Caption = 'LIST BARANG '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 448
      Top = 21
      Width = 19
      Height = 13
      Caption = 'Cari'
    end
    object Ed_cari: TEdit
      Left = 489
      Top = 15
      Width = 160
      Height = 21
      TabOrder = 0
      OnChange = Ed_cariChange
    end
  end
  object DBGrid1: TDBGrid
    Left = -7
    Top = 55
    Width = 689
    Height = 322
    DataSource = DSbarang
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Qbarang: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM tbarang'
      '&WHERE'
      '&ORDERBY')
    Left = 264
    Top = 232
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
        DataType = mdIdentifier
      end
      item
        Value = Null
        Name = 'ORDERBY'
        DataType = mdIdentifier
      end>
    object Qbarangkode_barang: TStringField
      FieldName = 'kode_barang'
      Origin = 'kode_barang'
      Required = True
    end
    object Qbarangnama_barang: TStringField
      FieldName = 'nama_barang'
      Origin = 'nama_barang'
      Required = True
      Size = 100
    end
    object Qbarangdeskripsi: TStringField
      FieldName = 'deskripsi'
      Origin = 'deskripsi'
      Required = True
      Size = 250
    end
    object Qbarangsatuan: TStringField
      FieldName = 'satuan'
      Origin = 'satuan'
      Required = True
      Size = 10
    end
    object Qbarangstokawal: TSingleField
      FieldName = 'stokawal'
      Origin = 'stokawal'
      Required = True
    end
    object Qbarangstokmin: TSingleField
      FieldName = 'stokmin'
      Origin = 'stokmin'
      Required = True
    end
    object Qbaranghargajual: TSingleField
      FieldName = 'hargajual'
      Origin = 'hargajual'
      Required = True
    end
    object Qbarangflg_aktif: TSmallintField
      FieldName = 'flg_aktif'
      Origin = 'flg_aktif'
      Required = True
    end
  end
  object DSbarang: TDataSource
    DataSet = Qbarang
    Left = 336
    Top = 224
  end
end
