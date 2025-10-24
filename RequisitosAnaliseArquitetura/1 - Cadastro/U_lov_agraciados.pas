unit U_lov_agraciados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Db, DBTables, Buttons, DBCtrls;

type
  Tfrm_lov_agraciados = class(TForm)
    Panel1: TPanel;
    EdNome: TEdit;
    DBGridPesquisa: TDBGrid;
    bbtn_saida: TSpeedButton;
    Label1: TLabel;
    DbAno: TDBLookupComboBox;
    ckPesquisaAno: TCheckBox;
    QConsAgraciadosM1: TQuery;
    QConsAgraciadosM1NOME: TStringField;
    DSConsAgraciados: TDataSource;
    QConsAgraciadosM1CODIGO: TFloatField;
    procedure SQLConsAgraciados;
    procedure FormShow(Sender: TObject);
    procedure EdNomeChange(Sender: TObject);
    procedure DBGridPesquisaDblClick(Sender: TObject);
    procedure DbAnoClick(Sender: TObject);
    procedure bbtn_saidaClick(Sender: TObject);
    procedure ckPesquisaAnoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Codigo : double;
  end;

var
  frm_lov_agraciados: Tfrm_lov_agraciados;

implementation
uses  DM_SCM;

{$R *.DFM}

procedure Tfrm_lov_agraciados.SQLConsAgraciados;
begin
        QConsAgraciadosM1.Active := false;

        if EdNome.Text <> '' then
          QConsAgraciadosM1.ParamByName('p_nome').AsString := EdNome.Text + '%'
        else 
          QConsAgraciadosM1.ParamByName('p_nome').AsString := '';        

        if ckPesquisaAno.Checked then
           QConsAgraciadosM1.ParamByName('p_ano').AsString := DbAno.Text
        else
           QConsAgraciadosM1.ParamByName('p_ano').AsString := '0';
        

        QConsAgraciadosM1.Active := true;
        
end;

procedure Tfrm_lov_agraciados.FormShow(Sender: TObject);
begin
     Codigo:= 0;
     dmscm.Q_AnoAgraciadosM1.Active := true;          
     SQLConsAgraciados;
     DBGridPesquisa.SetFocus;
end;

procedure Tfrm_lov_agraciados.EdNomeChange(Sender: TObject);
begin
     SQLConsAgraciados;
end;


procedure Tfrm_lov_agraciados.DBGridPesquisaDblClick(Sender: TObject);
begin
    codigo := QConsAgraciadosM1CODIGO.Value;
    Close;
end;

procedure Tfrm_lov_agraciados.DbAnoClick(Sender: TObject);
begin
    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

procedure Tfrm_lov_agraciados.bbtn_saidaClick(Sender: TObject);
begin
  close;
  dmscm.Q_AnoAgraciadosM1.Active := false;
     
end;

procedure Tfrm_lov_agraciados.ckPesquisaAnoClick(Sender: TObject);
begin
     if ckPesquisaAno.Checked then
        dbAno.Enabled := true
     else
        dbAno.Enabled := false; 

    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

end.
