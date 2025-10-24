unit u_qr_AgraciadosOrdemM1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tqr_AgraciadosOrdemM1 = class(TQuickRep)
    Qry_AgraciadosOrdemM1: TQuery;
    Qry_AgraciadosOrdemM1CODIGO: TFloatField;
    Qry_AgraciadosOrdemM1NOME: TStringField;
    Qry_AgraciadosOrdemM1ANO: TFloatField;
    Qry_AgraciadosOrdemM1COMARCA: TStringField;
    Qry_AgraciadosOrdemM1CARGO_PROFISSAO: TStringField;
    DataSource1: TDataSource;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
  private

  public

  end;

var
  qr_AgraciadosOrdemM1: Tqr_AgraciadosOrdemM1;

implementation

{$R *.DFM}

end.
