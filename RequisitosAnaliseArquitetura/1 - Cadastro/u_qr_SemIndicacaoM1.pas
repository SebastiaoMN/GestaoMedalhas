unit u_qr_SemIndicacaoM1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tqr_SemIndicacaoM1 = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    QRDBText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    Qry_SemIndicacaoM1: TQuery;
    DataSource1: TDataSource;
    Qry_SemIndicacaoM1CODIGO: TFloatField;
    Qry_SemIndicacaoM1COMARCA: TStringField;
    Qry_SemIndicacaoM1ANO: TFloatField;
  private

  public

  end;

var
  qr_SemIndicacaoM1: Tqr_SemIndicacaoM1;

implementation
uses DM_SCM;

{$R *.DFM}

end.
