unit Upembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFpembelian = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    BtnEdit: TBitBtn;
    BtnTambah: TBitBtn;
    BtnHapus: TBitBtn;
    BtnRefresh: TBitBtn;
    DBGrid1: TDBGrid;
    Qpembelian: TFDQuery;
    DSpembelian: TDataSource;
    Qpembeliankode_pembelian: TStringField;
    Qpembeliantgl_pembelian: TDateField;
    Qpembeliankode_supplier: TStringField;
    Qpembelianno_bukti: TStringField;
    Qpembeliannama_supplier: TStringField;
    BtnClose: TBitBtn;
    procedure BtnTambahClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpembelian: TFpembelian;

implementation

{$R *.dfm}

uses UTambahEditPembelian, Ufunction, UDM;

procedure TFpembelian.BtnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TFpembelian.BtnEditClick(Sender: TObject);       //edit
begin
    Application.CreateForm(TFtambahEditPembelian,FtambahEditPembelian);
    Status_simpan := 2;
    //master
    Ftambaheditpembelian.Ed_kode_pembelian.Text := Qpembeliankode_pembelian.AsString;
    Ftambaheditpembelian.Dtpembelian.DateTime := Qpembeliantgl_pembelian.AsDateTime;
    Ftambaheditpembelian.Ed_kodesupplier.Text := Qpembeliankode_supplier.AsString;
    Ftambaheditpembelian.cb_namasupplier.Text := Qpembeliannama_supplier.AsString;
    Ftambaheditpembelian.Ed_nobukti.Text := Qpembelianno_bukti.AsString;

    //detail
     with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select tpd.*,tb.nama_barang,tb.satuan from tpembelian_detail tpd '+
       ' INNER JOIN tbarang tb ON tb.kode_barang=tpd.kode_barang '+
       ' WHERE tpd.kode_pembelian='+QuotedStr(Qpembeliankode_pembelian.AsString);
       Open;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        with Ftambaheditpembelian do
        begin
          CDS1.Insert;
          CDS1kode_barang.Text := FieldByName('kode_barang').AsString;
          CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
          CDS1satuan.Text := FieldByName('satuan').AsString;
          CDS1harga_beli.AsFloat := FieldByName('harga_beli').AsFloat;
          CDS1qty.AsFloat := FieldByName('qty').AsFloat;
          CDS1sub_total.AsFloat := FieldByName('sub_total').AsFloat;
          CDS1.Post;
        end;
        dm.Qtemp.Next;
      end;
    end;
  Ftambaheditpembelian.ShowModal;
  Ftambaheditpembelian.Free;
end;

procedure TFpembelian.BtnHapusClick(Sender: TObject);
begin
    if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    //MASTER
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpembelian_master '+
         ' WHERE kode_pembelian= '+QuotedStr(Qpembeliankode_pembelian.AsString);
      Execute;
    end;
    //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpembelian_detail '+
         ' WHERE kode_pembelian= '+QuotedStr(Qpembeliankode_pembelian.AsString);
      Execute;
    end;
    btnrefreshClick(Sender);
  end;
end;

procedure TFpembelian.BtnRefreshClick(Sender: TObject);
begin
    Qpembelian.Refresh;
    Qpembelian.Open;
end;

procedure TFpembelian.BtnTambahClick(Sender: TObject);     //tambah
begin
    Application.CreateForm(TFtambahEditPembelian,FtambahEditPembelian);
    Status_simpan := 1;
    FTambahEditPembelian.ed_kode_pembelian.text := Autokode('kode_pembelian', 'tpembelian_master','PO');
    FTambahEditPembelian.DTpembelian.DateTime:=now;
    FtambahEditPembelian.ShowModal;
    FtambahEditPembelian.Free;
end;

procedure TFpembelian.DBGrid1DblClick(Sender: TObject);
begin
   btneditClick(Sender);
end;



procedure TFpembelian.FormShow(Sender: TObject);
begin
  btnrefreshClick(Sender);
  Qpembelian.Active:=true;
end;

end.
