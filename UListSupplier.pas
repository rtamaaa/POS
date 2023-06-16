unit UListSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TFListSupplier = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Ed_cari: TEdit;
    DSsupplier: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnEdit: TBitBtn;
    BtnTambah: TBitBtn;
    BtnHapus: TBitBtn;
    BtnRefresh: TBitBtn;
    Qsupplier: TFDQuery;
    Qsupplierkode_supplier: TStringField;
    Qsuppliernama_supplier: TStringField;
    Qsupplieralamat: TMemoField;
    Qsupplierno_telp: TStringField;
    Label2: TLabel;
    BtnClose: TBitBtn;
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
  FListSupplier: TFListSupplier;

implementation

{$R *.dfm}

uses UDM, Ufunction, UTambahEditsupplier;


procedure TFListSupplier.BtnCloseClick(Sender: TObject);
begin
 close
end;

procedure TFListSupplier.BtnEditClick(Sender: TObject);         //edit
begin
  Application.CreateForm(TFtambahEditsupplier,FTambahEditsupplier);
  status_simpan := 2;
  FTambahEditsupplier.Ed_kode_supplier.Text := Qsupplierkode_supplier.AsString;
  FTambahEditsupplier.Ed_nama_supplier.Text := Qsuppliernama_supplier.AsString;
  FTambahEditsupplier.Ed_noTelp.Text := Qsupplierno_telp.AsString;
  FTambahEditsupplier.Memo_Alamat.Text := Qsupplieralamat.AsString;
  FTambahEditsupplier.ShowModal;
  FTambahEditsupplier.Free
end;

procedure TFListSupplier.BtnHapusClick(Sender: TObject);            //hapus
begin
  if Application.MessageBox('Apakah Anda yakin ingin menghapus data yang dipilih','Konfirmasi',MB_YESNO or MB_ICONINFORMATION)=idyes then
    begin
      with DM.Qtemp do
     begin
       Close;
       SQL.Clear;
       Sql.Text:='DELETE FROM pos.tsupplier '+
       'WHERE kode_supplier= '+QuotedStr(Qsupplierkode_supplier.AsString);
       Execute;
     end;
     btnrefreshClick(sender);
    end;
end;

procedure TFListSupplier.BtnRefreshClick(Sender: TObject);         //refresh
begin
    if Qsupplier.Active then
      Qsupplier.Refresh
      else
      Qsupplier.Open
end;

procedure TFListSupplier.BtnTambahClick(Sender: TObject);             //tambah
begin
 Application.CreateForm(TFtambahEditsupplier,FtambahEditsupplier);
 Status_simpan := 1;
 Cflg_aktif := 0;
 FTambahEditsupplier.ed_kode_supplier.text := Autokode('kode_supplier', 'tsupplier','SP');
 FTambahEditsupplier.ShowModal;
 FTambahEditsupplier.Free;
end;

procedure TFListSupplier.DBGrid1DblClick(Sender: TObject);             //dbclick
begin
btneditClick(Sender);
end;

procedure TFListSupplier.Ed_cariChange(Sender: TObject);               //cari
begin
  Qsupplier.Close;
  Qsupplier.SQL.Clear;
  Qsupplier.SQL.Add('SELECT * FROM tsupplier ');
  Qsupplier.SQL.Add('WHERE kode_supplier='+QuotedStr('%'+Ed_cari.Text+'%')+' OR nama_supplier LIKE '+QuotedStr('%'+ed_cari.Text+'%'));

  Qsupplier.Open;
end;

procedure TFListSupplier.FormShow(Sender: TObject);
begin
BtnRefreshClick(Sender);
end;



end.
