unit u_frm_rel_agraciadosM1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons;

type
  TfrmRelAgraciadosM1 = class(TForm)
    GroupBox1: TGroupBox;
    DBAno: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    BtnSair: TSpeedButton;
    BtnRelAgraciadosAnoM1: TBitBtn;
    BtnRelAgraciadosOrdemM1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnRelAgraciadosAnoM1Click(Sender: TObject);
    procedure BtnRelAgraciadosOrdemM1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAgraciadosM1: TfrmRelAgraciadosM1;

implementation

uses DM_SCM, u_qr_agraciadosAnoM1, u_qr_AgraciadosOrdemM1;

{$R *.dfm}

procedure TfrmRelAgraciadosM1.FormShow(Sender: TObject);
begin
  dmscm.Q_AnoAgraciadosM1.Active := true;
  DBAno.KeyValue := dmscm.Q_AnoAgraciadosM1Ano.AsVariant;
  DBAno.Enabled := true;
end;

procedure TfrmRelAgraciadosM1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmscm.Q_AnoAgraciadosM1.Active := False;
end;

procedure TfrmRelAgraciadosM1.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelAgraciadosM1.BtnRelAgraciadosAnoM1Click(Sender: TObject);
begin
   if DBAno.Text <> '' then
   begin
      qr_agraciadosAnoM1.Qry_AgraciadosAnoM1.active := false;
      qr_agraciadosAnoM1.Qry_AgraciadosAnoM1.ParamByName('p_ano').AsString := DBAno.Text;
      qr_agraciadosAnoM1.Qry_AgraciadosAnoM1.active := true;
      qr_agraciadosAnoM1.Preview;
   end
   else 
      MessageDlg('Selecione um ano !',mtWarning,[mbOK],0);
end;

procedure TfrmRelAgraciadosM1.BtnRelAgraciadosOrdemM1Click(
  Sender: TObject);
begin
      qr_agraciadosOrdemM1.Qry_AgraciadosOrdemM1.active := false;
      qr_agraciadosOrdemM1.Qry_AgraciadosOrdemM1.active := true;
      qr_agraciadosOrdemM1.Preview;
end;

end.
