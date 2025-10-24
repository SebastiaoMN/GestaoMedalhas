unit frm_principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Menus, StdCtrls, jpeg;

type
  Tfrm_princi = class(TForm)
    MainMenu1: TMainMenu;
    Agraciados1: TMenuItem;
    Agraciados2: TMenuItem;
    Sair1: TMenuItem;
    Status: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    DisqueteparaoMinasGerais1: TMenuItem;
    Image5: TImage;
    abelas1: TMenuItem;
    CargoProfisso1: TMenuItem;
    MedalhaDesHlioCosta1: TMenuItem;
    Cadastros2: TMenuItem;
    Consultas1: TMenuItem;
    Relatrios2: TMenuItem;
    Gerao2: TMenuItem;
    MedalhaColardoMrito1: TMenuItem;
    Cadastros1: TMenuItem;
    Consultas2: TMenuItem;
    Relatrios1: TMenuItem;
    Agraciadosporano1: TMenuItem;
    Agraciadosporprofisso1: TMenuItem;
    Comarcassemindicao1: TMenuItem;
    Agraciados3: TMenuItem;
    Agraciados4: TMenuItem;
    Agraciados5: TMenuItem;
    Disponibilizaonainternet1: TMenuItem;
    Disponibilizaonainternet2: TMenuItem;
    procedure Agraciados1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Agraciados2Click(Sender: TObject);
    procedure DisqueteparaoMinasGerais1Click(Sender: TObject);
    procedure Disponibilizaonainternet1Click(Sender: TObject);
    procedure Disponibilizaonainternet2Click(Sender: TObject);
    procedure CargoProfisso1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Agraciadosporano1Click(Sender: TObject);
    procedure Agraciadosporprofisso1Click(Sender: TObject);
    procedure Comarcassemindicao1Click(Sender: TObject);
    procedure Agraciados3Click(Sender: TObject);
    procedure Agraciados4Click(Sender: TObject);
    procedure Agraciados5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    CheckLogin : boolean;
  end;

var
  frm_princi: Tfrm_princi;

implementation

uses 
frm_login, DM_SCM,  U_Cad_CargoProfissao,

{Medalha Des. Helio Costa}
U_cad_agraciadosM1, U_cons_agraciadosM1, frm_MinasGerais,
U_disponibiliza_internet_M1,u_frm_rel_agraciadosM1, 
u_frm_rel_agraciadosCargoProfissaoM1, U_frm_rel_semIndicacaoM1,

{Medalha Colar do Mérito}
u_disponilibiza_internet_M2, U_cad_agraciadosM2,
U_cons_agraciadosM2, u_frm_rel_agraciadosM2;

{$R *.DFM}

procedure Tfrm_princi.Agraciados1Click(Sender: TObject);
begin
   frmCadAgraciadosM1.ShowModal;
end;

procedure Tfrm_princi.Sair1Click(Sender: TObject);
begin
 //application.Terminate;
 close;
end;

procedure Tfrm_princi.FormShow(Sender: TObject);
var
acc_senha : string;
begin
with FrmLogin, DMSCM do
begin
   DBSCM.Connected:=false;
   while not DBSCM.Connected do
   begin
      ShowModal;
      if CheckLogin then
      begin
         DBSCM.Params.Clear;
         DBSCM.Params.Values['USER NAME'] := 'SESSIONADMIN';
         DBSCM.Params.Values['PASSWORD'] := 'SESSIONADMIN';
         DBSCM.Connected := true;

         SPSenha.ParamByName('P_USUARIO').AsString := EditUser.Text;
         SPSenha.ParamByName('P_SENHA_AP').AsString := EditPass.Text;
         SPSenha.ExecProc;
         acc_senha := SPSenha.ParamByName('Result').AsString;
         DBSCM.Connected := false;

         DBSCM.Params.Clear;
         DBSCM.Params.Add('USER NAME='+EditUser.Text);
         DBSCM.Params.Add('PASSWORD='+acc_senha);
         try
           DBSCM.Connected:=true;
         except
           MessageDlg('Usuário ou Senha inválida !',mtWarning,[mbOK],0);
         end;
      end
      else
      begin
         Frm_princi.Close;
         Abort;
      end;
   end;
   Q_sys.Active := true;
   frm_princi.Status.Panels[0].Text := Q_sysUSER.Text+'  -  '+Q_sysNOME.Text;
   frm_princi.Status.Panels[1].Text := Q_sysDATA.Text;
end;

end;

procedure Tfrm_princi.Agraciados2Click(Sender: TObject);
begin
     Frm_cons_AgraciadosM1.ShowModal;
end;


procedure Tfrm_princi.DisqueteparaoMinasGerais1Click(Sender: TObject);
begin
  Application.CreateForm(TFfrm_MinasGerais, Ffrm_MinasGerais);
  dmscm.Q_AnoAgraciadosM1.Active := true;
  Ffrm_MinasGerais.DBLkupComboBoxAno.KeyValue:=dmscm.Q_AnoAgraciadosM1Ano.AsVariant;
  Ffrm_MinasGerais.showmodal;
  Ffrm_MinasGerais.Destroy;
  dmscm.Q_AnoAgraciadosM1.Active := false;
end;


procedure Tfrm_princi.Disponibilizaonainternet1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDisponibilizarInternetM1, frmDisponibilizarInternetM1);
  dmscm.Q_AnoAgraciadosM1.Active := true;
  frmDisponibilizarInternetM1.DBLkupComboBoxAno.KeyValue:=dmscm.Q_AnoAgraciadosM1Ano.AsVariant;
  frmDisponibilizarInternetM1.showmodal;
  frmDisponibilizarInternetM1.Destroy;
  dmscm.Q_AnoAgraciadosM1.Active := false;
end;

procedure Tfrm_princi.Disponibilizaonainternet2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDisponibilizarInternetM2, frmDisponibilizarInternetM2);
  dmscm.Q_AnoAgraciadosM2.Active := true;
  frmDisponibilizarInternetM2.DBLookupComboBox1.KeyValue := dmscm.Q_AnoAgraciadosM2Ano.AsVariant;
  frmDisponibilizarInternetM2.showmodal;
  frmDisponibilizarInternetM2.Destroy;
  dmscm.Q_AnoAgraciadosM2.Active := false;
end;



procedure Tfrm_princi.CargoProfisso1Click(Sender: TObject);
begin
     frmCargoProfissao.showmodal;
end;

procedure Tfrm_princi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.Terminate;
end;

procedure Tfrm_princi.Agraciadosporano1Click(Sender: TObject);
begin
     frmRelAgraciadosM1.showmodal;
end;



procedure Tfrm_princi.Agraciadosporprofisso1Click(Sender: TObject);
begin
     frmRelAgraciadosCargoProfissaoM1.showmodal;
end;

procedure Tfrm_princi.Comarcassemindicao1Click(Sender: TObject);
begin
     frmRelSemIndicacaoM1.ShowModal;
end;

procedure Tfrm_princi.Agraciados3Click(Sender: TObject);
begin
     frmCadAgraciadosM2.showmodal;
end;

procedure Tfrm_princi.Agraciados4Click(Sender: TObject);
begin
     Frm_cons_agraciadosM2.showmodal;
end;

procedure Tfrm_princi.Agraciados5Click(Sender: TObject);
begin
  frmRelAgraciadosM2.showmodal;
end;

end.
