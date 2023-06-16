unit UTambahEditSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFTambahEditSupplier = class(TForm)
    Ed_kode_supplier: TEdit;
    Ed_nama_supplier: TEdit;
    Ed_noTelp: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo_Alamat: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    BtnSimpan: TBitBtn;
    BtnBtl: TBitBtn;
    procedure BtnSimpanClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTambahEditSupplier: TFTambahEditSupplier;

implementation

{$R *.dfm}

uses Ufunction, UDM, UListSupplier;



procedure TFTambahEditSupplier.BtnSimpanClick(Sender: TObject);
begin
if ed_kode_supplier.Text='' then
begin
  Messagedlg('Kode supplier Tidak Boleh kosong',mtWarning,[MBOK],0);
  Exit;
end;
if ed_nama_supplier.Text='' then
begin
  Messagedlg('Nama supplier Tidak Boleh kosong',mtWarning,[MBOK],0);
  Exit;
end;
if ed_noTelp.Text='' then
begin
  Messagedlg('NO Telp Barang Tidak Boleh kosong',mtWarning,[MBOK],0);
  Exit;
end;
//tambah
if status_simpan=1 then
    begin
      with dm.Qtemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='INSERT INTO pos.tsupplier(kode_supplier,nama_supplier,alamat,'+
        'no_telp)VALUES('+
        QuotedStr(ed_kode_supplier.Text)+','+
        QuotedStr(ed_nama_supplier.Text)+','+
        QuotedStr(memo_Alamat.Text)+','+
        QuotedStr(ed_noTelp.Text)+')';
       Execute;
      end;
      Messagedlg('Tambah data Berhasil',mtInformation,[MBOK],0);
    end;
    //edit
    if status_simpan=2 then
        begin
          with dm.Qtemp do
          begin
          Close;
          SQL.Clear;
          SQL.Text:='UPDATE pos.tsupplier SET '+
          'nama_supplier= '+QuotedStr(ed_nama_supplier.Text)+','+
          'Alamat= '+QuotedStr(memo_alamat.Text)+','+
          'no_telp= '+QuotedStr(Ed_noTelp.Text)+' '+
          'WHERE kode_supplier= '+QuotedStr(ed_kode_supplier.text);
            Execute;
          end;
              Messagedlg('Edit Data Berhasil',MtInformation,[MBOK],0);
        end;
        Flistsupplier.btnrefreshClick(sender);
        Close;
end;



end.
