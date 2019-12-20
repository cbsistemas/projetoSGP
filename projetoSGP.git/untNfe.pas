unit untNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,ShellApi,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExExtCtrls, JvImage, RzPanel, RzBckgnd,
  dxGDIPlusClasses, Vcl.ImgList, PngImageList, RzSplit, JvExStdCtrls, JvButton,
  JvCtrls, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, JvCheckBox, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ComCtrls, RzTreeVw, RzDBEdit, RzTabs, FIBDatabase,
  pFIBDatabase, Data.DB, FIBDataSet, pFIBDataSet, Datasnap.DBClient,
  pFIBClientDataSet, Datasnap.Provider, RzCmboBx, RzDBCmbo, FIBQuery, pFIBQuery,
  Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.Buttons, System.Math,
  JvDBDatePickerEdit, Vcl.DBCtrls, frxClass, frxDBSet, RzRadGrp, DateUtils,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, JvActionsEngine,
  JvDBActions, RzRadChk;

type
  TfrmNfe = class(TForm)
    RzPanel1: TRzPanel;
    lblTituloCliente: TRzLabel;
    lblTituloTotal: TRzLabel;
    lblTotal: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    RzBackground1: TRzBackground;
    JvImage1: TJvImage;
    RzSplitter1: TRzSplitter;
    btnIncluir: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    NFe: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnGravar: TRzBitBtn;
    PngImageList2: TPngImageList;
    RzPanel3: TRzPanel;
    pnlNumVenda: TRzGroupBox;
    edtPesqNumVenda: TRzEdit;
    chkNumVenda: TJvCheckBox;
    pnlPeriodo: TRzGroupBox;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    chkPeriodo: TJvCheckBox;
    pnlCliente: TRzGroupBox;
    edtPesqCliente: TRzEdit;
    chkCliente: TJvCheckBox;
    btnPesquisar: TJvImgBtn;
    PngImageList1: TPngImageList;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    tbsForm: TRzTabSheet;
    fdsNFe_Item: TpFIBDataSet;
    transNFe: TpFIBTransaction;
    dspNFe_Item: TpFIBDataSetProvider;
    cdsNFe_Item: TpFIBClientDataSet;
    dsNFe: TDataSource;
    dsNFe_Item: TDataSource;
    RzGroupBox1: TRzGroupBox;
    lblCidade: TRzLabel;
    lblDtInc: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel19: TRzLabel;
    btnPesqCliente: TRzBitBtn;
    edtDt_Inc: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    edtFrete: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    edtBaseICMS: TRzDBEdit;
    cbxTipoFrete: TRzDBComboBox;
    edtID: TRzDBEdit;
    RzLabel1: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel9: TRzLabel;
    gbxItens: TRzGroupBox;
    gdrItens: TJvDBGrid;
    pnlLancItens: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    edtQtnItem: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    edtItemDesconto: TRzDBEdit;
    btnItemGravar: TRzBitBtn;
    btnItemCancelar: TRzBitBtn;
    btnItemExcluir: TRzBitBtn;
    btnItemAlterar: TRzBitBtn;
    btnItensIncluir: TRzBitBtn;
    btnIncItensVenda: TRzBitBtn;
    RzDBEdit4: TRzDBEdit;
    edtItemCodigo: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    qrySql: TpFIBQuery;
    ActionList1: TActionList;
    nfeGerar: TAction;
    nfeValida: TAction;
    nfeEnviar: TAction;
    nfeStatusWebServer: TAction;
    nfeEmitir: TAction;
    nfeImprimir: TAction;
    nfeCancelar: TAction;
    nfeInutilizarNum: TAction;
    ppmNfe: TPopupMenu;
    EmitirNotaFiscalEletrnica1: TMenuItem;
    ImprimirDANFE1: TMenuItem;
    InutilizarNumerao1: TMenuItem;
    nfeCancelar1: TMenuItem;
    fdsNF_Cancelada: TpFIBDataSet;
    fdsNF_CanceladaID: TFIBBCDField;
    fdsNF_CanceladaIDFILIAL: TFIBBCDField;
    fdsNF_CanceladaDT_INC: TFIBDateField;
    fdsNF_CanceladaIDCLIENTE: TFIBBCDField;
    fdsNF_CanceladaDT_EMISSAO: TFIBDateField;
    fdsNF_CanceladaVLR_TOTAL: TFIBBCDField;
    fdsNF_CanceladaCHAVE_CONSULTA_NF: TFIBStringField;
    fdsNF_CanceladaNUMERO_PROTOCOLO_NF: TFIBStringField;
    fdsNF_CanceladaCHAVE_CONSULTA_CANC: TFIBStringField;
    fdsNF_CanceladaNUMERO_PROTOCOLO_CANC: TFIBStringField;
    fdsNF_CanceladaENVIADO_WEB: TFIBStringField;
    cdsNF_Devolvidas: TpFIBClientDataSet;
    cdsNF_DevolvidasID: TpFIBClientBCDField;
    cdsNF_DevolvidasIDFILIAL: TpFIBClientBCDField;
    cdsNF_DevolvidasDT_INC: TDateField;
    cdsNF_DevolvidasCHAVE_NF_COMPRA: TStringField;
    dspNF_Devolvidas: TpFIBDataSetProvider;
    dsNF_Devolvidas: TDataSource;
    fdsNF_Devolvidas: TpFIBDataSet;
    fdsNF_DevolvidasID: TFIBBCDField;
    fdsNF_DevolvidasIDFILIAL: TFIBBCDField;
    fdsNF_DevolvidasDT_INC: TFIBDateField;
    fdsNF_DevolvidasCHAVE_NF_COMPRA: TFIBStringField;
    fdsNF_DevolvidasIDNFE: TFIBBCDField;
    cdsNF_DevolvidasIDNFE: TpFIBClientBCDField;
    edtCFOP: TRzDBEdit;
    RzLabel6: TRzLabel;
    qryComand: TpFIBQuery;
    BitBtn1: TBitBtn;
    btnInfoAdicional: TRzBitBtn;
    RzLabel13: TRzLabel;
    edtBcIcms: TRzDBEdit;
    edtVlrIcms: TRzDBEdit;
    RzLabel14: TRzLabel;
    edtAliqIcms: TRzDBEdit;
    RzLabel16: TRzLabel;
    edtVlrIPI: TRzDBEdit;
    RzLabel17: TRzLabel;
    edtAliqIPI: TRzDBEdit;
    RzLabel22: TRzLabel;
    edtCstCsosn: TRzDBEdit;
    RzLabel26: TRzLabel;
    fdsNF_DevolvidasNOTA_NUM: TFIBStringField;
    cdsNF_DevolvidasNOTA_NUM: TStringField;
    nfeCartaCorrecao: TAction;
    CartadeCorreo1: TMenuItem;
    JvDBDatePickerEdit1: TJvDBDatePickerEdit;
    fdsNF_CanceladaIDNOTA: TFIBBCDField;
    fdsNF_CanceladaMODELO_NOTA: TFIBStringField;
    btnInformacoesAdicionais: TRzBitBtn;
    btnNaturezaOperacao: TRzBitBtn;
    fdsNatOperacao: TpFIBDataSet;
    cbxNatOperacao: TRzDBLookupComboBox;
    dsNatOperacao: TDataSource;
    fdsNatOperacaoID: TFIBBCDField;
    fdsNatOperacaoDT_INC: TFIBDateField;
    fdsNatOperacaoDT_ALT: TFIBDateField;
    fdsNatOperacaoSTATUS: TFIBStringField;
    fdsNatOperacaoOPERACAO: TFIBStringField;
    fdsNatOperacaoDESCRICAO: TFIBMemoField;
    fdsNatOperacaoAREA_CIRCULACAO: TFIBStringField;
    fdsNatOperacaoTIPO_MOVIMENTACAO: TFIBStringField;
    fdsNatOperacaoCAT_SAIDA_CFOP: TFIBStringField;
    fdsNatOperacaoCFOP_PADRAO: TFIBStringField;
    fdsNatOperacaoMOVIMENTO_ESTOQUE: TFIBStringField;
    fdsNFe: TpFIBDataSet;
    fdsNFeID: TFIBBCDField;
    fdsNFeIDFILIAL: TFIBBCDField;
    fdsNFeDT_INC: TFIBDateField;
    fdsNFeDT_ALT: TFIBDateField;
    fdsNFeDT_EMISSAO: TFIBDateField;
    fdsNFeSTATUS: TFIBStringField;
    fdsNFeIDCLIENTE: TFIBBCDField;
    fdsNFeVLR_TOTITEM: TFIBBCDField;
    fdsNFeVLR_DESCONTO: TFIBBCDField;
    fdsNFeVLR_FRETE: TFIBBCDField;
    fdsNFeVLR_TOTAL: TFIBBCDField;
    fdsNFePESO: TFIBBCDField;
    fdsNFeSUBTRIBUTARIA: TFIBBCDField;
    fdsNFeENVIADO_WEB: TFIBStringField;
    fdsNFeCODIGO_NFE: TFIBIntegerField;
    fdsNFeCHAVE_CONSULTA: TFIBStringField;
    fdsNFeNUMERO_PROTOCOLO: TFIBStringField;
    fdsNFeOBS: TFIBStringField;
    fdsNFeCHAVE_NF_DEVOLUCAO: TFIBStringField;
    fdsNFeIDTRANSPORTADORA: TFIBBCDField;
    fdsNFeIDVEICULO: TFIBBCDField;
    fdsNFeTRANSP_QTN_VOLUME: TFIBIntegerField;
    fdsNFeTRANSP_ESPECIE: TFIBStringField;
    fdsNFeTRANSP_MARCA: TFIBStringField;
    fdsNFeTRANSP_NUMERACAO: TFIBIntegerField;
    fdsNFeCLIENTE: TFIBStringField;
    fdsNFeCONTATO: TFIBStringField;
    fdsNFeRAZAOSOCIAL: TFIBStringField;
    fdsNFeEMAIL: TFIBStringField;
    fdsNFeENDERECO: TFIBStringField;
    fdsNFeNUMERO: TFIBStringField;
    fdsNFeCOMPLEMENTO: TFIBStringField;
    fdsNFeCEP: TFIBStringField;
    fdsNFeBAIRRO: TFIBStringField;
    fdsNFeREFERENCIA: TFIBStringField;
    fdsNFeTELEFONE: TFIBStringField;
    fdsNFeCELULAR: TFIBStringField;
    fdsNFeKM_TOTAL: TFIBSmallIntField;
    fdsNFeUF: TFIBStringField;
    fdsNFeCIDADE: TFIBStringField;
    fdsNFeCIDADE_CODIGO: TFIBBCDField;
    fdsNFeDOCUMENTO: TFIBStringField;
    fdsNFeIE: TFIBStringField;
    fdsNFeICMS_VBC: TFIBBCDField;
    fdsNFeICMS_VLR: TFIBBCDField;
    fdsNFeDT_SAIDA: TFIBDateField;
    fdsNFeTRANSP_CNPJ_CPF: TFIBStringField;
    fdsNFeTRANSP_NOME: TFIBStringField;
    fdsNFeTRANSP_IE: TFIBStringField;
    fdsNFeTRANSP_ENDERECO: TFIBStringField;
    fdsNFeTRANSP_CIDADE: TFIBStringField;
    fdsNFeTRANSP_UF: TFIBStringField;
    fdsNFeVEIC_PLACA: TFIBStringField;
    fdsNFeVEIC_UF: TFIBStringField;
    fdsNFeTIPO: TFIBStringField;
    fdsNFeINFO_ADICIONAL: TFIBMemoField;
    fdsNFeNATUREZA_OPERACAO: TFIBStringField;
    RzBitBtn1: TRzBitBtn;
    edtValorICMS: TRzDBEdit;
    RzLabel8: TRzLabel;
    fdsNFeICMS_ST_VBC: TFIBBCDField;
    fdsNFeICMS_ST_VLR: TFIBBCDField;
    RzDBEdit3: TRzDBEdit;
    RzLabel27: TRzLabel;
    RzDBEdit6: TRzDBEdit;
    RzLabel28: TRzLabel;
    edtOutrasDespesas: TRzDBEdit;
    RzLabel29: TRzLabel;
    fdsNFeOUTRAS_DESPESAS: TFIBBCDField;
    rgbStatus: TRzRadioGroup;
    fdsCliente: TpFIBDataSet;
    fdsClienteID: TFIBBCDField;
    fdsClienteNOME: TFIBStringField;
    gdrNotas: TJvDBGrid;
    fdsNFeINDICADOR_IE: TFIBStringField;
    fdsNF_Inutilizada: TpFIBDataSet;
    fdsNF_InutilizadaID: TFIBBCDField;
    fdsNF_InutilizadaIDFILIAL: TFIBBCDField;
    fdsNF_InutilizadaDT_INC: TFIBDateField;
    fdsNF_InutilizadaIDNOTA: TFIBBCDField;
    fdsNF_InutilizadaIDCLIENTE: TFIBBCDField;
    fdsNF_InutilizadaDT_EMISSAO: TFIBDateField;
    fdsNF_InutilizadaCODIGO_NF: TFIBIntegerField;
    fdsNF_InutilizadaCHAVE_NF: TFIBStringField;
    fdsNF_InutilizadaPROTOCOLO_IN: TFIBStringField;
    fdsNF_InutilizadaENVIADO_WEB: TFIBStringField;
    fdsNF_InutilizadaMODELO_NOTA: TFIBStringField;
    fdsNF_InutilizadaVLR_TOTAL: TFIBBCDField;
    Action2: TAction;
    RzLabel4: TRzLabel;
    edtDesconto: TRzDBEdit;
    fdsNFeIDFORMA_PAG: TFIBBCDField;
    fdsNFeTOT_PARCELA: TFIBIntegerField;
    fdsNFeORDEM: TFIBStringField;
    cbxFormaPagamento: TRzDBComboBox;
    fdsContReceberCheque: TpFIBDataSet;
    fdsContReceberChequeID: TFIBBCDField;
    fdsContReceberChequeIDFILIAL: TFIBBCDField;
    fdsContReceberChequeIDRECEBER_ITEM: TFIBBCDField;
    fdsContReceberChequeIDBANCO: TFIBBCDField;
    fdsContReceberChequeAGENCIA: TFIBStringField;
    fdsContReceberChequeCONTA: TFIBStringField;
    fdsContReceberChequeNUM_CHEQUE: TFIBStringField;
    fdsContReceberChequeDT_EMISSAO: TFIBDateField;
    fdsContReceberChequeEMITENTE: TFIBStringField;
    fdsContReceberChequeVALOR: TFIBBCDField;
    fdsContReceberChequeDT_VENCIMENTO: TFIBDateField;
    fdsContReceberChequeENVIADO_WEB: TFIBStringField;
    edtClienteCodigo: TRzEdit;
    btnPesqClientes: TRzBitBtn;
    fdsNFeIDPEDIDO: TFIBIntegerField;
    fdsNFeORIGEM_PEDIDO_VENDA: TFIBStringField;
    fdsNFeTIPO_FRETE: TFIBIntegerField;
    EmitirNotaFiscalAvulsa1: TMenuItem;
    nfeEmitirNFAe: TAction;
    Label1: TLabel;
    Label2: TLabel;
    btnDadosEntrega: TRzBitBtn;
    BalloonHint1: TBalloonHint;
    fdsNFeENTREG_CNPJ_CPF: TFIBStringField;
    fdsNFeENTREG_ENDERECO: TFIBStringField;
    fdsNFeENTREG_NUMERO: TFIBStringField;
    fdsNFeENTREG_COMPLEMENTO: TFIBStringField;
    fdsNFeENTREG_BAIRRO: TFIBStringField;
    fdsNFeENTREG_CIDADE_CODIGO: TFIBIntegerField;
    fdsNFeENTREG_CIDADE: TFIBStringField;
    fdsNFeENTREG_UF: TFIBStringField;
    fdsNFeENTREG_TELEFONE: TFIBStringField;
    fdsNFeENTREG_CEP: TFIBStringField;
    RzDBEdit7: TRzDBEdit;
    RzLabel30: TRzLabel;
    fdsNFeICMS_REDUCAO_BC: TFIBBCDField;
    PngImageList3: TPngImageList;
    RzDBEdit10: TRzDBEdit;
    RzLabel31: TRzLabel;
    fdsNFeORIGEM_PEDIDO: TFIBStringField;
    fdsNFeICMS_VLR_IPI: TFIBBCDField;
    fdsNFeICMS_ALQ_IPI: TFIBBCDField;
    fdsNFe_ItemID: TFIBBCDField;
    fdsNFe_ItemIDFILIAL: TFIBBCDField;
    fdsNFe_ItemIDNFE: TFIBBCDField;
    fdsNFe_ItemITEM: TFIBSmallIntField;
    fdsNFe_ItemIDPROD_ITEM: TFIBBCDField;
    fdsNFe_ItemDT_INC: TFIBDateField;
    fdsNFe_ItemDT_ALT: TFIBDateField;
    fdsNFe_ItemQTN: TFIBBCDField;
    fdsNFe_ItemVLR_UNITARIO: TFIBBCDField;
    fdsNFe_ItemVLR_DESCONTO: TFIBBCDField;
    fdsNFe_ItemVLR_TOTAL: TFIBBCDField;
    fdsNFe_ItemPESO: TFIBBCDField;
    fdsNFe_ItemENVIADO_WEB: TFIBStringField;
    fdsNFe_ItemORIGEM_VENDA_PEDIDO: TFIBStringField;
    fdsNFe_ItemNUM_VENDA_PEDIDO: TFIBBCDField;
    fdsNFe_ItemCFOP: TFIBStringField;
    fdsNFe_ItemCST_CSOSN: TFIBStringField;
    fdsNFe_ItemINFO_ADICIONAL: TFIBStringField;
    fdsNFe_ItemICMS_BCALC: TFIBBCDField;
    fdsNFe_ItemICMS_VLR: TFIBBCDField;
    fdsNFe_ItemICMS_ALIQIPI: TFIBBCDField;
    fdsNFe_ItemICMS_PERCENTL_DEVOL: TFIBBCDField;
    fdsNFe_ItemICMS_VIPI: TFIBBCDField;
    fdsNFe_ItemICMS_ALIQ: TFIBBCDField;
    fdsNFe_ItemICMS_ST_VLR: TFIBBCDField;
    fdsNFe_ItemICMS_ST_VBC: TFIBBCDField;
    fdsNFe_ItemICMS_REDUCAO_BC: TFIBBCDField;
    fdsNFe_ItemVLR_FRETE: TFIBBCDField;
    fdsNFe_ItemVLR_OUTRAS_DESPESAS: TFIBBCDField;
    fdsNFe_ItemPRECO_CUSTO: TFIBBCDField;
    fdsNFe_ItemDT_EMISSAO: TFIBDateField;
    fdsNFe_ItemPRODUTO: TFIBStringField;
    fdsNFe_ItemCOD_FABRICA: TFIBStringField;
    fdsNFe_ItemCOD_FABRICANTE: TFIBStringField;
    fdsNFe_ItemUNIDADE: TFIBStringField;
    fdsNFe_ItemNCM: TFIBStringField;
    fdsNFe_ItemCEST: TFIBStringField;
    fdsNFe_ItemIBPT_NACIONA_FEDERAL: TFIBBCDField;
    fdsNFe_ItemINFO_ADICIONAL1: TFIBStringField;
    cdsNFe_ItemID: TpFIBClientBCDField;
    cdsNFe_ItemIDFILIAL: TpFIBClientBCDField;
    cdsNFe_ItemIDNFE: TpFIBClientBCDField;
    cdsNFe_ItemITEM: TSmallintField;
    cdsNFe_ItemIDPROD_ITEM: TpFIBClientBCDField;
    cdsNFe_ItemDT_INC: TDateField;
    cdsNFe_ItemDT_ALT: TDateField;
    cdsNFe_ItemQTN: TpFIBClientBCDField;
    cdsNFe_ItemVLR_UNITARIO: TpFIBClientBCDField;
    cdsNFe_ItemVLR_DESCONTO: TpFIBClientBCDField;
    cdsNFe_ItemVLR_TOTAL: TpFIBClientBCDField;
    cdsNFe_ItemPESO: TpFIBClientBCDField;
    cdsNFe_ItemENVIADO_WEB: TStringField;
    cdsNFe_ItemORIGEM_VENDA_PEDIDO: TStringField;
    cdsNFe_ItemNUM_VENDA_PEDIDO: TpFIBClientBCDField;
    cdsNFe_ItemCFOP: TStringField;
    cdsNFe_ItemCST_CSOSN: TStringField;
    cdsNFe_ItemINFO_ADICIONAL: TStringField;
    cdsNFe_ItemICMS_BCALC: TpFIBClientBCDField;
    cdsNFe_ItemICMS_VLR: TpFIBClientBCDField;
    cdsNFe_ItemICMS_ALIQIPI: TpFIBClientBCDField;
    cdsNFe_ItemICMS_PERCENTL_DEVOL: TpFIBClientBCDField;
    cdsNFe_ItemICMS_VIPI: TpFIBClientBCDField;
    cdsNFe_ItemICMS_ALIQ: TpFIBClientBCDField;
    cdsNFe_ItemICMS_ST_VLR: TpFIBClientBCDField;
    cdsNFe_ItemICMS_ST_VBC: TpFIBClientBCDField;
    cdsNFe_ItemICMS_REDUCAO_BC: TpFIBClientBCDField;
    cdsNFe_ItemVLR_FRETE: TpFIBClientBCDField;
    cdsNFe_ItemVLR_OUTRAS_DESPESAS: TpFIBClientBCDField;
    cdsNFe_ItemPRECO_CUSTO: TpFIBClientBCDField;
    cdsNFe_ItemDT_EMISSAO: TDateField;
    cdsNFe_ItemPRODUTO: TStringField;
    cdsNFe_ItemCOD_FABRICA: TStringField;
    cdsNFe_ItemCOD_FABRICANTE: TStringField;
    cdsNFe_ItemUNIDADE: TStringField;
    cdsNFe_ItemNCM: TStringField;
    cdsNFe_ItemCEST: TStringField;
    cdsNFe_ItemIBPT_NACIONA_FEDERAL: TpFIBClientBCDField;
    cdsNFe_ItemINFO_ADICIONAL1: TStringField;
    RzLabel32: TRzLabel;
    RzDBEdit11: TRzDBEdit;
    fdsNFeNUM_ALEATORIO_NFE: TFIBIntegerField;
    fdsNFeSERIE: TFIBIntegerField;
    RzDBEdit12: TRzDBEdit;
    RzLabel33: TRzLabel;
    RzDBEdit13: TRzDBEdit;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzDBEdit14: TRzDBEdit;
    fdsNFe_ItemCST_PIS: TFIBStringField;
    fdsNFe_ItemCST_COFINS: TFIBStringField;
    fdsNFe_ItemFCP: TFIBBCDField;
    cdsNFe_ItemCST_PIS: TStringField;
    cdsNFe_ItemCST_COFINS: TStringField;
    cdsNFe_ItemFCP: TpFIBClientBCDField;
    fdsNFe_ItemPREC_CUSTO_MEDIO: TFIBBCDField;
    fdsNFe_ItemIDGRUPO: TFIBBCDField;
    cdsNFe_ItemPREC_CUSTO_MEDIO: TpFIBClientBCDField;
    cdsNFe_ItemIDGRUPO: TpFIBClientBCDField;
    fdsNFe_ItemIBPT_ESTADUAL: TFIBBCDField;
    fdsNFe_ItemIBPT_MUNICIPAL: TFIBBCDField;
    cdsNFe_ItemIBPT_ESTADUAL: TpFIBClientBCDField;
    cdsNFe_ItemIBPT_MUNICIPAL: TpFIBClientBCDField;
    fdsNFeCHAVE_CONTIGENCIA: TFIBStringField;
    rgbEan: TRzRadioButton;
    rgbRef: TRzRadioButton;
    rgbFab: TRzRadioButton;
    RzDBEdit15: TRzDBEdit;
    RzLabel36: TRzLabel;
    fdsNFe_ItemICMS_MVAST: TFIBBCDField;
    cdsNFe_ItemICMS_MVAST: TpFIBClientBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tbsFormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnItensIncluirClick(Sender: TObject);
    procedure edtItemCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fdsNFeAfterScroll(DataSet: TDataSet);
    procedure btnItemGravarClick(Sender: TObject);
    procedure btnPesqClienteClick(Sender: TObject);
    procedure btnItemExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure NFeClick(Sender: TObject);
    procedure nfeEmitirExecute(Sender: TObject);
    procedure cbxTipoFreteExit(Sender: TObject);
    procedure nfeInutilizarNumExecute(Sender: TObject);
    procedure nfeImprimirExecute(Sender: TObject);
    procedure nfeCancelarExecute(Sender: TObject);
    procedure btnIncItensVendaClick(Sender: TObject);
    procedure btnItemAlterarClick(Sender: TObject);
    procedure cdsNFe_ItemBeforeEdit(DataSet: TDataSet);
    procedure btnPesqVeiculoClick(Sender: TObject);
    procedure gdrNotasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnItemCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnInfoAdicionalClick(Sender: TObject);
    procedure RzDBEdit8Exit(Sender: TObject);
    procedure nfeCartaCorrecaoExecute(Sender: TObject);
    procedure cdsNFe_ItemAfterPost(DataSet: TDataSet);
    procedure btnInformacoesAdicionaisClick(Sender: TObject);
    procedure btnNaturezaOperacaoClick(Sender: TObject);
    procedure cbxNatOperacaoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PesquisaCFOPItem(idItem: Integer);
    procedure rgbStatusChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure btnPesquisarClick(Sender: TObject);
    procedure gdrNotasDblClick(Sender: TObject);
    procedure RzDBEdit3Exit(Sender: TObject);
    procedure RzDBEdit3Enter(Sender: TObject);
    procedure RzDBEdit6Exit(Sender: TObject);
    procedure edtFreteEnter(Sender: TObject);
    procedure edtFreteExit(Sender: TObject);
    procedure edtOutrasDespesasEnter(Sender: TObject);
    procedure edtOutrasDespesasExit(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure pagDinheiroExecute(Sender: TObject);
    procedure chkClienteClick(Sender: TObject);
    procedure edtPesqClienteEnter(Sender: TObject);
    procedure edtPesqClienteExit(Sender: TObject);
    procedure edtClienteCodigoEnter(Sender: TObject);
    procedure edtClienteCodigoExit(Sender: TObject);
    procedure btnPesqClientesClick(Sender: TObject);
    procedure edtPesqNumVendaEnter(Sender: TObject);
    procedure edtPesqNumVendaExit(Sender: TObject);
    procedure chkNumVendaClick(Sender: TObject);
    procedure edtClienteCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkPeriodoClick(Sender: TObject);
    procedure nfeEmitirNFAeExecute(Sender: TObject);
    procedure btnDadosEntregaClick(Sender: TObject);
    procedure edtQtnItemExit(Sender: TObject);
    procedure edtBcIcmsExit(Sender: TObject);
    procedure edtAliqIcmsExit(Sender: TObject);
    procedure edtAliqIPIExit(Sender: TObject);
    procedure cdsNFe_ItemAfterDelete(DataSet: TDataSet);
    procedure cdsNFe_ItemReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    procedure RetornaItensNF;
    procedure EditaInsere;
    procedure GravaCancela;
    procedure Fechar;
    procedure ControlaBtnsItens;
    procedure PesquisarItem;
    procedure EmitirNFe;
    procedure EmitirNFAe;
    procedure ImprimirDANFE;
    procedure CancelarNFe;
    procedure CartaCorrecao;
    procedure RetornaChaveNFsDevolver;
    procedure pesquisar(tipo: String);
    procedure RetornaClienteId(idCliente: string);
    procedure RetornaIDCliente(cliente: string);
    Procedure GeraParcelaCheque(prefixo: string; parcelas: Integer;
      vlrParcelar: Double);
    Procedure GeraParcelaCartao(prefixo: string; parcelas: Integer;
      vlrParcelar: Double);
    Procedure GerarDocumentos;
    Procedure GeraNotaAVista;
    Procedure ShowFinalizacaoVenda;
    procedure VerificaFormaPagamento;
    function VerificaFaturamento(num:Integer):Boolean;
    function RetornaCntReceberItemID(idFilial: Integer; valor: Double;
      dt_venc: TDate): Integer;
    Procedure GravaCntReceber(valorTotal: Double; parcelasTotal: string;
      idFormaPag: Integer);
    Procedure GravaCntReceberItem(prefixo, parcela: string; dtVenc: TDate;
      valor: Double);
    function CalculaImpostos(valorBase:Currency; aliquota:Currency): Currency;
    procedure RateioNosItens(vlrTotItem:Currency);
    procedure ControlaCamposDevolucao;
  public
  var
    idVenda, idReceber, idFormaPag, idBanco, nBanco, nAgencia, nConta,
      idCliente, celula: Integer;
    valorParcelar, valorDinheiro, valorDesconto, valorCheque, valorCartao,
      troco: Double;
    emitente, idCli,indicadorIE: String;
    tipoVenda, moeda: String[2];
    vlr_fretTemp, vlrOutras_Despesas: Double;
    { Public declarations }
  end;

var
  frmNfe: TfrmNfe;
  pesoTotal, pesoOld: Double;
  valorTotalItens, valorTotalDesconto: Double;
  CFOP_NOVO, CST_CSOSN_NOVO: string[4];
  DT_NF_DEVOLVIDA: TDateTime;
  idNfe: Integer;
  alterandoIten, permiteEdicao: Boolean;

implementation

{$R *.dfm}

uses ClipBrd, untData, uUtils, untPesqProdutoItens, untPesqCliente,
  untStatusNFe,
  untPrincipal, untTransportadoraDados, untInutilizarNFe, untPesqTransportadora,
  untPesqVeiculo, untNtDevolucaoInfo, untPesqVendasPedidos,
  untInfoAdicionalProduto, untNFeCartaCorrecao, untNFeInformacoesAdicionais,
  UntCadNatOperacoes, untOutrosPagamentos, untTipoCartaoCredito,
  untLancDadosBasicCheque, untVendaFinalizacao, untPedidos, untEntregaDados,
  uVerificaPermicao, untMsgUsuarioNaoPermitido;

procedure TfrmNfe.BitBtn1Click(Sender: TObject);
begin
  fdsNFe.Close;
  fdsNFe_Item.Open;
  fdsNFe_Item.Last;
  fdsNFe_Item.First;

  while not(fdsNFe_Item.Eof) do
  begin
    with qryComand do
    begin
      Close;
      SQL.Clear;
      SQL.Add('EXECUTE PROCEDURE gera_mov_item_gerencial(' +
        fdsNFe_ItemIDPROD_ITEM.AsString + ', ' + fdsNFe_ItemIDFILIAL.AsString +
        ', ' + QuotedStr(FormatDateTime('MM/DD/YYYY',
        fdsNFe_ItemDT_INC.AsDateTime)) + ', ' + QuotedStr('NOTA FISCAL') + ', '
        + fdsNFe_ItemIDNFE.AsString + ', ' + QuotedStr('S') + ', ' +
        fdsNFe_ItemQTN.AsString + ', ' + fdsNFe_ItemIDFILIAL.AsString + ')');
      Prepare;
      ExecQuery;
    end;
    transNFe.CommitRetaining;
    fdsNFe_Item.Next;
  end;
end;

procedure TfrmNfe.btnAlterarClick(Sender: TObject);
var
   uVerificaPermicao: TVerificaPermicao;
begin
  if (uVerificaPermicao.Verifica('ADM_NFE_EDIT') = True) then
  begin
    RzPanel3.Enabled := False;
    permiteEdicao := true;
    fdsNFe.Edit;
    fdsNFeDT_ALT.AsDateTime := Now;
    idCli := fdsNFeIDCLIENTE.AsString;
    if fdsNFeDT_SAIDA.AsDateTime < Now then
      fdsNFeDT_SAIDA.AsDateTime := Now;
    pesoOld := fdsNFePESO.AsFloat;
    valorTotalItens := fdsNFeVLR_TOTITEM.AsFloat;
    valorTotalDesconto := fdsNFeVLR_DESCONTO.AsFloat;
    RetornaItensNF;
    EditaInsere;
   if  verificaFaturamento(fdsNFeIDPEDIDO.AsInteger)=true then
   begin
     edtFrete.ReadOnly := true;
     edtoutrasDespesas.ReadOnly:= true;
   end
   else
   begin
     edtFrete.ReadOnly := False;
     edtoutrasDespesas.ReadOnly:= False;
   end;
    if fdsNFe.State in [dsEdit] then
    begin
      if fdsNFeORIGEM_PEDIDO_VENDA.AsString <> EmptyStr then
      begin
        btnIncItensVenda.Enabled := False;
         btnItemAlterar.Enabled:=False;
        btnItemExcluir.Enabled := False;
        btnItensIncluir.Enabled := False;
        btnPesqCliente.Enabled := False;
      end;
    end;
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString <> 'VD' then
      CFOP_NOVO := cdsNFe_ItemCFOP.AsString;
  end
  else
   TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para alterar NFe.','Sem Permiss�o','I',[mbOk]);

end;

procedure TfrmNfe.btnCancelarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle,
    Pchar('Deseja realmente cancelar a Inclus�o/Altera��o desta NFe?'),
    'Aten��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        fdsNFe.Cancel;
        cdsNFe_Item.Cancel;
        cdsNFe_Item.EmptyDataSet;
        transNFe.RollbackRetaining;
        GravaCancela;
        RzPanel3.Enabled := true;
        if Assigned(frmPedidos) then // formulario de pedidos esta aberto
          Fechar;
      end;
  end;
end;

procedure TfrmNfe.btnDadosEntregaClick(Sender: TObject);
begin
  // try
  // frmEntregaDados := TfrmEntregaDados.Create(nil);
  // //dados do local de entrega
  // if fdsNFeENTREG_ENDERECO.AsString=EmptyStr then
  // begin
  // with qrySql do
  // begin
  // close;
  // SQL.Clear;
  // SQL.Add('SELECT C.*,CD.CODIGO,CD.NOME AS NOMECIDADE ,CD.UF FROM CLIENTE C,CIDADE_IBGE CD WHERE CD.ID = C.IDCIDADE AND C.ID='+QuotedStr(idCli));
  // Prepare;
  // ExecQuery;
  //
  // if qrySql.RecordCount>0 then
  // begin
  // if FieldByName('CNPJ').AsString >EmptyStr then
  // fdsNFeENTREG_CNPJ_CPF.AsString:= FieldByName('CNPJ').AsString
  // else
  // fdsNFeENTREG_CNPJ_CPF.AsString:= FieldByName('CPF').AsString;
  // fdsNFeENTREG_ENDERECO.AsString:=FieldByName('ENDERECO').AsString;
  // fdsNFeENTREG_NUMERO.AsString:= FieldByName('NUMERO').AsString;
  // fdsNFeENTREG_COMPLEMENTO.AsString:=FieldByName('COMPLEMENTO').AsString;
  // fdsNFeENTREG_BAIRRO.AsString:= FieldByName('BAIRRO').AsString;
  // fdsNFeENTREG_CIDADE_CODIGO.AsInteger :=  FieldByName('CODIGO').AsInteger;
  // fdsNFeENTREG_CIDADE.AsString       :=  FieldByName('NOMECIDADE').AsString;
  // fdsNFeENTREG_UF.AsString            := FieldByName('UF').AsString;
  // fdsNFeENTREG_CEP.AsString           :=  FieldByName('CEP').AsString;
  // fdsNFeENTREG_TELEFONE.AsString      :=  FieldByName('TELEFONE').AsString;
  // end;
  // end;
  // end;
  // frmEntregaDados.ShowModal;
  // Finally
  // frmEntregaDados.Free;
  // end;
end;

procedure TfrmNfe.btnDeleteClick(Sender: TObject);
var
  tempIdNF, idFilialTemp: string;
  uVerificaPermicao: TVerificaPermicao;
begin
  if (uVerificaPermicao.Verifica('ADM_NFE_EXCL') = True) then
  begin
    if (fdsNFeCODIGO_NFE.AsString = '0') then
    begin
      tempIdNF := fdsNFeID.AsString;
      idFilialTemp := fdsNFeIDFILIAL.AsString;

      with qryComand do
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM NFE_ITEM WHERE IDNFE = ' + tempIdNF +
          ' AND IDFILIAL = ' + idFilialTemp);
        Prepare;
        ExecQuery;

        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM NFE WHERE ID = ' + tempIdNF + ' AND IDFILIAL = ' +
          idFilialTemp);
        Prepare;
        ExecQuery;
      end;

      transNFe.CommitRetaining;

      Application.MessageBox('Nota exclu�da com sucesso!', 'Sucesso',
        MB_ICONEXCLAMATION + MB_OK);

      tbsTabela.Show;
      fdsNFe.Close;
      fdsNFe.Open;
    end
    else
      Application.MessageBox('Voc� n�o pode excluir essa nota!Tente inutilizar',
        'Aten��o', MB_ICONERROR + MB_OK);
  end
  else
  TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para Excluir NFe.','Sem Permiss�o','I',[mbOk]);
