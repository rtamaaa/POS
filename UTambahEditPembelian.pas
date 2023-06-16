unit UTambahEditPembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Datasnap.DBClient, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFTambahEditPembelian = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Ed_kode_pembelian: TEdit;
    DTpembelian: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Ed_kodesupplier: TEdit;
    Cb_namaSupplier: TComboBox;
    Label5: TLabel;
    Ed_noBukti: TEdit;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    CDS1: TClientDataSet;
    DSCDS1: TDataSource;
    InsertCtrlN1: TMenuItem;
    DeleteDel1: TMenuItem;
    CDS1kode_barang: TStringField;
    CDS1nama_barang: TStringField;
    CDS1satuan: TStringField;
    CDS1harga_beli: TFloatField;
    CDS1qty: TFloatField;
    CDS1sub_total: TFloatField;
    Panel1: TPanel;
    BtnSimpan: TButton;
    Edit1: TMenuItem;
    BtnClose: TBitBtn;
    procedure BtnSimpanClick(Sender: TObject);
    procedure Cb_namaSupplierChange(Sender: TObject);
    procedure Cb_namaSupplierDropDown(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure InsertCtrlN1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure DeleteDel1Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTambahEditPembelian: TFTambahEditPembelian;

implementation

{$R *.dfm}

uses UDM, Ufunction, Upembelian;



procedure TFTambahEditPembelian.BtnCloseClick(Sender: TObject);
begin
    close
end;

procedure TFTambahEditPembelian.BtnSimpanClick(Sender: TObject);
begin
  if Ed_kode_pembelian.Text='' then
 begin
   Messagedlg('Kode Pembelian Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if cb_namasupplier.Text='' then
 begin
   Messagedlg('Nama supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ed_kodesupplier.Text='' then
 begin
   Messagedlg('Kode supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ed_nobukti.Text='' then
 begin
   Messagedlg('No bukti Tidak Boleh Kosong',mtWarning,[Mbok],0);
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
    SQL.Text:='INSERT INTO pos.tpembelian_master(kode_pembelian, '+
              'tgl_pembelian,kode_supplier,no_bukti) VALUES('+
        QuotedStr(Ed_kode_pembelian.Text)+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpembelian.DateTime))+','+
        QuotedStr(Ed_kodesupplier.Text)+','+
        QuotedStr(Ed_nobukti.Text)+')';
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
      SQL.Text:='INSERT INTO pos.tpembelian_detail(kode_pembelian,'+
                'kode_barang,qty,harga_beli,sub_total) VALUES('+
          QuotedStr(Ed_kode_pembelian.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_beli.Value)+','+
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
    SQL.Text:='UPDATE pos.tpembelian_master SET '+
        'tgl_pembelian='+QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpembelian.DateTime))+','+
        'kode_supplier= '+QuotedStr(Ed_kodesupplier.Text)+','+
        'no_bukti= '+QuotedStr(Ed_nobukti.Text)+
        ' WHERE kode_pembelian= '+QuotedStr(Ed_kode_pembelian.Text);
    Execute;
  end;
  //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpembelian_detail '+
         ' WHERE kode_pembelian= '+QuotedStr(Ed_kode_pembelian.Text);
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
      SQL.Text:='INSERT INTO pos.tpembelian_detail(kode_pembelian,'+
                'kode_barang,qty,harga_beli,sub_total) VALUES('+
          QuotedStr(Ed_kode_pembelian.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_beli.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Fpembelian.btnrefreshClick(Sender);
  Close;
end;

procedure TFTambahEditPembelian.Cb_namaSupplierChange(Sender: TObject);
begin
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select kode_supplier from tsupplier where nama_supplier='+QuotedStr(cb_namasupplier.Text);
       Open;
      Ed_kodesupplier.Text:=FieldByName('kode_supplier').AsString;
    end;
end;

procedure TFTambahEditPembelian.Cb_namaSupplierDropDown(Sender: TObject);
begin
     with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_supplier from tsupplier';
       Open;
      cb_namasupplier.Clear;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        cb_namasupplier.Items.Add(dm.Qtemp.FieldByName('nama_supplier').AsString);
        dm.Qtemp.Next;
      end;
    end;
end;

procedure TFTambahEditPembelian.DBGrid1ColExit(Sender: TObject);
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
    if (CDS1qty.Value<>0) or (CDS1harga_beli.Value<>0) then
      CDS1sub_total.Value := CDS1qty.Value * CDS1harga_beli.Value;
    CDS1.Post;
  end;
end;



procedure TFTambahEditPembelian.DeleteDel1Click(Sender: TObject);
begin
  if CDS1.RecordCount > 0 then
  CDS1.Delete;
end;

procedure TFTambahEditPembelian.Edit1Click(Sender: TObject);
begin
  CDS1.Edit;
end;

procedure TFTambahEditPembelian.InsertCtrlN1Click(Sender: TObject);
begin
   CDS1.Insert;
end;

end.
