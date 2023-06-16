unit Ufunctionpelanggan;

interface

implementation

uses UListPelanggan, Ufunction, UDM;

function listpelanggan (SourceString: string): string;
  begin

procedure TFListPelanggan.BtnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambahEditPelanggan,FTambahEditPelanggan);
  status_simpan := 2;
  FTambahEditPelanggan.Ed_kode_pelanggan.Text := QPelanggankode_pelanggan.AsString;
  FTambahEditPelanggan.Ed_nama_pelanggan.Text := QpelangganNama_pelanggan.AsString;
  FTambahEditPelanggan.Ed_noTelp.Text := Qpelangganno_telp.AsString;
  FTambahEditPelanggan.Memo_Alamat.Text := Qpelangganalamat.AsString;
  FTambahEditPelanggan.ShowModal;
  FTambahEditPelanggan.Free
end;

procedure TFListPelanggan.BtnHapusClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah Anda yakin ingin menghapus data yang dipilih','Konfirmasi',MB_YESNO or MB_ICONINFORMATION)=idyes then
    begin
      with DM.Qtemp do
     begin
       Close;
       SQL.Clear;
       Sql.Text:='DELETE FROM pos.tpelanggan'+
       'WHERE kode_pelanggan= '+QuotedStr(Qpelanggankode_pelanggan.AsString);
       Execute;
     end;
     btnrefreshClick(sender);
    end;
end;

procedure TFListPelanggan.BtnRefreshClick(Sender: TObject);
begin
  ed_cari.Clear;
  Qpelanggan.MacroByName('WHERE').Value:='';
    if Qpelanggan.Active then
      Qpelanggan.Refresh
      else
      Qpelanggan.Open
end;

procedure TFListPelanggan.BtnTambahClick(Sender: TObject);
begin
 Application.CreateForm(TFtambahEditPelanggan,FtambahEditPelanggan);
 Status_simpan := 1;
 Cflg_aktif := 0;
 FTambahEditpelanggan.ed_kode_pelanggan.text := Autokode('kode_pelanggan', 'tpelanggan','PL');
 FTambahEditPelanggan.ShowModal;
 FTambahEditPelanggan.Free;
end;

procedure TFListPelanggan.DBGrid1DblClick(Sender: TObject);
begin
btneditClick(Sender);
end;

procedure TFListPelanggan.Ed_cariChange(Sender: TObject);
begin
  Qpelanggan.MacroByName('WHERE').Value:= 'WHERE kode_pelanggan LIKE'+QuotedStr('%'+Ed_cari.Text+'%')+' OR nama_pelanggan LIKE '+QuotedStr('%'+Ed_cari.Text+'%');
  if Qpelanggan.Active then
    Qpelanggan.Refresh
    else
    Qpelanggan.Open;
end;

procedure TFListPelanggan.FormShow(Sender: TObject);
begin
BtnRefreshClick(Sender);
end;

  end;

end.

