unit u_frm_rel_SemIndicacaoM1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons;

type
  TfrmRelSemIndicacaoM1 = class(TForm)
    GroupBox1: TGroupBox;
    DBAno: TDBLookupComboBox;
    BtnSair: TSpeedButton;
    BtnRelSemIndicacaoM1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnRelSemIndicacaoM1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSemIndicacaoM1: TfrmRelSemIndicacaoM1;

implementation

uses DM_SCM, u_qr_SemIndicacaoM1;

{$R *.dfm}

procedure TfrmRelSemIndicacaoM1.FormShow(Sender: TObject);
begin
  dmscm.Q_AnoAgraciadosM1.Active := true;
  DBAno.KeyValue := dmscm.Q_AnoAgraciadosM1Ano.AsVariant;
  DBAno.Enabled := true;
end;

procedure TfrmRelSemIndicacaoM1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmscm.Q_AnoAgraciadosM1.Active := False;
end;

procedure TfrmRelSemIndicacaoM1.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelSemIndicacaoM1.BtnRelSemIndicacaoM1Click(Sender: TObject);
begin
   if DBAno.Text <> '' then
   begin
      qr_SemIndicacaoM1.Qry_SemIndicacaoM1.Active := false;
      qr_SemIndicacaoM1.Qry_SemIndicacaoM1.ParamByName('p_ano').AsString := DBAno.Text;
      qr_SemIndicacaoM1.Qry_SemIndicacaoM1.active := true;
      qr_SemIndicacaoM1.Preview;
   end
   else 
      MessageDlg('Selecione um ano !',mtWarning,[mbOK],0);
end;



end.
