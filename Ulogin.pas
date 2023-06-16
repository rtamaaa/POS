unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFlogin = class(TForm)
    EdUser: TEdit;
    EdPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TLogin: TButton;
    procedure TLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;
  username, password: String;

implementation

{$R *.dfm}

uses UDM, Ufunction, UDashboard;



procedure TFlogin.FormShow(Sender: TObject);
begin
    edpassword.PasswordChar:='*';
end;

procedure TFlogin.TLoginClick(Sender: TObject);
begin
    username := Trim(eduser.text);
    password := getmd5(edpassword.text);

    with DM.Qtemp do
    begin
      sql.Clear;

      sql.Add('select*from tuser where user='+QuotedStr(eduser.text));
      sql.Add('and password='+Quotedstr(password));

      Open;
    end;
    if dm.Qtemp.RecordCount >0 then
    begin
      HakAkses:=dm.Qtemp.FieldByName('hak_akses').AsString;
      PIC:=dm.Qtemp.FieldByName('user').AsString;
      cUser_id := dm.Qtemp.FieldByName('id').AsString;
      Dashboard.CategoryPanelGroup1.Enabled:=true;
      Dashboard.show;
      fLogin.Close;
    end
      else
        begin
             messageDlg('user / pw salah', mtwarning,[mbok],0);
             eduser.clear;
             edpassword.Clear;
             eduser.SetFocus;
        end;



end;

end.
