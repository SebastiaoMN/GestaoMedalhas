unit U_Cad_AgraciadosM1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DBActns, ActnList, db,
  DBTables;

type
  TfrmCadAgraciadosM1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBCPF: TDBEdit;
    DBNome: TDBEdit;
    DBAno: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnSair: TSpeedButton;
    DBMedalhaEnviada: TDBCheckBox;
    BtnAnterior: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    DBHomonimo: TDBCheckBox;
    DBInMemorian: TDBCheckBox;
    DBDisponibilizaInternet: TDBCheckBox;
    Label5: TLabel;
    DBCodigo: TDBEdit;
    DBCargoProfissao: TDBLookupComboBox;
    DBComarca: TDBLookupComboBox;
    QCons: TQuery;
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
  frmCadAgraciadosM1: TfrmCadAgraciadosM1;

implementation
    uses DM_SCM, U_lov_agraciados;
{$R *.DFM}

procedure TfrmCadAgraciadosM1.BtnSairClick(Sender: TObject);
begin
  if (DMSCM.DSAgraciadosM1.State = dsinsert) or (DMSCM.DSAgraciadosM1.State = dsedit) then
      if messageDlg('Deseja salvar registro antes de sair ?', mtwarning,[mbOk,mbCancel],0) = mrOK then
         dmscm.QAgraciadosM1.post
      else
         dmscm.QAgraciadosM1.Cancel;

   Close;
   dmscm.QAgraciadosM1.Active := false;
   dmscm.QCargoProfissao.Active := false;
   dmscm.QComarca.Active := false;
   dmscm.QTipoSexo.Active := false;
end;

procedure TfrmCadAgraciadosM1.FormShow(Sender: TObject);
begin
   dmscm.QAgraciadosM1.Active := true;
   dmscm.QCargoProfissao.Active := true;
   dmscm.QComarca.Active := True;
   dmscm.QTipoSexo.Active := True;
   desabilitaCampos;
end;

procedure TfrmCadAgraciadosM1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (DMSCM.DSAgraciadosM1.State = dsinsert) or (DMSCM.DSAgraciadosM1.State = dsedit) then
      if messageDlg('Deseja salvar registro antes de sair ?', mtwarning,[mbOk,mbCancel],0) = mrOK then
         dmscm.QAgraciadosM1.post
      else
         dmscm.QAgraciadosM1.Cancel;

   Close;
   dmscm.QAgraciadosM1.Active := false;
   dmscm.QCargoProfissao.Active := false;
   dmscm.QComarca.Active := false;
end;

procedure TfrmCadAgraciadosM1.HabilitaCampos;
begin
   DBNome.Enabled := true;
   DBCPF.Enabled := true;
   DBANO.Enabled := true;

   dmscm.QCargoProfissao.Active := true;
   DBCargoProfissao.Enabled := true;
   DBSexo.Enabled := true;

   DBComarca.Enabled := true;
   DBHomonimo.Enabled := true;
   DBInMemorian.Enabled := true;
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

procedure TfrmCadAgraciadosM1.DesabilitaCampos;
begin
   DBNome.Enabled := false;
   DBCPF.Enabled := false;
   DBANO.Enabled := false;
   DBCargoProfissao.Enabled := false;
   DBSexo.Enabled := false;

   DBComarca.Enabled := false;
   DBHomonimo.Enabled := false;
   DBInMemorian.Enabled := false;
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

function TfrmCadAgraciadosM1.ValidaCampos : boolean;
begin
	result := true;

  // Campos obrigatórios ****************************************************

  if dbComarca.Text = '' then
  begin
     messageDlg('A comarca deve ser informada.',mterror,[mbok],0);
     result := false;
     abort;
  end;            
  
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
  
	// valida CPF
    if DBCPF.text <> '' then
    begin
    	if not DMSCM.ValidaCPF(DBCPF.text) then
        begin
        messageDlg('O CPF não é válido.',mterror,[mbok],0);
        result := false;
        abort;
        end;
    end;

    // verifica se tem nome repetido e homônimo desmarcado.
    if DBHomonimo.Checked = false then
    begin
       //para nome repetido
       QConsNome.active := false;
       QConsNome.ParamByName('p_nome').AsString := DBnome.Text;

       if dbCodigo.Text <> '' then
          QConsNome.ParamByName('p_codigo').AsString := dbCodigo.Text
       else
          QConsNome.ParamByName('p_codigo').AsString := '0';       

       QConsNome.active := true;

       if not QConsNome.IsEmpty  then
       begin
           messageDlg('Nome já cadastrado no sistema. Caso necessário, marque como homônimo!', mterror, [mbok],0);
           result := false;
           abort;
       end;
	end;

    // Verifica se CPF foi preenchido e se tem repetido.
    if DBCPF.text <> '' then
    begin
       //Para cpf repetido
       QCons.active := false;
       QCons.SQL.Clear;
       QCons.sql.add('SELECT 1 FROM agraciados'); 
       QCons.sql.add(' where cpf = ' + DBCPF.Text);
       QCons.sql.add(' and tipo_medalha = 1 and data_exclusao is null');

       if dbCodigo.Text <> '' then
          QCons.sql.add(' and codigo <> ' + dbCodigo.Text);

       QCons.active := true;

       if not QCons.IsEmpty  then
       begin
           messageDlg('CPF já cadastrado no sistema !', mterror, [mbok],0);
           result := false;
           abort;
       end;
   end;


   // Verifica se a comarca já recebeu medalhas no ano.
     QCons.active := false;
     QCons.SQL.Clear;
     QCons.sql.add('SELECT 1 FROM agraciados'); 
     QCons.sql.add(' where ano = ' + DBAno.Text);
     QCons.sql.add(' and comr_codigo = ' + inttostr(DBComarca.KeyValue) );
     QCons.sql.add(' and tipo_medalha = 1 and data_exclusao is null');

     if dbCodigo.Text <> '' then
          QCons.sql.add(' and codigo <> ' + dbCodigo.Text);

     QCons.active := true;

     if not QCons.IsEmpty  then
     begin
         messageDlg('Esta comarca já foi indicada neste ano !', mterror, [mbok],0);
         result := false;
         abort;
     end;

