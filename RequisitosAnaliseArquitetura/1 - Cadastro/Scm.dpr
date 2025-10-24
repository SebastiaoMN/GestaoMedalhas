program scm;

uses
  Forms,
  Windows,
  Dialogs,
  SysUtils,
  dbTables,
  frm_principal in 'frm_principal.pas' {frm_princi},
  U_Cad_AgraciadosM1 in 'U_Cad_AgraciadosM1.pas' {frmCadAgraciadosM1},
  frm_login in 'frm_login.pas' {frmlogin},
  DM_SCM in 'DM_SCM.pas' {DMSCM: TDataModule},
  U_cons_agraciadosM1 in 'U_cons_agraciadosM1.pas' {Frm_cons_agraciadosM1},
  frm_MinasGerais in 'frm_MinasGerais.pas' {Ffrm_MinasGerais},
  U_disponibiliza_internet_M1 in 'U_disponibiliza_internet_M1.pas' {frmDisponibilizarInternetM1},
  u_disponilibiza_internet_M2 in 'u_disponilibiza_internet_M2.pas' {frmDisponibilizarInternetM2},
  U_lov_agraciados in 'U_lov_agraciados.pas' {frm_lov_agraciados},
  U_Cad_CargoProfissao in 'U_Cad_CargoProfissao.pas' {frmCargoProfissao},
  U_lov_cargoProfissao in 'U_lov_cargoProfissao.pas' {Frm_lov_CargoProfissao},
  u_frm_rel_SemIndicacaoM1 in 'u_frm_rel_SemIndicacaoM1.pas' {frmRelSemIndicacaoM1},
  u_qr_AgraciadosAnoM1 in 'u_qr_AgraciadosAnoM1.pas' {qr_agraciadosAnoM1: TQuickRep},
  u_qr_AgraciadosCargoProfissaoM1 in 'u_qr_AgraciadosCargoProfissaoM1.pas' {qr_AgraciadosCargoProfissaoM1: TQuickRep},
  u_frm_Rel_AgraciadosCargoProfissaoM1 in 'u_frm_Rel_AgraciadosCargoProfissaoM1.pas' {frmRelAgraciadosCargoProfissaoM1},
  u_qr_AgraciadosOrdemM1 in 'u_qr_AgraciadosOrdemM1.pas' {qr_AgraciadosOrdemM1: TQuickRep},
  u_frm_rel_agraciadosM1 in 'u_frm_rel_agraciadosM1.pas' {frmRelAgraciadosM1},
  u_qr_SemIndicacaoM1 in 'u_qr_SemIndicacaoM1.pas' {qr_SemIndicacaoM1: TQuickRep},
  U_Cad_AgraciadosM2 in 'U_Cad_AgraciadosM2.pas' {frmCadAgraciadosM2},
  U_lov_agraciadosM2 in 'U_lov_agraciadosM2.pas' {frm_lov_agraciadosM2},
  U_cons_agraciadosM2 in 'U_cons_agraciadosM2.pas' {Frm_cons_agraciadosM2},
  u_frm_rel_agraciadosM2 in 'u_frm_rel_agraciadosM2.pas' {frmRelAgraciadosM2},
  u_qr_AgraciadosAnoM2 in 'u_qr_AgraciadosAnoM2.pas' {qr_agraciadosAnoM2: TQuickRep},
  u_qr_AgraciadosOrdemM2 in 'u_qr_AgraciadosOrdemM2.pas' {qr_AgraciadosOrdemM2: TQuickRep};

{$R *.RES}
begin
      Application.Initialize;
      Application.Title := 'Sistema de Controle de Medalhas';
      Application.CreateForm(Tfrm_princi, frm_princi);
  Application.CreateForm(TfrmCadAgraciadosM1, frmCadAgraciadosM1);
  Application.CreateForm(Tfrmlogin, frmlogin);
  Application.CreateForm(TDMSCM, DMSCM);
  Application.CreateForm(TfrmDisponibilizarInternetM1, frmDisponibilizarInternetM1);
  Application.CreateForm(TfrmDisponibilizarInternetM2, frmDisponibilizarInternetM2);
  Application.CreateForm(TfrmCargoProfissao, frmCargoProfissao);
  Application.CreateForm(TFrm_cons_agraciadosM1, Frm_cons_agraciadosM1);
  Application.CreateForm(TfrmRelSemIndicacaoM1, frmRelSemIndicacaoM1);
  Application.CreateForm(Tqr_agraciadosAnoM1, qr_agraciadosAnoM1);
  Application.CreateForm(Tqr_AgraciadosCargoProfissaoM1, qr_AgraciadosCargoProfissaoM1);
  Application.CreateForm(TfrmRelAgraciadosCargoProfissaoM1, frmRelAgraciadosCargoProfissaoM1);
  Application.CreateForm(Tqr_AgraciadosOrdemM1, qr_AgraciadosOrdemM1);
  Application.CreateForm(TfrmRelAgraciadosM1, frmRelAgraciadosM1);
  Application.CreateForm(Tqr_SemIndicacaoM1, qr_SemIndicacaoM1);
  Application.CreateForm(TfrmCadAgraciadosM2, frmCadAgraciadosM2);
  Application.CreateForm(TFrm_cons_agraciadosM2, Frm_cons_agraciadosM2);
  Application.CreateForm(TfrmRelAgraciadosM2, frmRelAgraciadosM2);
  Application.CreateForm(Tqr_agraciadosAnoM2, qr_agraciadosAnoM2);
  Application.CreateForm(Tqr_AgraciadosOrdemM2, qr_AgraciadosOrdemM2);
  Application.Run;

end.
