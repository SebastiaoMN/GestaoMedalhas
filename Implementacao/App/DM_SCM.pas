{ Observação:
Os componentes das funcionalidades Medalha Des. Helio Costa estão com o identificador M1 e
a medalha Colar do Mérito como M2 }

unit DM_SCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  TDMSCM = class(TDataModule)
    DSAgraciadosM1: TDataSource;
    QAgraciadosM1: TQuery;
    UAgraciadosM1: TUpdateSQL;
    DBSCM: TDatabase;
    QConsComarca: TQuery;
    UpdateCargoComarca: TUpdateSQL;
    DSComarca: TDataSource;
    QComarca: TQuery;
    QComarcaNOME: TStringField;
    DSCons_agraciados: TDataSource;
    Q_AnoAgraciadosM1: TQuery;
    Q_AnoAgraciadosM1ANO: TFloatField;
    DSAnoAgraciadosM1: TDataSource;
    DS_usuario_autorizado: TDataSource;
    Q_sys: TQuery;
    Q_sysDATA: TDateTimeField;
    Q_sysUSER: TStringField;
    Q_sysNOME: TStringField;
    spsenha: TStoredProc;
    Q_AnoAgraciadosM2: TQuery;
    Q_AnoAgraciadosM2Ano: TFloatField;
    DSAnoAgraciadosM2: TDataSource;
    DSCargoProfissao: TDataSource;
    QCargoProfissao: TQuery;
    QCargoProfissaoCODIGO: TFloatField;
    QComarcaCODIGO: TFloatField;
    DSAgraciadosM2: TDataSource;
    QAgraciadosM2: TQuery;
    UAgraciadosM2: TUpdateSQL;
    QAgraciadosM2CODIGO: TFloatField;
    QAgraciadosM2NOME: TStringField;
    QAgraciadosM2ANO: TFloatField;
    QAgraciadosM2CAPR_CODIGO: TFloatField;
    QAgraciadosM2IDENTIFICADOR_ENVIADO: TFloatField;
    QAgraciadosM2IDENTIFICADOR_INTERNET: TFloatField;
    QCargoProfissaoDESCRICAO: TStringField;
    QAgraciadosM1CODIGO: TFloatField;
    QAgraciadosM1NOME: TStringField;
    QAgraciadosM1ANO: TFloatField;
    QAgraciadosM1COMR_CODIGO: TFloatField;
    QAgraciadosM1CAPR_CODIGO: TFloatField;
    QAgraciadosM1IDENTIFICADOR_ENVIADO: TFloatField;
    QAgraciadosM1IDENTIFICADOR_INTERNET: TFloatField;
    QAgraciadosM1IDENTIFICADOR_IN_MEMORIAN: TFloatField;
    QAgraciadosM1IDENTIFICADOR_HOMONIMO: TFloatField;
    QAgraciadosM1CPF: TFloatField;
    DSTipoSexo: TDataSource;
    QTipoSexo: TQuery;
    QTipoSexoTIPO: TStringField;
    QTipoSexoDESCRICAO: TStringField;
    QAgraciadosM1SEXO: TStringField;
    QAgraciadosM2SEXO: TStringField;
    procedure QAgraciadosM1AfterPost(DataSet: TDataSet);
    Function  ValidaCPF(s: string): Boolean;
    procedure QCargoProfissaoAfterPost(DataSet: TDataSet);
    Function fn_CommitQuery(QryOri: TQuery; DBOri: TDataBase): Boolean;
    procedure QAgraciadosM2AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSCM: TDMSCM;

implementation


{$R *.DFM}


procedure TDMSCM.QAgraciadosM1AfterPost(DataSet: TDataSet);
begin
  //  DMSCM.Commit_update(QAgraciadosM1);
     if Not fn_CommitQuery(QAgraciadosM1,dbscm) then
    begin
          messageDlg('Erro de gravação !', mterror, [mbok],0);
    end
end;


Function TDMSCM.ValidaCPF(s :string): Boolean;
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


procedure TDMSCM.QCargoProfissaoAfterPost(DataSet: TDataSet);
begin
   //DMSCM.Commit_update(QCargoProfissao);
   
   if Not fn_CommitQuery(QCargoProfissao,dbscm) then
    begin
          messageDlg('Erro de gravação !', mterror, [mbok],0);
    end
end;

//*****************************************************************
// Atualiza o update das query's, caso ocorra erro retorna mensagem
{Função copiada do Infoguia para atualizar os dados no banco de dados. }
Function TDMSCM.fn_CommitQuery(QryOri: TQuery; DBOri: TDataBase): Boolean;
begin
  //start a transação
  DBOri.StartTransaction;
  try
     //aplica os updates realizados
     QryOri.ApplyUpdates;
     DBOri.Commit;
     Result:=true;
  except
{     MessageBox(Screen.ActiveForm.Handle , 'Erro de gravação !'+#13+
     'TENTE GRAVAR NOVAMENTE, caso o erro persistir ligue para informática.','Erro',16);}
     //caso ocorra erro cancela update
     QryOri.CancelUpdates;
     DBOri.Rollback;
     Result:=false;
  end;
  //Dá o commit no banco para applyupdate correto
  QryOri.CommitUpdates;
end;



procedure TDMSCM.QAgraciadosM2AfterPost(DataSet: TDataSet);
begin
     if Not fn_CommitQuery(QAgraciadosM2,dbscm) then
        messageDlg('Erro de gravação !', mterror, [mbok],0);
    
end;

end.
