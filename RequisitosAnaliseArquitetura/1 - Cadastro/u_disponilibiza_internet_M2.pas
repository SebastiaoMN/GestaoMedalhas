unit u_disponilibiza_internet_M2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TfrmDisponibilizarInternetM2 = class(TForm)
    QDisponibilizaInternetM2: TQuery;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    BtnDisponibiliza: TBitBtn;
    GroupBox2: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BtnRetira: TBitBtn;
    procedure BtnDisponibilizaClick(Sender: TObject);
    procedure BtnRetiraClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisponibilizarInternetM2: TfrmDisponibilizarInternetM2;

implementation

{$R *.dfm}

procedure TfrmDisponibilizarInternetM2.BtnDisponibilizaClick(
  Sender: TObject);
begin
	if DBLookupComboBox1.Text = '' then
        	MessageDlg('Informe um ano.',mtError,[mbCancel],0)
	else
        begin
              	QDisponibilizaInternetM2.SQL.add ('update agraciados set identificador_internet = 1 where ano = ');
		QDisponibilizaInternetM2.SQL.add (DBLookupComboBox1.Text);
		QDisponibilizaInternetM2.SQL.add (' and tipo_medalha =  2 and data_exclusao is null');
                QDisponibilizaInternetM2.ExecSQL;
		QDisponibilizaInternetM2.SQL.Clear;
        end;

end;

procedure TfrmDisponibilizarInternetM2.BtnRetiraClick(Sender: TObject);
begin
	if DBLookupComboBox1.Text = '' then
        	MessageDlg('Informe um ano.',mtError,[mbCancel],0)
	else
        begin
        	QDisponibilizaInternetM2.SQL.add ('update agraciados set identificador_internet = 0 where ano = ');
		QDisponibilizaInternetM2.SQL.add (DBLookupComboBox1.Text);
		QDisponibilizaInternetM2.SQL.add (' and tipo_medalha = 2 and data_exclusao is null');
                QDisponibilizaInternetM2.ExecSQL;
		QDisponibilizaInternetM2.SQL.Clear;

        end;
end;

procedure TfrmDisponibilizarInternetM2.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

end.
