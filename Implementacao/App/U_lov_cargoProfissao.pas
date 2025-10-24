unit U_lov_cargoProfissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, Buttons,
  ExtCtrls;

type
  TFrm_lov_CargoProfissao = class(TForm)
    Panel1: TPanel;
    bbtn_saida: TSpeedButton;
    Label1: TLabel;
    EdNome: TEdit;
    DBGridPesquisa: TDBGrid;
    QConsCargoProfissao: TQuery;
    QConsCargoProfissaoCODIGO: TFloatField;
    DSConsCargoProfissao: TDataSource;
    QConsCargoProfissaoDESCRICAO: TStringField;
    procedure bbtn_saidaClick(Sender: TObject);
    procedure SQLConsCargoProfissao;
    procedure FormShow(Sender: TObject);
    procedure EdNomeChange(Sender: TObject);
    procedure DBGridPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Codigo : double;
  end;

var
  Frm_lov_CargoProfissao: TFrm_lov_CargoProfissao;

implementation

{$R *.dfm}



procedure TFrm_lov_CargoProfissao.SQLConsCargoProfissao;
begin
        QConsCargoProfissao.Active := false;

        if EdNome.Text <> '' then
          QConsCargoProfissao.ParamByName('p_nome').AsString := EdNome.Text + '%'
        else 
          QConsCargoProfissao.ParamByName('p_nome').AsString := '';        

        QConsCargoProfissao.Active := true;
        
end;

procedure TFrm_lov_CargoProfissao.FormShow(Sender: TObject);
begin
     Codigo:= 0;        
     SQLConsCargoProfissao;
     DBGridPesquisa.SetFocus;
end;

procedure TFrm_lov_CargoProfissao.EdNomeChange(Sender: TObject);
begin
     SQLConsCargoProfissao;
end;


procedure TFrm_lov_CargoProfissao.DBGridPesquisaDblClick(Sender: TObject);
begin
    codigo := QConsCargoProfissaoCODIGO.Value;
    Close;
end;



procedure TFrm_lov_CargoProfissao.bbtn_saidaClick(Sender: TObject);
begin
     Close; 
end;

end.
