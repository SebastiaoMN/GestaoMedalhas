unit u_qr_AgraciadosAnoM1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tqr_agraciadosAnoM1 = class(TQuickRep)
    Qry_AgraciadosAnoM1: TQuery;
    DataSource1: TDataSource;
    Qry_AgraciadosAnoM1CODIGO: TFloatField;
    Qry_AgraciadosAnoM1NOME: TStringField;
    Qry_AgraciadosAnoM1ANO: TFloatField;
    Qry_AgraciadosAnoM1COMARCA: TStringField;
    Qry_AgraciadosAnoM1CARGO_PROFISSAO: TStringField;
    Qry_AgraciadosAnoM1IDENTIFICADOR_ENVIADO: TStringField;
    Qry_AgraciadosAnoM1IDENTIFICADOR_INTERNET: TStringField;
    Qry_AgraciadosAnoM1IDENTIFICADOR_IN_MEMORIAN: TStringField;
    Qry_AgraciadosAnoM1IDENTIFICADOR_HOMONIMO: TStringField;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
  qr_agraciadosAnoM1: Tqr_agraciadosAnoM1;

implementation

uses DM_SCM;

{$R *.DFM}

end.
