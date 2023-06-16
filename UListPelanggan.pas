unit UListPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TFListPelanggan = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Ed_cari: TEdit;
    DSpelanggan: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnEdit: TBitBtn;
    BtnTambah: TBitBtn;
    BtnHapus: TBitBtn;
    BtnClose: TBitBtn;
    BtnRefresh: TBitBtn;
    Qpelanggan: TFDQuery;
    Qpelanggankode_pelanggan: TStringField;
    Qpelanggannama_pelanggan: TStringField;
    Qpelangganalamat: TMemoField;
    Qpelangganno_telp: TStringField;
    Label2: TLabel;
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ed_cariChange(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListPelanggan: TFListPelanggan;

implementation

{$R *.dfm}

uses UDM, Ufunction, UTambahEditPelanggan;


procedure TFListPelanggan.BtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFListPelanggan.BtnEditClick(Sender: TObject);           //edit
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

procedure TFListPelanggan.BtnHapusClick(Sender: TObject);        //hapus
begin
  if Application.MessageBox('Apakah Anda yakin ingin menghapus data yang dipilih','Konfirmasi',MB_YESNO or MB_ICONINFORMATION)=idyes then
    begin
      with DM.Qtemp do
     begin
       Close;
       SQL.Clear;
       Sql.Text:='DELETE FROM pos.tpelanggan '+
       'WHERE kode_pelanggan= '+QuotedStr(Qpelanggankode_pelanggan.AsString);
       Execute;
     end;
     btnrefreshClick(sender);
    end;
end;

procedure TFListPelanggan.BtnRefreshClick(Sender: TObject);     //refresh
begin
    if Qpelanggan.Active then
      Qpelanggan.Refresh
      else
      Qpelanggan.Open
end;

procedure TFListPelanggan.BtnTambahClick(Sender: TObject);           //tambah
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

procedure TFListPelanggan.Ed_cariChange(Sender: TObject);             //cari
begin
  Qpelanggan.Close;
  Qpelanggan.SQL.Clear;
  Qpelanggan.SQL.Add('SELECT * FROM tpelanggan ');
  Qpelanggan.SQL.Add('WHERE kode_pelanggan='+QuotedStr('%'+Ed_cari.Text+'%')+' OR nama_pelanggan LIKE '+QuotedStr('%'+ed_cari.Text+'%'));

  Qpelanggan.Open;
end;

procedure TFListPelanggan.FormShow(Sender: TObject);
begin
BtnRefreshClick(Sender);
end;



end.
