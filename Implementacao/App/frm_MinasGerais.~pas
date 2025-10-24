unit frm_MinasGerais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, DBCtrls, ComCtrls;

type
  TFfrm_MinasGerais = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Q_RelAgraciados: TQuery;
    Q_RelAgraciadosNOME: TStringField;
    Q_RelAgraciadosNOME_1: TStringField;
    SaveDialogMGerais: TSaveDialog;
    BitBtnIniciar: TBitBtn;
    GroupBox1: TGroupBox;
    DBLkupComboBoxAno: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    ProgressBar1: TProgressBar;
    procedure SaveDialogMGeraisCanClose(Sender: TObject;
      var CanClose: Boolean);
    procedure BitBtnIniciarClick(Sender: TObject);
    procedure DBLkupComboBoxAnoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ffrm_MinasGerais: TFfrm_MinasGerais;

implementation

uses frm_principal;

{$R *.DFM}

var intHandle: Integer;

{* PROCEDIMENTOS INICIAIS *****************************************************}
procedure TFfrm_MinasGerais.BitBtnIniciarClick(Sender: TObject);
begin
   SaveDialogMGerais.Execute;
end;

{* GRAVA DISQUETE *************************************************************}
procedure TFfrm_MinasGerais.SaveDialogMGeraisCanClose(Sender: TObject;
  var CanClose: Boolean);
var strSaida: String;
    pchSaida: PChar;
begin
Ffrm_MinasGerais.Refresh;
Q_RelAgraciados.ParamByName('p_ano').Value := StrToFloat(DBLkupComboBoxAno.Text);
Q_RelAgraciados.Close;
Q_RelAgraciados.Open;

if  SaveDialogMGerais.FileName = '' then
    Exit;

intHandle := FileCreate(SaveDialogMGerais.FileName);
if  intHandle < 0  then
begin
    MessageDlg('ERRO AO CRIAR O ARQUIVO!!!',mtError,[mbCancel],0);
    Exit;
end;
strSaida :=
'              MEDALHA "DESEMBARGADOR HÉLIO COSTA"' + #13#10 +
'De acordo com as Resoluções nºs 269/95 e 362/2000, as seguintes' + #13#10 +
'personalidades, escolhidas por comissões locais, serão agraciadas com' +
                                                                        #13#10 +
'a Medalha "Des. Hélio Costa" neste ano, em cerimônias a serem' + #13#10 +
'realizadas nas respectivas comarcas:' + #13#10 + #13#10;
pchSaida := Pchar(strSaida);
FileWrite(intHandle,pchSaida^,Length(strSaida));
ProgressBar1.Max := Q_RelAgraciados.RecordCount;
while not Q_RelAgraciados.Eof do
begin
   ProgressBar1.Position := ProgressBar1.Position + 1;
   strSaida := Q_RelAgraciadosNome_1.Value +
               StringOfChar(' ',30 - Length(Q_RelAgraciadosNome_1.Value));
   strSaida := strSaida + Q_RelAgraciadosNome.Value + #13#10;
   pchSaida := Pchar(strSaida);
   FileWrite(intHandle,pchSaida^,Length(strSaida));
   Q_RelAgraciados.Next;
end;

FileClose(intHandle);
MessageDlg('FORMATO PARA O "MINAS GERAIS" GERADO COM SUCESSO.' + #13#10 + #13#10 +
           SaveDialogMGerais.FileName,mtInformation,[mbOk],0);

end;

procedure TFfrm_MinasGerais.DBLkupComboBoxAnoClick(Sender: TObject);
begin
    BitBtnIniciar.SetFocus;
end;

procedure TFfrm_MinasGerais.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