end;

procedure TfrmNfe.btnFirstClick(Sender: TObject);
begin
  fdsNFe.Prior;
end;

procedure TfrmNfe.btnGravarClick(Sender: TObject);
var
  vlr_fretTemp, vlrOutras_Despesas,valorTotal: Double;
begin
  vlr_fretTemp := 0;
  vlrOutras_Despesas := 0;

  if not(alterandoIten) then
  begin
    Application.MessageBox
      ('Voc� est� incluindo ou alterando um item, grave a inclus�o/altera��o deste primeiro e depois grave a Nota.',
      'Ante��o', MB_OK + MB_ICONERROR);
    edtQtnItem.SetFocus;
    Abort;
  end;

  if fdsNFeCLIENTE.AsString = EmptyStr then
  begin
    Application.MessageBox('Informe um Cliente.', 'Ante��o',
      MB_OK + MB_ICONERROR);
    edtQtnItem.SetFocus;
    Abort;
  end;

  if cdsNFe_Item.RecordCount = 0 then
  begin
    Application.MessageBox('Voc� n�o pode gravar uma Nota sem itens vendidos.',
      'Ante��o', MB_OK + MB_ICONERROR);
    btnItensIncluir.SetFocus;
    Abort;
  end;

  if cbxTipoFrete.ItemIndex <> 2 then
  begin
    if (Trim(fdsNFeTRANSP_NOME.AsString) = EmptyStr) or
      (Trim(fdsNFeTRANSP_CNPJ_CPF.AsString) = EmptyStr) then
    begin
      Application.MessageBox
        ('Para Notas Fiscais com frete, os dados do transportador devem ser informado',
        'Ante��o', MB_OK + MB_ICONERROR);
      cbxTipoFrete.SetFocus;
      Abort;
    end;
  end;
  // if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
  // begin
  // if (fdsNFeICMS_ST_VBC.AsFloat > 0 )and (fdsNFeICMS_ST_VLR.AsFloat > 0)   then
  // begin
  // fdsNFeINFO_ADICIONAL.AsString := (fdsNFeINFO_ADICIONAL.AsString + ' Valor da Base de ICMS ST: ' + fdsNFeICMS_ST_VBC.AsString +' Valor de ICMS ST: '+ fdsNFeICMS_ST_VLR.AsString);
  // end;
  // end;

  permiteEdicao := False;
 { cdsNFe_Item.First;
  while not(cdsNFe_Item.Eof) do
  begin
    cdsNFe_Item.Edit;
    cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat := fdsNFeOUTRAS_DESPESAS.AsFloat *
      (RoundTo(cdsNFe_ItemVLR_TOTAL.AsFloat / fdsNFeVLR_TOTITEM.AsFloat, -2));
    cdsNFe_ItemVLR_FRETE.AsFloat := fdsNFeVLR_FRETE.AsFloat *
      (RoundTo(cdsNFe_ItemVLR_TOTAL.AsFloat / fdsNFeVLR_TOTITEM.AsFloat, -2));

    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VD' then         //soma na base de ICMS e ipi
    begin
      valorTotal:= cdsNFe_ItemVLR_TOTAL.AsFloat + cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat+cdsNFe_ItemVLR_FRETE.AsFloat;

      cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQIPI.AsFloat);

      if fdsNFeINDICADOR_IE.AsString ='NC' then
      begin
       cdsNFe_ItemICMS_BCALC.AsFloat := valorTotal ;//+ cdsNFe_ItemICMS_VIPI.AsFloat;
      end
      else
       cdsNFe_ItemICMS_BCALC.AsFloat := valorTotal;

      cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQ.AsFloat);

    end;

    vlr_fretTemp := vlr_fretTemp + cdsNFe_ItemVLR_FRETE.AsFloat;
    vlrOutras_Despesas := vlrOutras_Despesas +
      cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat;
    cdsNFe_Item.Post;
    cdsNFe_Item.Next;
  end;}

  {with cdsNFe_Item do
  begin
    Last;
    Edit;
    cdsNFe_ItemVLR_FRETE.AsFloat := cdsNFe_ItemVLR_FRETE.AsFloat +
      (fdsNFeVLR_FRETE.AsFloat - vlr_fretTemp);
    cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat :=
      cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat +
      (fdsNFeOUTRAS_DESPESAS.AsFloat - vlrOutras_Despesas);
    Post;
  end; }
 {if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VD' then         //soma na base de ICMS e ipi
 begin
  if fdsNFeINDICADOR_IE.AsString ='NC' then
  begin
    fdsNFeICMS_VBC.AsFloat:=0;
    fdsNFeICMS_VLR.AsFloat:=0;
    fdsNFeICMS_VLR_IPI.AsFloat := 0;
    cdsNFe_Item.First;
    while not(cdsNFe_Item.Eof) do
    begin
      if cdsNFe_ItemICMS_VLR.AsFloat>0 then
      begin
//        fdsNFeICMS_VBC.AsFloat:= fdsNFeICMS_VBC.AsFloat+cdsNFe_ItemICMS_BCALC.AsFloat;
//        fdsNFeICMS_VLR.AsFloat:= fdsNFeICMS_VLR.AsFloat+ cdsNFe_ItemICMS_VLR.AsFloat;

        fdsNFeICMS_VBC.AsFloat:= fdsNFeICMS_VBC.AsFloat+cdsNFe_ItemICMS_BCALC.AsFloat;
        fdsNFeICMS_VLR.AsFloat:= fdsNFeICMS_VLR.AsFloat+ cdsNFe_ItemICMS_VLR.AsFloat;
      end
      else
      begin
        fdsNFeICMS_VBC.AsFloat:= fdsNFeICMS_VBC.AsFloat+0;
        fdsNFeICMS_VLR.AsFloat:= fdsNFeICMS_VLR.AsFloat+ 0;
      end;
      fdsNFeICMS_VLR_IPI.AsFloat:= fdsNFeICMS_VLR_IPI.AsFloat+ cdsNFe_ItemICMS_VIPI.AsFloat;
      cdsNFe_Item.Next;
    end;
  end;
 end; }
  fdsNFe.Post;
  cdsNFe_Item.ApplyUpdates(0);
  cdsNF_Devolvidas.ApplyUpdates(0);
  transNFe.CommitRetaining;
  // DM.Conexao.CommitRetaining;
  GravaCancela;
  RzPanel3.Enabled := true;
