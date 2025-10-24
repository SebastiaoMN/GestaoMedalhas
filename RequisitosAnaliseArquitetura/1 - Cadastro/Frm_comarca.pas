unit frm_comarca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Db, DBTables, Buttons;

type
  TFormCons_cidade = class(TForm)
    Panel1: TPanel;
    EditPesquisa: TEdit;
    DBGridPesquisa: TDBGrid;
    QComarca: TQuery;
    DS_Municipio: TDataSource;
    QComarcaCODIGO: TFloatField;
    QComarcaNOME: TStringField;
    bbtn_saida: TSpeedButton;
    procedure SQLConsCidade;
    procedure FormShow(Sender: TObject);
    procedure EditPesquisaChange(Sender: TObject);
    procedure DBGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure bbtn_saidaClick(Sender: TObject);
    procedure DBGridPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    Frase : String;
  public
    { Public declarations }
    Cod_Cidade : Double;
    Nome : String;
  end;

var
  FormCons_cidade: TFormCons_cidade;

implementation
uses DM_SCM;

{$R *.DFM}

procedure TFormCons_cidade.SQLConsCidade;
begin
     QComarca.Active:=false;
     QComarca.sql.Clear;
     QComarca.sql.Add('SELECT ');
     QComarca.sql.Add(' MUNICIPIO."CODIGO" , MUNICIPIO."NOME"');
     QComarca.sql.Add('FROM "DBATJ"."MUNICIPIO" MUNICIPIO');
     QComarca.sql.Add('WHERE (MUNICIPIO."UF_SIGLA" = ''MG'')');
     QComarca.sql.Add('AND (MUNICIPIO."CODIGO" = MUNICIPIO."COMR_CODIGO")');
     if EditPesquisa.Text<>'' then
        QComarca.sql.Add('  AND (TRANSLATE(UPPER(NOME),''√¡¿¬ƒ⁄Ÿ‹€…»À ÕÃœŒ”’“÷‘«'',''AAAAAUUUUEEEEIIIIOOOOOC'') LIKE '''+EditPesquisa.Text+'%'')');
     QComarca.sql.Add('ORDER BY');
     QComarca.sql.Add(' MUNICIPIO."NOME"');
     QComarca.Active:=true;
end;

procedure TFormCons_cidade.FormShow(Sender: TObject);
begin
     SQLConsCidade;
     DBGridPesquisa.SetFocus;
end;

procedure TFormCons_cidade.EditPesquisaChange(Sender: TObject);
begin
     SQLConsCidade;
end;

procedure TFormCons_cidade.DBGridPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #27 then
        Close
     else if Key=#13 then
        DBGridPesquisa.OnDblClick(Self)
     else
         begin
              if Key<>#8 then
                Frase:=Frase+UpperCase(key)
             else
                Frase:=Copy(Frase,1,Length(Frase)-1);
         end;

     EditPesquisa.Text:=Frase;

end;

procedure TFormCons_cidade.bbtn_saidaClick(Sender: TObject);
begin
   formCons_cidade.Close;
end;

procedure TFormCons_cidade.DBGridPesquisaDblClick(Sender: TObject);
begin
    Cod_cidade := QComarcaCodigo.Value;
    Nome := QComarcaNome.Value;
    FormCons_cidade.Close;
end;

end.
