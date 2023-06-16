object Fpenjualan: TFpenjualan
  Left = 0
  Top = 0
  Caption = 'LIST PENJUALAN'
  ClientHeight = 466
  ClientWidth = 678
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
    Top = 409
    Width = 678
    Height = 57
    Align = alBottom
    TabOrder = 0
    object BtnEdit: TBitBtn
      Left = 434
      Top = 14
      Width = 73
      Height = 33
      Caption = 'UBAH'
      TabOrder = 0
      OnClick = BtnEditClick
    end
    object BtnTambah: TBitBtn
      Left = 355
      Top = 14
      Width = 73
      Height = 33
      Caption = 'TAMBAH'
      TabOrder = 1
      OnClick = BtnTambahClick
    end
    object BtnHapus: TBitBtn
      Left = 513
      Top = 14
      Width = 73
      Height = 33
      Caption = 'HAPUS'
      TabOrder = 2
      OnClick = BtnHapusClick
    end
    object BtnRefresh: TBitBtn
      Left = 592
      Top = 14
      Width = 73
      Height = 33
      Caption = 'REFRESH'
      TabOrder = 3
      OnClick = BtnRefreshClick
    end
    object BtnClose: TBitBtn
      Left = 20
      Top = 14
      Width = 73
      Height = 33
      Caption = 'KEMBALI'
      TabOrder = 4
      OnClick = BtnCloseClick
    end
  end
  object Ed_cari: TEdit
    Left = 489
    Top = 15
    Width = 160
    Height = 21
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 678
    Height = 360
    Align = alClient
    DataSource = DSpenjualan
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 49
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 165
      Height = 23
      Caption = 'LIST PENJUALAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DSpenjualan: TDataSource
    DataSet = Qpenjualan
    Left = 336
    Top = 224
  end
  object Qpenjualan: TFDQuery
    Active = True
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT tpm.*,tp.nama_pelanggan FROM tpenjualan_master tpm '
      'INNER JOIN tpelanggan tp ON tp.kode_pelanggan=tpm.kode_pelanggan'
      '')
    Left = 256
    Top = 168
    object Qpenjualankode_penjualan: TStringField
      FieldName = 'kode_penjualan'
      Origin = 'kode_penjualan'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Qpenjualantgl_penjualan: TDateField
      FieldName = 'tgl_penjualan'
      Origin = 'tgl_penjualan'
      Required = True
    end
    object Qpenjualankode_pelanggan: TStringField
      FieldName = 'kode_pelanggan'
      Origin = 'kode_pelanggan'
      Required = True
    end
    object Qpenjualanno_bukti: TStringField
      FieldName = 'no_bukti'
      Origin = 'no_bukti'
      Required = True
    end
    object Qpenjualannama_pelanggan: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama_pelanggan'
      Origin = 'nama_pelanggan'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Qpenjualantotal: TSingleField
      FieldName = 'total'
      Origin = 'total'
      Required = True
    end
    object Qpenjualanbayar: TSingleField
      FieldName = 'bayar'
      Origin = 'bayar'
      Required = True
    end
    object Qpenjualankembali: TSingleField
      FieldName = 'kembali'
      Origin = 'kembali'
      Required = True
    end
  end
end
