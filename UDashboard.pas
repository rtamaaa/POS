unit UDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TDashboard = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    BtnListPenjualan: TBitBtn;
    bt_listPelanggan: TBitBtn;
    BtnlistBarang: TBitBtn;
    BtnListPembelian: TBitBtn;
    BtnListSupplier: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnlistBarangClick(Sender: TObject);
    procedure bt_listPelangganClick(Sender: TObject);
    procedure BtnListSupplierClick(Sender: TObject);
    procedure BtnListPembelianClick(Sender: TObject);
    procedure BtnListPenjualanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dashboard: TDashboard;

implementation

{$R *.dfm}

uses Ulogin, UlistBarang, UListPelanggan, UListSupplier, Upembelian, Upenjualan;



procedure TDashboard.BtnlistBarangClick(Sender: TObject);
begin
application.CreateForm(TFlistbarang,Flistbarang);
 FListBarang.show
end;

procedure TDashboard.BtnListPembelianClick(Sender: TObject);
begin
   Application.CreateForm(TFPembelian,FPembelian);
FPembelian.Show;
end;

procedure TDashboard.BtnListPenjualanClick(Sender: TObject);
begin
   Application.CreateForm(TFPenjualan,FPenjualan);
FPenjualan
.Show;
end;

procedure TDashboard.BtnListSupplierClick(Sender: TObject);
begin
   Application.CreateForm(TFListSupplier,FListSupplier);
FListSupplier.Show;
end;

procedure TDashboard.bt_listPelangganClick(Sender: TObject);
begin
 Application.CreateForm(TFListPelanggan,FListPelanggan);
FListPelanggan.Show;
end;

procedure TDashboard.FormShow(Sender: TObject);
begin
Application.CreateForm(TFLogin,Flogin);
CategoryPanelGroup1.Enabled:=false;
flogin.Show;
end;

end.
