unit U_cons_justificativa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrm_cons_justificativa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    btn_saida: TSpeedButton;
    bbtn_imprime_justificativa: TSpeedButton;
    Edit_ano: TEdit;
    DBGrid1: TDBGrid;
    procedure SQL_Cons_justificativa;
    procedure btn_saidaClick(Sender: TObject);
    procedure Edit_anoExit(Sender: TObject);
    procedure Edit_anoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bbtn_imprime_justificativaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cons_justificativa: TFrm_cons_justificativa;

implementation

uses dm_scm, U_rel_justificativa;
{$R *.DFM}

procedure TFrm_cons_justificativa.btn_saidaClick(Sender: TObject);
begin
   frm_cons_justificativa.close;
end;

procedure TFrm_cons_justificativa.Edit_anoExit(Sender: TObject);
begin
     if Frm_cons_justificativa.Edit_ano.Text <> '' then
        SQL_CONS_JUSTIFICATIVA;
end;

procedure TFrm_cons_justificativa.SQL_CONS_JUSTIFICATIVA;
begin
     with DMSCM do
        begin
            QConsJust2.active:=false;
            QConsJust2.ParamByName('p_ano').value := Frm_cons_justificativa.edit_ano.text;
            QConsJust2.Active:=true;
            if QConsJust2.IsEmpty then
            begin
                messageDlg('Nenhum registro encontrado neste ano.',mtwarning,[mbok],0);
                Frm_cons_justificativa.edit_ano.SetFocus;
                Frm_cons_justificativa.bbtn_imprime_justificativa.Enabled := false;
            end
            else
              Frm_cons_justificativa.bbtn_imprime_justificativa.Enabled := true;
        end;
end;

procedure TFrm_cons_justificativa.Edit_anoKeyPress(Sender: TObject;
  var Key: Char);
begin
    {habilita a tecla <enter> no KeyPress de qualquer componente}
    if Key = #13 then
    begin
     Key := #0;
     Perform (CM_DialogKey, VK_TAB,0);
    end;
end;

procedure TFrm_cons_justificativa.FormShow(Sender: TObject);
begin
   dmscm.QConsJust2.Active := false;
   Frm_cons_justificativa.bbtn_imprime_justificativa.Enabled := false;
end;

procedure TFrm_cons_justificativa.bbtn_imprime_justificativaClick(Sender: TObject);
begin
   rel_justificativa.preview;
end;

end.
