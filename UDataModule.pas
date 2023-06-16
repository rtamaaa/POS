unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, DBAccess, Uni, MemDS;

type
  TDM = class(TDataModule)
    UniConnection1: TUniConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Qtemp: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
