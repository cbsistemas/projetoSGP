unit untPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, pFIBClientDataSet,
  Datasnap.DBClient, Datasnap.Provider, FIBDataSet, pFIBDataSet, RzButton,
  RzDBEdit, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzPanel, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, RzTabs, RzBckgnd, RzLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls, JvExExtCtrls, JvImage;

type
  TfrmpesqPreVenda = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    imgFlagYellow: TImage;
    imgFlagRed: TImage;
    imgFlagGreen: TImage;
    imgFlagYellow2: TImage;
    imgFlagRed2: TImage;
    imgFlagGreen2: TImage;
    RzBackground1: TRzBackground;
    pgcControl: TRzPageControl;
    tbsVenda: TRzTabSheet;
    gdrVendas: TJvDBGrid;
    tbsItens: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    lblCidade: TRzLabel;
    lblCodigo: TRzLabel;
    lblDtInc: TRzLabel;
    RzLabel1: TRzLabel;
    lblVendedor: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel2: TRzLabel;
    edtCliente: TRzEdit;
    edtPrefixo: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtID: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    edtIDVendedor: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    gdrVendaItens: TJvDBGrid;
    RzPanel2: TRzPanel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edtQtnItem: TRzDBEdit;
    edtPrecCusto: TRzDBEdit;
    edtPreVenda: TRzDBEdit;
    btnItemGravar: TRzBitBtn;
    btnItemCancelar: TRzBitBtn;
    btnItemAlterar: TRzBitBtn;
    edtItemNome: TRzDBEdit;
    edtItemDesconto: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    btnExcluir: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnGravar: TRzBitBtn;
    fdsPreVenda: TpFIBDataSet;
    fdsPreVendaID: TFIBBCDField;
    fdsPreVendaIDFILIAL: TFIBBCDField;
    fdsPreVendaDT_INC: TFIBDateField;
    fdsPreVendaSTATUS: TFIBStringField;
    fdsPreVendaIDCLIENTE: TFIBBCDField;
    fdsPreVendaIDVENDEDOR: TFIBBCDField;
    fdsPreVendaIDFORMA_PAG: TFIBBCDField;
    fdsPreVendaVLR_TOTITEM: TFIBBCDField;
    fdsPreVendaVLR_DESCONTO: TFIBBCDField;
    fdsPreVendaVLR_TOTAL: TFIBBCDField;
    fdsPreVendaVLR_VENDA: TFIBBCDField;
    fdsPreVendaPREFIXO: TFIBStringField;
    fdsPreVendaVENDEDOR: TFIBStringField;
    fdsPreVendaCLIENTE: TFIBStringField;
    fdsPreVendaFORMA_PAGAMENTO: TFIBStringField;
    fdsPreVendaNUM_PROPIO: TFIBIntegerField;
    dsPreVenda: TDataSource;
    fdsPreVendaItens: TpFIBDataSet;
    dsPreVendaItens: TDataSource;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    dspPreVendaItens: TpFIBDataSetProvider;
    cdsPreVendaItens: TpFIBClientDataSet;
    cdsPreVendaItensIDPREVENDA: TpFIBClientBCDField;
    cdsPreVendaItensITEM: TSmallintField;
    cdsPreVendaItensIDPROD_ITEM: TpFIBClientBCDField;
    cdsPreVendaItensDT_INC: TDateField;
    cdsPreVendaItensQTN: TpFIBClientBCDField;
    cdsPreVendaItensVLR_UNITARIO: TpFIBClientBCDField;
    cdsPreVendaItensVLR_DESC: TpFIBClientBCDField;
    cdsPreVendaItensVLR_TOTAL: TpFIBClientBCDField;
    cdsPreVendaItensIDFILIAL: TpFIBClientBCDField;
    cdsPreVendaItensNOME: TStringField;
    cdsPreVendaItensCOD_FABRICA: TStringField;
    cdsPreVendaItensSEL: TStringField;
    cdsPreVendaItensCONFIRMADO: TStringField;
    cdsPreVendaItensPREC_TAB1: TpFIBClientBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpesqPreVenda: TfrmpesqPreVenda;

implementation

{$R *.dfm}

end.
