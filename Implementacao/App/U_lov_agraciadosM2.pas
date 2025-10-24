unit U_lov_agraciadosM2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Db, DBTables, Buttons, DBCtrls;

type
  Tfrm_lov_agraciadosM2 = class(TForm)
    Panel1: TPanel;
    EdNome: TEdit;
    DBGridPesquisa: TDBGrid;
    bbtn_saida: TSpeedButton;
    Label1: TLabel;
    DbAno: TDBLookupComboBox;
    ckPesquisaAno: TCheckBox;
    QConsAgraciadosM2: TQuery;
    QConsAgraciadosM2NOME: TStringField;
    DSConsAgraciados: TDataSource;
    QConsAgraciadosM2CODIGO: TFloatField;
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
  frm_lov_agraciadosM2: Tfrm_lov_agraciadosM2;

implementation
uses  DM_SCM;

{$R *.DFM}

procedure Tfrm_lov_agraciadosM2.SQLConsAgraciados;
begin
        QConsAgraciadosM2.Active := false;

        if EdNome.Text <> '' then
          QConsAgraciadosM2.ParamByName('p_nome').AsString := EdNome.Text + '%'
        else 
          QConsAgraciadosM2.ParamByName('p_nome').AsString := '';        

        if ckPesquisaAno.Checked then
           QConsAgraciadosM2.ParamByName('p_ano').AsString := DbAno.Text
        else
           QConsAgraciadosM2.ParamByName('p_ano').AsString := '0';
        

        QConsAgraciadosM2.Active := true;
        
end;

procedure Tfrm_lov_agraciadosM2.FormShow(Sender: TObject);
begin
     Codigo:= 0;
     dmscm.Q_AnoAgraciadosM2.Active := true;          
     SQLConsAgraciados;
     DBGridPesquisa.SetFocus;
end;

procedure Tfrm_lov_agraciadosM2.EdNomeChange(Sender: TObject);
begin
     SQLConsAgraciados;
end;


procedure Tfrm_lov_agraciadosM2.DBGridPesquisaDblClick(Sender: TObject);
begin
    codigo := QConsAgraciadosM2CODIGO.Value;
    Close;
end;

procedure Tfrm_lov_agraciadosM2.DbAnoClick(Sender: TObject);
begin
    EdNome.Clear;
    SQLConsAgraciados;
    DBGridPesquisa.SetFocus;
end;

procedure Tfrm_lov_agraciadosM2.bbtn_saidaClick(Sender: TObject);
begin
  close;
  dmscm.Q_AnoAgraciadosM2.Active := false;
     
end;

procedure Tfrm_lov_agraciadosM2.ckPesquisaAnoClick(Sender: TObject);
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
