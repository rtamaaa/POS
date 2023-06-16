object FListPelanggan: TFListPelanggan
  Left = 0
  Top = 0
  Caption = 'Pelanggan'
  ClientHeight = 433
  ClientWidth = 685
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
  object Panel2: TPanel
    Left = -5
    Top = 0
    Width = 682
    Height = 49
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 119
      Height = 23
      Caption = 'PELANGGAN'
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
      Top = 18
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
    DataSource = DSpelanggan
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 376
    Width = 682
    Height = 57
    TabOrder = 2
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
    object BtnClose: TBitBtn
      Left = 8
      Top = 8
      Width = 73
      Height = 33
      Caption = 'KEMBALI'
      TabOrder = 3
      OnClick = BtnCloseClick
    end
    object BtnRefresh: TBitBtn
      Left = 609
      Top = 7
      Width = 73
      Height = 33
      Caption = 'REFRESH'
      TabOrder = 4
      OnClick = BtnRefreshClick
    end
  end
  object DSpelanggan: TDataSource
    DataSet = Qpelanggan
    Left = 336
    Top = 224
  end
  object Qpelanggan: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM tpelanggan'
      '&WHERE'
      '&ORDERBY')
    Left = 424
    Top = 160
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
    object Qpelanggankode_pelanggan: TStringField
      FieldName = 'kode_pelanggan'
      Origin = 'kode_pelanggan'
      Required = True
    end
    object Qpelanggannama_pelanggan: TStringField
      FieldName = 'nama_pelanggan'
      Origin = 'nama_pelanggan'
      Required = True
      Size = 60
    end
    object Qpelangganalamat: TMemoField
      FieldName = 'alamat'
      Origin = 'alamat'
      Required = True
      BlobType = ftMemo
    end
    object Qpelangganno_telp: TStringField
      FieldName = 'no_telp'
      Origin = 'no_telp'
      Required = True
      Size = 13
    end
  end
end
