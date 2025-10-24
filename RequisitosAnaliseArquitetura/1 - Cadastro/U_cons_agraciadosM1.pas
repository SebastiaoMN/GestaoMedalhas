unit U_cons_agraciadosM1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DBCtrls, DB, DBTables;

type
  TFrm_cons_agraciadosM1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridPesquisa: TDBGrid;
    DSConsAgraciados: TDataSource;
    QConsAgraciadosM1: TQuery;
    QConsAgraciadosM1NOME: TStringField;
    QConsAgraciadosM1CODIGO: TFloatField;
    Panel3: TPanel;
    bbtn_saida: TSpeedButton;
    Label1: TLabel;
    EdNome: TEdit;
    DbAno: TDBLookupComboBox;
    ckPesquisaAno: TCheckBox;
    QConsAgraciadosM1ANO: TFloatField;
    QConsAgraciadosM1CPF: TFloatField;
    QConsAgraciadosM1COMARCA: TStringField;
    QConsAgraciadosM1CARGO_PROFISSAO: TStringField;
    QConsAgraciadosM1IDENTIFICADOR_ENVIADO: TStringField;
    QConsAgraciadosM1IDENTIFICADOR_INTERNET: TStringField;
    QConsAgraciadosM1IDENTIFICADOR_IN_MEMORIAN: TStringField;
    QConsAgraciadosM1IDENTIFICADOR_HOMONIMO: TStringField;
    QConsAgraciadosM1SEXO: TStringField;
    procedure ckPesquisaAnoClick(Sender: TObject);
    procedure bbtn_saidaClick(Sender: TObject);
    procedure DbAnoClick(Sender: TObject);
    procedure EdNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SQLConsAgraciados;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cons_agraciadosM1: TFrm_cons_agraciadosM1;

implementation

uses
   dm_scm;
{$R *.DFM}

procedure TFrm_cons_agraciadosM1.SQLConsAgraciados;
begin
        QConsAgraciadosM1.Active := false;

        if EdNome.Text <> '' then
          QConsAgraciadosM1.ParamByName('p_nome').AsString := EdNome.Text
        else 
          QConsAgraciadosM1.ParamByName('p_nome').AsString := '';        

        if ckPesquisaAno.Checked then
           QConsAgraciadosM1.ParamByName('p_ano').AsString := DbAno.Text
        else
           QConsAgraciadosM1.ParamByName('p_ano').AsString := '0';
        

        QConsAgraciadosM1.Active := true;
        
end;

procedure TFrm_cons_agraciadosM1.ckPesquisaAnoClick(Sender: TObject);
begin
     if ckPesquisaAno.Checked then
        dbAno.Enabled := true
     else
        dbAno.Enabled := false; 

    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

procedure TFrm_cons_agraciadosM1.bbtn_saidaClick(Sender: TObject);
begin
  close;
  dmscm.Q_AnoAgraciadosM1.Active := false;
end;

procedure TFrm_cons_agraciadosM1.DbAnoClick(Sender: TObject);
begin
    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

procedure TFrm_cons_agraciadosM1.EdNomeChange(Sender: TObject);
begin
     SQLConsAgraciados;
end;

procedure TFrm_cons_agraciadosM1.FormShow(Sender: TObject);
begin
     dmscm.Q_AnoAgraciadosM1.Active := true;          
     SQLConsAgraciados;
     DBGridPesquisa.SetFocus;
end;

end.


