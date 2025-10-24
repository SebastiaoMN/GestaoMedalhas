unit frm_login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  Tfrmlogin = class(TForm)
    Edituser: TEdit;
    Editpass: TEdit;
    bbtn_ok: TBitBtn;
    bbtn_cancela: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure bbtn_okClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdituserChange(Sender: TObject);
    procedure bbtn_cancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckLogin : boolean;
  end;

var
  frmlogin: Tfrmlogin;

implementation

{$R *.DFM}

procedure Tfrmlogin.bbtn_okClick(Sender: TObject);
begin
   checkLogin := true;
end;

procedure Tfrmlogin.FormCreate(Sender: TObject);
begin
    checklogin := false;
end;

procedure Tfrmlogin.EdituserChange(Sender: TObject);
begin
 if (frmLogin.Edituser.text <> '') and (frmLogin.Editpass.text <> '') then
      frmLogin.bbtn_ok.Enabled := true
 else
      frmLogin.bbtn_ok.Enabled := false;

end;

procedure Tfrmlogin.bbtn_cancelaClick(Sender: TObject);
begin
   checkLogin := False;
end;
procedure Tfrmlogin.FormShow(Sender: TObject);
begin
  Edituser.Clear;
  Editpass.Clear;
end;

end.
