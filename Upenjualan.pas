unit Upenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TFpenjualan = class(TForm)
    Panel1: TPanel;
    BtnEdit: TBitBtn;
    BtnTambah: TBitBtn;
    BtnHapus: TBitBtn;
    BtnRefresh: TBitBtn;
    DSpenjualan: TDataSource;
    Qpenjualan: TFDQuery;
    Ed_cari: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Qpenjualankode_penjualan: TStringField;
    Qpenjualantgl_penjualan: TDateField;
    Qpenjualankode_pelanggan: TStringField;
    Qpenjualanno_bukti: TStringField;
    Qpenjualannama_pelanggan: TStringField;
    Qpenjualantotal: TSingleField;
    Qpenjualanbayar: TSingleField;
    Qpenjualankembali: TSingleField;
    BtnClose: TBitBtn;
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnTambahClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpenjualan: TFpenjualan;

implementation

{$R *.dfm}

uses  UDM, Ufunction, UTambahEditPenjualan;



procedure TFpenjualan.BtnCloseClick(Sender: TObject);
begin
 close
end;

procedure TFpenjualan.BtnEditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambaheditpenjualan,Ftambaheditpenjualan);
  status_simpan := 2;
  //master
  Ftambaheditpenjualan.Ed_kode_penjualan.Text := Qpenjualankode_penjualan.AsString;
  Ftambaheditpenjualan.Dtpenjualan.DateTime := Qpenjualantgl_penjualan.AsDateTime;
  Ftambaheditpenjualan.Ed_kodepelanggan.Text := Qpenjualankode_pelanggan.AsString;
  Ftambaheditpenjualan.cb_namapelanggan.Text := Qpenjualannama_pelanggan.AsString;
  Ftambaheditpenjualan.Ed_nobukti.Text := Qpenjualanno_bukti.AsString;
  Ftambaheditpenjualan.Edtotal.Text :=FloatToStr(Qpenjualantotal.AsFloat);
  Ftambaheditpenjualan.Edbayar.Text :=FloatToStr(Qpenjualanbayar.AsFloat);
  Ftambaheditpenjualan.Edkembali.Text :=FloatToStr(Qpenjualankembali.AsFloat);
  //detail
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select tpd.*,tb.nama_barang,tb.satuan from tpenjualan_detail tpd '+
       ' INNER JOIN tbarang tb ON tb.kode_barang=tpd.kode_barang '+
       ' WHERE tpd.kode_penjualan='+QuotedStr(Qpenjualankode_penjualan.AsString);
       Open;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        with Ftambaheditpenjualan do
        begin
          CDS1.Insert;
          CDS1kode_barang.Text := FieldByName('kode_barang').AsString;
          CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
          CDS1satuan.Text := FieldByName('satuan').AsString;
          CDS1harga_jual.AsFloat := FieldByName('harga_jual').AsFloat;
          CDS1qty.AsFloat := FieldByName('qty').AsFloat;
          CDS1sub_total.AsFloat := FieldByName('sub_total').AsFloat;
          CDS1.Post;
        end;
        dm.Qtemp.Next;
      end;
    end;
  Ftambaheditpenjualan.ShowModal;
  Ftambaheditpenjualan.Free;
end;

procedure TFpenjualan.BtnHapusClick(Sender: TObject);
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
      SQL.Text:='DELETE FROM pos.tpenjualan_master '+
         ' WHERE kode_penjualan= '+QuotedStr(Qpenjualankode_penjualan.AsString);
      Execute;
    end;
    //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpenjualan_detail '+
         ' WHERE kode_penjualan= '+QuotedStr(Qpenjualankode_penjualan.AsString);
      Execute;
    end;
    btnrefreshClick(Sender);
  end;
end;

procedure TFpenjualan.BtnRefreshClick(Sender: TObject);
begin
   Qpenjualan.Refresh;
    Qpenjualan.Open;
end;

procedure TFpenjualan.BtnTambahClick(Sender: TObject);
begin
  Application.CreateForm(TFtambaheditpenjualan,Ftambaheditpenjualan);
  status_simpan := 1;
  Cflg_aktif := 0;
  Ftambaheditpenjualan.Ed_kode_penjualan.Text := Autokode('kode_penjualan','tpenjualan_master','PJ');
  Ftambaheditpenjualan.Dtpenjualan.DateTime := Now;
  Ftambaheditpenjualan.ShowModal;
  Ftambaheditpenjualan.Free;
end;

procedure TFpenjualan.DBGrid1DblClick(Sender: TObject);
begin
  btneditClick(Sender);
end;

procedure TFpenjualan.FormShow(Sender: TObject);
begin
  btnrefreshClick(Sender);
  Qpenjualan.active:=true;
end;

end.
