unit untData;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  FIBDatabase, pFIBDatabase, frxClass, ImgList, Controls, cxGraphics, frxDBSet,
  frxBarcode, frxExportPDF,vcl.dialogs;

type
  TDM = class(TDataModule)
    Conexao: TpFIBDatabase;
    transPricipal: TpFIBTransaction;
    qryGeral: TpFIBQuery;
    fdsConfig: TpFIBDataSet;
    dsConfig: TDataSource;
    frxReport1: TfrxReport;
    fdsUsuarioPermic: TpFIBDataSet;
    fdsUsuarioPermicIDUSUARIO: TFIBBCDField;
    fdsUsuarioPermicIDFILIAL: TFIBBCDField;
    fdsUsuarioPermicDT_INC: TFIBDateField;
    fdsUsuarioPermicDT_ALT: TFIBDateField;
    fdsUsuarioPermicADMINISTRACAO: TFIBStringField;
    fdsUsuarioPermicFINANCEIRO: TFIBStringField;
    fdsUsuarioPermicCADASTRO: TFIBStringField;
    fdsUsuarioPermicADM_PEDIDO: TFIBStringField;
    fdsUsuarioPermicADM_PREVENDA: TFIBStringField;
    fdsUsuarioPermicADM_ROMANEIO: TFIBStringField;
    fdsUsuarioPermicADM_ESTOQUE: TFIBStringField;
    fdsUsuarioPermicADM_MOVINTERNA: TFIBStringField;
    fdsUsuarioPermicADM_VENDAS: TFIBStringField;
    fdsUsuarioPermicADM_MOVCAIXA: TFIBStringField;
    fdsUsuarioPermicADM_COMPRAS: TFIBStringField;
    fdsUsuarioPermicADM_OS: TFIBStringField;
    fdsUsuarioPermicPDV: TpFIBDataSet;
    fdsUsuarioPermicPDVIDUSUARIO: TFIBBCDField;
    fdsUsuarioPermicPDVIDFILIAL: TFIBBCDField;
    fdsUsuarioPermicPDVDT_INC: TFIBDateField;
    fdsUsuarioPermicPDVDT_ALT: TFIBDateField;
    fdsUsuarioPermicPDVRECEBIMENTO: TFIBStringField;
    fdsUsuarioPermicPDVDESC_MAX_ITEM: TFIBStringField;
    fdsUsuarioPermicPDVDESC_MAX_TOT_VENDA: TFIBStringField;
    fdsUsuarioPermicPDVVER_MOVIMENTO: TFIBStringField;
    fdsUsuarioPermicPDVSANGRIA: TFIBStringField;
    fdsUsuarioPermicPDVSUPRIMENTO: TFIBStringField;
    fdsUsuarioPermicPDVFECHAMENTO: TFIBStringField;
    fdsUsuarioPermicPDVALTERAR_PREC_UNIT: TFIBStringField;
    fdsUsuarioPermicPDVDEVOLUCAO: TFIBStringField;
    fdsUsuarioPermicADM_COMISSAO: TFIBStringField;
    fdsUsuarioPermicCAD_PRODUTOS: TFIBStringField;
    fdsUsuarioPermicCAD_GRUPO: TFIBStringField;
    fdsUsuarioPermicCAD_USUARIO: TFIBStringField;
    fdsUsuarioPermicCAD_PRODUTOS_EDIT: TFIBStringField;
    fdsUsuarioPermicCAD_PRODUTOS_INSERT: TFIBStringField;
    fdsUsuarioPermicFIN_RECEBER: TFIBStringField;
    fdsUsuarioPermicFIN_PAGAR: TFIBStringField;
    fdsUsuarioPermicFIN_FLUXOCAIXA: TFIBStringField;
    fdsUsuarioPermicADM_BALANCO: TFIBStringField;
    fdsUsuarioPermicEXIBIR_VENDAS_DIA: TFIBStringField;
    fdsUsuarioPermicEXIBIR_PEDIDOS_DIA: TFIBStringField;
    fdsConfigNFe: TpFIBDataSet;
    fdsConfigNFeID: TFIBBCDField;
    fdsConfigNFeIDFILIAL: TFIBBCDField;
    fdsConfigNFeCERT_SENHA: TFIBStringField;
    fdsConfigNFeCERT_NUM_SERIE: TFIBStringField;
    fdsConfigNFeWS_UF: TFIBStringField;
    fdsConfigNFeWS_AMBIENTE_NF_E: TFIBStringField;
    fdsConfigNFeWS_AMBIENTE_NF_CE: TFIBStringField;
    fdsConfigNFeIDCSC: TFIBStringField;
    fdsConfigNFeCSC: TFIBStringField;
    frxConfig: TfrxDBDataset;
    fdsConfigNFeGERA_CREDITO_ICMS: TFIBStringField;
    frxBarCodeObject1: TfrxBarCodeObject;
    dsConfigNFe: TDataSource;
    fdsConfigNFeSERIE_NFE: TFIBIntegerField;
    fdsConfigNFeSERIE_NFCE: TFIBIntegerField;
    dsCaixa: TDataSource;
    fdsCaixa: TpFIBDataSet;
    fdsCaixaID: TFIBBCDField;
    fdsCaixaDT_INC: TFIBDateField;
    fdsCaixaNUM_CAIXA: TFIBIntegerField;
    fdsCaixaCONTROLE: TFIBBCDField;
    fdsCaixaENVIADO_WEB: TFIBStringField;
    fdsCaixaIDFILIAL: TFIBBCDField;
    fdsCaixaIMP_CUPOM: TFIBStringField;
    fdsCaixaMODELO_IMPRESSORA: TFIBStringField;
    fdsCaixaMODELO_BALANCA: TFIBStringField;
    fdsCaixaPORTA_BALANCA: TFIBStringField;
    fdsCaixaCERT_SENHA: TFIBStringField;
    fdsCaixaCERT_NUM_SERIE: TFIBStringField;
    fdsCaixaIDCSC: TFIBStringField;
    fdsCaixaCSC: TFIBStringField;
    fdsCaixaPDV_UTILIZA_GAVETA: TFIBStringField;
    frxPDFExport1: TfrxPDFExport;
    fdsConfigMDFe: TpFIBDataSet;
    fdsConfigMDFeID: TFIBBCDField;
    fdsConfigMDFeCERT_SENHA: TFIBStringField;
    fdsConfigMDFeCERT_NUM_SERIE: TFIBStringField;
    fdsConfigMDFeWS_UF: TFIBStringField;
    fdsConfigMDFeWS_AMBIENTE: TFIBStringField;
    fdsConfigMDFeSERIE_MANIFESTO: TFIBIntegerField;
    fdsConfigMDFeULTIMO_MANIFESTO: TFIBIntegerField;
    fdsConfigMDFeTIPO_CERT: TFIBStringField;
    fdsConfigMDFeCNPJ_CPF: TFIBStringField;
    fdsConfigMDFeIE: TFIBStringField;
    fdsConfigMDFeNOME: TFIBStringField;
    fdsConfigMDFeRAZAO: TFIBStringField;
    fdsConfigMDFeENDERECO: TFIBStringField;
    fdsConfigMDFeNUMERO: TFIBStringField;
    fdsConfigMDFeBAIRRO: TFIBStringField;
    fdsConfigMDFeCODCIDADE: TFIBIntegerField;
    fdsConfigMDFeCIDADE: TFIBStringField;
    fdsConfigMDFeUF: TFIBStringField;
    fdsConfigMDFeCEP: TFIBStringField;
    fdsConfigMDFeTIPO_EMITENTE: TFIBStringField;
    fdsConfigMDFeTELEFONE: TFIBStringField;
    fdsConfigID: TFIBBCDField;
    fdsConfigIDFILIAL: TFIBBCDField;
    fdsConfigNOME: TFIBStringField;
    fdsConfigRAZAO: TFIBStringField;
    fdsConfigCNPJ: TFIBStringField;
    fdsConfigIE: TFIBStringField;
    fdsConfigENDERECO: TFIBStringField;
    fdsConfigENDERECO_FANTASIA: TFIBStringField;
    fdsConfigNUMERO: TFIBSmallIntField;
    fdsConfigBAIRRO: TFIBStringField;
    fdsConfigBAIRRO_FANTASIA: TFIBStringField;
    fdsConfigIDCIDADE: TFIBBCDField;
    fdsConfigCEP: TFIBStringField;
    fdsConfigTELEFONE: TFIBStringField;
    fdsConfigTELEFONE2: TFIBStringField;
    fdsConfigEMAIL: TFIBStringField;
    fdsConfigSITE: TFIBStringField;
    fdsConfigLOGO_IMG_CAMINHO: TFIBStringField;
    fdsConfigIDCLIENTEPADRAO: TFIBBCDField;
    fdsConfigIDVENDEDORPADRAO: TFIBBCDField;
    fdsConfigFABRICA: TFIBStringField;
    fdsConfigIDFORM_PAG_PAD: TFIBBCDField;
    fdsConfigIDPORTADOR_PADRAO: TFIBBCDField;
    fdsConfigUTILIZAR_TABELA_PRECO: TFIBStringField;
    fdsConfigCLIENTE_EXIBIR_PJ: TFIBStringField;
    fdsConfigHORA_BKP: TFIBTimeField;
    fdsConfigBAIXA_AUTO_CARTAO: TFIBStringField;
    fdsConfigPARAM: TFIBStringField;
    fdsConfigCHAVE: TFIBStringField;
    fdsConfigHOJE: TFIBStringField;
    fdsConfigCARENCIA_JUROS: TFIBIntegerField;
    fdsConfigVALOR_MULTA_ATRASO: TFIBBCDField;
    fdsConfigJUROS_DIA_PORCENTAGEM: TFIBBCDField;
    fdsConfigPDV_DESC_MAX_VENDA: TFIBBCDField;
    fdsConfigDIAS_ATRASO_BLOQUEIO: TFIBIntegerField;
    fdsConfigCONTROLAR_FALTAS: TFIBStringField;
    fdsConfigIDTRANPS_PADRAO: TFIBBCDField;
    fdsConfigIDVEICULO_PADRAO: TFIBBCDField;
    fdsConfigESTOQUE_GERENCIAL: TFIBStringField;
    fdsConfigCFOP_PADRAO: TFIBStringField;
    fdsConfigCEST_PADRAO: TFIBStringField;
    fdsConfigCSOSN_PADRAO: TFIBStringField;
    fdsConfigMARGEN_LUCRO_PADRAO: TFIBBCDField;
    fdsConfigCARTAO_CREDITO_AVISTA: TFIBStringField;
    fdsConfigTARIFA_BOLETO: TFIBBCDField;
    fdsConfigPDV_UTILIZAR_GAVETA: TFIBStringField;
    fdsConfigFILIAL_PREC_VENDA_IGUAL: TFIBStringField;
    fdsConfigFISCAL: TFIBStringField;
    fdsConfigMODELO_IMPRESSORA: TFIBStringField;
    fdsConfigAUTO_PECAS: TFIBStringField;
    fdsConfigBAIXA_DOCS_AUTO: TFIBStringField;
    fdsConfigMODO_TAB_PRECO: TFIBStringField;
    fdsConfigTIPO_IMPRESSAO_PEDIDO: TFIBIntegerField;
    fdsConfigPEDIDO_SIMPLES: TFIBStringField;
    fdsConfigBLOQUEAR_CLIENT_ATRASO: TFIBStringField;
    fdsConfigTP_CERTIFICADO_NFE: TFIBStringField;
    fdsConfigMODELO_ETIQ_PROD: TFIBStringField;
    fdsConfigMODELO_BALANCA_GERAL: TFIBStringField;
    fdsConfigTAMANHO_CAMPOS_BAL: TFIBStringField;
    fdsConfigTIPO_COD_PROD_ETIQUETABAL: TFIBStringField;
    fdsConfigDADOS_COD_ETIQUETA_BAL: TFIBStringField;
    fdsConfigUTILIZAR_BAL_ETIQUETA: TFIBStringField;
    fdsConfigPREFIXO_EAN: TFIBIntegerField;
    fdsConfigCNPJ_OU_CPF: TFIBStringField;
    fdsConfigPRODUTOR_RURAL: TFIBStringField;
    fdsConfigCUPOM_CREDIARIO_SIMPLIFIC: TFIBStringField;
    fdsConfigFILIAL: TFIBStringField;
    fdsConfigCIDADE: TFIBStringField;
    fdsConfigUF: TFIBStringField;
    fdsConfigCODIGO_MUNICIPIO: TFIBBCDField;
    fdsUsuarioPermicACESSO_SGP: TFIBStringField;
    fdsUsuarioPermicADM_MANIFESTO: TFIBStringField;
    fdsUsuarioPermicADM_NFE: TFIBStringField;
    fdsUsuarioPermicADM_NFE_EXCL: TFIBStringField;
    fdsUsuarioPermicADM_PEDIDO_FATURAMENTO: TFIBStringField;
    fdsUsuarioPermicADM_PEDIDO_ORCAMENTO: TFIBStringField;
    fdsUsuarioPermicADM_ESTOQUE_IMP_ETIQUETA: TFIBStringField;
    fdsUsuarioPermicADM_ESTOQUE_INVENTARIO: TFIBStringField;
    fdsUsuarioPermicADM_VENDAS_ENTREGA: TFIBStringField;
    fdsUsuarioPermicADM_VENDAS_RELATORIO: TFIBStringField;
    fdsUsuarioPermicADM_COMPRAS_EXCL: TFIBStringField;
    fdsUsuarioPermicADM_COMPRAS_REL: TFIBStringField;
    fdsUsuarioPermicCAD_TAB_PRECO: TFIBStringField;
    fdsUsuarioPermicCAD_GRUPO_INSERT: TFIBStringField;
    fdsUsuarioPermicCAD_GRUPO_EDIT: TFIBStringField;
    fdsUsuarioPermicCAD_GRUPO_EXCL: TFIBStringField;
    fdsUsuarioPermicCAD_USUARIO_EDIT: TFIBStringField;
    fdsUsuarioPermicCAD_USUARIO_INSERT: TFIBStringField;
    fdsUsuarioPermicCAD_USUARIO_EDIT_PERMIC: TFIBStringField;
    fdsUsuarioPermicCAD_USUARIO_VER_PERMIC: TFIBStringField;
    fdsUsuarioPermicCAD_PRODUTOS_EXCL: TFIBStringField;
    fdsUsuarioPermicCAD_PROD_EDIT_DESC_MAX: TFIBStringField;
    fdsUsuarioPermicCAD_PROD_EDIT_PRECOS: TFIBStringField;
    fdsUsuarioPermicCAD_PROD_MARGEM_LUCRO: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTES: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTE_EDIT: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTE_EDIT_CREDITO: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTE_EDIT_LIMITE: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTE_EDIT_STATUS: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTE_INSERT: TFIBStringField;
    fdsUsuarioPermicCAD_CLIENTE_EXCL: TFIBStringField;
    fdsUsuarioPermicCAD_FORNRCEDOR: TFIBStringField;
    fdsUsuarioPermicCAD_FORNEC_EDIT: TFIBStringField;
    fdsUsuarioPermicCAD_FORNRC_EXCL: TFIBStringField;
    fdsUsuarioPermicCAD_FORNEC_INSERT: TFIBStringField;
    fdsUsuarioPermicEXPORTAR_PROD_BALANCA: TFIBStringField;
    fdsUsuarioPermicCAD_VENDEDOR: TFIBStringField;
    fdsUsuarioPermicCAD_VENDEDOR_EDT: TFIBStringField;
    fdsUsuarioPermicCAD_VENDEDOR_INSERT: TFIBStringField;
    fdsUsuarioPermicCAD_VENDEDOR_EXCL: TFIBStringField;
    fdsUsuarioPermicPLANO_CONTAS: TFIBStringField;
    fdsUsuarioPermicCAD_FUNCIONARIO: TFIBStringField;
    fdsUsuarioPermicCONFIGURACOES: TFIBStringField;
    fdsUsuarioPermicCAD_ENTREGA: TFIBStringField;
    fdsUsuarioPermicCAD_ENTREGA_EDIT: TFIBStringField;
    fdsUsuarioPermicCAD_ENTREGA_INSERT: TFIBStringField;
    fdsUsuarioPermicADM_NFE_EDIT: TFIBStringField;
    fdsUsuarioPermicADM_NFE_EMITIR: TFIBStringField;
    fdsUsuarioPermicPDVESTOQUE_ZERADO_VENDER: TFIBStringField;
    fdsUsuarioPermicPDVLIBERAR_CLIENTE_BLOQ: TFIBStringField;
    fdsUsuarioPermicPDVABRIR_GAVETA: TFIBStringField;
    fdsUsuarioPermicPDVLIMITE_CREDITO: TFIBStringField;
    fdsUsuarioPermicADMIN_1: TFIBStringField;
    fdsUsuarioPermicPDVDESC_ACRE_RECEBER: TFIBStringField;
    fdsUsuarioPermicPDVNAO_USAR_JUROS_RECEBER: TFIBStringField;
    fdsConfigDIAS_PRIMEIRA_PARCELA: TFIBIntegerField;
    fdsConfigQTN_SOLICITAR: TFIBStringField;
    fdsCaixaSERIE_NFCE: TFIBIntegerField;
    fdsCaixaULTIMA_NFCE: TFIBBCDField;
    fdsCaixaBAUD_RATE: TFIBIntegerField;
    fdsCaixaTIME_OUT: TFIBIntegerField;
    fdsCaixaPARITY_BAL: TFIBStringField;
    fdsCaixaSTOP_BITS_BAL: TFIBStringField;
    fdsCaixaHANDSHAKING_BAL: TFIBStringField;
    fdsCaixaDATA_BITS_BAL: TFIBIntegerField;
    fdsCaixaTAB_PRECO: TFIBIntegerField;
    fdsCaixaGENERATION: TFIBStringField;
    fdsConfigTAB_PADRAO_PDV: TFIBIntegerField;
    fdsConfigTAB_PADRAO_PRE_VENDA: TFIBIntegerField;
    fdsConfigBLOQUEAR_F9: TFIBStringField;
    fdsConfigMDFeIDFILIAL: TFIBBCDField;
    fdsConfigESTOQUE_CONSUMO: TFIBStringField;
    fdsConfigMODELO_IMP_ETIQ: TFIBStringField;
    fdsConfigDPI_IMP_ETIQ: TFIBStringField;
    fdsConfigPORTA_IMP_ETIQ: TFIBStringField;
    fdsConfigTIPO_CONECT_IMP_ETQ: TFIBStringField;
    fdsConfigSALVAR_PROD_PESQ: TFIBStringField;
    fdsConfigNFeDT_VALID: TFIBDateField;
    fdsUsuarioPermicLIBERAR_CLIENTE_BLOQ: TFIBStringField;
    fdsConfigPADRAO_LAYOUT: TFIBStringField;
    fdsCaixaPADRAO_LAYOUT: TFIBStringField;
    fdsConfigBAIXA_AUTO_CARTAO_CD: TFIBStringField;
    fdsConfigDIAS_BAIXA_CT: TFIBIntegerField;
    fdsConfigDIAS_BAIXA_CD: TFIBIntegerField;
    fdsConfigDIAS_BAIXA_DOC: TFIBIntegerField;
    fdsConfigN_VENDA_ESTOQUE_ZERO: TFIBStringField;
    fdsConfigN_VISUALIZAR_ESTOQ_ZERO: TFIBStringField;
    fdsUsuarioPermicESTOQUE_ZERADO_VENDER: TFIBStringField;
    fdsCaixaNF_F9: TFIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure fdsConfigAfterInsert(DataSet: TDataSet);
    procedure fdsCaixaAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public const
    gridOddColor = $00D2E8D2;

  var
    dtInicio, dtFim: TDateTime;
    filial, vlrTotal, dtVencimento, vlrCustoTotal, totItens, tipo,vlrLucroTotal,
      vlrLucroTotalMedio,margemLucro,margemLucroMed,vlrTotDev,subTotal,vlrConfirmadaTot,vlrOffTot,qtnOff,qtnConfirmada,valor: string[30];
    formaPagamento,carta: string[50];
    vendedor, cliente: string[100];
    totVendas, idUsuario: Integer;
    logo,obs: string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Conexao.Connected := False;
