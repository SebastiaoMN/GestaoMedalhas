unit U_Cad_AgraciadosM2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DBActns, ActnList, db,
  DBTables;

type
  TfrmCadAgraciadosM2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBNome: TDBEdit;
    DBAno: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    BtnSair: TSpeedButton;
    DBMedalhaEnviada: TDBCheckBox;
    BtnAnterior: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    DBDisponibilizaInternet: TDBCheckBox;
    Label5: TLabel;
    DBCodigo: TDBEdit;
    DBCargoProfissao: TDBLookupComboBox;
    QConsNome: TQuery;
    Panel3: TPanel;
    BtnIncluir: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnGravar: TSpeedButton;
    BtnPesquisar: TSpeedButton;
    BtnDesfazer: TSpeedButton;
    BtnExcluir: TSpeedButton;
    QMaxSequencial: TQuery;
    QMaxSequencialSEQUENCIAL: TFloatField;
    Label6: TLabel;
    DBSexo: TDBLookupComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DesabilitaCampos;
    function ValidaCampos : boolean;
    procedure HabilitaCampos;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnDesfazerClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAgraciadosM2: TfrmCadAgraciadosM2;

implementation
    uses DM_SCM, U_lov_agraciadosM2;
{$R *.DFM}

procedure TfrmCadAgraciadosM2.BtnSairClick(Sender: TObject);
begin
  if (DMSCM.DSAgraciadosM2.State = dsinsert) or (DMSCM.DSAgraciadosM2.State = dsedit) then
      if messageDlg('Deseja salvar registro antes de sair ?', mtwarning,[mbOk,mbCancel],0) = mrOK then
         dmscm.QAgraciadosM2.post
      else
         dmscm.QAgraciadosM2.Cancel;

   Close;
   dmscm.QAgraciadosM2.Active := false;
   dmscm.QCargoProfissao.Active := false;
   dmscm.QComarca.Active := false;
   dmscm.QTipoSexo.Active := false;
end;

procedure TfrmCadAgraciadosM2.FormShow(Sender: TObject);
begin
   dmscm.QAgraciadosM2.Active := true;
   dmscm.QCargoProfissao.Active := true;
   dmscm.QTipoSexo.Active := true;
   desabilitaCampos;
end;

procedure TfrmCadAgraciadosM2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (DMSCM.DSAgraciadosM2.State = dsinsert) or (DMSCM.DSAgraciadosM2.State = dsedit) then
      if messageDlg('Deseja salvar registro antes de sair ?', mtwarning,[mbOk,mbCancel],0) = mrOK then
         dmscm.QAgraciadosM2.post
      else
         dmscm.QAgraciadosM2.Cancel;

   Close;
   dmscm.QAgraciadosM2.Active := false;
   dmscm.QCargoProfissao.Active := false;
   dmscm.QTipoSexo.Active := false;
end;

procedure TfrmCadAgraciadosM2.HabilitaCampos;
begin
   DBNome.Enabled := true;
   DBANO.Enabled := true;

   dmscm.QCargoProfissao.Active := true;
   DBCargoProfissao.Enabled := true;
   DBSexo.Enabled := true;
   DBMedalhaEnviada.Enabled := true;
   DBDisponibilizaInternet.Enabled := true;

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

procedure TfrmCadAgraciadosM2.DesabilitaCampos;
begin
   DBNome.Enabled := false;
   DBANO.Enabled := false;
   DBCargoProfissao.Enabled := false;
   DBSexo.Enabled := False;
   DBMedalhaEnviada.Enabled := false;
   DBDisponibilizaInternet.Enabled := false;

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

function TfrmCadAgraciadosM2.ValidaCampos : boolean;
begin
	result := true;

  // Campos obrigatórios ****************************************************


  if dbNome.Text = '' then
  begin
     messageDlg('O nome deve ser informado.',mterror,[mbok],0);
     result := false;
     abort;
  end;

  if dbAno.Text = '' then
  begin
     messageDlg('O ano deve ser informado.',mterror,[mbok],0);
     result := false;
     abort;
  end;

  // **************************************************************************

    // verifica se tem nome repetido
       QConsNome.active := false;
       QConsNome.ParamByName('p_nome').AsString := DBnome.Text;

       if dbCodigo.Text <> '' then
          QConsNome.ParamByName('p_codigo').AsString := dbCodigo.Text
       else
          QConsNome.ParamByName('p_codigo').AsString := '0';

       QConsNome.active := true;

       if not QConsNome.IsEmpty  then
       begin
           messageDlg('Nome já cadastrado no sistema!', mterror, [mbok],0);
           result := false;
           abort;
       end;

end;


procedure TfrmCadAgraciadosM2.BtnAlterarClick(Sender: TObject);
begin

   DMSCM.DSAgraciadosM2.DataSet.Edit;

   HabilitaCampos;


end;

procedure TfrmCadAgraciadosM2.BtnGravarClick(Sender: TObject);
begin

	If ValidaCampos then
    Begin

 	     if DBCodigo.Text = '' then
         Begin
           QMaxSequencial.Open;

           if QMaxSequencialSequencial.AsString = '' then
       	       DBCodigo.Text := '1'
   	       else
               DBCodigo.Text := QMaxSequencialSequencial.AsString;

      	   QMaxSequencial.close;
         end;

        DMSCM.DSAgraciadosM2.DataSet.Post;
        messageDlg('O registro foi salvo.',mtinformation,[mbok],0);
    end
    else
       messageDlg('O registro não foi salvo.',mterror,[mbok],0);


  DesabilitaCampos;

end;

procedure TfrmCadAgraciadosM2.BtnDesfazerClick(Sender: TObject);
begin

   dmscm.QAgraciadosM2.Cancel;
   DesabilitaCampos;


end;

procedure TfrmCadAgraciadosM2.BtnExcluirClick(Sender: TObject);
begin
   if messageDlg('Deseja excluir o registro do agraciados ?',mtwarning,[mbOk,mbCancel],0) = mrOK then
   begin
       DMSCM.QAgraciadosM2.Delete;
   end
   else
       DMSCM.QAgraciadosM2.cancel;

   
end;

procedure TfrmCadAgraciadosM2.BtnIncluirClick(Sender: TObject);
begin
   DMSCM.DSAgraciadosM2.DataSet.Insert;
   DBMedalhaEnviada.Checked := false;
   DBDisponibilizaInternet.Checked := false;
   HabilitaCampos;  
end;

procedure TfrmCadAgraciadosM2.BtnAnteriorClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM2.DataSet.FindPrior;
end;

procedure TfrmCadAgraciadosM2.btnProximoClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM2.DataSet.Next;
end;

procedure TfrmCadAgraciadosM2.btnUltimoClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM2.DataSet.Last;
end;

procedure TfrmCadAgraciadosM2.btnPrimeiroClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM2.DataSet.First;
end;

procedure TfrmCadAgraciadosM2.BtnPesquisarClick(Sender: TObject);
begin
   Application.CreateForm(Tfrm_lov_agraciadosM2, frm_lov_agraciadosM2);
   frm_lov_agraciadosM2.showModal;
   if frm_lov_agraciadosM2.codigo <> 0 then
     if dmscm.QAgraciadosM2.Locate('Codigo',frm_lov_agraciadosM2.codigo,[loCaseInsensitive]) = false then
       messageDlg('ERRO NA PESQUISA !'+#13+'Favor contactar o administrador do sistema.',mterror,[mbok],0);

   frm_lov_agraciadosM2.Destroy;
end;

end.
