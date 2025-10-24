unit U_rel_agraciados;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, jpeg;

type
  TRel_agraciados = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    Ano: TQRDBText;
    QRImage1: TQRImage;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape1: TQRShape;
    QR_situacao: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  Rel_agraciados: TRel_agraciados;

implementation

USES DM_SCM;
{$R *.DFM}

procedure TRel_agraciados.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 Rel_agraciados.font.name:='Draft 10Cpi';
end;

end.
