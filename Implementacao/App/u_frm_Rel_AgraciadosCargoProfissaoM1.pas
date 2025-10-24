unit u_frm_Rel_AgraciadosCargoProfissaoM1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls;

type
  TfrmRelAgraciadosCargoProfissaoM1 = class(TForm)
    GroupBox1: TGroupBox;
    BtnRelAgraciadosCargoProfM1: TBitBtn;
    BtnSair: TSpeedButton;
    DBCargoProfissao: TDBLookupComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRelAgraciadosCargoProfM1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAgraciadosCargoProfissaoM1: TfrmRelAgraciadosCargoProfissaoM1;

implementation

uses DM_SCM, u_qr_AgraciadosCargoProfissaoM1;

{$R *.dfm}

procedure TfrmRelAgraciadosCargoProfissaoM1.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelAgraciadosCargoProfissaoM1.FormShow(Sender: TObject);
begin
     DBCargoProfissao.Enabled := false;
     dmscm.QCargoProfissao.Active := true;
     DBCargoProfissao.Enabled := true;
end;

procedure TfrmRelAgraciadosCargoProfissaoM1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmscm.QCargoProfissao.Active := false;
end;

procedure TfrmRelAgraciadosCargoProfissaoM1.BtnRelAgraciadosCargoProfM1Click(
  Sender: TObject);
begin
  qr_AgraciadosCargoProfissaoM1.Qry_AgraciadosCargoProfissaoM1.Active := false;

  {Como o cargo/Profissão não é obrigatório, permitir a geração de relatórios com agraciados
  sem o cargo/profissão informado.}
  
  if dbCargoProfissao.text = '' then
    qr_AgraciadosCargoProfissaoM1.Qry_AgraciadosCargoProfissaoM1.ParamByName('p_caprcodigo').AsString :=  '0'
  else
    qr_AgraciadosCargoProfissaoM1.Qry_AgraciadosCargoProfissaoM1.ParamByName('p_caprcodigo').AsString :=  dbCargoProfissao.KeyValue;
    
  qr_AgraciadosCargoProfissaoM1.Qry_AgraciadosCargoProfissaoM1.Active := true;  
  qr_AgraciadosCargoProfissaoM1.Preview;  
end;

end.
