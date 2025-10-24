unit U_cons_agraciados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Buttons;

type
  TFrm_cons_agraciados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit_ano: TEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    btn_saida: TSpeedButton;
    bbtn_rel_agraciados: TSpeedButton;
    RG_SITUACAO: TRadioGroup;
    bbtn_rel_situacao: TSpeedButton;
    procedure SQL_Cons_CPF;
    procedure btn_saidaClick(Sender: TObject);
    procedure Edit_anoExit(Sender: TObject);
    procedure Edit_anoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RG_SITUACAOClick(Sender: TObject);
    procedure bbtn_rel_agraciadosClick(Sender: TObject);
    procedure bbtn_rel_situacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cons_agraciados: TFrm_cons_agraciados;

implementation

uses
   dm_scm, U_cons_justificativa, U_rel_agraciados;
{$R *.DFM}

procedure TFrm_cons_agraciados.SQL_Cons_CPF;
begin
     with DMSCM, frm_cons_agraciados do
        begin
           QConsAgraciados2.Active := false;
           QConsAgraciados2.SQL.Clear;
           QConsAgraciados2.SQL.Add('SELECT agraciados.CPF,');
           QConsAgraciados2.SQL.Add('       agraciados.ANO,');
           QConsAgraciados2.SQL.Add('       Initcap(municipio.nome) comarca,');
           QConsAgraciados2.SQL.Add('       initcap(agraciados.NOME) nome,');
           QConsAgraciados2.SQL.Add('       decode(agraciados.IDENTIFICADOR_ENVIADO,1,''Sim'',0,''Não'') enviado');
           QConsAgraciados2.SQL.Add('FROM DBATJ.AGRACIADOS agraciados,');
           QConsAgraciados2.SQL.Add('DBATJ.MUNICIPIO municipio');
           QConsAgraciados2.SQL.Add('where agraciados.ANO = '+Edit_ano.Text);
           QConsAgraciados2.SQL.Add('      and municipio.codigo =  municipio.comr_codigo');
           QConsAgraciados2.SQL.Add('      and municipio.codigo =  agraciados.comr_codigo');
           case Rg_situacao.ItemIndex of
              0: QConsAgraciados2.SQL.Add('      and IDENTIFICADOR_ENVIADO = 0');
              1: QConsAgraciados2.SQL.Add('      and IDENTIFICADOR_ENVIADO = 1');
           end;
           QConsAgraciados2.SQL.Add('order by municipio.nome, agraciados.nome');
           QConsAgraciados2.Active := true;
           if QConsAgraciados2.IsEmpty then
              begin
                messageDlg('Nenhum registro encontrado neste ano.',mtwarning,[mbok],0);
                Frm_cons_agraciados.edit_ano.SetFocus;
                bbtn_rel_situacao.Enabled := false;
                bbtn_rel_agraciados.Enabled := false;
              end
           else
           begin
              bbtn_rel_situacao.Enabled := true;
              bbtn_rel_agraciados.Enabled := true;
           end;
        end;
end;

procedure TFrm_cons_agraciados.btn_saidaClick(Sender: TObject);
begin
   frm_cons_agraciados.close;
end;

procedure TFrm_cons_agraciados.Edit_anoExit(Sender: TObject);
begin
    if Frm_cons_agraciados.Edit_ano.Text <> '' then
    begin
        SQL_Cons_CPF;
        RG_situacao.ItemIndex := 2;
    end;
end;

procedure TFrm_cons_agraciados.Edit_anoKeyPress(Sender: TObject;
  var Key: Char);
begin
    {habilita a tecla <enter> no KeyPress de qualquer componente}
    if Key = #13 then
    begin
     Key := #0;
     Perform (CM_DialogKey, VK_TAB,0);
    end;
end;

procedure TFrm_cons_agraciados.FormShow(Sender: TObject);
begin
    dmscm.QConsAgraciados2.Active := false;
    bbtn_rel_situacao.Enabled := false;
    bbtn_rel_agraciados.Enabled := false;
end;

procedure TFrm_cons_agraciados.RG_SITUACAOClick(Sender: TObject);
begin
    SQL_Cons_CPF;
end;

procedure TFrm_cons_agraciados.bbtn_rel_agraciadosClick(Sender: TObject);
begin
   RG_situacao.ItemIndex := 2;
   SQL_Cons_CPF;
   rel_agraciados.QR_situacao.Caption := '';
   rel_agraciados.Preview;
end;
procedure TFrm_cons_agraciados.bbtn_rel_situacaoClick(Sender: TObject);
begin
   case Rg_situacao.ItemIndex of
        0: rel_agraciados.QR_situacao.Caption := 'Somente as medalhas não enviadas.';
        1: rel_agraciados.QR_situacao.Caption := 'Somente as medalhas enviadas.';
        2: rel_agraciados.QR_situacao.Caption := '';
   end;
   rel_agraciados.Preview;
end;

end.