end;


procedure TfrmCadAgraciadosM1.BtnAlterarClick(Sender: TObject);
begin

   DMSCM.DSAgraciadosM1.DataSet.Edit;

   HabilitaCampos;


end;

procedure TfrmCadAgraciadosM1.BtnGravarClick(Sender: TObject);
begin

	If ValidaCampos then
    Begin

 	     if DBCodigo.Text = '' then
         Begin
           QMaxSequencial.Open;
   	       DBCodigo.Text := QMaxSequencialSequencial.AsString;
      	   QMaxSequencial.close;
         end;

        if DBHomonimo.Checked then
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_HOMONIMO').AsInteger := 1
        else
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_HOMONIMO').AsInteger := 0;

        if DBInMemorian.Checked then
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_IN_MEMORIAN').AsInteger := 1
        else
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_IN_MEMORIAN').AsInteger := 0;

        if DBMedalhaEnviada.Checked then
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_ENVIADO').AsInteger := 1
        else
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_ENVIADO').AsInteger := 0;

        if DBDisponibilizaInternet.Checked then
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_INTERNET').AsInteger := 1
        else
           DMSCM.QAgraciadosM1.FieldByName('IDENTIFICADOR_INTERNET').AsInteger := 0;

        DMSCM.DSAgraciadosM1.DataSet.Post;
        messageDlg('O registro foi salvo.',mtinformation,[mbok],0);

    end
    else
       messageDlg('O registro não foi salvo.',mterror,[mbok],0);


  DesabilitaCampos;

end;

procedure TfrmCadAgraciadosM1.BtnDesfazerClick(Sender: TObject);
begin

   dmscm.QAgraciadosM1.Cancel;

   DesabilitaCampos;

   
end;

procedure TfrmCadAgraciadosM1.BtnExcluirClick(Sender: TObject);
begin
   if messageDlg('Deseja excluir o registro do agraciados ?',mtwarning,[mbOk,mbCancel],0) = mrOK then
   begin
       DMSCM.QAgraciadosM1.Delete;
   end
   else
       DMSCM.QAgraciadosM1.cancel;

   
end;

procedure TfrmCadAgraciadosM1.BtnIncluirClick(Sender: TObject);
begin
   DMSCM.DSAgraciadosM1.DataSet.Insert;
   DBHomonimo.Checked := False;
   DBInMemorian.Checked := false;
   DBMedalhaEnviada.Checked := false;
   DBDisponibilizaInternet.Checked := false;

   HabilitaCampos;

 
end;

procedure TfrmCadAgraciadosM1.BtnAnteriorClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM1.DataSet.FindPrior;
end;

procedure TfrmCadAgraciadosM1.btnProximoClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM1.DataSet.Next;
end;

procedure TfrmCadAgraciadosM1.btnUltimoClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM1.DataSet.Last;
end;

procedure TfrmCadAgraciadosM1.btnPrimeiroClick(Sender: TObject);
begin
     DMSCM.DSAgraciadosM1.DataSet.First;
end;

procedure TfrmCadAgraciadosM1.BtnPesquisarClick(Sender: TObject);
begin
   Application.CreateForm(Tfrm_lov_agraciados, frm_lov_agraciados);
   frm_lov_agraciados.showModal;
   if frm_lov_agraciados.codigo <> 0 then
     if dmscm.QAgraciadosM1.Locate('Codigo',frm_lov_agraciados.codigo,[loCaseInsensitive]) = false then
       messageDlg('ERRO NA PESQUISA !'+#13+'Favor contactar o administrador do sistema.',mterror,[mbok],0);

   frm_lov_agraciados.Destroy;
end;

end.
