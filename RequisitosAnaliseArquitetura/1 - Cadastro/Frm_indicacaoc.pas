unit frm_indicacaoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, ActnList, DBActns, db, variants;

type
  Tfrm_indicacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    btn_insere: TSpeedButton;
    btn_edita: TSpeedButton;
    btn_grava: TSpeedButton;
    btn_exclui: TSpeedButton;
    btn_saida: TSpeedButton;
    DBEdit_ano: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    bbtn_comarca: TSpeedButton;
    DBEdit_comr_codigo: TDBEdit;
    Label3: TLabel;
    DBEdit_observacao: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    bbtn_cancela: TSpeedButton;
    ActionList1: TActionList;
    DataSetCancel1: TDataSetCancel;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetFirst1: TDataSetFirst;
    DataSetInsert1: TDataSetInsert;
    DataSetLast1: TDataSetLast;
    DataSetNext1: TDataSetNext;
    DataSetPost1: TDataSetPost;
    DataSetPrior1: TDataSetPrior;
    DBEdit_desc_comarca: TDBEdit;
    btn_pesquisa: TSpeedButton;
    procedure btn_saidaClick(Sender: TObject);
    procedure bbtn_comarcaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit_observacaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_anoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_comr_codigoExit(Sender: TObject);
    procedure DataSetInsert1Execute(Sender: TObject);
    procedure DataSetEdit1Execute(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_indicacao: Tfrm_indicacao;


implementation
       uses DM_SCM, frm_comarca, U_lov_justificativa, U_lov_agraciados;
{$R *.DFM}

procedure Tfrm_indicacao.btn_saidaClick(Sender: TObject);
begin
        frm_indicacao.Close;
end;

procedure Tfrm_indicacao.bbtn_comarcaClick(Sender: TObject);
begin
  with FormCons_cidade,DMSCM do
  begin
      Application.CreateForm(TFormCons_cidade, FormCons_cidade);
      FormCons_cidade.ShowModal;
      FormCons_cidade.Destroy;      
      if Cod_Cidade<>0 then
      begin
         Qjustificativa_comarcaCOMR_CODIGO.Value := Cod_cidade;
         DBEdit_comr_codigo.OnExit(Self);
      end;
  end;
end;

procedure Tfrm_indicacao.FormShow(Sender: TObject);
begin
   dmscm.QJustificativa_comarca.Active := true;
end;

procedure Tfrm_indicacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 45  then
      DataSetInsert1.OnExecute(Self);
      frm_indicacao.DBEdit_ano.SetFocus;
end;

procedure Tfrm_indicacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (DMSCM.DSJustificativa_comarca.State = dsinsert) or (DMSCM.DSJustificativa_comarca.State = dsedit) then
      if messageDlg('Deseja salvar registro antes de sair ?', mtwarning,[mbYes, mbNo], 0) = mrYes then
         dmscm.QJustificativa_comarca.post
      else
         dmscm.QJustificativa_comarca.Cancel;

   frm_indicacao.Close;
   dmscm.QJustificativa_comarca.Active := false;
end;

procedure Tfrm_indicacao.DBEdit_observacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     if (Dmscm.DSJustificativa_comarca.State = dsInsert) or (Dmscm.DSJustificativa_comarca.State = Dsedit) then
        Dmscm.QJustificativa_comarca.Post;
end;

procedure Tfrm_indicacao.DBEdit_anoKeyPress(Sender: TObject;
  var Key: Char);
begin
{habilita a tecla <enter> no KeyPress de qualquer componente}
    if Key = #13 then
    begin
     Key := #0;
     Perform (CM_DialogKey, VK_TAB,0);
    end;
end;
procedure Tfrm_indicacao.DBEdit_comr_codigoExit(Sender: TObject);
begin
   with DMSCM, frm_indicacao do
    begin
        QComarca.Active := false;
        QComarca.ParamByName('p_comarca').asfloat := QJustificativa_comarcaComr_codigo.Value;
        QComarca.Active := true;
        if QComarca.IsEmpty  then
        begin
            messageDlg('Comarca não cadastrada !', mterror, [mbok],0);
            DBEdit_comr_codigo.SetFocus;
        end;
    end;
end;

procedure Tfrm_indicacao.DataSetInsert1Execute(Sender: TObject);
begin
        DMSCM.QJustificativa_comarca.Insert;
        DBEdit_ano.SetFocus;
end;

procedure Tfrm_indicacao.DataSetEdit1Execute(Sender: TObject);
begin
        DMSCM.QJustificativa_comarca.Edit;
        DBEdit_ano.SetFocus;

end;

procedure Tfrm_indicacao.btn_pesquisaClick(Sender: TObject);
begin
   dmscm.QAnoJustificativa.Active := true;
   Application.CreateForm(Tfrm_lov_justificativa, frm_lov_justificativa);
   frm_lov_Justificativa.DBLkupComboBoxAno.KeyValue:=dmscm.QAnoJustificativaAno.AsVariant;
   frm_lov_Justificativa.showModal;
   if frm_lov_Justificativa.cod_comarca <> 0 then
     if dmscm.QJustificativa_comarca.Locate('ano;comr_codigo',VarArrayOf([frm_lov_Justificativa.ano_comarca,frm_lov_Justificativa.cod_comarca]),[loCaseInsensitive]) = false then
       messageDlg('ERRO NA PESQUISA !'+#13+'Favor contactar o administrador do sistema.',mterror,[mbok],0);

   frm_lov_Justificativa.Destroy;
   dmscm.QAnoJustificativa.Active := false;
end;

end.
