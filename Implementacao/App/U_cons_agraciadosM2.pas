unit U_cons_agraciadosM2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DBCtrls, DB, DBTables;

type
  TFrm_cons_agraciadosM2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridPesquisa: TDBGrid;
    DSConsAgraciados: TDataSource;
    QConsAgraciadosM2: TQuery;
    QConsAgraciadosM2NOME: TStringField;
    QConsAgraciadosM2CODIGO: TFloatField;
    Panel3: TPanel;
    bbtn_saida: TSpeedButton;
    Label1: TLabel;
    EdNome: TEdit;
    DbAno: TDBLookupComboBox;
    ckPesquisaAno: TCheckBox;
    QConsAgraciadosM2ANO: TFloatField;
    QConsAgraciadosM2CARGO_PROFISSAO: TStringField;
    QConsAgraciadosM2IDENTIFICADOR_ENVIADO: TStringField;
    QConsAgraciadosM2IDENTIFICADOR_INTERNET: TStringField;
    QConsAgraciadosM2SEXO: TStringField;
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
  Frm_cons_agraciadosM2: TFrm_cons_agraciadosM2;

implementation

uses
   dm_scm;
{$R *.DFM}

procedure TFrm_cons_agraciadosM2.SQLConsAgraciados;
begin
        QConsAgraciadosM2.Active := false;

        if EdNome.Text <> '' then
          QConsAgraciadosM2.ParamByName('p_nome').AsString := EdNome.Text
        else 
          QConsAgraciadosM2.ParamByName('p_nome').AsString := '';        

        if ckPesquisaAno.Checked then
           QConsAgraciadosM2.ParamByName('p_ano').AsString := DbAno.Text
        else
           QConsAgraciadosM2.ParamByName('p_ano').AsString := '0';
        

        QConsAgraciadosM2.Active := true;
        
end;

procedure TFrm_cons_agraciadosM2.ckPesquisaAnoClick(Sender: TObject);
begin
     if ckPesquisaAno.Checked then
        dbAno.Enabled := true
     else
        dbAno.Enabled := false; 

    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

procedure TFrm_cons_agraciadosM2.bbtn_saidaClick(Sender: TObject);
begin
  close;
  dmscm.Q_AnoAgraciadosM2.Active := false;
end;

procedure TFrm_cons_agraciadosM2.DbAnoClick(Sender: TObject);
begin
    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

procedure TFrm_cons_agraciadosM2.EdNomeChange(Sender: TObject);
begin
     SQLConsAgraciados;
end;

procedure TFrm_cons_agraciadosM2.FormShow(Sender: TObject);
begin
     dmscm.Q_AnoAgraciadosM2.Active := true;          
     SQLConsAgraciados;
     DBGridPesquisa.SetFocus;
end;

end.


