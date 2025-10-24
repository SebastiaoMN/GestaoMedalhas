unit U_disponibiliza_internet_M1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, DBCtrls, DB, DBTables;

type
  TfrmDisponibilizarInternetM1 = class(TForm)
    GroupBox1: TGroupBox;
    DBLkupComboBoxAno: TDBLookupComboBox;
    BitBtnIniciar: TBitBtn;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    BtnDisponibiliza: TBitBtn;
    GroupBox2: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BtnRetira: TBitBtn;
    QDisponibilizaInternetM1: TQuery;
    procedure BtnDisponibilizaClick(Sender: TObject);
    procedure BtnRetiraClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisponibilizarInternetM1: TfrmDisponibilizarInternetM1;

implementation

{$R *.dfm}

procedure TfrmDisponibilizarInternetM1.BtnDisponibilizaClick(Sender: TObject);
begin

	if DBLookupComboBox1.Text = '' then
        	MessageDlg('Informe um ano.',mtError,[mbCancel],0)
	else
        begin
              	QDisponibilizaInternetM1.SQL.add ('update agraciados set identificador_internet = 1 where ano = ');
		QDisponibilizaInternetM1.SQL.add (DBLookupComboBox1.Text);
		QDisponibilizaInternetM1.SQL.add (' and tipo_medalha = 1 and data_exclusao is null');
                QDisponibilizaInternetM1.ExecSQL;
		QDisponibilizaInternetM1.SQL.Clear;
        end;

end;

procedure TfrmDisponibilizarInternetM1.BtnRetiraClick(Sender: TObject);
begin

	if DBLookupComboBox1.Text = '' then
        	MessageDlg('Informe um ano.',mtError,[mbCancel],0)
	else
        begin
        	QDisponibilizaInternetM1.SQL.add ('update agraciados set identificador_internet = 0 where ano = ');
		QDisponibilizaInternetM1.SQL.add (DBLookupComboBox1.Text);
		QDisponibilizaInternetM1.SQL.add (' and tipo_medalha = 1 and data_exclusao is null');
                QDisponibilizaInternetM1.ExecSQL;
		QDisponibilizaInternetM1.SQL.Clear;

        end;
end;

procedure TfrmDisponibilizarInternetM1.SpeedButton2Click(Sender: TObject);
begin
   close;
end;

end.