end;

procedure TfrmNfe.btnIncItensVendaClick(Sender: TObject);
begin
  cdsNFe_Item.First;
  while not(cdsNFe_Item.Eof) do
  begin
   btnItemExcluir.Click;
   cdsNFe_Item.Next;
  end;

  cdsNFe_Item.Cancel;
  cdsNFe_Item.EmptyDataSet;
  transNFe.RollbackRetaining;
  Try
    if not(frmNfe = nil) then
    begin
      frmPesqVendasPedidos := TfrmPesqVendasPedidos.Create(nil);
      frmPesqVendasPedidos.chkCliente.Checked := true;
      frmPesqVendasPedidos.edtPesqCliente.Text := fdsNFeCLIENTE.Text;
      frmPesqVendasPedidos.ShowModal;
    end;
  Finally
    if frmPesqVendasPedidos.ModalResult = mrOk then
    begin
      with frmPesqVendasPedidos do
      begin
        // valorTotalDesconto := valorTotalDesconto + fdsVendasPedidosVLR_DESCONTO.AsFloat;
        // fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat - fdsVendasPedidosVLR_DESCONTO.AsFloat;
        fdsNFeORIGEM_PEDIDO_VENDA.AsString := fdsVendasPedidosPREFIXO.AsString;
        fdsNFeIDPEDIDO.AsInteger := fdsItensIDVENDA.AsInteger;

        Try
          frmPesqCliente := TfrmPesqCliente.Create(nil);
          frmPesqCliente.edtNome.Text := fdsVendasPedidosNOMECLIENTE.AsString;
          frmPesqCliente.Show;
          frmPesqCliente.btnPesquisar.Click;
          frmPesqCliente.ModalResult := mrOk;
        Finally
          if frmPesqCliente.ModalResult = mrOk then
          begin
            fdsNFeIDCLIENTE.AsInteger := frmPesqCliente.fdsClientesID.AsInteger;
            fdsNFeCLIENTE.AsString := frmPesqCliente.fdsClientesNOME.AsString;
            fdsNFeUF.AsString := frmPesqCliente.fdsClientesUF.AsString;
          end;
          frmPesqCliente.Free;
        End;

        fdsItens.First;
        while not(fdsItens.Eof) do
        begin
          if fdsItensQTN.AsFloat - fdsItensQTN_RETORNO.AsFloat > 0 then
          begin
            cdsNFe_Item.append;
            cdsNFe_ItemIDNFE.AsInteger := fdsNFeID.AsInteger;
            cdsNFe_ItemIDFILIAL.AsInteger := fdsNFeIDFILIAL.AsInteger;
            cdsNFe_ItemDT_INC.AsDateTime := Now;
            cdsNFe_ItemIDPROD_ITEM.AsInteger := fdsItensIDPROD_ITEM.AsInteger;
            cdsNFe_ItemVLR_UNITARIO.AsFloat := fdsItensVLR_UNITARIO.AsFloat;

            if (fdsItensDESCONTO_FORMA.AsString = 'P') then
              cdsNFe_ItemVLR_DESCONTO.AsFloat :=
                RoundTo(fdsItensVLR_UNITARIO.AsFloat *
                fdsItensVLR_DESC_ACRE.AsFloat / 100, -2)
            else
              cdsNFe_ItemVLR_DESCONTO.AsFloat := fdsItensVLR_DESC_ACRE.AsFloat;

            cdsNFe_ItemPESO.AsFloat := fdsItensPESO.AsFloat;
            cdsNFe_ItemPRODUTO.AsString := fdsItensNOMEPRODUTO.AsString;
            cdsNFe_ItemCOD_FABRICA.AsString := fdsItensCOD_FABRICA.AsString;
            cdsNFe_ItemQTN.AsFloat := fdsItensQTN.AsFloat -
              fdsItensQTN_RETORNO.AsFloat;
            cdsNFe_ItemVLR_TOTAL.AsFloat := fdsItensVLR_TOTAL.AsFloat;
            cdsNFe_ItemINFO_ADICIONAL.AsString :=
              fdsItensINFO_ADICIONAL.AsString;
            cdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString :=
              fdsVendasPedidosPREFIXO.AsString;
            cdsNFe_ItemNUM_VENDA_PEDIDO.AsInteger := fdsItensIDVENDA.AsInteger;

            if fdsNatOperacaoCAT_SAIDA_CFOP.AsString <> 'VD' then
            begin;
              cdsNFe_ItemCFOP.AsString := CFOP_NOVO;
              cdsNFe_ItemCST_CSOSN.AsString := CST_CSOSN_NOVO;
            end
            else
            begin
              cdsNFe_ItemCFOP.AsString := fdsItensCFOP.AsString;
              if fdsNFeUF.AsString <> DM.fdsConfigUF.AsString then
                cdsNFe_ItemCFOP.AsString :=
                  StringReplace(cdsNFe_ItemCFOP.AsString, '5', '6', []);
              cdsNFe_ItemCST_CSOSN.AsString := fdsItensCST_CSOSN.AsString;
            end;

            cdsNFe_ItemITEM.AsInteger := cdsNFe_Item.RecordCount + 1;
            cdsNFe_Item.Post;
          end;
          fdsItens.Next;
        end;
        // if (fdsPedidoTIPO_DESC_ACRESC.AsString = 'D') then
        // fdsPedidoVLR_TOTAL.AsFloat := fdsPedidoVLR_TOTAL.AsFloat - fdsPedidoVLR_DESCONTO.AsFloat
        // else
        // if (fdsPedidoTIPO_DESC_ACRESC.AsString = 'A') then
        // fdsPedidoVLR_TOTAL.AsFloat := fdsPedidoVLR_TOTAL.AsFloat + fdsPedidoVLR_DESCONTO.AsFloat vitor ver desconto no total
      end;
    end;
    frmPesqVendasPedidos.Free;
  End;
end;

procedure TfrmNfe.btnIncluirClick(Sender: TObject);
begin
  permiteEdicao := true;
  RzPanel3.Enabled := False;
  cdsNFe_Item.Close;
  cdsNFe_Item.Open;
  cdsNFe_Item.EmptyDataSet;
  fdsNFe.append;
  fdsNFeIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsNFeDT_INC.AsDateTime := Now;
  fdsNFeDT_SAIDA.AsDateTime := Now;
  fdsNFeSTATUS.AsString := 'AB';
  fdsNFeIDFORMA_PAG.AsInteger := 1;
  fdsNFeIDTRANSPORTADORA.AsInteger := DM.fdsConfigIDTRANPS_PADRAO.AsInteger;
  fdsNFeIDVEICULO.AsInteger := DM.fdsConfigIDVEICULO_PADRAO.AsInteger;
  fdsNFeINFO_ADICIONAL.AsString :=
    'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL, N�O GERA DIREITO A CR�DITO FISCAL DE ICMS, DE ISS E DE IPI.';

  btnItemAlterar.Enabled := False;
  btnItemExcluir.Enabled := False;
  pesoTotal := 0;
  valorTotalItens := 0;
  valorTotalDesconto := 0;
  cbxTipoFrete.ItemIndex := 2;

  // RetornaChaveNFsDevolver;

  EditaInsere;
end;

