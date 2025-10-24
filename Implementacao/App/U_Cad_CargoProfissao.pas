unit U_Cad_CargoProfissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls;

type
  TfrmCargoProfissao = class(TForm)
    QAtualiza: TQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSair: TSpeedButton;
    BtnAnterior: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBCodigo: TDBEdit;
    DBDescricao: TDBEdit;
    Panel3: TPanel;
    BtnIncluir: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnGravar: TSpeedButton;
    BtnPesquisar: TSpeedButton;
    BtnDesfazer: TSpeedButton;
    BtnExcluir: TSpeedButton;
    QMaxSequencial: TQuery;
    QMaxSequencialSEQUENCIAL: TFloatField;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnDesfazerClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargoProfissao: TfrmCargoProfissao;

implementation
uses DM_SCM, U_lov_cargoProfissao;

{$R *.dfm}



procedure TfrmCargoProfissao.btnPrimeiroClick(Sender: TObject);
begin
     DMSCM.QCargoProfissao.FindFirst;
end;

procedure TfrmCargoProfissao.BtnAnteriorClick(Sender: TObject);
begin
     DMSCM.QCargoProfissao.FindPrior;
end;

procedure TfrmCargoProfissao.btnProximoClick(Sender: TObject);
begin
     DMSCM.QCargoProfissao.FindNext;
end;

procedure TfrmCargoProfissao.btnUltimoClick(Sender: TObject);
begin
     DMSCM.QCargoProfissao.FindLast;
end;

procedure TfrmCargoProfissao.FormShow(Sender: TObject);
begin
    DMSCM.QCargoProfissao.Active := true;
    DesabilitaCampos;
end;

procedure TfrmCargoProfissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     DMSCM.QCargoProfissao.Active := false;
end;


procedure TfrmCargoProfissao.HabilitaCampos;
begin
   DBDescricao.Enabled := true;

   BtnAnterior.Enabled := false;
   btnPrimeiro.Enabled := false;
   btnProximo.Enabled := false;
   btnUltimo.Enabled := false;  

   BtnIncluir.Enabled := false;
   BtnAlterar.Enabled := false;
   BtnPesquisar.Enabled := false;
   BtnExcluir.Enabled := false;
   BtnGravar.Enabled := true;       
   BtnDesfazer.Enabled := true;

end;

procedure TfrmCargoProfissao.BtnIncluirClick(Sender: TObject);
begin
    DMSCM.DSCargoProfissao.DataSet.Insert;
    HabilitaCampos;
end;

procedure TfrmCargoProfissao.DesabilitaCampos;
begin
   DBDescricao.Enabled := false;

   BtnAnterior.Enabled := true;
   btnPrimeiro.Enabled := true;
   btnProximo.Enabled := true;
   btnUltimo.Enabled := true;  

   
   BtnIncluir.Enabled := true;
   BtnAlterar.Enabled := true;
   BtnPesquisar.Enabled := true;
   BtnExcluir.Enabled := true;
   BtnGravar.Enabled := false;       
   BtnDesfazer.Enabled := false;
end;

procedure TfrmCargoProfissao.BtnAlterarClick(Sender: TObject);
begin
   DMSCM.DSCargoProfissao.DataSet.Edit;
   HabilitaCampos;
end;

procedure TfrmCargoProfissao.BtnGravarClick(Sender: TObject);
begin

  if DBCodigo.Text = '' then
  Begin
     QMaxSequencial.open;
     if QMaxSequencialSequencial.AsString = '' then
        DBCodigo.Text := '1'
     else    
        DBCodigo.Text := QMaxSequencialSequencial.AsString;
     QMaxSequencial.close;
  end;

  DMSCM.DSCargoProfissao.DataSet.Post;
  messageDlg('O registro foi salvo.',mtinformation,[mbok],0);
  DesabilitaCampos;
  
end;

procedure TfrmCargoProfissao.BtnDesfazerClick(Sender: TObject);
begin

   dmscm.QCargoProfissao.Cancel;     
   DesabilitaCampos;
end;

procedure TfrmCargoProfissao.BtnExcluirClick(Sender: TObject);
begin
   if messageDlg('Deseja excluir o cargo / profissão ?',mtwarning,[mbOk,mbCancel],0) = mrOK then
   begin
        // Verifica se o cargo/profissao não está sendo utilizado por algum agraciado.
       QAtualiza.Active := false;
       QAtualiza.SQL.Clear;
       QAtualiza.SQL.Add('select 1 from agraciados where capr_codigo = ' + DBCodigo.text);
       QAtualiza.Active := true;
       if not QAtualiza.IsEmpty  then
       begin
         messageDlg('Este cargo/profissão está sendo utilizado por um agraciado e não deve ser excluido !', mterror, [mbok],0);
         DMSCM.QCargoProfissao.cancel;
         abort;
       end
       else
        DMSCM.QCargoProfissao.Delete;
        
   end
   else
       DMSCM.QCargoProfissao.cancel;
end;

procedure TfrmCargoProfissao.BtnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmCargoProfissao.BtnPesquisarClick(Sender: TObject);
begin
   Application.CreateForm(Tfrm_lov_cargoProfissao, frm_lov_cargoProfissao);
   frm_lov_cargoProfissao.showModal;
   if frm_lov_cargoProfissao.codigo <> 0 then
     if dmscm.QCargoProfissao.Locate('Codigo',frm_lov_cargoProfissao.codigo,[loCaseInsensitive]) = false then
       messageDlg('ERRO NA PESQUISA !'+#13+'Favor contactar o administrador do sistema.',mterror,[mbok],0);

   frm_lov_cargoProfissao.Destroy;

end;

end.
