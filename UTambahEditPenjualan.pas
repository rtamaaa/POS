unit UTambahEditPenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons;

type
  TFTambahEditPenjualan = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Ed_kode_penjualan: TEdit;
    DTpenjualan: TDateTimePicker;
    Ed_kodepelanggan: TEdit;
    Cb_namapelanggan: TComboBox;
    Ed_noBukti: TEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnSimpan: TButton;
    PopupMenu1: TPopupMenu;
    InsertCtrlN1: TMenuItem;
    DeleteDel1: TMenuItem;
    Edit1: TMenuItem;
    CDS1: TClientDataSet;
    DSCDS1: TDataSource;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edtotal: TEdit;
    Edbayar: TEdit;
    Edkembali: TEdit;
    CDS1kode_barang: TStringField;
    CDS1nama_barang: TStringField;
    CDS1satuan: TStringField;
    CDS1harga_jual: TFloatField;
    CDS1qty: TFloatField;
    CDS1sub_total: TFloatField;
    BtnClose: TBitBtn;
    procedure BtnSimpanClick(Sender: TObject);
    procedure Cb_namapelangganChange(Sender: TObject);
    procedure Cb_namapelangganDropDown(Sender: TObject);
    procedure CDS1AfterPost(DataSet: TDataSet);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DeleteDel1Click(Sender: TObject);
    procedure EdbayarChange(Sender: TObject);
    procedure InsertCtrlN1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTambahEditPenjualan: TFTambahEditPenjualan;

implementation

{$R *.dfm}

uses UDM, Ufunction, Upenjualan;

procedure TFTambahEditPenjualan.BtnCloseClick(Sender: TObject);
begin
 close

end;

procedure TFTambahEditPenjualan.BtnSimpanClick(Sender: TObject);
begin
  if Ed_kode_penjualan.Text='' then
 begin
   Messagedlg('Kode Penjualan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if cb_namapelanggan.Text='' then
 begin
   Messagedlg('Nama Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ed_kodepelanggan.Text='' then
 begin
   Messagedlg('Kode Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ed_nobukti.Text='' then
 begin
   Messagedlg('No Telp Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if CDS1.RecordCount=0 then
 begin
   Messagedlg('Data Detail Masih Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 //Tambah
 if status_simpan=1 then
 begin
  //master
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='INSERT INTO pos.tpenjualan_master(kode_penjualan, '+
              'tgl_penjualan,kode_pelanggan,no_bukti,total,bayar,kembali) VALUES('+
        QuotedStr(Ed_kode_penjualan.Text)+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpenjualan.DateTime))+','+
        QuotedStr(Ed_kodepelanggan.Text)+','+
        QuotedStr(Ed_nobukti.Text)+','+
        QuotedStr(Edtotal.Text)+','+
        QuotedStr(Edbayar.Text)+','+
        QuotedStr(Edkembali.Text)+')';
    Execute;
  end;
  //Detail
  CDS1.First;
  while not CDS1.Eof do
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO pos.tpenjualan_detail(kode_penjualan,'+
                'kode_barang,qty,harga_jual,sub_total) VALUES('+
          QuotedStr(Ed_kode_penjualan.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_jual.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Tambah Data Berhasil',MtInformation,[Mbok],0);
 end;
 //edit
 if status_simpan=2 then
 begin
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='UPDATE pos.tpenjualan_master SET '+
        'tgl_penjualan='+QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpenjualan.DateTime))+','+
        'kode_pelanggan= '+QuotedStr(Ed_kodepelanggan.Text)+','+
        'no_bukti= '+QuotedStr(Ed_nobukti.Text)+','+
        'total= '+QuotedStr(Edtotal.Text)+','+
        'bayar= '+QuotedStr(Edbayar.Text)+','+
        'kembali= '+QuotedStr(Edkembali.Text)+
        ' WHERE kode_penjualan= '+QuotedStr(Ed_kode_penjualan.Text);
    Execute;
  end;
  //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpenjualan_detail '+
         ' WHERE kode_penjualan= '+QuotedStr(Ed_kode_penjualan.Text);
      Execute;
    end;
  //Detail
  CDS1.First;
  while not CDS1.Eof do
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO pos.tpenjualan_detail(kode_penjualan,'+
                'kode_barang,qty,harga_jual,sub_total) VALUES('+
          QuotedStr(Ed_kode_penjualan.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_jual.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Fpenjualan.btnrefreshClick(Sender);
  Close;
end;

procedure TFTambahEditPenjualan.Cb_namapelangganChange(Sender: TObject);
begin
   with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select kode_pelanggan from tpelanggan where nama_pelanggan='+
       QuotedStr(cb_namapelanggan.Text);
       Open;
      Ed_kodepelanggan.Text:=FieldByName('kode_pelanggan').AsString;
    end;
end;

procedure TFTambahEditPenjualan.Cb_namapelangganDropDown(Sender: TObject);
begin
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_pelanggan from tpelanggan';
       Open;
      cb_namapelanggan.Clear;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        cb_namapelanggan.Items.Add(dm.Qtemp.FieldByName('nama_pelanggan').AsString);
        dm.Qtemp.Next;
      end;
    end;
end;

procedure TFTambahEditPenjualan.CDS1AfterPost(DataSet: TDataSet);
begin
  Edtotal.Clear;
 CDS1.First;
 while not CDS1.Eof do
 begin
  Edtotal.Text := FloatToStr(StrToFloatDef(Edtotal.Text,0)+CDS1sub_total.Value);
  CDS1.Next;
 end;
end;

procedure TFTambahEditPenjualan.DBGrid1ColExit(Sender: TObject);
begin
  if (CDS1.State in [dsInsert, dsEdit]) and (CDS1kode_barang.Text<>'') then
  begin
    with dm.Qtemp1 do
    begin
       SQL.Clear;
       sql.Text := 'select nama_barang,satuan from tbarang where kode_barang='+QuotedStr(CDS1kode_barang.Text);
       Open;
       if RecordCount=0 then
       Begin
         Messagedlg('Kode Barang Tidak ditemukan',mtWarning,[Mbok],0);
          Exit;
       End;
       CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
       CDS1satuan.Text := FieldByName('satuan').AsString;
    end;
    if (CDS1qty.Value<>0) or (CDS1harga_jual.Value<>0) then
      CDS1sub_total.Value := CDS1qty.Value * CDS1harga_jual.Value;
    CDS1.Post;
  end;
end;

procedure TFTambahEditPenjualan.DBGrid1Exit(Sender: TObject);
begin
  Edtotal.Clear;
 CDS1.First;
 while not CDS1.Eof do
 begin
  Edtotal.Text := FloatToStr(StrToFloatDef(Edtotal.Text,0)+CDS1sub_total.Value);
  CDS1.Next;
 end;
end;

procedure TFTambahEditPenjualan.DeleteDel1Click(Sender: TObject);
begin
  if CDS1.RecordCount > 0 then
  CDS1.Delete;
end;

procedure TFTambahEditPenjualan.EdbayarChange(Sender: TObject);
begin
  Edkembali.Text := FloatToStr(StrToFloatDef(Edbayar.Text,0) - StrToFloatDef(Edtotal.Text,0));
end;

procedure TFTambahEditPenjualan.Edit1Click(Sender: TObject);
begin
 CDS1.Edit;
end;

procedure TFTambahEditPenjualan.InsertCtrlN1Click(Sender: TObject);
begin
  CDS1.Insert;
end;

end.