procedure TfrmNfe.btnInfoAdicionalClick(Sender: TObject);
begin
  Try
    frmInfoAdicionalProduto := TfrmInfoAdicionalProduto.Create(nil);
    frmInfoAdicionalProduto.mmoInfo.Text := cdsNFe_ItemINFO_ADICIONAL.AsString;
    frmInfoAdicionalProduto.ShowModal;
  Finally
    if frmInfoAdicionalProduto.ModalResult = mrOk then
      cdsNFe_ItemINFO_ADICIONAL.AsString :=
        frmInfoAdicionalProduto.mmoInfo.Text;

    frmInfoAdicionalProduto.Free;
    edtQtnItem.SetFocus;
  End;
end;

procedure TfrmNfe.btnInformacoesAdicionaisClick(Sender: TObject);
begin
  Try
    frmNFeInformacoesAdicionais := TfrmNFeInformacoesAdicionais.Create(nil);
    if not(Trim(fdsNFeINFO_ADICIONAL.AsString) = EmptyStr) then
    begin
      frmNFeInformacoesAdicionais.mmoInformacaoAdicional.Lines.Clear;
      frmNFeInformacoesAdicionais.mmoInformacaoAdicional.Lines.Add
        (fdsNFeINFO_ADICIONAL.AsString);
    end;

    frmNFeInformacoesAdicionais.ShowModal;
  Finally
    if frmNFeInformacoesAdicionais.ModalResult = mrOk then
    begin
      fdsNFeINFO_ADICIONAL.AsString :=
        frmNFeInformacoesAdicionais.mmoInformacaoAdicional.Text;
    end;
    frmNFeInformacoesAdicionais.Free;
  End;
end;

procedure TfrmNfe.btnItemAlterarClick(Sender: TObject);
begin
  if cdsNFe_Item.RecordCount > 0 then
  begin
    cdsNFe_Item.Edit;
    edtItemDesconto.SetFocus;
    ControlaCamposDevolucao;
    ControlaBtnsItens;
  end;
end;

