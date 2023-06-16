unit UTambahEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFtambahEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Ed_kode: TEdit;
    Ed_nama_barang: TEdit;
    Ed_desk: TEdit;
    Ed_stok_awal: TEdit;
    Cb_satuan: TComboBox;
    Ed_stok_min: TEdit;
    Ed_harga: TEdit;
    BtnSimpan: TBitBtn;
    BtnBtl: TBitBtn;
    flg_check: TCheckBox;
    procedure flg_checkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FtambahEdit: TFtambahEdit;

implementation

{$R *.dfm}

uses Ufunction, UDM, UlistBarang;



procedure TFtambahEdit.BtnSimpanClick(Sender: TObject);
begin
if ed_kode.Text='' then
begin
  Messagedlg('Kode Barang Tidak Boleh kosong',mtWarning,[MBOK],0);
  Exit;
end;
if ed_nama_barang.Text='' then
begin
  Messagedlg('Nama Barang Tidak Boleh kosong',mtWarning,[MBOK],0);
  Exit;
end;
if ed_desk.Text='' then
begin
  Messagedlg('Deskripsi Barang Tidak Boleh kosong',mtWarning,[MBOK],0);
  Exit;
end;
//tambah
if status_simpan=1 then
    begin
      with dm.Qtemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='INSERT INTO pos.tbarang(kode_barang,nama_barang,Deskripsi,'+
        'satuan,stokawal,stokmin,hargajual,flg_aktif)VALUES('+
        QuotedStr(ed_kode.Text)+','+
        QuotedStr(ed_nama_barang.Text)+','+
        QuotedStr(ed_desk.Text)+','+
        QuotedStr(cb_satuan.Text)+','+
        QuotedStr(ed_stok_awal.Text)+','+
        QuotedStr(ed_stok_min.Text)+','+
        QuotedStr(ed_harga.Text)+','+
        IntToStr(cflg_aktif)+')';
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
          SQL.Text:='UPDATE pos.tbarang SET '+
          'nama_barang= '+QuotedStr(ed_nama_barang.Text)+','+
          'deskripsi= '+QuotedStr(ed_desk.Text)+','+
          'satuan= '+QuotedStr(cb_satuan.Text)+','+
          'stokawal= '+QuotedStr(ed_stok_awal.Text)+','+
          'stokmin= '+QuotedStr(ed_stok_min.Text)+','+
          'hargajual= '+QuotedStr(ed_harga.Text)+','+
          'flg_aktif= '+IntToStr(cflg_aktif)+' '+
          'WHERE kode_barang= '+QuotedStr(ed_kode.text);
            Execute;
          end;
              Messagedlg('Edit Data Berhasil',MtInformation,[MBOK],0);
        end;
         Flistbarang.btnrefreshClick(sender);
        Close;
end;

procedure TFtambahEdit.flg_checkClick(Sender: TObject);
begin
 if flg_check.Checked then
    cflg_aktif :=1
    else
    cflg_aktif :=0;
end;

procedure TFtambahEdit.FormShow(Sender: TObject);
begin
if cflg_aktif=1 then
    flg_check.Checked:=true
    else
    flg_check.Checked:=false;
end;

end.
