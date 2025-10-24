unit u_qr_AgraciadosCargoProfissaoM1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tqr_AgraciadosCargoProfissaoM1 = class(TQuickRep)
    Qry_AgraciadosCargoProfissaoM1: TQuery;
    Qry_AgraciadosCargoProfissaoM1CODIGO: TFloatField;
    Qry_AgraciadosCargoProfissaoM1NOME: TStringField;
    Qry_AgraciadosCargoProfissaoM1ANO: TFloatField;
    Qry_AgraciadosCargoProfissaoM1COMARCA: TStringField;
    Qry_AgraciadosCargoProfissaoM1CARGO_PROFISSAO: TStringField;
    DataSource1: TDataSource;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
  private

  public

  end;

var
  qr_AgraciadosCargoProfissaoM1: Tqr_AgraciadosCargoProfissaoM1;

implementation

{$R *.DFM}

end.
