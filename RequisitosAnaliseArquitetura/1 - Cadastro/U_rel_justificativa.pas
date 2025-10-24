unit U_rel_justificativa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, jpeg;

type
  TRel_justificativa = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRDB_comarca: TQRDBText;
    QRDB_observacao: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRDB_ano: TQRDBText;
    QRImage1: TQRImage;
  private

  public

  end;

var
  Rel_justificativa: TRel_justificativa;

implementation

uses DM_SCM;
{$R *.DFM}

end.
