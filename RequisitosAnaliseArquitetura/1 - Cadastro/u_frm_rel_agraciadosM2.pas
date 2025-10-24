unit u_frm_rel_agraciadosM2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons;

type
  TfrmRelAgraciadosM2 = class(TForm)
    GroupBox1: TGroupBox;
    DBAno: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    BtnSair: TSpeedButton;
    BtnRelAgraciadosAnoM2: TBitBtn;
    BtnRelAgraciadosOrdemM2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnRelAgraciadosAnoM2Click(Sender: TObject);
    procedure BtnRelAgraciadosOrdemM2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAgraciadosM2: TfrmRelAgraciadosM2;

implementation

uses DM_SCM, u_qr_agraciadosAnoM2, u_qr_AgraciadosOrdemM2;

{$R *.dfm}

procedure TfrmRelAgraciadosM2.FormShow(Sender: TObject);
begin
  dmscm.Q_AnoAgraciadosM2.Active := true;
  DBAno.KeyValue := dmscm.Q_AnoAgraciadosM2Ano.AsVariant;
  DBAno.Enabled := true;
end;

procedure TfrmRelAgraciadosM2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmscm.Q_AnoAgraciadosM2.Active := False;
end;

procedure TfrmRelAgraciadosM2.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelAgraciadosM2.BtnRelAgraciadosAnoM2Click(Sender: TObject);
begin
   if DBAno.Text <> '' then
   begin
      qr_agraciadosAnoM2.Qry_AgraciadosAnoM2.active := false;
      qr_agraciadosAnoM2.Qry_AgraciadosAnoM2.ParamByName('p_ano').AsString := DBAno.Text;
      qr_agraciadosAnoM2.Qry_AgraciadosAnoM2.active := true;
      qr_agraciadosAnoM2.Preview;
   end
   else 
      MessageDlg('Selecione um ano !',mtWarning,[mbOK],0);
end;

procedure TfrmRelAgraciadosM2.BtnRelAgraciadosOrdemM2Click(
  Sender: TObject);
begin
      qr_agraciadosOrdemM2.Qry_AgraciadosOrdemM2.active := false;
      qr_agraciadosOrdemM2.Qry_AgraciadosOrdemM2.active := true;
      qr_agraciadosOrdemM2.Preview;
end;

end.
