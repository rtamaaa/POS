unit UlistBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFLIstBarang = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnEdit: TBitBtn;
    BtnTambah: TBitBtn;
    BtnHapus: TBitBtn;
    Ed_cari: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Qbarang: TFDQuery;
    BtnRefresh: TBitBtn;
    DSbarang: TDataSource;
    Qbarangkode_barang: TStringField;
    Qbarangnama_barang: TStringField;
    Qbarangdeskripsi: TStringField;
    Qbarangsatuan: TStringField;
    Qbarangstokawal: TSingleField;
    Qbarangstokmin: TSingleField;
    Qbaranghargajual: TSingleField;
    Qbarangflg_aktif: TSmallintField;
    BtnClose: TBitBtn;
    Label2: TLabel;
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ed_cariChange(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIstBarang: TFLIstBarang;

implementation

{$R *.dfm}

uses UTambahEdit, Ufunction, UDM;

procedure TFLIstBarang.BtnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TFLIstBarang.BtnEditClick(Sender: TObject);       //edit
begin
 Application.CreateForm(TFtambahEdit,FtambahEdit);
  status_simpan := 2;
  FtambahEdit.Ed_kode.Text := QBarangkode_barang.AsString;
  FtambahEdit.Ed_nama_barang.Text := QBarangnama_barang.AsString;
  FtambahEdit.Ed_desk.Text := QBarangdeskripsi.AsString;
  FtambahEdit.cb_satuan.Text := QBarangsatuan.AsString;
  FtambahEdit.Ed_stok_awal.Text := FloatToStr(QBarangstokawal.AsFloat);
  FtambahEdit.Ed_stok_min.Text := FloatToStr(QBarangstokmin.AsFloat);
  FtambahEdit.Ed_harga.Text := FloatToStr(QBaranghargajual.AsFloat);
  Cflg_aktif := QBarangflg_aktif.AsInteger;
  FtambahEdit.ShowModal;
  FtambahEdit.Free;

end;

procedure TFLIstBarang.BtnHapusClick(Sender: TObject);           //hapus
begin
if Application.MessageBox('Apakah Anda yakin ingin menghapus data yang dipilih','Konfirmasi',MB_YESNO or MB_ICONINFORMATION)=idyes then
   Begin
     with DM.Qtemp do
     begin
       Close;
       SQL.Clear;
       Sql.Text:='DELETE FROM pos.tbarang '+
       'WHERE kode_barang= '+QuotedStr(Qbarangkode_barang.AsString);
       Execute;
     end;
     btnrefreshClick(sender);
   End;
end;

procedure TFLIstBarang.BtnRefreshClick(Sender: TObject);        //REFRESH
begin
 if Qbarang.Active then
    Qbarang.Refresh
 else
    Qbarang.Open;

end;

procedure TFLIstBarang.BtnTambahClick(Sender: TObject);       //TAMBAH
begin
Application.CreateForm(TFtambahEdit,FtambahEdit);
Status_simpan := 1;
Cflg_aktif := 0;
FTambahEdit.ed_kode.text := Autokode('kode_barang', 'tbarang','BR');
FtambahEdit.ShowModal;
FtambahEdit.Free;
end;

procedure TFLIstBarang.DBGrid1DblClick(Sender: TObject);
begin
btnEdit.Click;
end;



procedure TFLIstBarang.Ed_cariChange(Sender: TObject);       //cari
begin
  Qbarang.Close;
  Qbarang.SQL.Clear;
  Qbarang.SQL.Add('SELECT * FROM tbarang ');
  Qbarang.SQL.Add('WHERE kode_barang='+QuotedStr('%'+Ed_cari.Text+'%')+' OR nama_barang LIKE '+QuotedStr('%'+ed_cari.Text+'%'));

  Qbarang.Open;
end;

procedure TFLIstBarang.FormShow(Sender: TObject);
begin
btnrefreshClick(Sender);
end;

end.
