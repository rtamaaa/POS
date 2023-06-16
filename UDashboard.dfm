object Dashboard: TDashboard
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Point of Sale'
  ClientHeight = 383
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 0
    Height = 383
    VertScrollBar.Tracking = True
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 0
    object CategoryPanel1: TCategoryPanel
      Top = 0
      Height = 289
      Caption = 'Menu'
      TabOrder = 0
      ExplicitLeft = -3
      ExplicitTop = -2
      object BtnListPenjualan: TBitBtn
        Left = 0
        Top = 99
        Width = 194
        Height = 33
        Align = alTop
        Caption = 'List Penjualan'
        TabOrder = 0
        OnClick = BtnListPenjualanClick
      end
      object bt_listPelanggan: TBitBtn
        Left = 0
        Top = 33
        Width = 194
        Height = 33
        Align = alTop
        Caption = 'List Pelanggan'
        TabOrder = 1
        OnClick = bt_listPelangganClick
      end
      object BtnlistBarang: TBitBtn
        Left = 0
        Top = 0
        Width = 194
        Height = 33
        Align = alTop
        Caption = 'List Barang'
        TabOrder = 2
        OnClick = BtnlistBarangClick
      end
      object BtnListPembelian: TBitBtn
        Left = 0
        Top = 132
        Width = 194
        Height = 33
        Align = alTop
        Caption = 'List Pembelian'
        TabOrder = 3
        OnClick = BtnListPembelianClick
      end
      object BtnListSupplier: TBitBtn
        Left = 0
        Top = 66
        Width = 194
        Height = 33
        Align = alTop
        Caption = 'List Supplier'
        TabOrder = 4
        OnClick = BtnListSupplierClick
      end
    end
  end
end
