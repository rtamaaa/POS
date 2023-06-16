object FTambahEditPembelian: TFTambahEditPembelian
  Left = 0
  Top = 0
  Caption = 'Tambah/EditPembelian'
  ClientHeight = 471
  ClientWidth = 572
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
    Left = 20
    Top = 18
    Width = 75
    Height = 13
    Caption = 'Kode Pembelian'
  end
  object Label2: TLabel
    Left = 20
    Top = 51
    Width = 38
    Height = 13
    Caption = 'Tanggal'
  end
  object Label3: TLabel
    Left = 20
    Top = 82
    Width = 68
    Height = 13
    Caption = 'Nama Supplier'
  end
  object Label4: TLabel
    Left = 20
    Top = 116
    Width = 65
    Height = 13
    Caption = 'Kode Supplier'
  end
  object Label5: TLabel
    Left = 20
    Top = 149
    Width = 86
    Height = 13
    Caption = 'No. Bukti/Kwitansi'
  end
  object Ed_kode_pembelian: TEdit
    Left = 132
    Top = 15
    Width = 133
    Height = 21
    TabOrder = 0
  end
  object DTpembelian: TDateTimePicker
    Left = 132
    Top = 46
    Width = 133
    Height = 21
    Date = 45087.000000000000000000
    Time = 0.391867141202965300
    TabOrder = 1
  end
  object Ed_kodesupplier: TEdit
    Left = 132
    Top = 113
    Width = 133
    Height = 21
    TabOrder = 2
  end
  object Cb_namaSupplier: TComboBox
    Left = 132
    Top = 79
    Width = 205
    Height = 21
    TabOrder = 3
    OnChange = Cb_namaSupplierChange
    OnDropDown = Cb_namaSupplierDropDown
  end
  object Ed_noBukti: TEdit
    Left = 132
    Top = 146
    Width = 197
    Height = 21
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 173
    Width = 572
    Height = 240
    Align = alBottom
    DataSource = DSCDS1
    PopupMenu = PopupMenu1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    Columns = <
      item
        Expanded = False
        FieldName = 'kode_barang'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_barang'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'satuan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'harga_beli'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sub_total'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 413
    Width = 572
    Height = 58
    Align = alBottom
    TabOrder = 6
    object BtnSimpan: TButton
      Left = 488
      Top = 16
      Width = 75
      Height = 33
      Caption = 'SIMPAN'
      TabOrder = 0
      OnClick = BtnSimpanClick
    end
    object BtnClose: TBitBtn
      Left = 20
      Top = 6
      Width = 73
      Height = 33
      Caption = 'KEMBALI'
      TabOrder = 1
      OnClick = BtnCloseClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 216
    object InsertCtrlN1: TMenuItem
      Caption = 'Insert  Ctrl+N'
      ShortCut = 16462
      OnClick = InsertCtrlN1Click
    end
    object DeleteDel1: TMenuItem
      Caption = 'Delete Del'
      ShortCut = 16430
      OnClick = DeleteDel1Click
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      ShortCut = 16453
      OnClick = Edit1Click
    end
  end
  object CDS1: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000006000000000003000000A6000B6B6F64
      655F626172616E6701004900000001000557494454480200020014000B6E616D
      615F626172616E67010049000000010005574944544802000200C80006736174
      75616E01004900000001000557494454480200020014000A68617267615F6265
      6C690800040000000000037174790800040000000000097375625F746F74616C
      08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'kode_barang'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nama_barang'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'satuan'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'harga_beli'
        DataType = ftFloat
      end
      item
        Name = 'qty'
        DataType = ftFloat
      end
      item
        Name = 'sub_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 280
    object CDS1kode_barang: TStringField
      FieldName = 'kode_barang'
    end
    object CDS1nama_barang: TStringField
      FieldName = 'nama_barang'
      Size = 200
    end
    object CDS1satuan: TStringField
      FieldName = 'satuan'
    end
    object CDS1harga_beli: TFloatField
      FieldName = 'harga_beli'
    end
    object CDS1qty: TFloatField
      FieldName = 'qty'
    end
    object CDS1sub_total: TFloatField
      FieldName = 'sub_total'
    end
  end
  object DSCDS1: TDataSource
    DataSet = CDS1
    Left = 256
    Top = 240
  end
end
