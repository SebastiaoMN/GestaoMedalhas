unit U_lov_justificativa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Buttons, StdCtrls, DBCtrls;

type
  Tfrm_lov_justificativa = class(TForm)
    Label2: TLabel;
    DBLkupComboBoxAno: TDBLookupComboBox;
    Label1: TLabel;
    EditPesquisa: TEdit;
    bbtn_saida: TSpeedButton;
    DBGridPesquisa: TDBGrid;
    procedure SQLConsJustificadas;
    procedure FormShow(Sender: TObject);
    procedure EditPesquisaChange(Sender: TObject);
    procedure DBGridPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridPesquisaDblClick(Sender: TObject);
    procedure DBLkupComboBoxAnoClick(Sender: TObject);
    procedure bbtn_saidaClick(Sender: TObject);
  private
    { Private declarations }
     Frase : String;
  public
    { Public declarations }
     cod_comarca : double;
     ano_comarca : double;
  end;

var
  frm_lov_justificativa: Tfrm_lov_justificativa;

implementation
uses dm_scm;

{$R *.DFM}
procedure Tfrm_lov_justificativa.SQLConsJustificadas;
begin
     With DMSCM do
     begin
        QLovJustificativa.Active:=false;
        QLovJustificativa.sql.Clear;
        QLovJustificativa.sql.Add('SELECT initcap(MUNICIPIO.NOME) COMARCA,');
        QLovJustificativa.sql.Add('       justificativa_comarca.comr_codigo');
        QLovJustificativa.sql.Add('FROM DBATJ.JUSTIFICATIVA_COMARCA justificativa_comarca,DBATJ.MUNICIPIO MUNICIPIO');
        QLovJustificativa.sql.Add('where justificativa_comarca.ANO = '+DBLkupComboBoxAno.Text);
        QLovJustificativa.sql.Add('and justificativa_comarca.comr_codigo = MUNICIPIO.CODIGO');
        QLovJustificativa.sql.Add('and MUNICIPIO.CODIGO = MUNICIPIO.COMR_CODIGO');
        if EditPesquisa.Text<>'' then
        begin
           QLovJustificativa.sql.Add('and (TRANSLATE(UPPER(MUNICIPIO."NOME"),''√¡¿¬ƒ⁄Ÿ‹€…»À ÕÃœŒ”’“÷‘«'',''AAAAAUUUUEEEEIIIIOOOOOC'') LIKE '''+EditPesquisa.Text+'%'')');
        end;
        QLovJustificativa.sql.Add('ORDER BY COMARCA');
        QLovJustificativa.Active:=true;
     end;
end;

procedure Tfrm_lov_justificativa.FormShow(Sender: TObject);
begin
     cod_comarca := 0;
     SQLConsJustificadas;
     DBGridPesquisa.SetFocus;
end;

procedure Tfrm_lov_justificativa.EditPesquisaChange(Sender: TObject);
begin
     SQLConsJustificadas;
end;

procedure Tfrm_lov_justificativa.DBGridPesquisaKeyPress(Sender: TObject;
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

procedure Tfrm_lov_justificativa.DBGridPesquisaDblClick(Sender: TObject);
begin
    cod_comarca := dmscm.QLovJustificativaComr_codigo.Value;
    ano_comarca := DBLkupComboBoxAno.KeyValue;
    Close;
end;

procedure Tfrm_lov_justificativa.DBLkupComboBoxAnoClick(Sender: TObject);
begin
    EditPesquisa.Clear;
    SQLConsJustificadas;
    DBGridPesquisa.SetFocus;
end;

procedure Tfrm_lov_justificativa.bbtn_saidaClick(Sender: TObject);
begin
  close;
end;
 
end.
