object Fpembelian: TFpembelian
  Left = 0
  Top = 0
  Caption = 'Pembelian'
  ClientHeight = 444
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 164
      Height = 23
      Caption = 'LIST PEMBELIAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 387
    Width = 681
    Height = 57
    Align = alBottom
    TabOrder = 1
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 681
    Height = 338
    Align = alClient
    DataSource = DSpembelian
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Qpembelian: TFDQuery
    Active = True
    Connection = DM.FDConnection1
    SQL.Strings = (
      
        'SELECT tpm.*,ts.nama_supplier FROM tpembelian_master tpm'#10' INNER ' +
        'JOIN tsupplier ts ON ts.kode_supplier = tpm.kode_supplier'#10)
    Left = 256
    Top = 168
    object Qpembeliankode_pembelian: TStringField
      FieldName = 'kode_pembelian'
      Origin = 'kode_pembelian'
      Required = True
    end
    object Qpembeliantgl_pembelian: TDateField
      FieldName = 'tgl_pembelian'
      Origin = 'tgl_pembelian'
      Required = True
    end
    object Qpembeliankode_supplier: TStringField
      FieldName = 'kode_supplier'
      Origin = 'kode_supplier'
      Required = True
    end
    object Qpembelianno_bukti: TStringField
      FieldName = 'no_bukti'
      Origin = 'no_bukti'
      Required = True
    end
    object Qpembeliannama_supplier: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nama_supplier'
      Origin = 'nama_supplier'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object DSpembelian: TDataSource
    DataSet = Qpembelian
    Left = 336
    Top = 224
  end
end