procedure TfrmNfe.btnItemCancelarClick(Sender: TObject);
begin
  if cdsNFe_Item.State = dsEdit then
  begin
    pesoTotal := pesoTotal + (cdsNFe_ItemPESO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFePESO.AsFloat := pesoTotal;
    fdsNFeICMS_VBC.AsFloat := fdsNFeICMS_VBC.AsFloat +cdsNFe_ItemICMS_BCALC.AsFloat;
    fdsNFeICMS_VLR.AsFloat := fdsNFeICMS_VLR.AsFloat +cdsNFe_ItemICMS_VLR.AsFloat;
    fdsNFeICMS_ST_VLR.AsFloat := fdsNFeICMS_ST_VLR.AsFloat +cdsNFe_ItemICMS_ST_VLR.AsFloat;
    fdsNFeICMS_ST_VBC.AsFloat := fdsNFeICMS_ST_VBC.AsFloat +cdsNFe_ItemICMS_ST_VBC.AsFloat;
    fdsNFeICMS_VLR_IPI.AsFloat:= fdsNFeICMS_Vlr_IPI.AsFloat+ cdsNFe_ItemICMS_VIPI.AsFloat;
    fdsNFeICMS_ALQ_IPI.AsFloat:=fdsNFeICMS_ALQ_IPI.AsFloat+cdsNFe_ItemICMS_ALIQIPI.AsFloat;
    fdsNFeVLR_DESCONTO.AsFloat := fdsNFeVLR_DESCONTO.AsFloat +
      (cdsNFe_ItemVLR_DESCONTO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFeVLR_TOTITEM.AsFloat := fdsNFeVLR_TOTITEM.AsFloat +
      (cdsNFe_ItemVLR_UNITARIO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat +
      cdsNFe_ItemVLR_TOTAL.AsFloat;
  end;
  cdsNFe_Item.Cancel;
  ControlaBtnsItens;
end;

procedure TfrmNfe.btnItemExcluirClick(Sender: TObject);
var
  i: SmallInt;
begin
  if cdsNFe_Item.RecordCount > 0 then
  begin
    i := 1;

    pesoTotal := pesoTotal - (cdsNFe_ItemPESO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFePESO.AsFloat := pesoTotal;
    fdsNFeVLR_DESCONTO.AsFloat := fdsNFeVLR_DESCONTO.AsFloat -(cdsNFe_ItemVLR_DESCONTO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    // ShowMessage(FloatToStr(valorTotalDesconto));

    // if (cdsNFe_ItemNUM_VENDA_PEDIDO.AsInteger > 0) then
    // begin
    // with qryComand do
    // begin
    // Close;
    // SQL.Clear;
    // if (cdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString = 'VE') then
    // SQL.Add('SELECT VLR_DESCONTO FROM VENDA WHERE ID = ' + cdsNFe_ItemNUM_VENDA_PEDIDO.AsString)
    // else
    // SQL.Add('SELECT VLR_DESCONTO FROM PEDIDO WHERE ID = ' + cdsNFe_ItemNUM_VENDA_PEDIDO.AsString);
    // Prepare;
    // ExecQuery;
    // valorTotalDesconto := valorTotalDesconto - qryComand.FieldByName('VLR_DESCONTO').AsFloat;
    // fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat + qryComand.FieldByName('VLR_DESCONTO').AsFloat;
    // end;
    // end;

    // fdsNFeVLR_DESCONTO.AsFloat := valorTotalDesconto;
    fdsNFeVLR_TOTITEM.AsFloat := fdsNFeVLR_TOTITEM.AsFloat -
      (cdsNFe_ItemVLR_UNITARIO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat - cdsNFe_ItemVLR_TOTAL.AsFloat - cdsNFe_ItemICMS_VIPI.AsFloat;

    fdsNFeICMS_ST_VLR.AsFloat := fdsNFeICMS_ST_VLR.AsFloat -cdsNFe_ItemICMS_ST_VLR.AsFloat;
    fdsNFeICMS_ST_VBC.AsFloat := fdsNFeICMS_ST_VBC.AsFloat - cdsNFe_ItemICMS_ST_VBC.AsFloat;

    fdsNFeICMS_VBC.AsFloat := fdsNFeICMS_VBC.AsFloat - cdsNFe_ItemICMS_BCALC.AsFloat;
    fdsNFeICMS_VLR.AsFloat := fdsNFeICMS_VLR.AsFloat - cdsNFe_ItemICMS_VLR.AsFloat;
    fdsNFeICMS_VLR_IPI.AsFloat:= fdsNFeICMS_Vlr_IPI.AsFloat - cdsNFe_ItemICMS_VIPI.AsFloat;
    fdsNFeICMS_ALQ_IPI.AsFloat:=fdsNFeICMS_ALQ_IPI.AsFloat-cdsNFe_ItemICMS_ALIQIPI.AsFloat;

    cdsNFe_Item.Delete;

    cdsNFe_Item.First;
    while not(cdsNFe_Item.Eof) do
    begin
      cdsNFe_Item.Edit;
      cdsNFe_ItemITEM.AsInteger := i;
      cdsNFe_Item.Post;
      Inc(i);
      cdsNFe_Item.Next;
    end;
  end;
end;

procedure TfrmNfe.btnItemGravarClick(Sender: TObject);
begin
  if (not(Trim(edtQtnItem.Text) = EmptyStr) and (cdsNFe_ItemQTN.AsFloat > 0))
  then
  begin
    cdsNFe_ItemVLR_TOTAL.AsFloat :=
      (cdsNFe_ItemVLR_UNITARIO.AsFloat - cdsNFe_ItemVLR_DESCONTO.AsFloat) *
      cdsNFe_ItemQTN.AsFloat + cdsNFe_ItemICMS_ST_VLR.AsFloat;

    if cdsNFe_Item.State in [dsInsert] then
      cdsNFe_ItemITEM.AsInteger := cdsNFe_Item.RecordCount + 1;

    cdsNFe_Item.Post;

    alterandoIten := False;
    ControlaBtnsItens;
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString ='VD' then
    begin
      vlr_fretTemp := 0;
      vlrOutras_Despesas := 0;
      cdsNFe_Item.First;
      while not(cdsNFe_Item.Eof) do
      begin
       RateioNosItens(fdsNFeVLR_TOTITEM.AsFloat);
        cdsNFe_Item.Next;
      end;
    end;
    btnItensIncluir.SetFocus;
  end
  else
    edtQtnItem.SetFocus;
end;

procedure TfrmNfe.btnItensIncluirClick(Sender: TObject);
begin
  if fdsNFeNATUREZA_OPERACAO.AsString = EmptyStr then
  begin
    Application.MessageBox
      ('Antes Selecione uma Natureza de Opera��o',
      'Ante��o', MB_OK + MB_ICONEXCLAMATION);
    cbxNatOperacao.SetFocus;
    Abort;
  end;
  if fdsNFeIDCLIENTE.AsString = EmptyStr then
  begin
    Application.MessageBox
      ('Antes Selecione um Cliente.',
      'Ante��o', MB_OK + MB_ICONEXCLAMATION);
    cbxNatOperacao.SetFocus;
    Abort;
  end;
  cdsNFe_Item.append;
  cdsNFe_ItemIDNFE.AsInteger := fdsNFeID.AsInteger;
  cdsNFe_ItemIDFILIAL.AsInteger := fdsNFeIDFILIAL.AsInteger;
  cdsNFe_ItemDT_INC.AsDateTime := Now;
  cdsNFe_ItemVLR_TOTAL.AsFloat := 0;
  if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
  begin
    RzDBEdit3.Enabled := true;
    RzDBEdit6.Enabled := true;
  end
  else
  begin
    RzDBEdit3.Enabled := False;
    RzDBEdit6.Enabled := False;
  end;

  edtItemCodigo.SetFocus;
  alterandoIten := true;
  ControlaBtnsItens;
end;

procedure TfrmNfe.btnLastClick(Sender: TObject);
begin
  fdsNFe.Last;
end;

procedure TfrmNfe.btnNaturezaOperacaoClick(Sender: TObject);
begin
  Try
    frmCadNatOperacoes := TfrmCadNatOperacoes.Create(nil);
    frmCadNatOperacoes.ShowModal;
  Finally
    if frmCadNatOperacoes.ModalResult = mrOk then
    begin
      fdsNatOperacao.Close;
      fdsNatOperacao.Open;
      fdsNatOperacao.Last;
      fdsNatOperacao.First;
      fdsNatOperacao.Locate('OPERACAO',
        frmCadNatOperacoes.naturezaOperacao, []);
      cbxNatOperacao.SetFocus;
    end;
    frmCadNatOperacoes.Free;
  End;
end;

procedure TfrmNfe.btnNextClick(Sender: TObject);
begin
  fdsNFe.Next;
end;

procedure TfrmNfe.btnPesqClienteClick(Sender: TObject);
begin
  Try
    frmPesqCliente := TfrmPesqCliente.Create(nil);
    frmPesqCliente.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin

      indicadorIE:= frmPesqCliente.fdsClientesINDICADOR_IE.AsString;
      if fdsNFeIDCLIENTE.AsString<>EmptyStr then
      begin
        cdsNFe_Item.First;
        while not(cdsNFe_Item.Eof) do
        begin
         RateioNosItens(fdsNFeVLR_TOTITEM.AsFloat);
          cdsNFe_Item.Next;
        end;
      end;
      fdsNFeIDCLIENTE.AsInteger := frmPesqCliente.fdsClientesID.AsInteger;
      fdsNFeCLIENTE.AsString := frmPesqCliente.fdsClientesNOME.AsString;
      fdsNFeUF.AsString := frmPesqCliente.fdsClientesUF.AsString;
      // idCliente:= frmPesqCliente.fdsClientesID.AsInteger;

      idCli := frmPesqCliente.fdsClientesID.AsString;

      btnItensIncluir.SetFocus;
    end;
    frmPesqCliente.Free;
  End;
end;

procedure TfrmNfe.btnPesqClientesClick(Sender: TObject);
begin
  Try
    frmPesqCliente := TfrmPesqCliente.Create(nil);
    frmPesqCliente.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin
      edtClienteCodigo.Text := frmPesqCliente.fdsClientesID.AsString;
      edtPesqCliente.Text := frmPesqCliente.fdsClientesNOME.AsString;
      RetornaClienteId(edtClienteCodigo.Text);
      btnPesquisar.Click;
    end;
    frmPesqCliente.Free;
  End
end;

procedure TfrmNfe.btnPesquisarClick(Sender: TObject);
begin
  if rgbStatus.ItemIndex = 0 then
    pesquisar('AB');
  if rgbStatus.ItemIndex = 1 then
    pesquisar('NF');
  if rgbStatus.ItemIndex = 2 then
    pesquisar('ER');
  if rgbStatus.ItemIndex = 3 then
    pesquisar('CL');
  if rgbStatus.ItemIndex = 4 then
    pesquisar('OF');
  if rgbStatus.ItemIndex = 5 then
    pesquisar('IN');
  tbsTabela.Show;

end;

procedure TfrmNfe.btnPesqVeiculoClick(Sender: TObject);
begin
  Try
    frmPesqVeiculo := TfrmPesqVeiculo.Create(nil);
    frmPesqVeiculo.idTransportadora := fdsNFeIDTRANSPORTADORA.AsInteger;
    frmPesqVeiculo.ShowModal;
  Finally
    if frmPesqVeiculo.ModalResult = mrOk then
    begin
      fdsNFeIDVEICULO.AsInteger := frmPesqVeiculo.fdsVeiculoID.AsInteger;
      // fdsNFeVEICULO.AsString := frmPesqVeiculo.fdsVeiculoNOME.AsString;
    end;
    frmPesqVeiculo.Free;
    btnItensIncluir.SetFocus;
  End;
end;

procedure TfrmNfe.btnPriorClick(Sender: TObject);
begin
  fdsNFe.First;
end;

procedure TfrmNfe.btnTodosClick(Sender: TObject);
begin
  with fdsNFe do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

function TfrmNfe.CalculaImpostos(valorBase:Currency; aliquota:Currency): Currency;
var
 valor:Currency;
 const
  p:Currency = 100;
begin
 valor:= roundTo((valorBase* aliquota)/p ,-2) ;

 result:= valor;

end;

procedure TfrmNfe.CancelarNFe;
var
  tempIdNF, idFilialTemp, chaveXMLCan, caminhoXML, DestinoXML: string;
  mes: TDateTime;
begin
  if not(fdsNFeCHAVE_CONSULTA.AsString = string.Empty) and
    not(fdsNFeNUMERO_PROTOCOLO.AsString = string.Empty) then
  begin
    try
      tempIdNF := fdsNFeID.AsString;
      idFilialTemp := fdsNFeIDFILIAL.AsString;

      with fdsNFe do
      begin
        Close;
        Conditions.Clear;
        Conditions.AddCondition('IDNF', 'NF.ID = ' + tempIdNF, true);
        Conditions.AddCondition('IDFILIAL', 'NF.IDFILIAL = ' +
          idFilialTemp, true);
        Conditions.Apply;
        Prepare;
        Open;
      end;

      RetornaItensNF;

      frmStatusNFe := TfrmStatusNFe.Create(nil);
      frmStatusNFe.param := 'CANCELAR';
      frmStatusNFe.ShowModal;
    finally
      if frmStatusNFe.ModalResult = mrOk then
      begin
        fdsNFe.Close;
        fdsNFe.Open;
        fdsNFe.Locate('ID', frmStatusNFe.cdsNFeID.AsString, []);
        fdsNF_Cancelada.Open;
        fdsNF_Cancelada.append;
        fdsNF_CanceladaIDFILIAL.AsInteger := fdsNFeIDFILIAL.AsInteger;
        fdsNF_CanceladaIDNOTA.AsInteger := fdsNFeID.AsInteger;
        fdsNF_CanceladaMODELO_NOTA.AsString := 'NFe';
        fdsNF_CanceladaIDCLIENTE.AsInteger := fdsNFeIDCLIENTE.AsInteger;
        fdsNF_CanceladaDT_EMISSAO.AsDateTime := fdsNFeDT_INC.AsDateTime;
        fdsNF_CanceladaVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat;
        fdsNF_CanceladaCHAVE_CONSULTA_NF.AsString :=
          fdsNFeCHAVE_CONSULTA.AsString;
        fdsNF_CanceladaNUMERO_PROTOCOLO_NF.AsString :=
          fdsNFeNUMERO_PROTOCOLO.AsString;
        fdsNF_CanceladaCHAVE_CONSULTA_CANC.AsString :=
          frmStatusNFe.ChaveCancelamento;
        fdsNF_CanceladaNUMERO_PROTOCOLO_CANC.AsString :=
          frmStatusNFe.NumeroProtocolo;
        fdsNF_Cancelada.Post;

        fdsNFe.Edit;
        fdsNFeSTATUS.AsString := 'CL';
        fdsNFeCHAVE_CONSULTA.AsString := frmStatusNFe.ChaveCancelamento;
        fdsNFeNUMERO_PROTOCOLO.AsString := frmStatusNFe.NumeroProtocolo;
        fdsNFe.Post;
        DM.conexao.CommitRetaining;

        fdsNFe_Item.First;
        while not(fdsNFe_Item.Eof) do
        begin
          if (fdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString <> 'PD') or
            (fdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString <> 'VE') then
          begin
            with qryComand do
            begin
              Close;
              SQL.Clear;
              SQL.Add('EXECUTE PROCEDURE gera_mov_item(' +
                fdsNFe_ItemIDPROD_ITEM.AsString + ', ' +
                fdsNFe_ItemIDFILIAL.AsString + ', ' +
                QuotedStr(FormatDateTime('MM/DD/YYYY',
                fdsNFe_ItemDT_INC.AsDateTime)) + ', ' + QuotedStr('NOTA FISCAL')
                + ', ' + fdsNFe_ItemIDNFE.AsString + ', ' + QuotedStr('E') +
                ', ' + fdsNFe_ItemQTN.AsString + ', ' +
                fdsNFe_ItemIDFILIAL.AsString + ')');
              Prepare;
              ExecQuery;
            end;
            transNFe.CommitRetaining;
          end;
          fdsNFe_Item.Next;
        end;

        chaveXMLCan := frmStatusNFe.IDEventoCan + '-procEventoNFe.xml';
        caminhoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Eventos\'
          + FormatDateTime('yyyy', Now) + FormatDateTime('MM', Now) + '\' +
          chaveXMLCan;
        DestinoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Canceladas\' + FormatDateTime('yyyy', Now) +
          FormatDateTime('MM', Now) + '\';

        if DirectoryExists(DestinoXML) = False then
          CreateDir(DestinoXML);

        DestinoXML := DestinoXML + chaveXMLCan;
        MoveFile(PChar(caminhoXML), PChar(DestinoXML));
        // Foi movido xml para canceladas
        // ****************************************
        // Inicio exclusao xml da pasta emitidas
        chaveXMLCan := StringReplace(fdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',
          [rfReplaceAll]) + '-nfe.xml';
        caminhoXML := ExtractFilePath(Application.ExeName) +
          '\NFeLogs\Emitidas\' + FormatDateTime('yyyy', Now) +
          FormatDateTime('MM', Now) + '\' + chaveXMLCan;
        //showMessage(ExtractFilePath(Application.ExeName));

        if FileExists(caminhoXML) = False then
        begin
          mes := Now;
          mes := INCMONTH(mes, -1);
          caminhoXML := ExtractFilePath(Application.ExeName) +
            '\NFeLogs\Emitidas\' + FormatDateTime('yyyy', Now) +
            FormatDateTime('MM', mes) + '\' + chaveXMLCan;
        end;
       // ShowMessage(caminhoXML);
        Deletefile(caminhoXML);
        if FileExists(caminhoXML) then
        begin
          Deletefile(caminhoXML);
        end;
        // Fim Exclusao do xml

        Application.MessageBox('Canclamento de NFe realizado com sucesso!',
          'Sucesso', MB_ICONEXCLAMATION + MB_OK);
      end;
      frmStatusNFe.Free;

      with fdsNFe do
      begin
        Close;
        Conditions.Clear;
        Conditions.Apply;
        Prepare;
        Open;
        Locate('ID', tempIdNF, []);
      end;
      case rgbStatus.ItemIndex of
        0:
          pesquisar('AB');
        1:
          pesquisar('NT');
        2:
          pesquisar('ER');
        3:
          pesquisar('CL');
        4:
          pesquisar('OF');
        5:
          pesquisar('IN');
      end;
      tbsTabela.Show;
    end;
  end;
end;

procedure TfrmNfe.CartaCorrecao;
var
  correcao, tempIdNF, idFilialTemp: string;
begin
  correcao := EmptyStr;

  if not(fdsNFeCHAVE_CONSULTA.AsString = string.Empty) and
    not(fdsNFeNUMERO_PROTOCOLO.AsString = string.Empty) then
  begin
    tempIdNF := fdsNFeID.AsString;
    idFilialTemp := fdsNFeIDFILIAL.AsString;

    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('IDNF', 'NF.ID = ' + tempIdNF, true);
      Conditions.AddCondition('IDFILIAL', 'NF.IDFILIAL = ' +
        idFilialTemp, true);
      Conditions.Apply;
      Prepare;
      Open;
    end;

    RetornaItensNF;

    try
      frmNFeCartaCorrecao := TfrmNFeCartaCorrecao.Create(nil);
      frmNFeCartaCorrecao.ShowModal;
    finally
      if frmNFeCartaCorrecao.ModalResult = mrOk then
      begin
        correcao := frmNFeCartaCorrecao.mmoCorrecaoTexto.Text;
      end;
      frmNFeCartaCorrecao.Free;
    end;

    if not(correcao = EmptyStr) then
    begin
      try
        frmStatusNFe := TfrmStatusNFe.Create(nil);
        frmStatusNFe.param := 'CartaCorrecao';
        frmStatusNFe.lblRetorno.Caption := 'Aguarde enviando Carta de Corre��o';
        frmStatusNFe.correcao := correcao;
        frmStatusNFe.ShowModal;
      finally
        frmStatusNFe.Free;
      end;
    end;

    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.Apply;
      Prepare;
      Open;
      Locate('ID', tempIdNF, []);
    end;
    tbsTabela.Show;
  end;
end;

procedure TfrmNfe.cbxTipoFreteExit(Sender: TObject);
begin
  if fdsNFe.State in [dsEdit, dsInsert] then
  begin
    if cbxTipoFrete.ItemIndex <> 2 then
    begin
      try
        frmTransportadoraDados := TfrmTransportadoraDados.Create(nil);
        frmTransportadoraDados.ShowModal;
      Finally
        pesoTotal := fdsNFePESO.AsFloat;
        frmTransportadoraDados.Free;
      end;
    end
    else
      btnDadosEntrega.Enabled := False;
  end;
end;

procedure TfrmNfe.cdsNFe_ItemAfterDelete(DataSet: TDataSet);
begin
 if fdsNatOperacaoCAT_SAIDA_CFOP.AsString ='VD' then
 begin
   vlr_fretTemp := 0;
   vlrOutras_Despesas := 0;
  while not(cdsNFe_Item.Eof) do
  begin
   RateioNosItens(fdsNFeVLR_TOTITEM.AsFloat);
    cdsNFe_Item.Next;
  end;
 end;
end;

procedure TfrmNfe.cdsNFe_ItemAfterPost(DataSet: TDataSet);
begin
  if permiteEdicao = true then
  begin
    pesoTotal := pesoTotal + (cdsNFe_ItemPESO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFePESO.AsFloat := pesoTotal;
    fdsNFeICMS_ST_VLR.AsFloat := fdsNFeICMS_ST_VLR.AsFloat +cdsNFe_ItemICMS_ST_VLR.AsFloat;
    fdsNFeICMS_ST_VBC.AsFloat := fdsNFeICMS_ST_VBC.AsFloat +cdsNFe_ItemICMS_ST_VBC.AsFloat;
    fdsNFeICMS_VLR_IPI.AsFloat:= fdsNFeICMS_Vlr_IPI.AsFloat+ cdsNFe_ItemICMS_VIPI.AsFloat;
    fdsNFeICMS_ALQ_IPI.AsFloat:=fdsNFeICMS_ALQ_IPI.AsFloat+cdsNFe_ItemICMS_ALIQIPI.AsFloat;
    fdsNFeVLR_DESCONTO.AsFloat := fdsNFeVLR_DESCONTO.AsFloat +(cdsNFe_ItemVLR_DESCONTO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFeVLR_TOTITEM.AsFloat := fdsNFeVLR_TOTITEM.AsFloat +(cdsNFe_ItemVLR_UNITARIO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat +cdsNFe_ItemVLR_TOTAL.AsFloat+ cdsNFe_ItemICMS_VIPI.AsFloat;
    fdsNFeICMS_VBC.AsFloat := fdsNFeICMS_VBC.AsFloat +cdsNFe_ItemICMS_BCALC.AsFloat;
    fdsNFeICMS_VLR.AsFloat := fdsNFeICMS_VLR.AsFloat +cdsNFe_ItemICMS_VLR.AsFloat;
  end;
end;

procedure TfrmNfe.cdsNFe_ItemBeforeEdit(DataSet: TDataSet);
begin
  if permiteEdicao = true then
  begin
    if fdsNFe.State in [dsInsert, dsEdit] then
    begin
      pesoTotal := pesoTotal -
        (cdsNFe_ItemPESO.AsFloat * cdsNFe_ItemQTN.AsFloat);
      fdsNFePESO.AsFloat := pesoTotal;
      fdsNFeICMS_ST_VLR.AsFloat := fdsNFeICMS_ST_VLR.AsFloat - cdsNFe_ItemICMS_ST_VLR.AsFloat;
      fdsNFeICMS_ST_VBC.AsFloat := fdsNFeICMS_ST_VBC.AsFloat - cdsNFe_ItemICMS_ST_VBC.AsFloat;
      fdsNFeVLR_DESCONTO.AsFloat := fdsNFeVLR_DESCONTO.AsFloat -
        (cdsNFe_ItemVLR_DESCONTO.AsFloat * cdsNFe_ItemQTN.AsFloat);
      fdsNFeVLR_TOTITEM.AsFloat := fdsNFeVLR_TOTITEM.AsFloat -
        (cdsNFe_ItemVLR_UNITARIO.AsFloat * cdsNFe_ItemQTN.AsFloat);
      fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat - cdsNFe_ItemVLR_TOTAL.AsFloat - cdsNFe_ItemICMS_VIPI.AsFloat;
      fdsNFeICMS_VBC.AsFloat := fdsNFeICMS_VBC.AsFloat - cdsNFe_ItemICMS_BCALC.AsFloat;
      fdsNFeICMS_VLR.AsFloat := fdsNFeICMS_VLR.AsFloat - cdsNFe_ItemICMS_VLR.AsFloat;
      fdsNFeICMS_VLR_IPI.AsFloat:= fdsNFeICMS_Vlr_IPI.AsFloat - cdsNFe_ItemICMS_VIPI.AsFloat;
      fdsNFeICMS_ALQ_IPI.AsFloat:=fdsNFeICMS_ALQ_IPI.AsFloat-cdsNFe_ItemICMS_ALIQIPI.AsFloat;
    end;
  end;
end;

procedure TfrmNfe.cdsNFe_ItemReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
 raise Exception.Create(E.Message);
end;

procedure TfrmNfe.chkClienteClick(Sender: TObject);
begin
  pnlCliente.Enabled := chkCliente.Checked;
  if not(chkCliente.Checked) then
  begin
    edtPesqCliente.Text := 'TODOS';
    edtClienteCodigo.Text := 'C�DIGO';
    edtPesqCliente.Font.Color := clGray;
    btnPesqClientes.Enabled := False;
    btnPesquisar.Click;
  end
  else
  begin
    edtPesqCliente.Font.Color := clBtnText;
    edtClienteCodigo.SetFocus;
    btnPesqClientes.Enabled := true;
  end;
end;

procedure TfrmNfe.chkNumVendaClick(Sender: TObject);
begin
  pnlNumVenda.Enabled := chkNumVenda.Checked;
  if not(chkNumVenda.Checked) then
  begin
    edtPesqNumVenda.Text := 'TODOS';
    edtPesqNumVenda.Font.Color := clGray;
    btnPesquisar.Click;
  end;
end;

procedure TfrmNfe.chkPeriodoClick(Sender: TObject);
begin
  pnlPeriodo.Enabled := chkPeriodo.Checked;
end;

procedure TfrmNfe.ControlaBtnsItens;
begin
  btnItemCancelar.Enabled := alterandoIten;
  btnItemGravar.Enabled := alterandoIten;
  btnInfoAdicional.Enabled := alterandoIten;
  btnItensIncluir.Enabled := not(alterandoIten);
  btnIncItensVenda.Enabled := not(alterandoIten);
  btnItemAlterar.Enabled := not(alterandoIten);
  btnItemExcluir.Enabled := not(alterandoIten);
  gdrItens.Enabled := not(alterandoIten);
  alterandoIten := not(alterandoIten);
  RzGroupBox1.Enabled := alterandoIten;
end;

procedure TfrmNfe.ControlaCamposDevolucao;
var
 i:SmallInt;
begin
 if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
 begin
   for i := 0 to ComponentCount -1 do
   begin
     if ((Components[i] is TRzDBEdit)) then
     begin
       if Components[i].Tag = 5 then
       begin
       TRzDBEdit(Components[i]).Enabled := True;
       TRzDBEdit(Components[i]).TabStop := False;
       TRzDBEdit(Components[i]).Color := clInfoBk;
       end;
     end;
   end;
 end
 else
 begin
   for i := 0 to ComponentCount -1 do
   begin
     if ((Components[i] is TRzDBEdit)) then
     begin
       if Components[i].Tag = 5 then
       begin
        TRzDBEdit(Components[i]).Enabled := False;
       end;
     end;
   end;
 end;
end;

procedure TfrmNfe.EditaInsere;
var
  i: SmallInt;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).ActivePageIndex := 1;
      TRzPageControl(Components[i]).Pages[0].TabVisible := False;
    end;

    if ((Components[i] is TRzBitBtn)) then
    begin
      if Components[i].Tag = 1 then
        TRzBitBtn(Components[i]).Enabled := False
      else
        TRzBitBtn(Components[i]).Enabled := true;
    end;
    if ((Components[i] is TRzDBLookupComboBox)) then
    begin
      if Components[i].Tag = 1 then
        TRzDBLookupComboBox(Components[i]).ReadOnly := False
      else
        TRzDBLookupComboBox(Components[i]).ReadOnly := true;
    end;
    if ((Components[i] is TRzDBComboBox)) then
    begin
      if Components[i].Tag = 1 then
        TRzDBComboBox(Components[i]).ReadOnly := False
      else
        TRzDBComboBox(Components[i]).ReadOnly := true;
    end;
  end;
  // cdsItensPedido.Close;

  cbxTipoFrete.ReadOnly := False;
  ControlaBtnsItens;
  idNfe := fdsNFeID.AsInteger;
  DT_NF_DEVOLVIDA := Now;
  cdsNF_Devolvidas.Open;

end;

procedure TfrmNfe.edtAliqIcmsExit(Sender: TObject);
begin
  if cdsNFe_Item.State in [dsInsert, dsEdit] then
  begin
    if (fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VE')then
    begin
     cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(cdsNFe_ItemICMS_BCALC.AsFloat,cdsNFe_ItemICMS_ALIQ.AsFloat);
    end;
  end;
end;

procedure TfrmNfe.edtAliqIPIExit(Sender: TObject);
var
valorTotal:Currency;
begin
  if cdsNFe_Item.State in [dsInsert, dsEdit] then
  begin
   //calsulando Impostos
    valorTotal:=(cdsNFe_ItemVLR_UNITARIO.AsFloat * cdsNFe_ItemQTN.AsFloat);
    cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQIPI.AsFloat);
  end;
end;

procedure TfrmNfe.edtBcIcmsExit(Sender: TObject);
begin
 if cdsNFe_Item.State in [dsInsert, dsEdit] then
 begin
  cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(cdsNFe_ItemICMS_BCALC.AsFloat,cdsNFe_ItemICMS_ALIQ.AsFloat);
 end;
end;

procedure TfrmNfe.edtClienteCodigoEnter(Sender: TObject);
begin
  if Trim(edtClienteCodigo.Text) = 'C�DIGO' then
  begin
    edtClienteCodigo.Text := EmptyStr;
    edtClienteCodigo.Font.Color := clBlack;
  end;
end;

procedure TfrmNfe.edtClienteCodigoExit(Sender: TObject);
begin
  if Trim(edtClienteCodigo.Text) = EmptyStr then
  begin
    edtClienteCodigo.Text := 'C�DIGO';
    edtClienteCodigo.Font.Color := clGray;
  end
  else
  begin
    RetornaClienteId(edtClienteCodigo.Text);
    if fdsCliente.RecordCount = 0 then
      btnPesqClientes.Click
    else
    begin
      edtPesqCliente.Text := fdsClienteNOME.AsString;
      btnPesquisar.Click;
    end;
  end;
end;

procedure TfrmNfe.edtClienteCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    btnPesqClientes.SetFocus;
  end;
end;

procedure TfrmNfe.edtFreteEnter(Sender: TObject);
begin
  if fdsNFe.State in [dsEdit, dsInsert] then
  begin
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat -
      fdsNFeVLR_FRETE.AsFloat;
  end;
end;

procedure TfrmNfe.edtFreteExit(Sender: TObject);
begin
  if fdsNFe.State in [dsEdit, dsInsert] then
  begin
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat +
      fdsNFeVLR_FRETE.AsFloat;
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString ='VD' then
    begin
      vlr_fretTemp := 0;
      vlrOutras_Despesas := 0;

      cdsNFe_Item.First;
      while not(cdsNFe_Item.Eof) do
      begin
       RateioNosItens(fdsNFeVLR_TOTITEM.AsFloat);
        cdsNFe_Item.Next;
      end;
    end;

  end;
end;

procedure TfrmNfe.edtItemCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    PesquisarItem;
  end;
end;

procedure TfrmNfe.edtItemCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PesquisarItem;
  end;
end;

procedure TfrmNfe.edtOutrasDespesasEnter(Sender: TObject);
begin
  if fdsNFe.State in [dsInsert, dsEdit] then
  begin
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat -
      fdsNFeOUTRAS_DESPESAS.AsFloat;
  end;
end;

procedure TfrmNfe.edtOutrasDespesasExit(Sender: TObject);
begin
  if fdsNFe.State in [dsInsert, dsEdit] then
  begin
    fdsNFeVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat +
      fdsNFeOUTRAS_DESPESAS.AsFloat;
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString ='VD' then
    begin
      vlr_fretTemp := 0;
      vlrOutras_Despesas := 0;
      cdsNFe_Item.First;
      while not(cdsNFe_Item.Eof) do
      begin
       RateioNosItens(fdsNFeVLR_TOTITEM.AsFloat);
        cdsNFe_Item.Next;
      end;
    end;

  end;
end;

procedure TfrmNfe.edtPesqClienteEnter(Sender: TObject);
begin
  if Trim(edtPesqCliente.Text) = 'TODOS' then
  begin
    edtPesqCliente.Text := EmptyStr;
    edtPesqCliente.Font.Color := clBlack;
  end;
end;

procedure TfrmNfe.edtPesqClienteExit(Sender: TObject);
begin
  if Trim(edtPesqCliente.Text) = EmptyStr then
  begin
    edtPesqCliente.Text := 'TODOS';
    edtPesqCliente.Font.Color := clGray;
  end;
end;

procedure TfrmNfe.edtPesqNumVendaEnter(Sender: TObject);
begin
  if Trim(edtPesqNumVenda.Text) = 'TODOS' then
  begin
    edtPesqNumVenda.Text := EmptyStr;
    edtPesqNumVenda.Font.Color := clBlack;
  end;
end;

procedure TfrmNfe.edtPesqNumVendaExit(Sender: TObject);
begin
  if Trim(edtPesqNumVenda.Text) = EmptyStr then
  begin
    edtPesqNumVenda.Text := 'TODOS';
    edtPesqNumVenda.Font.Color := clGray;
  end
  else
    btnPesquisar.Click;
end;

procedure TfrmNfe.edtQtnItemExit(Sender: TObject);
begin
  if cdsNFe_Item.State in [dsInsert, dsEdit] then
  begin
    {if (fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VD') then
    begin
     //calsulando Impostos
      cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(cdsNFe_ItemVLR_UNITARIO.AsFloat,cdsNFe_ItemICMS_ALIQ.AsFloat)* cdsNFe_ItemQTN.AsFloat;
      cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(cdsNFe_ItemVLR_UNITARIO.AsFloat,cdsNFe_ItemICMS_ALIQIPI.AsFloat)* cdsNFe_ItemQTN.AsFloat;
    end;}
  end;
end;

procedure TfrmNfe.EmitirNFAe;
var
  tempIdNF, idFilialTemp: string;
begin
  if fdsNFe.RecordCount > 0 then
  begin
    if (fdsNFeORIGEM_PEDIDO_VENDA.AsString <> 'PD') and
      (fdsNFeORIGEM_PEDIDO_VENDA.AsString <> 'VE') then
    begin
      if (fdsNFeSTATUS.AsString = 'AB') and (fdsNFeIDFORMA_PAG.AsInteger <> 11)
      then
      begin
        if fdsNFeIDFORMA_PAG.AsInteger <> 1 then
          ShowFinalizacaoVenda;
      end;
    end;

    tempIdNF := fdsNFeID.AsString;
    idFilialTemp := fdsNFeIDFILIAL.AsString;
    cdsNF_Devolvidas.Open;
    // 7896050500019
    // ACBrNFe1.Configuracoes.Certificados.NumeroSerie := ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;  vitor ver isso para multiplos certificados

    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('IDNF', 'NF.ID = ' + tempIdNF, true);
      Conditions.AddCondition('IDFILIAL', 'NF.IDFILIAL = ' +
        idFilialTemp, true);
      Conditions.Apply;
      Prepare;
      Open;
    end;
    RetornaItensNF;

    RetornaChaveNFsDevolver;

    try
      frmStatusNFe := TfrmStatusNFe.Create(nil);
      frmStatusNFe.param := 'EmitirNFAE';
      frmStatusNFe.ShowModal;
    finally
      if frmStatusNFe.ModalResult = mrOk then
      begin
        fdsNFe_Item.First;

        while not(fdsNFe_Item.Eof) do
        begin
          if fdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString <> 'PD' then
          begin
            with qryComand do
            begin
              Close;
              SQL.Clear;
              SQL.Add('EXECUTE PROCEDURE gera_mov_item(' +
                fdsNFe_ItemIDPROD_ITEM.AsString + ', ' +
                fdsNFe_ItemIDFILIAL.AsString + ', ' +
                QuotedStr(FormatDateTime('MM/DD/YYYY',
                fdsNFe_ItemDT_INC.AsDateTime)) + ', ' + QuotedStr('NOTA FISCAL')
                + ', ' + fdsNFe_ItemIDNFE.AsString + ', ' + QuotedStr('S') +
                ', ' + fdsNFe_ItemQTN.AsString + ', ' +
                fdsNFe_ItemIDFILIAL.AsString + ')');
              Prepare;
              ExecQuery;
            end;
            transNFe.CommitRetaining;
          end;
          fdsNFe_Item.Next;
        end;
      end;
      frmStatusNFe.Free;
    end;

    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.Apply;
      Prepare;
      Open;
      Locate('ID', tempIdNF, []);
    end;

    case rgbStatus.ItemIndex of
      0:
        pesquisar('AB');
      1:
        pesquisar('NT');
      2:
        pesquisar('ER');
      3:
        pesquisar('CL');
      4:
        pesquisar('OF');
      5:
        pesquisar('IN');
    end;
    tbsTabela.Show;
  end;
end;

procedure TfrmNfe.EmitirNFe;
var
  tempIdNF, idFilialTemp: string;
begin
  if fdsNFe.RecordCount > 0 then
  begin
    if (fdsNFeORIGEM_PEDIDO_VENDA.AsString <> 'PD') and
      (fdsNFeORIGEM_PEDIDO_VENDA.AsString <> 'VE') then
    begin
      if (fdsNFeSTATUS.AsString = 'AB') and (fdsNFeIDFORMA_PAG.AsInteger <> 11)
      then
      begin
        if fdsNFeIDFORMA_PAG.AsInteger <> 1 then
          ShowFinalizacaoVenda;
      end;
    end;

    tempIdNF := fdsNFeID.AsString;
    idFilialTemp := fdsNFeIDFILIAL.AsString;
    cdsNF_Devolvidas.Open;
    // 7896050500019
    // ACBrNFe1.Configuracoes.Certificados.NumeroSerie := ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;  vitor ver isso para multiplos certificados

    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('IDNF', 'NF.ID = ' + tempIdNF, true);
      Conditions.AddCondition('IDFILIAL', 'NF.IDFILIAL = ' +
        idFilialTemp, true);
      Conditions.Apply;
      Prepare;
      Open;
    end;
    RetornaItensNF;

    RetornaChaveNFsDevolver;

    try
      frmStatusNFe := TfrmStatusNFe.Create(nil);
      frmStatusNFe.param := 'EMITIR';
      frmStatusNFe.ShowModal;
    finally
      if frmStatusNFe.ModalResult = mrOk then
      begin
        // fdsNFe.Edit;
        // //  fdsNFeSTATUS.AsString := statusTemp;
        // fdsNFeCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID;
        // fdsNFeNUMERO_PROTOCOLO.AsString := frmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
        // fdsNFe.Post;
        // transNFe.CommitRetaining;

        fdsNFe_Item.First;

        while not(fdsNFe_Item.Eof) do
        begin
          if (fdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString <> 'PD') or
            (fdsNFe_ItemORIGEM_VENDA_PEDIDO.AsString <> 'VE') then
          begin
            with qryComand do
            begin
              Close;
              SQL.Clear;
              SQL.Add('EXECUTE PROCEDURE gera_mov_item(' +
                fdsNFe_ItemIDPROD_ITEM.AsString + ', ' +
                fdsNFe_ItemIDFILIAL.AsString + ', ' +
                QuotedStr(FormatDateTime('MM/DD/YYYY',
                fdsNFe_ItemDT_INC.AsDateTime)) + ', ' + QuotedStr('NOTA FISCAL')
                + ', ' + fdsNFe_ItemIDNFE.AsString + ', ' + QuotedStr('S') +
                ', ' + fdsNFe_ItemQTN.AsString + ', ' +
                fdsNFe_ItemIDFILIAL.AsString + ')');
              Prepare;

              // SQL.Add('EXECUTE PROCEDURE gera_mov_item(' +  fdsNFe_ItemIDPROD_ITEM.AsString + ', ' + fdsNFe_ItemIDFILIAL.AsString + ', ' +
              // QuotedStr(FormatDateTime('MM/DD/YYYY',fdsNFe_ItemDT_INC.AsDateTime)) + ', ' + QuotedStr('NOTA FISCAL') +
              // ', ' + fdsNFe_ItemIDNFE.AsString + ', ' + QuotedStr('S') + ', ' + fdsNFe_ItemQTN.AsString + ', ' + fdsNFe_ItemIDFILIAL.AsString + ')');
              // Prepare;
              ExecQuery;
            end;
            transNFe.CommitRetaining;
          end;
          fdsNFe_Item.Next;
        end;
      end;
      frmStatusNFe.Free;
    end;

    with fdsNFe do
    begin
      Close;
      cdsNFe_Item.Close;
      Conditions.Clear;
      Conditions.Apply;
      Prepare;
      Open;
      Locate('ID', tempIdNF, []);
    end;

    case rgbStatus.ItemIndex of
      0:
        pesquisar('AB');
      1:
        pesquisar('NT');
      2:
        pesquisar('ER');
      3:
        pesquisar('CL');
      4:
        pesquisar('OF');
      5:
        pesquisar('IN');
    end;
    tbsTabela.Show;
  end;
end;

procedure TfrmNfe.fdsNFeAfterScroll(DataSet: TDataSet);
begin
  if (pgcControl.ActivePageIndex = 1) then
  begin
    RetornaItensNF;
    RetornaChaveNFsDevolver;
  end;

  if (fdsNFeSTATUS.AsString = 'NF') then
  begin
    EmitirNotaFiscalEletrnica1.Enabled := False;
    InutilizarNumerao1.Enabled := False;
    ImprimirDANFE1.Enabled := true;
    nfeCancelar1.Enabled := true;
    btnAlterar.Enabled := False;
    btnDelete.Enabled := False;
    CartadeCorreo1.Enabled := true;
    cbxNatOperacao.ReadOnly := true;
    edtFrete.ReadOnly := true;
    edtOutrasDespesas.ReadOnly := true;
  end
  else
  begin
    EmitirNotaFiscalEletrnica1.Enabled := true;
    InutilizarNumerao1.Enabled := true;
    ImprimirDANFE1.Enabled := False;
    nfeCancelar1.Enabled := False;
    btnAlterar.Enabled := true;
    btnDelete.Enabled := true;
    CartadeCorreo1.Enabled := False;
    cbxNatOperacao.ReadOnly := False;
    edtFrete.ReadOnly := False;
    edtOutrasDespesas.ReadOnly := False;
  end;

  if fdsNFeSTATUS.AsString = 'IN' then
  begin
    btnAlterar.Enabled := False;
    btnDelete.Enabled := False;
    InutilizarNumerao1.Enabled := False;
    EmitirNotaFiscalEletrnica1.Enabled := False;
  end;

  if fdsNFeSTATUS.AsString = 'CL' then
  begin
    btnAlterar.Enabled := False;
    btnDelete.Enabled := False;
    EmitirNotaFiscalEletrnica1.Enabled := False;
    InutilizarNumerao1.Enabled := False;
  end;

  if fdsNFeSTATUS.AsString = 'OF' then
  begin
    btnAlterar.Enabled := False;
    btnDelete.Enabled := False;
    EmitirNotaFiscalEletrnica1.Enabled := true;
  end;
  if fdsNFeSTATUS.AsString = 'AB' then
  begin
    btnDelete.Enabled := true;
    InutilizarNumerao1.Enabled := False;
  end;
end;

procedure TfrmNfe.Fechar;
var
  mensagem: string;
begin
  if fdsNFe.State in [dsInsert, dsEdit] then
  begin
    case fdsNFe.State of
      dsInsert:
        begin
          mensagem :=
            'Salve ou Cancele a Inclus�o da Nota Fiscal antes de sair.'
        end;
      dsEdit:
        begin
          mensagem :=
            'Salve ou Cancele a Altera��o da Nota Fiscal antes de sair.'
        end;
    end;
    Application.MessageBox(pWideChar(mensagem), 'Aten��o',
      MB_OK + MB_ICONWARNING);
    Abort;
  end
  else
  begin
    FreeAndNil(frmNfe);
  end;
end;

procedure TfrmNfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fechar;
end;

procedure TfrmNfe.FormCreate(Sender: TObject);
begin
  dtpInicio.Date := StartOfTheYear(Date);
  tbsTabela.Show;
  // fdsNFe.Open;
  pesquisar('AB');
  fdsNatOperacao.Open;
  fdsNatOperacao.Last;
  fdsNatOperacao.First;

end;

procedure TfrmNfe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Fechar;
end;

procedure TfrmNfe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TfrmNfe.FormShow(Sender: TObject);
begin
  lblTotal.Caption := intToStr(fdsNFe.RecordCount);
end;

procedure TfrmNfe.gdrItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(cdsNFe_Item.RecNo) then
  begin
    gdrItens.Canvas.Brush.Color := DM.gridOddColor;
    gdrItens.Canvas.FillRect(Rect);
    gdrItens.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmNfe.gdrNotasDblClick(Sender: TObject);
begin
  if fdsNFe.RecordCount > 0 then
  begin
    Clipboard.AsText := fdsNFeCHAVE_CONSULTA.AsString;
  end;
end;

procedure TfrmNfe.gdrNotasDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
     gdrNotas.Canvas.Brush.Color := clWhite;
  if not odd(fdsNFe.RecNo) then
  begin
    gdrNotas.Canvas.Brush.Color := DM.gridOddColor;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if fdsNFeSTATUS.AsString = 'CF' then
  begin
    gdrNotas.Canvas.Font.Color := clGreen;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if fdsNFeSTATUS.AsString = 'NF' then
  begin
    gdrNotas.Canvas.Font.Color := clGreen;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if fdsNFeSTATUS.AsString = 'CL' then
  begin
    gdrNotas.Canvas.Font.Color := $000080FF;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  if (fdsNFeSTATUS.AsString = 'OF') then
  begin
    gdrNotas.Canvas.Font.Color := clBlue;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  if fdsNFeSTATUS.AsString = 'ER' then
  begin
    gdrNotas.Canvas.Font.Color := clRed;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if fdsNFeSTATUS.AsString = 'IN' then
  begin
    gdrNotas.Canvas.Font.Color := clPurple;
    gdrNotas.Canvas.FillRect(Rect);
    gdrNotas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmNfe.GeraNotaAVista;
begin

end;

procedure TfrmNfe.GeraParcelaCartao(prefixo: string; parcelas: Integer;
  vlrParcelar: Double);
begin

end;

procedure TfrmNfe.GeraParcelaCheque(prefixo: string; parcelas: Integer;
  vlrParcelar: Double);
begin

end;

procedure TfrmNfe.GerarDocumentos;
begin

end;

procedure TfrmNfe.GravaCancela;
var
  i: SmallInt;
  utils: TUtils;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).Pages[0].TabVisible := true;
      TRzPageControl(Components[i]).ActivePageIndex := 0;
    end
    else
    begin
      if ((Components[i] is TRzBitBtn)) then
      begin
        if Components[i].Tag = 1 then
          TRzBitBtn(Components[i]).Enabled := true
        else
          TRzBitBtn(Components[i]).Enabled := False;
      end
      else
      begin
        if Components[i].Tag = 15 then
        begin
          if (Components[i] is TRzEdit) then
            utils.ResetColorCampo(TRzDBEdit(Components[i]), true)
          else
            utils.ResetColorCampo(TRzDBEdit(Components[i]), False);
        end;
      end;
//      if ((Components[i] is TRzDBLookupComboBox)) then
//      begin
//        if Components[i].Tag = 1 then
//          TRzDBLookupComboBox(Components[i]).ReadOnly := False
//        else
//          TRzDBLookupComboBox(Components[i]).ReadOnly := true;
//      end;
//      if ((Components[i] is TRzDBComboBox)) then
//      begin
//        if Components[i].Tag = 1 then
//          TRzDBComboBox(Components[i]).ReadOnly := False
//        else
//          TRzDBComboBox(Components[i]).ReadOnly := true;
//      end;
    end;
  end;

  cbxTipoFrete.ReadOnly := true;
  alterandoIten := False;
  rgbStatus.ItemIndex := 0;
  tbsTabela.Show;
  fdsNFe.Locate('ID', idNfe, []);
  lblTotal.Caption := intToStr(fdsNFe.RecordCount);

end;

procedure TfrmNfe.GravaCntReceber(valorTotal: Double; parcelasTotal: string;
  idFormaPag: Integer);
begin

end;

procedure TfrmNfe.GravaCntReceberItem(prefixo, parcela: string; dtVenc: TDate;
  valor: Double);
begin

end;

procedure TfrmNfe.ImprimirDANFE;
var
  tempIdNF, idFilialTemp: string;
begin
  tempIdNF := fdsNFeID.AsString;
  idFilialTemp := fdsNFeIDFILIAL.AsString;

  with fdsNFe do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('IDNF', 'NF.ID = ' + tempIdNF, true);
    Conditions.AddCondition('IDFILIAL', 'NF.IDFILIAL = ' + idFilialTemp, true);
    Conditions.Apply;
    Prepare;
    Open;
  end;

  RetornaItensNF;

  try
    frmStatusNFe := TfrmStatusNFe.Create(nil);
    frmStatusNFe.param := 'ImprimirDANFE';
    frmStatusNFe.lblRetorno.Caption := 'Aguarde reimprimindo DANFE';
    frmStatusNFe.ShowModal;
  finally
    frmStatusNFe.Free;
    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.Apply;
      Prepare;
      Open;
      Locate('ID', tempIdNF, []);
    end;
    tbsTabela.Show;
  end;
end;

procedure TfrmNfe.nfeCancelarExecute(Sender: TObject);
begin
  CancelarNFe;
end;

procedure TfrmNfe.nfeCartaCorrecaoExecute(Sender: TObject);
begin
  CartaCorrecao;
end;

procedure TfrmNfe.NFeClick(Sender: TObject);
var
 uVerificaPermicao: TVerificaPermicao;
begin
  if (uVerificaPermicao.Verifica('ADM_NFE_EMITIR') = True) then
  begin
    ppmNfe.Popup(frmNfe.Left + 510, frmNfe.top + 660);
  end
  else
    TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o.','Aten��o','I',[mbOk]);
end;

procedure TfrmNfe.nfeEmitirExecute(Sender: TObject);
begin
  EmitirNFe;
end;

procedure TfrmNfe.nfeEmitirNFAeExecute(Sender: TObject);
begin
  EmitirNFAe;
end;

procedure TfrmNfe.nfeImprimirExecute(Sender: TObject);
begin
  ImprimirDANFE;
end;

procedure TfrmNfe.nfeInutilizarNumExecute(Sender: TObject);
var
  numInicial, numFinal, modelo, serie: Integer;
  justificativa: string;
  tempIdNF, idFilialTemp: string;
begin
  if fdsNFe.RecordCount > 0 then
  begin
    tempIdNF := fdsNFeID.AsString;
    idFilialTemp := fdsNFeIDFILIAL.AsString;

    cdsNF_Devolvidas.Open;

    // ACBrNFe1.Configuracoes.Certificados.NumeroSerie := ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;  vitor ver isso para multiplos certificados

    with fdsNFe do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('IDNF', 'NF.ID = ' + tempIdNF, true);
      Conditions.AddCondition('IDFILIAL', 'NF.IDFILIAL = ' +
        idFilialTemp, true);
      Conditions.Apply;
      Prepare;
      Open;
    end;
    Try
      frmInutilizarNFe := TfrmInutilizarNFe.Create(nil);
      frmInutilizarNFe.ShowModal;
    Finally
      if frmInutilizarNFe.ModalResult = mrOk then
      begin
        if (frmInutilizarNFe.rbxModelo.ItemIndex = 0) then
          modelo := 55;

        if (frmInutilizarNFe.rbxModelo.ItemIndex = 1) then
          modelo := 65;

        numInicial := fdsNFeCODIGO_NFE.AsInteger;
        numFinal := fdsNFeCODIGO_NFE.AsInteger;
        serie := StrToInt(frmInutilizarNFe.edtSerie.Text);

        justificativa := frmInutilizarNFe.mmoJustificativa.Text;

        try
          frmStatusNFe := TfrmStatusNFe.Create(nil);
          frmStatusNFe.param := 'INUTILIZAR';
          frmStatusNFe.serie := serie;
          frmStatusNFe.modelo := modelo;
          frmStatusNFe.numInicial := numInicial;
          frmStatusNFe.numFinal := numFinal;
          frmStatusNFe.justificativa := justificativa;
          frmStatusNFe.lblRetorno.Caption := 'Aguarde inutilizando numera��o';
          frmStatusNFe.ShowModal;
        finally
          frmStatusNFe.Free;
        end;
      end;
    end;
  End;

end;

procedure TfrmNfe.pagDinheiroExecute(Sender: TObject);
var
  utils: TUtils;
begin
  // edtDinheiro.Text :=FloatToStr(utils.ValidaInteiroFloat(edtDinheiro.Text, 'F'));
  // valorDinheiro := StrToFloat(edtDinheiro.Text);
  // edtDinheiro.Text := utils.AdicionaMascaraDinheiro(edtDinheiro.Text);
end;

procedure TfrmNfe.pesquisar(tipo: String);
var
  utils: TUtils;
  numVenda: Double;
begin
  fdsNFe_Item.Close;
  tbsTabela.Show;

  with fdsNFe do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('TIPO', 'NF.STATUS = ' + QuotedStr(tipo), true);

    if (chkNumVenda.Checked) then
    begin
      numVenda := utils.ValidaInteiroFloat(edtPesqNumVenda.Text, 'I');

      if numVenda > 0 then
        Conditions.AddCondition('CODIGO', ' NF.CODIGO_NFE = ' +
          QuotedStr(FloatToStr(numVenda)), true);
    end;

    if chkPeriodo.Checked then
      Conditions.AddCondition('DTVENDA', 'NF.DT_INC BETWEEN ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), true);

    if (chkCliente.Checked) and not(Trim(edtPesqCliente.Text) = 'TODOS') then
    begin
      RetornaIDCliente(Trim(edtPesqCliente.Text));
      if fdsCliente.RecordCount > 0 then
        Conditions.AddCondition('IDCLIENTE', 'NF.IDCLIENTE = ' +
          fdsClienteID.AsString, true)
      else
        Conditions.AddCondition('IDCLIENTE', 'NF.IDCLIENTE = 0', true);
    end;

    Conditions.Apply;
    OrderClause := 'NF.DT_INC DESC, NF.CODIGO_NFE DESC';
    Prepare;
    // SelectSQl.SaveToFile('D:\Teste.txt');
    Open;
  end;
  lblTotal.Caption := intToStr(fdsNFe.RecordCount);
end;

procedure TfrmNfe.PesquisaCFOPItem(idItem: Integer);
begin
  with qrySql do
  begin
    Close;
    SQL.Clear;
    qrySql.SQL.Add
      ('select CFOP, CSOSN from produto_item I, produto p where  I.id = :idItem  and P.id = I.idproduto');
    ParamByName('idItem').AsInteger := idItem;
    Prepare;
    ExecQuery;
  end;
  if qrySql.RecordCount > 0 then
  BEGIN
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VD' then
      CFOP_NOVO := qrySql.FieldByName('CFOP').AsString;

    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
      CST_CSOSN_NOVO := '900'
    else
      CST_CSOSN_NOVO := qrySql.FieldByName('CSOSN').AsString;

  END;
end;

procedure TfrmNfe.PesquisarItem;
var
valor:Currency;
begin
  if cdsNFe_Item.State in [dsInsert, dsEdit] then
  begin
    with qrySql do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT PI.*, P.CFOP, P.CSOSN,P.IBPT_NACIONA_FEDERAL,P.IBPT_ESTADUAL,P.IBPT_MUNICIPAL, P.INFO_ADICIONAL, PIE.PREC_VENDA,CEST,ALIQ_ICMS,ALQ_IPI,CST_PIS,CST_COFINS,FCP,P.IDGRUPO');
      SQL.Add('FROM PRODUTO_ITEM PI, PRODUTO P, PRODUTO_ITEM_ESTOQUE PIE ');
      SQL.Add('WHERE P.ID = PI.IDPRODUTO AND ');

      if rgbEan.Checked=true then
      SQL.Add('PI.COD_FABRICA = :COD_FABRICA');
      if rgbFab.Checked = true then
      SQL.Add('PI.COD_FABRICANTE = :COD_FABRICA');
      if rgbRef.Checked = true then
      SQL.Add('PI.REFERENCIA = :COD_FABRICA');

      SQL.Add('AND PIE.IDITEM = PI.ID AND PIE.IDFILIAL = :IDFILIAL');
      ParamByName('COD_FABRICA').AsString := edtItemCodigo.Text;
      ParamByName('IDFILIAL').AsString := DM.fdsConfigIDFILIAL.AsString;
      Prepare;
      ExecQuery;
    end;

    if qrySql.RecordCount = 0 then
    begin
      Try
        frmPesqProdutoItens := TfrmPesqProdutoItens.Create(nil);
        frmPesqProdutoItens.ShowModal;
      Finally
        if frmPesqProdutoItens.ModalResult = mrOk then
        begin
          cdsNFe_ItemIDPROD_ITEM.AsInteger :=
            frmPesqProdutoItens.fdsProdutoItensID.AsInteger;
          cdsNFe_ItemIDGRUPO.AsInteger:= frmPesqProdutoItens.fdsProdutoItensIDGRUPO.AsInteger;
          cdsNFe_ItemVLR_UNITARIO.AsFloat :=
            frmPesqProdutoItens.fdsProdutoItensPREC_VENDA.AsFloat;
          cdsNFe_ItemPESO.AsFloat :=
            frmPesqProdutoItens.fdsProdutoItensPESO.AsFloat;
          cdsNFe_ItemPRODUTO.AsString :=
            frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
          cdsNFe_ItemCOD_FABRICA.AsString :=
            frmPesqProdutoItens.fdsProdutoItensCOD_FABRICA.AsString;
          cdsNFe_ItemINFO_ADICIONAL.AsString :=
            frmPesqProdutoItens.fdsProdutoItensINFO_ADICIONAL.AsString;
          cdsNFe_ItemPRECO_CUSTO.AsFloat :=
            frmPesqProdutoItens.fdsProdutoItensPREC_CUSTO.AsFloat;
          cdsNFe_ItemPREC_CUSTO_MEDIO.AsFloat :=
            frmPesqProdutoItens.fdsProdutoItensPREC_CUSTO_MEDIO.AsFloat;
          cdsNFe_ItemCST_PIS.AsString := frmPesqProdutoItens.fdsProdutoItensCST_PIS.AsString;
          cdsNFe_ItemCST_COFINS.AsString := frmPesqProdutoItens.fdsProdutoItensCST_COFINS.AsString;
          cdsNFe_ItemIBPT_NACIONA_FEDERAL.AsFloat :=frmPesqProdutoItens.fdsProdutoItensIBPT_NACIONA_FEDERAL.AsFloat;
          cdsNFe_ItemIBPT_ESTADUAL.AsFloat :=frmPesqProdutoItens.fdsProdutoItensIBPT_ESTADUAL.AsFloat;
          cdsNFe_ItemIBPT_MUNICIPAL.AsFloat :=frmPesqProdutoItens.fdsProdutoItensIBPT_MUNICIPAL.AsFloat;
          cdsNFe_ItemCEST.AsString := frmPesqProdutoItens.fdsProdutoItensCEST.AsString;
          cdsNFe_ItemFCP.AsFloat := frmPesqProdutoItens.fdsProdutoItensFCP.AsFloat;

          //calc fret e outras Desp
          if fdsNFeVLR_FRETE.AsFloat>0 then
          begin
            cdsNFe_ItemVLR_FRETE.AsFloat := fdsNFeVLR_FRETE.AsFloat *(RoundTo(cdsNFe_ItemVLR_UNITARIO.AsFloat / (fdsNFeVLR_TOTITEM.AsFloat+cdsNFe_ItemVLR_UNITARIO.AsFloat), -2));
          end;
          if fdsNFeOUTRAS_DESPESAS.AsFloat>0 then
          begin
            cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat := fdsNFeOUTRAS_DESPESAS.AsFloat *(RoundTo(cdsNFe_ItemVLR_UNITARIO.AsFloat / (fdsNFeVLR_TOTITEM.AsFloat+cdsNFe_ItemVLR_UNITARIO.AsFloat), -2));
          end;

          if (fdsNatOperacaoCAT_SAIDA_CFOP.AsString ='VD') then
          begin
           cdsNFe_ItemICMS_ALIQ.AsFloat:= frmPesqProdutoItens.fdsProdutoItensALIQ_ICMS.AsFloat;
           cdsNFe_ItemICMS_ALIQIPI.AsFloat:=frmPesqProdutoItens.fdsProdutoItensALQ_IPI.AsFloat;

           cdsNFe_ItemICMS_BCALC.AsFloat := frmPesqProdutoItens.fdsProdutoItensPREC_VENDA.AsFloat+cdsNFe_ItemVLR_FRETE.AsFloat+cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat;

            //calsulando Impostos
           cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(cdsNFe_ItemICMS_BCALC.AsFloat,frmPesqProdutoItens.fdsProdutoItensALQ_IPI.AsFloat);

           if indicadorIE ='NC' then
           begin
            cdsNFe_ItemICMS_BCALC.AsFloat:=cdsNFe_ItemICMS_BCALC.AsFloat+cdsNFe_ItemICMS_VIPI.AsFloat;
           end;

           cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(cdsNFe_ItemICMS_BCALC.AsFloat,frmPesqProdutoItens.fdsProdutoItensALIQ_ICMS.AsFloat);

          end;

          if fdsNatOperacaoCAT_SAIDA_CFOP.AsString <> 'VD' then
          begin
            cdsNFe_ItemCFOP.AsString := CFOP_NOVO;
            cdsNFe_ItemCST_CSOSN.AsString := CST_CSOSN_NOVO;
          end
          else
          begin
            cdsNFe_ItemCFOP.AsString :=
              frmPesqProdutoItens.fdsProdutoItensCFOP.AsString;

            if (fdsNFeUF.AsString <> DM.fdsConfigUF.AsString) and (not(fdsNFeUF.AsString = EmptyStr)) then
              cdsNFe_ItemCFOP.AsString :=
                StringReplace(cdsNFe_ItemCFOP.AsString, '5', '6', []);
            cdsNFe_ItemCST_CSOSN.AsString :=
              frmPesqProdutoItens.fdsProdutoItensCSOSN.AsString;
          end;

          cdsNFe_ItemQTN.AsFloat := 1;
        end;
      end;
    end
    else
    begin
      cdsNFe_ItemIDPROD_ITEM.AsInteger := qrySql.FieldByName('ID').AsInteger;
      cdsNFe_ItemIDGRUPO.AsInteger:= qrySql.FieldByName('IDGRUPO').AsInteger;
      cdsNFe_ItemPRODUTO.AsString := qrySql.FieldByName('NOME').AsString;
      cdsNFe_ItemVLR_UNITARIO.AsFloat := qrySql.FieldByName('PREC_VENDA')
        .AsFloat; // vitor ver sobre tabela de pre�o
      cdsNFe_ItemCOD_FABRICA.AsString :=
        qrySql.FieldByName('COD_FABRICA').AsString;
      cdsNFe_ItemINFO_ADICIONAL.AsString :=
        qrySql.FieldByName('INFO_ADICIONAL').AsString;
      cdsNFe_ItemPRECO_CUSTO.AsFloat := qrySql.FieldByName('PREC_CUSTO').AsFloat;
      cdsNFe_ItemPREC_CUSTO_MEDIO.AsFloat:= qrySql.FieldByName('PREC_CUSTO_MEDIO').AsFloat;
      cdsNFe_ItemCEST.AsString:= qrySql.FieldByName('CEST').AsString;

      cdsNFe_ItemCST_PIS.AsString := qrySql.FieldByName('CST_PIS').AsString;
      cdsNFe_ItemCST_COFINS.AsString := qrySql.FieldByName('CST_COFINS').AsString;
      cdsNFe_ItemIBPT_NACIONA_FEDERAL.AsFloat :=qrySql.FieldByName('IBPT_NACIONA_FEDERAL').AsFloat;
      cdsNFe_ItemIBPT_ESTADUAL.AsFloat :=qrySql.FieldByName('IBPT_ESTADUAL').AsFloat;
      cdsNFe_ItemIBPT_MUNICIPAL.AsFloat :=qrySql.FieldByName('IBPT_MUNICIPAL').AsFloat;
      cdsNFe_ItemFCP.AsFloat := qrySql.FieldByName('FCP').AsFloat;

      //calc fret e outras Desp
      if fdsNFeVLR_FRETE.AsFloat>0 then
      begin
        cdsNFe_ItemVLR_FRETE.AsFloat := fdsNFeVLR_FRETE.AsFloat *(RoundTo(cdsNFe_ItemVLR_UNITARIO.AsFloat / (fdsNFeVLR_TOTITEM.AsFloat+cdsNFe_ItemVLR_UNITARIO.AsFloat), -2));
      end;
      if fdsNFeOUTRAS_DESPESAS.AsFloat>0 then
      begin
        cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat := fdsNFeOUTRAS_DESPESAS.AsFloat *(RoundTo(cdsNFe_ItemVLR_UNITARIO.AsFloat / (fdsNFeVLR_TOTITEM.AsFloat+cdsNFe_ItemVLR_UNITARIO.AsFloat), -2));
      end;

      if (fdsNatOperacaoCAT_SAIDA_CFOP.AsString ='VD') then
      begin
       cdsNFe_ItemICMS_ALIQ.AsFloat:= qrySql.FieldByName('ALIQ_ICMS').AsFloat;
       cdsNFe_ItemICMS_ALIQIPI.AsFloat:=qrySql.FieldByName('ALQ_IPI').AsFloat;
       cdsNFe_ItemICMS_BCALC.AsFloat := qrySql.FieldByName('PREC_VENDA').AsFloat+cdsNFe_ItemVLR_FRETE.AsFloat+cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat;
        //calsulando Impostos
       cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(cdsNFe_ItemICMS_BCALC.AsFloat,qrySql.FieldByName('ALQ_IPI').AsFloat);

       if fdsNFeINDICADOR_IE.AsString ='NC' then
       begin
        cdsNFe_ItemICMS_BCALC.AsFloat:=cdsNFe_ItemICMS_BCALC.AsFloat+cdsNFe_ItemICMS_VIPI.AsFloat;
       end;

       cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(cdsNFe_ItemICMS_BCALC.AsFloat,qrySql.FieldByName('ALIQ_ICMS').AsFloat);

      end;

      if fdsNatOperacaoCAT_SAIDA_CFOP.AsString <> 'VD' then
      begin
        cdsNFe_ItemCST_CSOSN.AsString := CST_CSOSN_NOVO;
        cdsNFe_ItemCFOP.AsString := CFOP_NOVO;
      end
      else
      begin
        cdsNFe_ItemCFOP.AsString := qrySql.FieldByName('CFOP').AsString;
        if  (fdsNFeUF.AsString <> DM.fdsConfigUF.AsString) and (not(fdsNFeUF.AsString = EmptyStr)) then
          cdsNFe_ItemCFOP.AsString := StringReplace(cdsNFe_ItemCFOP.AsString,
            '5', '6', []);
        cdsNFe_ItemCST_CSOSN.AsString := qrySql.FieldByName('CSOSN').AsString;
      end;

      cdsNFe_ItemQTN.AsInteger := 1;
    end;
  end;
end;

procedure TfrmNfe.RateioNosItens(vlrTotItem:Currency);
var
valorTotal,ValorTotItem:Currency;
begin
 if fdsNFe.State in [dsEdit,dsInsert] then
 begin
    ValorTotItem:= vlrTotItem;
    cdsNFe_Item.Edit;
    cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat := RoundTo((RoundTo(cdsNFe_ItemVLR_TOTAL.Value /ValorTotItem , -2))* fdsNFeOUTRAS_DESPESAS.Value,-2 );
    cdsNFe_ItemVLR_FRETE.AsFloat := RoundTo(RoundTo(cdsNFe_ItemVLR_TOTAL.Value / ValorTotItem, -2)*fdsNFeVLR_FRETE.Value,-2);
    vlr_fretTemp := vlr_fretTemp + cdsNFe_ItemVLR_FRETE.AsFloat;
    vlrOutras_Despesas := vlrOutras_Despesas +cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat;

    if cdsNFe_Item.RecNo =cdsNFe_Item.RecordCount then
    begin
      //colocar para tirar a diferen�a do ultimo;
      cdsNFe_ItemVLR_FRETE.AsFloat := cdsNFe_ItemVLR_FRETE.AsFloat +(fdsNFeVLR_FRETE.AsFloat - vlr_fretTemp);
      cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat := cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat +(fdsNFeOUTRAS_DESPESAS.AsFloat - vlrOutras_Despesas);
    end;
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VD' then         //soma na base de ICMS
    begin
      valorTotal:= cdsNFe_ItemVLR_TOTAL.AsFloat + cdsNFe_ItemVLR_OUTRAS_DESPESAS.AsFloat+cdsNFe_ItemVLR_FRETE.AsFloat;
      cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQIPI.AsFloat);

      if fdsNFeINDICADOR_IE.AsString ='NC' then
      begin
       cdsNFe_ItemICMS_BCALC.AsFloat := valorTotal + cdsNFe_ItemICMS_VIPI.AsFloat;
      end
      else
       cdsNFe_ItemICMS_BCALC.AsFloat := valorTotal;

      cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQ.AsFloat);

    end;
    cdsNFe_Item.Post;
 end;
end;

procedure TfrmNfe.RetornaChaveNFsDevolver;
begin
  cdsNF_Devolvidas.Close;
  fdsNF_Devolvidas.Close;
  fdsNF_Devolvidas.ParamByName('IDNFE').AsInteger := fdsNFeID.AsInteger;
  fdsNF_Devolvidas.ParamByName('IDFILIAL').AsInteger :=
    fdsNFeIDFILIAL.AsInteger;
  fdsNF_Devolvidas.Prepare;
  fdsNF_Devolvidas.Open;
  cdsNF_Devolvidas.Open;
end;

procedure TfrmNfe.RetornaClienteId(idCliente: string);
begin
  with fdsCliente do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('IDCLIENTE', 'ID = ' + idCliente, true);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

function TfrmNfe.RetornaCntReceberItemID(idFilial: Integer; valor: Double;
  dt_venc: TDate): Integer;
begin

end;

procedure TfrmNfe.RetornaIDCliente(cliente: string);
begin
  with fdsCliente do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('NOMECLIENTE', 'NOME like UPPER(' +
      QuotedStr(cliente + '%') + ')', true);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmNfe.RetornaItensNF;
begin
  if not(fdsNFe.State in [dsInsert]) and (fdsNFe.RecordCount > 0) then
  begin
    with fdsNFe_Item do
    begin
      cdsNFe_Item.Close;
      Close;
      Conditions.Clear;
      Conditions.Apply;
      Conditions.AddCondition('IDNFE', 'IDNFE=' + fdsNFeID.AsString, true);
      Conditions.AddCondition('IDFILIAL',
        'IDFILIAL=' + fdsNFeIDFILIAL.AsString, true);
      Conditions.Apply;
      Prepare;
      Open;
      cdsNFe_Item.Open;
    end;
  end;
end;

procedure TfrmNfe.RzBitBtn2Click(Sender: TObject);
begin
  // ppmFormaPag.Popup(frmNFe.Left + 471, frmNFe.top + 220);
end;

procedure TfrmNfe.RzDBEdit3Enter(Sender: TObject);
begin
  // if cdsNFe_Item.State in [dsEdit,dsInsert] then
  // begin
  // // cdsNFe_ItemVLR_UNITARIO.AsFloat := cdsNFe_ItemVLR_UNITARIO.AsFloat - cdsNFe_ItemICMS_ST_VLR.AsFloat;
  // end;
end;

procedure TfrmNfe.RzDBEdit3Exit(Sender: TObject);
begin
  // if cdsNFe_Item.State in [dsEdit, dsInsert] then
  // begin
  // // cdsNFe_ItemVLR_UNITARIO.AsFloat := cdsNFe_ItemVLR_UNITARIO.AsFloat + cdsNFe_ItemICMS_ST_VLR.AsFloat;
  // end;
end;

procedure TfrmNfe.RzDBEdit6Exit(Sender: TObject);
begin
  if cdsNFe_Item.State in [dsInsert, dsEdit] then
  begin
    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
      RzDBEdit6.Enabled := true
    else
      RzDBEdit6.Enabled := False;
  end;
end;

procedure TfrmNfe.RzDBEdit8Exit(Sender: TObject);
var
 valorTotal:Currency;
begin
  if cdsNFe_Item.State in [dsInsert, dsEdit] then
  begin
     valorTotal:=((cdsNFe_ItemVLR_UNITARIO.AsFloat * cdsNFe_ItemQTN.AsFloat)- cdsNFe_ItemVLR_DESCONTO.AsFloat);

    if (fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV')or (fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VE') then
    begin
     // cdsNFe_ItemICMS_BCALC.AsFloat := cdsNFe_ItemVLR_TOTAL.AsFloat;
      {cdsNFe_ItemICMS_BCALC.AsFloat := valorTotal;
      if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'VE' then
      begin
        cdsNFe_ItemICMS_VLR.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQ.AsFloat);
        cdsNFe_ItemICMS_VIPI.AsFloat:= CalculaImpostos(valorTotal,cdsNFe_ItemICMS_ALIQIPI.AsFloat);
      end;}
    end;
  end;
end;

procedure TfrmNfe.ShowFinalizacaoVenda;
var
  prazo: Double;
  utils: TUtils;
begin
  Try
    // prazo := utils.ValidaInteiroFloat(fdsPedidoPRAZO.AsString, 'I');

    frmVendaFinalizacao := TfrmVendaFinalizacao.Create(nil);
    frmVendaFinalizacao.idVenda := fdsNFeID.AsInteger;
    frmVendaFinalizacao.edtIDVenda.Text := fdsNFeID.AsString;
    frmVendaFinalizacao.edtPrefixoVenda.Text := 'VE';
    frmVendaFinalizacao.tipoVenda := 'NF';
    frmVendaFinalizacao.idVendedor := DM.fdsConfigIDVENDEDORPADRAO.AsInteger;
    //frmVendaFinalizacao.edtDinheiro.SetFocus;
    // if fdsPedidoIDVENDEDOR.AsInteger <> 1 then
    // frmVendaFinalizacao.edtIdVendedor.Enabled := False;

    frmVendaFinalizacao.cliente := fdsNFeCLIENTE.AsString;
    frmVendaFinalizacao.idCliente := fdsNFeIDCLIENTE.AsInteger;
    frmVendaFinalizacao.idFormaPag := fdsNFeIDFORMA_PAG.AsInteger;

    // if (fdsPedidoIDFORMA_PAG.AsInteger = 10) then
    // frmVendaFinalizacao.valorDoc := RoundTo(fdsPedidoVLR_TOTAL.AsFloat + DM.fdsConfigTARIFA_BOLETO.AsFloat, -2)
    // else
    frmVendaFinalizacao.valorDoc := fdsNFeVLR_TOTAL.AsFloat;

    frmVendaFinalizacao.edtCliente.Text := fdsNFeCLIENTE.AsString;
    frmVendaFinalizacao.edtDesconto.ReadOnly:=True;
    frmVendaFinalizacao.cbxTipoDesconto.ReadOnly:=True;

    // if prazo > 0 then
    // frmVendaFinalizacao.prazo := prazo;

    frmVendaFinalizacao.ShowModal;
  Finally
    if frmVendaFinalizacao.ModalResult = mrOk then
    begin
      fdsNFe.Edit;
      fdsNFeIDFORMA_PAG.AsInteger := frmVendaFinalizacao.idFormaPag;
      fdsNFe.Post;
      transNFe.CommitRetaining;
      Application.MessageBox
        ('Opera��o finalizada com sucesso!Clique em OK para continuar.',
        'Secesso', MB_OK + MB_ICONEXCLAMATION);
    end
    else
      Abort;
    frmVendaFinalizacao.Free;

  End;
end;

procedure TfrmNfe.rgbStatusChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if NewIndex = 0 then
    pesquisar('AB');

  if NewIndex = 1 then
    pesquisar('NF');

  if NewIndex = 2 then
    pesquisar('ER');

  if NewIndex = 3 then
    pesquisar('CL');

  if NewIndex = 4 then
    pesquisar('OF');

  if NewIndex = 5 then
    pesquisar('IN');
end;

procedure TfrmNfe.cbxNatOperacaoExit(Sender: TObject);
var
  i: SmallInt;
begin
  if fdsNFe.State in [dsEdit, dsInsert] then
  begin
    if (fdsNatOperacaoCAT_SAIDA_CFOP.AsString <> 'VD') then
      CFOP_NOVO := fdsNatOperacaoCFOP_PADRAO.AsString;

    if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
    begin
      CST_CSOSN_NOVO := '900';

      // for i := 0 to ComponentCount -1 do
      // begin
      // if ((Components[i] is TRzDBEdit)) then
      // begin
      // if Components[i].Tag = 59 then
      // begin
      // // TRzDBEdit(Components[i]).ReadOnly := False;
      // TRzDBEdit(Components[i]).TabStop := True;
      // TRzDBEdit(Components[i]).Color := clMoneyGreen;
      // end;
      // end;
      // end;

      Try
        cdsNF_Devolvidas.Open;
        frmNtDevolucaoInfo := TfrmNtDevolucaoInfo.Create(nil);
        frmNtDevolucaoInfo.dtpDtEmissao.Date := DT_NF_DEVOLVIDA;
        // frmNtDevolucaoInfo.cbxCFOP.Value := CFOP_NOVO;
        frmNtDevolucaoInfo.ShowModal;
      Finally
        if frmNtDevolucaoInfo.ModalResult = mrOk then
        begin
          // fdsPedidoCHAVE_NF_DEVOLUCAO.AsString := frmNtDevolucaoInfo.edtNumNfe.Text;
          DT_NF_DEVOLVIDA := frmNtDevolucaoInfo.dtpDtEmissao.Date;
          // fdsPedidoOBS.AsString := 'N� NF Devolvida: ' + frmNtDevolucaoInfo.edtNumNfe.Text + ' - Dt. Emiss�o: ' + FormatDateTime('MM/DD/YYYY',frmNtDevolucaoInfo.dtpDtEmissao.Date) + ' - Motivo: ' + frmNtDevolucaoInfo.mmoInfo.Text;

          if fdsNatOperacaoCAT_SAIDA_CFOP.AsString = 'DV' then
            fdsNFeOBS.AsString := 'Motivo Devolu��o: ' +
              frmNtDevolucaoInfo.mmoInfo.Text;
        end;
        frmNtDevolucaoInfo.Free;
      End;
      cbxFormaPagamento.Value := '11';
       for i := 0 to ComponentCount -1 do
       begin
         if ((Components[i] is TRzDBEdit)) then
         begin
           if Components[i].Tag = 5 then
           begin
             TRzDBEdit(Components[i]).Enabled := True;
             TRzDBEdit(Components[i]).TabStop := False;
             TRzDBEdit(Components[i]).Color := clInfoBk;
           end;
         end;
       end;
    end
    else
    begin
       for i := 0 to ComponentCount -1 do
       begin
         if ((Components[i] is TRzDBEdit)) then
         begin
           if Components[i].Tag = 5 then
           begin
            TRzDBEdit(Components[i]).Enabled := False;
           end;
         end;
       end;
      // TRzDBEdit(Components[i]).TabStop := False;
      // TRzDBEdit(Components[i]).Color := clInfoBk;
      // end;
      // end;
      // end;
    end;
    // *inicio da fun��o de acerto
    cdsNFe_Item.First;
    // while cdsNFe_Item.Eof do
    // begin
    // PesquisaCFOPItem(cdsNFe_ItemIDPROD_ITEM.AsInteger);
    //
    // cdsNFe_Item.Edit;
    // cdsNFe_ItemCFOP.AsString := CFOP_NOVO;
    // cdsNFe_ItemCST_CSOSN.AsString := CST_CSOSN_NOVO;
    // cdsNFe_Item.Post;
    // cdsNFe_Item.Next;
    // end;

    while not(cdsNFe_Item.Eof) do
    begin
      PesquisaCFOPItem(cdsNFe_ItemIDPROD_ITEM.AsInteger);

      cdsNFe_Item.Edit;
      cdsNFe_ItemCFOP.AsString := CFOP_NOVO;
      cdsNFe_ItemCST_CSOSN.AsString := CST_CSOSN_NOVO;
      cdsNFe_Item.Post;
      cdsNFe_Item.Next;
    end;
    // if fdsNFeORIGEM_PEDIDO_VENDA.AsString ='PD' then
    // begin
    // CFOP_NOVO := fdsNatOperacaoCFOP_PADRAO.AsString;
    // cdsNFe_Item.First;
    // while not(cdsNFe_Item.Eof) do
    // begin
    // cdsNFe_Item.Edit;
    // cdsNFe_ItemCFOP.AsString := CFOP_NOVO;
    // cdsNFe_Item.Post;
    // cdsNFe_Item.Next;
    // end;
    // end;
  end;
end;

procedure TfrmNfe.tbsFormShow(Sender: TObject);
begin
  if fdsNFe.RecordCount > 0 then
  begin
    RetornaItensNF;
    RetornaChaveNFsDevolver;
  end;
end;

function TfrmNfe.VerificaFaturamento(num: Integer):Boolean;
begin
  if num <> 0 then
  begin
   result:= True;
  end
  else
  result:= false;
end;

procedure TfrmNfe.VerificaFormaPagamento;
begin

end;

end.