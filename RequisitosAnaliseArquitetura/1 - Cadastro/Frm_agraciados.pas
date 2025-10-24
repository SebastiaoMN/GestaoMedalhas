unit frm_agraciados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DBActns, ActnList, db;

type
  Tfrm_cad_agraciado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_insere: TSpeedButton;
    btn_edita: TSpeedButton;
    btn_grava: TSpeedButton;
    btn_exclui: TSpeedButton;
    GroupBox1: TGroupBox;
    DBEdit_CPF: TDBEdit;
    DBEdit_nome: TDBEdit;
    DBEdit_comr_comarca: TDBEdit;
    DBEdit_ano: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bbtn_comarca: TSpeedButton;
    Edit_desccomarca: TEdit;
    btn_saida: TSpeedButton;
    DBCheck_enviado: TDBCheckBox;
    ActionList1: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    bbtn_cancela: TSpeedButton;
    DataSetCancel1: TDataSetCancel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DataSetLast1: TDataSetLast;
    DataSetFirst1: TDataSetFirst;
    procedure btn_saidaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSetInsert1Execute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCheck_enviadoKeyPress(Sender: TObject; var Key: Char);
    Function ValidaCPF(const s:string): Boolean;
    procedure DBEdit_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure bbtn_comarcaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_agraciado: Tfrm_cad_agraciado;

implementation
    uses frm_comarca, DM_SCM;
{$R *.DFM}

procedure Tfrm_cad_agraciado.btn_saidaClick(Sender: TObject);
begin
   frm_cad_agraciado.Close;
end;

procedure Tfrm_cad_agraciado.FormShow(Sender: TObject);
begin
   dmscm.QAgraciados.Active := true;
end;

procedure Tfrm_cad_agraciado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmscm.QAgraciados.Active := false;
end;

procedure Tfrm_cad_agraciado.DataSetInsert1Execute(Sender: TObject);
begin
         DMSCM.QAgraciados.Insert;
         DBEdit_CPF.SetFocus;
end;

procedure Tfrm_cad_agraciado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 45  then
      DataSetInsert1.OnExecute(Self);
end;

procedure Tfrm_cad_agraciado.DBCheck_enviadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     if (Dmscm.DSAgraciados.State = dsInsert) or (Dmscm.DSAgraciados.State = Dsedit) then
        Dmscm.QAgraciados.Post;
end;

Function Tfrm_cad_agraciado.ValidaCPF(const s:string): Boolean;
var
i, Numero, Resto : Byte ;
DV1, DV2 : Byte ;
Total, Soma : Integer ;
Begin
result := FALSE;
if length (Trim (s)) = 11 Then
    begin
      Total := 0 ;
      Soma := 0 ;
      for i := 1 to 9 do
        Begin
          Try
            Numero := StrToInt (s[i]);
          Except
            Numero := 0;
          end;
          Total := Total + (Numero * (11 - i)) ;
          Soma := Soma + Numero;
        end;
    Resto := Total mod 11;
    if Resto > 1 then
      DV1 := 11 - Resto
    else
      DV1 := 0;
    Total := Total + Soma + 2 * DV1;
    Resto := Total mod 11;
    if Resto > 1 then
      DV2 := 11 - Resto
    else
      DV2 := 0;
    if (IntToStr (DV1) = s[10]) and (IntToStr (DV2) = s[11]) then
      result := TRUE;
    end;
end;

procedure Tfrm_cad_agraciado.DBEdit_CPFKeyPress(Sender: TObject;
  var Key: Char);
begin
{habilita a tecla <enter> no KeyPress de qualquer componente}
    with frm_cad_agraciado, DMSCM do
    begin
        QComarca.Active := false;
        QComarca.ParamByName('p_comarca').value := DBEdit_comr_comarca.Text;
        QComarca.Active := true;
        if QComarca.IsEmpty  then
        begin
            messageDlg('Comarca nãno cadastrada !', mterror, [mbok],0);
            abort;
        end
        else
            Edit_desccomarca.Text :=  QComarcaNome.text;
    end;

    if Key = #13 then
    begin
     Key := #0;
     Perform (CM_DialogKey, VK_TAB,0);
    end;
end;

procedure Tfrm_cad_agraciado.bbtn_comarcaClick(Sender: TObject);
begin
  with FormCons_cidade,DMSCM do
  begin
      Application.CreateForm(TFormCons_cidade, FormCons_cidade);
      FormCons_cidade.ShowModal;
      if Cod_Cidade<>0 then
      begin
         QAgraciadosCOMR_CODIGO.Value            := Cod_cidade;
         frm_cad_agraciado.Edit_desccomarca.Text := nome;
      end;
  end;
end;

end.
