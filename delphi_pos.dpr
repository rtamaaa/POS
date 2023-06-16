program delphi_pos;

uses
  Vcl.Forms,
  Ulogin in 'Ulogin.pas' {Flogin},
  Ufunction in 'Ufunction.pas',
  UDashboard in 'UDashboard.pas' {Dashboard},
  UDM in 'UDM.pas' {DM: TDataModule},
  UlistBarang in 'UlistBarang.pas' {FLIstBarang},
  UTambahEdit in 'UTambahEdit.pas' {FtambahEdit},
  UListPelanggan in 'UListPelanggan.pas' {FListPelanggan},
  UTambahEditPelanggan in 'UTambahEditPelanggan.pas' {FTambahEditPelanggan},
  UListSupplier in 'UListSupplier.pas' {FListSupplier},
  UTambahEditSupplier in 'UTambahEditSupplier.pas' {FTambahEditSupplier},
  Upembelian in 'Upembelian.pas' {Fpembelian},
  UTambahEditPembelian in 'UTambahEditPembelian.pas' {FTambahEditPembelian},
  Upenjualan in 'Upenjualan.pas' {Fpenjualan},
  UTambahEditPenjualan in 'UTambahEditPenjualan.pas' {FTambahEditPenjualan};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDashboard, Dashboard);
  Application.Run;
end.
