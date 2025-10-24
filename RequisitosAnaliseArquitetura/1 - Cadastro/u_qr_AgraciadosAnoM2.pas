unit u_qr_AgraciadosAnoM2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tqr_agraciadosAnoM2 = class(TQuickRep)
    Qry_AgraciadosAnoM2: TQuery;
    DataSource1: TDataSource;
    Qry_AgraciadosAnoM2CODIGO: TFloatField;
    Qry_AgraciadosAnoM2NOME: TStringField;
    Qry_AgraciadosAnoM2ANO: TFloatField;
    Qry_AgraciadosAnoM2CARGO_PROFISSAO: TStringField;
    Qry_AgraciadosAnoM2IDENTIFICADOR_ENVIADO: TStringField;
    Qry_AgraciadosAnoM2IDENTIFICADOR_INTERNET: TStringField;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
  private

  public

  end;

var
  qr_agraciadosAnoM2: Tqr_agraciadosAnoM2;

implementation

uses DM_SCM;

{$R *.DFM}

end.