end;

procedure TDM.fdsCaixaAfterEdit(DataSet: TDataSet);
begin
 if fdsCaixa.State in [dsEdit,dsInsert] then
  begin
  if fdsCaixaPADRAO_LAYOUT.AsString = EmptyStr then
  fdsCaixaPADRAO_LAYOUT.AsString := 'R'
  end;
end;

procedure TDM.fdsConfigAfterInsert(DataSet: TDataSet);
begin
  if fdsConfig.State in [dsEdit,dsInsert] then
  begin
  if fdsConfigPADRAO_LAYOUT.AsString = EmptyStr then
  fdsConfigPADRAO_LAYOUT.AsString := 'R'
  end;
end;

procedure TDM.frxReport1GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'dtInicio' then
    Value := dtInicio;

  if VarName = 'dtFim' then
    Value := dtFim;

  if VarName = 'formaPagamento' then
    Value := formaPagamento;

  if VarName = 'vendedor' then
    Value := vendedor;

  if VarName = 'cliente' then
    Value := cliente;

  if VarName = 'dtVencimento' then
    Value := dtVencimento;

  if VarName = 'totVendas' then
    Value := totVendas;

  if VarName = 'vlrTotal' then
    Value := vlrTotal;

  if VarName = 'vlrCustoTotal' then
    Value := vlrCustoTotal;

  if VarName = 'Filial' then
    Value := filial;

  if VarName = 'totItens' then
    Value := totItens;

  if VarName = 'Tipo' then
    Value := tipo;

  if VarName = 'Dir' then
    Value := logo;

  if VarName = 'vlrLucroTotal' then
    Value := vlrLucroTotal;

  if VarName = 'vlrLucroTotalMedio' then
    Value := vlrLucroTotalMedio;

  if VarName = 'margemLucroMed' then
    Value := margemLucroMed;

  if VarName = 'margemLucro' then
    Value := margemLucro;

  if VarName = 'vlrTotDev' then
    Value := vlrTotDev;
  if VarName = 'subTotal' then
    Value := subTotal;

  if VarName = 'obs' then
    Value := obs;

  if VarName = 'carta' then
    Value := carta;

  if VarName = 'vlrConfirmadaTot' then
    Value := vlrConfirmadaTot;

  if VarName = 'vlrOffTot' then
    Value := vlrOffTot;

  if VarName = 'qtnOff' then
  Value :=qtnOff;

  if VarName = 'qtnConfirmada' then
  Value := qtnConfirmada;

  if VarName = 'valor' then
    Value := valor;

end;

end.
