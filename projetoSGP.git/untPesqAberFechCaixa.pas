unit untPesqAberFechCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, RzDBGrid,
  Data.DB, FIBDataSet, pFIBDataSet;

type
  TfrmPesqAberFechCaixa = class(TForm)
    RzDBGrid1: TRzDBGrid;
    fdsMovCaixa: TpFIBDataSet;
    fdsMovCaixaID: TFIBBCDField;
    fdsMovCaixaIDCAIXA: TFIBBCDField;
    fdsMovCaixaIDFILIAL: TFIBBCDField;
    fdsMovCaixaDT_INC: TFIBDateField;
    fdsMovCaixaHR_INC: TFIBTimeField;
    fdsMovCaixaIDUSUARIO: TFIBBCDField;
    fdsMovCaixaCONTROLE: TFIBBCDField;
    fdsMovCaixaTIPO: TFIBStringField;
    fdsMovCaixaMOEDA: TFIBStringField;
    fdsMovCaixaVLR_ENTRADA: TFIBBCDField;
    fdsMovCaixaVLR_VENDA: TFIBBCDField;
    fdsMovCaixaVLR_TOTAL: TFIBBCDField;
    fdsMovCaixaVLR_DESCONTO: TFIBBCDField;
    fdsMovCaixaTROCO: TFIBBCDField;
    fdsMovCaixaENVIADO_WEB: TFIBStringField;
    fdsMovCaixaIDMOVIMENTO: TFIBBCDField;
    fdsMovCaixaHISTORICO: TFIBStringField;
    fdsMovCaixaFILIAL: TFIBStringField;
    fdsMovCaixaNUM_CAIXA: TFIBIntegerField;
    fdsMovCaixaVLR_CHEQUE: TFIBBCDField;
    fdsMovCaixaVLR_CARTAO: TFIBBCDField;
    fdsMovCaixaVLR_NOTA: TFIBBCDField;
    fdsMovCaixaVLR_FINANCEIRA: TFIBBCDField;
    fdsMovCaixaVLR_VALEDESCONTO: TFIBBCDField;
    fdsMovCaixaVLR_TICKET: TFIBBCDField;
    fdsMovCaixaVLR_CREDITO: TFIBBCDField;
    fdsMovCaixaDETALHE: TFIBStringField;
    dsMovCaixa: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqAberFechCaixa: TfrmPesqAberFechCaixa;

implementation

{$R *.dfm}

end.
