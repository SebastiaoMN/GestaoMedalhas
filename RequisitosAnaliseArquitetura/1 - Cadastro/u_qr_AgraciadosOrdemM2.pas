unit u_qr_AgraciadosOrdemM2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables, jpeg;

type
  Tqr_AgraciadosOrdemM2 = class(TQuickRep)
    Qry_AgraciadosOrdemM2: TQuery;
    Qry_AgraciadosOrdemM2CODIGO: TFloatField;
    Qry_AgraciadosOrdemM2NOME: TStringField;
    Qry_AgraciadosOrdemM2ANO: TFloatField;
    Qry_AgraciadosOrdemM2CARGO_PROFISSAO: TStringField;
    DataSource1: TDataSource;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
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
  qr_AgraciadosOrdemM2: Tqr_AgraciadosOrdemM2;

implementation

{$R *.DFM}

end.
