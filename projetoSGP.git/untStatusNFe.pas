unit untStatusNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.ExtCtrls, Vcl.StdCtrls,
  RzLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, System.Math, ACBrDFe,ACBrDFeUtil,
  ACBrBase, ACBrNFe, ACBrUtil, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS,
  XMLIntf, XMLDoc, zlib, ACBrNFeNotasFiscais, pcnNFe, pcnConversao,pcnGerador,pcnNFeW,
  pcnConversaoNFe,
  RzEdit, RzBckgnd, Vcl.Imaging.pngimage, JvExExtCtrls, JvImage, RzPanel,
  dxGDIPlusClasses, DateUtils, ACBrValidador, FIBQuery, pFIBQuery, FIBDataSet,
  pFIBDataSet,
  // ------------------------------------------------------------------------------
  ACBrMDFe, ACBrMDFeDAMDFeClass, ACBrMail,
  ACBrMDFeDAMDFeRLClass, ACBrDFeReport, pmdfeConversaoMDFe, ACBrDFeSSL,
  ACBrMDFeDAMDFeRL,
  ACBrMDFeManifestos, blcksock, TypInfo, JvMemoryDataset;

type
  TfrmStatusNFe = class(TForm)
    Timer1: TTimer;
    btnOK: TRzBitBtn;
    cdsNFe: TClientDataSet;
    cdsItensNFe: TClientDataSet;
    dspNFe: TDataSetProvider;
    dspItensNFe: TDataSetProvider;
    mmoErro: TRzMemo;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloTotal: TRzLabel;
    lblTotal: TRzLabel;
    lblRetorno: TRzLabel;
    RzBackground1: TRzBackground;
    cdsNF_Devolvidas: TClientDataSet;
    dspNF_Devolvidas: TDataSetProvider;
    cdsNF_DevolvidasID: TBCDField;
    cdsNF_DevolvidasIDFILIAL: TBCDField;
    cdsNF_DevolvidasDT_INC: TDateField;
    cdsNF_DevolvidasCHAVE_NF_COMPRA: TStringField;
    cdsNF_DevolvidasIDNFE: TBCDField;
    cdsNF_DevolvidasNOTA_NUM: TStringField;
    cdsNFeID: TBCDField;
    cdsNFeIDFILIAL: TBCDField;
    cdsNFeDT_INC: TDateField;
    cdsNFeDT_ALT: TDateField;
    cdsNFeDT_EMISSAO: TDateField;
    cdsNFeSTATUS: TStringField;
    cdsNFeIDCLIENTE: TBCDField;
    cdsNFeVLR_TOTITEM: TBCDField;
    cdsNFeVLR_DESCONTO: TBCDField;
    cdsNFeVLR_FRETE: TBCDField;
    cdsNFeVLR_TOTAL: TBCDField;
    cdsNFePESO: TBCDField;
    cdsNFeSUBTRIBUTARIA: TBCDField;
    cdsNFeENVIADO_WEB: TStringField;
    cdsNFeCODIGO_NFE: TIntegerField;
    cdsNFeCHAVE_CONSULTA: TStringField;
    cdsNFeNUMERO_PROTOCOLO: TStringField;
    cdsNFeNATUREZA_OPERACAO: TStringField;
    cdsNFeOBS: TStringField;
    cdsNFeCHAVE_NF_DEVOLUCAO: TStringField;
    cdsNFeTIPO_FRETE: TIntegerField;
    cdsNFeIDTRANSPORTADORA: TBCDField;
    cdsNFeIDVEICULO: TBCDField;
    cdsNFeTRANSP_QTN_VOLUME: TIntegerField;
    cdsNFeTRANSP_ESPECIE: TStringField;
    cdsNFeTRANSP_MARCA: TStringField;
    cdsNFeTRANSP_NUMERACAO: TIntegerField;
    cdsNFeCLIENTE: TStringField;
    cdsNFeCONTATO: TStringField;
    cdsNFeRAZAOSOCIAL: TStringField;
    cdsNFeEMAIL: TStringField;
    cdsNFeENDERECO: TStringField;
    cdsNFeNUMERO: TStringField;
    cdsNFeCOMPLEMENTO: TStringField;
    cdsNFeCEP: TStringField;
    cdsNFeBAIRRO: TStringField;
    cdsNFeREFERENCIA: TStringField;
    cdsNFeTELEFONE: TStringField;
    cdsNFeCELULAR: TStringField;
    cdsNFeKM_TOTAL: TSmallintField;
    cdsNFeUF: TStringField;
    cdsNFeCIDADE: TStringField;
    cdsNFeCIDADE_CODIGO: TBCDField;
    cdsNFeDOCUMENTO: TStringField;
    cdsNFeIE: TStringField;
    cdsNFeICMS_VBC: TBCDField;
    cdsNFeICMS_VLR: TBCDField;
    cdsNFeDT_SAIDA: TDateField;
    cdsNFeTRANSP_CNPJ_CPF: TStringField;
    cdsNFeTRANSP_NOME: TStringField;
    cdsNFeTRANSP_IE: TStringField;
    cdsNFeTRANSP_ENDERECO: TStringField;
    cdsNFeTRANSP_CIDADE: TStringField;
    cdsNFeTRANSP_UF: TStringField;
    cdsNFeVEIC_PLACA: TStringField;
    cdsNFeVEIC_UF: TStringField;
    cdsNFeTIPO: TStringField;
    cdsNFeINFO_ADICIONAL: TMemoField;
    qryComand: TpFIBQuery;
    cdsNFeICMS_ST_VBC: TBCDField;
    cdsNFeICMS_ST_VLR: TBCDField;
    cdsNFeOUTRAS_DESPESAS: TBCDField;
    cdsNFeINDICADOR_IE: TStringField;
    cdsNFeIDFORMA_PAG: TBCDField;
    cdsNFeTOT_PARCELA: TIntegerField;
    fdsContReceber: TpFIBDataSet;
    fdsContReceberID: TFIBBCDField;
    fdsContReceberIDFILIAL: TFIBBCDField;
    fdsContReceberDT_INC: TFIBDateField;
    fdsContReceberDT_ALT: TFIBDateField;
    fdsContReceberPOSICAO: TFIBStringField;
    fdsContReceberPREFIXO: TFIBStringField;
    fdsContReceberREFERENCIA: TFIBStringField;
    fdsContReceberIDCLIENTE: TFIBBCDField;
    fdsContReceberACRESCIMO: TFIBBCDField;
    fdsContReceberDESCONTO: TFIBBCDField;
    fdsContReceberVALOR: TFIBBCDField;
    fdsContReceberVALOR_PAGO: TFIBBCDField;
    fdsContReceberIDPORTADOR: TFIBBCDField;
    fdsContReceberHISTORICO: TFIBStringField;
    fdsContReceberIDFORMA_PAG: TFIBBCDField;
    fdsContReceberIDVENDA: TFIBBCDField;
    fdsContReceberTIPO_VENDA: TFIBStringField;
    fdsContReceberTOT_PARCELA: TFIBStringField;
    fdsContReceberPARCELAS_PG: TFIBIntegerField;
    fdsContReceberDINHEIRO: TFIBBCDField;
    fdsContReceberENVIADO_WEB: TFIBStringField;
    fdsContReceberItem: TpFIBDataSet;
    fdsContReceberItemID: TFIBBCDField;
    fdsContReceberItemPOSICAO: TFIBStringField;
    fdsContReceberItemPREFIXO: TFIBStringField;
    fdsContReceberItemREFERENCIA: TFIBStringField;
    fdsContReceberItemIDRECEBER: TFIBBCDField;
    fdsContReceberItemDT_VENC: TFIBDateField;
    fdsContReceberItemDT_PAG: TFIBDateField;
    fdsContReceberItemACRESCIMO: TFIBBCDField;
    fdsContReceberItemDESCONTO: TFIBBCDField;
    fdsContReceberItemVALOR: TFIBBCDField;
    fdsContReceberItemVALOR_PAGO: TFIBBCDField;
    fdsContReceberItemHISTORICO: TFIBStringField;
    fdsContReceberItemPARCELA: TFIBStringField;
    fdsContReceberItemENVIADO_WEB: TFIBStringField;
    fdsContReceberItemIDFILIAL: TFIBBCDField;
    fdsContReceberItemBAIXA_AGRUPADA: TFIBStringField;
    fdsContReceberItemPAGAMENTO_MOEDA: TFIBStringField;
    fdsContReceberItemREC_DESC_ACRE: TFIBBCDField;
    fdsContReceberItemREC_DINHEIRO: TFIBBCDField;
    fdsContReceberItemID_REC_ITEM: TFIBBCDField;
    fdsContReceberItemVALOR_JUROS_PAGO: TFIBBCDField;
    cdsNFeIDPEDIDO: TIntegerField;
    cdsNFeORIGEM_PEDIDO_VENDA: TStringField;
    cdsNFeENTREG_CNPJ_CPF: TStringField;
    cdsNFeENTREG_ENDERECO: TStringField;
    cdsNFeENTREG_NUMERO: TStringField;
    cdsNFeENTREG_COMPLEMENTO: TStringField;
    cdsNFeENTREG_BAIRRO: TStringField;
    cdsNFeENTREG_CIDADE_CODIGO: TIntegerField;
    cdsNFeENTREG_CIDADE: TStringField;
    cdsNFeENTREG_UF: TStringField;
    cdsNFeENTREG_TELEFONE: TStringField;
    cdsNFeENTREG_CEP: TStringField;
    cdsNFeICMS_REDUCAO_BC: TBCDField;
    dspManifesto: TDataSetProvider;
    dspItensManifesto: TDataSetProvider;
    cdsManifesto: TClientDataSet;
    cdsItensManifesto: TClientDataSet;
    cdsItensManifestoID: TBCDField;
    cdsItensManifestoIDMANIFESTO: TBCDField;
    cdsItensManifestoIDCLIENTE: TBCDField;
    cdsItensManifestoIDFILIAL: TBCDField;
    cdsItensManifestoITEM: TSmallintField;
    cdsItensManifestoCODIGO_NFE: TIntegerField;
    cdsItensManifestoCHAVE_NFE: TStringField;
    cdsItensManifestoPROTOCOLO_NFE: TStringField;
    cdsItensManifestoSERIE_NFE: TIntegerField;
    cdsItensManifestoVLR_TOTAL: TBCDField;
    cdsItensManifestoNOMECLIENTE: TStringField;
    qryManifesto: TpFIBQuery;
    cdsManifestoID: TBCDField;
    cdsManifestoIDFILIAL: TBCDField;
    cdsManifestoSTATUS: TStringField;
    cdsManifestoCODIGO_MANIFESTO: TIntegerField;
    cdsManifestoCHAVE_MANIFESTO: TStringField;
    cdsManifestoPROTOCOLO_MANIFESTO: TStringField;
    cdsManifestoSERIE_MANIFESTO: TIntegerField;
    cdsManifestoCNPJ_CPF: TStringField;
    cdsManifestoIE: TStringField;
    cdsManifestoNOME: TStringField;
    cdsManifestoRAZAO: TStringField;
    cdsManifestoENDERECO: TStringField;
    cdsManifestoNUMERO: TStringField;
    cdsManifestoBAIRRO: TStringField;
    cdsManifestoCODCIDADE: TBCDField;
    cdsManifestoCIDADE: TStringField;
    cdsManifestoUF: TStringField;
    cdsManifestoCEP: TStringField;
    cdsManifestoVLR_TOTAL_CARGA: TBCDField;
    cdsManifestoQTN_TOTAL_CARGA: TBCDField;
    cdsManifestoQTN_TOTAL_NF: TIntegerField;
    cdsManifestoPESO_BRUTO: TBCDField;
    cdsManifestoDT_INC: TDateField;
    cdsManifestoDT_ALT: TDateField;
    cdsManifestoDT_EMISSAO: TDateField;
    cdsManifestoIDTRANSPORTADORA: TBCDField;
    cdsManifestoIDVEICULO: TBCDField;
    cdsManifestoIDREBOQUE: TBCDField;
    cdsManifestoIDMOTORISTA: TBCDField;
    cdsManifestoCOD_CIDADE_DESTINO: TBCDField;
    cdsManifestoCIDADE_DESTINO: TStringField;
    cdsManifestoUF_DESTINO: TStringField;
    cdsManifestoUF_PERCUCO: TStringField;
    cdsManifestoCHAVE_ENCERRAMENTO: TStringField;
    cdsManifestoPROTOCOLO_ENCERRAMENTO: TStringField;
    cdsManifestoUNIDADE_CARGA: TIntegerField;
    cdsManifestoCOD_CIDADE_CARREGA: TBCDField;
    cdsManifestoCIDADE_CARREGA: TStringField;
    cdsManifestofdsManifestoItem: TDataSetField;
    cdsManifestoUF_PERCURCO2: TStringField;
    cdsManifestoDT_SAIDA: TDateField;
    cdsManifestoHORA_SAIDA: TTimeField;
    qryPedidoVenda: TpFIBQuery;
    cdsCntReceber: TClientDataSet;
    cdsCntReceberID_RECEBER: TStringField;
    cdsCntReceberTOT_PARCELA: TStringField;
    cdsCntReceberVLR_RECEBER: TFloatField;
    cdsCntReceberMOEDA: TStringField;
    cdsCntReceberItens: TJvMemoryData;
    cdsCntReceberItensID: TIntegerField;
    cdsCntReceberItensVALOR: TFloatField;
    cdsCntReceberItensDT_PARCELA: TDateField;
    cdsCntReceberItensNUM_PARCELA: TStringField;
    cdsCntReceberItensMOEDA: TIntegerField;
    cdsNFeICMS_VLR_IPI: TBCDField;
    cdsNFeICMS_ALQ_IPI: TBCDField;
    cdsNFeORDEM: TStringField;
    cdsNFeORIGEM_PEDIDO: TStringField;
    cdsItensNFeID: TBCDField;
    cdsItensNFeIDFILIAL: TBCDField;
    cdsItensNFeIDNFE: TBCDField;
    cdsItensNFeITEM: TSmallintField;
    cdsItensNFeIDPROD_ITEM: TBCDField;
    cdsItensNFeDT_INC: TDateField;
    cdsItensNFeDT_ALT: TDateField;
    cdsItensNFeQTN: TBCDField;
    cdsItensNFeVLR_UNITARIO: TBCDField;
    cdsItensNFeVLR_DESCONTO: TBCDField;
    cdsItensNFeVLR_TOTAL: TBCDField;
    cdsItensNFePESO: TBCDField;
    cdsItensNFeENVIADO_WEB: TStringField;
    cdsItensNFeORIGEM_VENDA_PEDIDO: TStringField;
    cdsItensNFeNUM_VENDA_PEDIDO: TBCDField;
    cdsItensNFeCFOP: TStringField;
    cdsItensNFeCST_CSOSN: TStringField;
    cdsItensNFeINFO_ADICIONAL: TStringField;
    cdsItensNFeICMS_BCALC: TBCDField;
    cdsItensNFeICMS_VLR: TBCDField;
    cdsItensNFeICMS_ALIQIPI: TBCDField;
    cdsItensNFeICMS_PERCENTL_DEVOL: TBCDField;
    cdsItensNFeICMS_VIPI: TBCDField;
    cdsItensNFeICMS_ALIQ: TBCDField;
    cdsItensNFeICMS_ST_VLR: TBCDField;
    cdsItensNFeICMS_ST_VBC: TBCDField;
    cdsItensNFeICMS_REDUCAO_BC: TBCDField;
    cdsItensNFeVLR_FRETE: TBCDField;
    cdsItensNFeVLR_OUTRAS_DESPESAS: TBCDField;
    cdsItensNFePRECO_CUSTO: TBCDField;
    cdsItensNFeDT_EMISSAO: TDateField;
    cdsItensNFePRODUTO: TStringField;
    cdsItensNFeCOD_FABRICA: TStringField;
    cdsItensNFeCOD_FABRICANTE: TStringField;
    cdsItensNFeUNIDADE: TStringField;
    cdsItensNFeNCM: TStringField;
    cdsItensNFeCEST: TStringField;
    cdsItensNFeIBPT_NACIONA_FEDERAL: TBCDField;
    cdsItensNFeINFO_ADICIONAL1: TStringField;
    cdsNFeNUM_ALEATORIO_NFE: TIntegerField;
    cdsManifestoNUM_ALEATORIO_MDFE: TIntegerField;
    cdsNFeSERIE: TIntegerField;
    cdsItensNFeCST_PIS: TStringField;
    cdsItensNFeCST_COFINS: TStringField;
    cdsItensNFeFCP: TBCDField;
    fdsProcon: TpFIBDataSet;
    fdsProconID: TFIBIntegerField;
    fdsProconUF: TFIBStringField;
    fdsProconENDERECO: TFIBStringField;
    fdsProconDESCRICAO: TFIBStringField;
    fdsProconEMAIL: TFIBStringField;
    fdsProconDDD: TFIBStringField;
    fdsProconSITE: TFIBStringField;
    fdsProconTELEFONE: TFIBStringField;
    cdsItensNFeIBPT_ESTADUAL: TBCDField;
    cdsItensNFeIBPT_MUNICIPAL: TBCDField;
    cdsItensManifestoCHAVE_CONTIGENCIA: TStringField;
    cdsNFeCHAVE_CONTIGENCIA: TStringField;
    cdsItensNFeICMS_MVAST: TBCDField;
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure GerarNFe;
    procedure EmitirNFAE;
    procedure TransmiteNFe;
    procedure ImprimirDANFE;
    procedure CancelarNFe;
    procedure CartaCorrecao;
    procedure InutizarNumeracao();
    function TestaConex�o: Boolean;
    procedure GerarMDFe;
    procedure EncerraMDFe;
    procedure CancelarMDFe;
    procedure ImprimirDAMDFe;
    procedure PROCON(uf:String);
  public
    param, NumeroProtocolo, ChaveCancelamento, correcao, IDEventoCan: string;
    numInicial, numFinal, modelo, serie: Integer;
    justificativa: string end;

  var
    frmStatusNFe: TfrmStatusNFe;
    idNF: String;

implementation

{$R *.dfm}

uses untPrincipal, untPedidos, untData, untNfe, untNFeInformacoesAdicionais,
  untMDFe;
// -----------------------------------------------

{ TfrmStatusNFe }

procedure TfrmStatusNFe.btnOKClick(Sender: TObject);
begin
  param := EmptyStr;
  ModalResult := mrCancel;
end;

procedure TfrmStatusNFe.CancelarMDFe;
var
  vAux: String;
begin
  try
    lblRetorno.Caption := 'Aguarde Cancelando Manifesto Eletr�nico ...';
    // frmMDFe.ACBrMDFe1.Manifestos.Clear;
    if not(InputQuery('WebServices Cancelamento', 'Justificativa', vAux)) then
    begin
      ModalResult := mrCancel;
      exit;
    end;
    // frmMDFe.ACBrMDFe1.Cancelamento(trim(vAux),frmMDFe.fdsManifestoCODIGO_MANIFESTO.AsInteger);
    frmMDFe.ACBrMDFe1.WebServices.Consulta.MDFeChave :=
      frmMDFe.fdsManifestoCHAVE_MANIFESTO.AsString;
    frmMDFe.ACBrMDFe1.WebServices.Consulta.Executar;

    frmMDFe.ACBrMDFe1.EventoMDFe.Evento.Clear;
    with frmMDFe.ACBrMDFe1.EventoMDFe.Evento.New do
    begin
      infEvento.CNPJCPF :=
        copy(OnlyNumber(frmMDFe.ACBrMDFe1.WebServices.Consulta.
        MDFeChave), 7, 14);
      infEvento.cOrgao :=
        StrToIntDef
        (copy(OnlyNumber(frmMDFe.ACBrMDFe1.WebServices.Consulta.MDFeChave),
        1, 2), 0);
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.chMDFe := frmMDFe.ACBrMDFe1.WebServices.Consulta.MDFeChave;

      infEvento.detEvento.nProt :=
        frmMDFe.ACBrMDFe1.WebServices.Consulta.Protocolo;
      infEvento.detEvento.xJust := vAux;
    end;

    frmMDFe.ACBrMDFe1.EnviarEvento
      (frmMDFe.fdsManifestoCODIGO_MANIFESTO.AsInteger);

    with frmMDFe do
    begin
      fdsManifesto.Edit;
      fdsManifestoSTATUS.AsString := 'CL';
      fdsManifesto.Post;
      DM.Conexao.CommitRetaining;
    end;
    lblRetorno.Caption := 'Cancelamento do Manifesto realizado com sucesso';
    btnOK.Enabled := True;

  Except
    on E: Exception do
    begin
      lblRetorno.Caption := 'Ocorreu algum erro';
      mmoErro.Lines.Add
        ('Ocorreu o seguinte erro ao cancelar o Manifesto Eletr�nico:');
      mmoErro.Lines.Add('C�digo do Erro: ' +
        IntToStr(frmMDFe.ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.
        retEvento.Items[0].RetInfEvento.cStat) + '   NFe N�: ' +
        frmMDFe.fdsManifestoCODIGO_MANIFESTO.AsString);
      mmoErro.Lines.Add(frmMDFe.ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.
        retEvento.Items[0].RetInfEvento.xMotivo);
      btnOK.Enabled := True;
    end;
  End;
end;

procedure TfrmStatusNFe.CancelarNFe;
var
  chaveXML, caminhoXML: String;
  mes:TDateTime;
begin
  lblRetorno.Caption := 'Aguarde Cancelando Nota Fiscal ...';

  justificativa := 'Erro de lan�amento da nota';
  if not(InputQuery('WebServices Eventos: Cancelamento',
    'Justificativa do Cancelamento', justificativa)) then
  begin
    ModalResult := mrCancel;
    exit;
  end;
  frmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  frmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;

  with frmPrincipal.ACBrNFe1.EventoNFe.Evento.New do
  begin
    // frmPedidos.fdsPedido.Locate('ID', '34', []);
    // ShowMessage(cdsPedidoid.AsString);
    infEvento.chNFe := Trim(OnlyNumber(cdsNFeCHAVE_CONSULTA.AsString));
    infEvento.detEvento.nProt := cdsNFeNUMERO_PROTOCOLO.AsString;
    infEvento.CNPJ := DM.fdsConfigCNPJ.AsString;
    infEvento.dhEvento := now;
    infEvento.tpEvento := teCancelamento;
    infEvento.detEvento.xJust := justificativa;
  end;

  btnOK.Enabled := True;
  chaveXML := StringReplace(cdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',
    [rfReplaceAll]) + '-nfe.xml';
  caminhoXML := ExtractFilePath(Application.ExeName) + '\NFeLogs\Emitidas\' +
    FormatDateTime('yyyy', now) + FormatDateTime('MM', now) + '\' + chaveXML;

  if FileExists(caminhoXML) = False then
  begin
    mes := Now;
    mes := INCMONTH(mes, -1);
    caminhoXML := ExtractFilePath(Application.ExeName) + '\NFeLogs\Emitidas\' +
    FormatDateTime('yyyy', now) + FormatDateTime('MM', mes) + '\' + chaveXML;
  end;


  frmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(caminhoXML, False);

  if frmPrincipal.ACBrNFe1.EnviarEvento
    (StrToInt(FormatDateTime('yymmddhhmm', now))) then
  begin
    with frmPrincipal.ACBrNFe1.WebServices.EnvEvento do
    begin
      if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
      begin
        lblRetorno.Caption := 'Ocorreu algum erro';
        mmoErro.Lines.Add
          ('Ocorreu o seguinte erro ao cancelar a nota fiscal eletr�nica:');
        mmoErro.Lines.Add('C�digo do Erro: ' +
          IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat) +
          '   NFe N�: ' + cdsNFeCODIGO_NFE.AsString);
        mmoErro.Lines.Add(EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xMotivo);
        btnOK.Enabled := True;
      end
      else
      begin
        // retornos
        NumeroProtocolo := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
        ChaveCancelamento := EventoRetorno.retEvento.Items[0]
          .RetInfEvento.chNFe;
        IDEventoCan :=
          (TpEventoToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.tpEvento)
          + ChaveCancelamento + IntToStr(EventoRetorno.retEvento.Items[0]
          .RetInfEvento.nSeqEvento));

        if Length(IntToStr(EventoRetorno.retEvento.Items[0]
          .RetInfEvento.nSeqEvento)) = 1 then
          IDEventoCan :=
            (TpEventoToStr(EventoRetorno.retEvento.Items[0]
            .RetInfEvento.tpEvento) + ChaveCancelamento + '0' +
            IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.nSeqEvento));

        with frmNFe do
        begin
          fdsNFe.Edit;
          fdsNFeSTATUS.AsString := 'CL';
          fdsNFe.Post;
          transNFe.CommitRetaining;
        end;

        btnOK.Enabled := True;
        ModalResult := mrOk;
        exit;
      end;
    end;
  end
  else
  begin
    with frmPrincipal.ACBrNFe1.WebServices.EnvEvento do
    begin
      lblRetorno.Caption := 'Ocorreu algum erro';
      mmoErro.Lines.Add('Ocorreram erros ao tentar efetuar o cancelamento:');
      mmoErro.Lines.Add('Lote: ' + IntToStr(EventoRetorno.idLote) +
        '    Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb));
      mmoErro.Lines.Add('Orgao: ' + IntToStr(EventoRetorno.cOrgao) +
        '    Status: ' + IntToStr(EventoRetorno.cStat));
      mmoErro.Lines.Add('Motivo: ' + EventoRetorno.xMotivo);
    end;
    btnOK.Enabled := True;
  end;
end;

procedure TfrmStatusNFe.CartaCorrecao;
var
  sequencia: string;
begin
  frmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;
  sequencia := '1';
  InputQuery('Informe o n�mero de segu�ncia desta Carta:', 'Sequ�ncia da Carta',
    sequencia);

  with frmPrincipal.ACBrNFe1.EventoNFe.Evento.New do
  begin
    infEvento.chNFe := Trim(OnlyNumber(cdsNFeCHAVE_CONSULTA.AsString));
    infEvento.CNPJ := DM.fdsConfigCNPJ.AsString;
    infEvento.dhEvento := now;
    infEvento.tpEvento := teCCe;
    infEvento.nSeqEvento := StrToInt(sequencia);
    infEvento.detEvento.xCorrecao := correcao;
    infEvento.detEvento.xCondUso := '';
  end;

  btnOK.Enabled := True;
  if frmPrincipal.ACBrNFe1.EnviarEvento
    (StrToInt(FormatDateTime('yymmddhhmm', now))) then
  begin
    with frmPrincipal.ACBrNFe1.WebServices.EnvEvento do
    begin
      if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
      begin
        lblRetorno.Caption := 'Ocorreu algum erro';
        mmoErro.Lines.Add
          ('Ocorreu o seguinte erro ao enviar a Carta de Corre��o:');
        mmoErro.Lines.Add('C�digo do Erro: ' +
          IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat) +
          '   NFe N�: ' + cdsNFeCODIGO_NFE.AsString);
        mmoErro.Lines.Add(EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xMotivo);
        btnOK.Enabled := True;
      end
      else
      begin
        // retornos
        lblRetorno.Caption := 'Carta de Corre��o enviada com sucesso';
        btnOK.Enabled := True;
        mmoErro.Lines.Add(EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xMotivo);
        frmPrincipal.ACBrNFe1.ImprimirEvento;
        // ModalResult := mrOk;
        // Exit;
      end;
    end;
  end
  else
  begin
    with frmPrincipal.ACBrNFe1.WebServices.EnvEvento do
    begin
      lblRetorno.Caption := 'Ocorreu algum erro';
      mmoErro.Lines.Add
        ('Ocorreram erros ao tentar enviar a Carta de Corre��o:');
      mmoErro.Lines.Add('Lote: ' + IntToStr(EventoRetorno.idLote) +
        '    Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb));
      mmoErro.Lines.Add('Orgao: ' + IntToStr(EventoRetorno.cOrgao) +
        '    Status: ' + IntToStr(EventoRetorno.cStat));
      mmoErro.Lines.Add('Motivo: ' + EventoRetorno.xMotivo);
    end;
    btnOK.Enabled := True;
  end;
end;

procedure TfrmStatusNFe.EmitirNFAE;
Var
  NotaF: NotaFiscal;
  Produto: TDetCollectionItem;
  NFRef: TNFrefCollectionItem; // Adiciona as notas fiscais que ser�o devolvidas
  Volume: TVolCollectionItem;
  Referenciada: TNFrefCollectionItem;
  ObsComplementar: TobsContCollectionItem;
  ObsFisco: TobsFiscoCollectionItem;
  Ok: Boolean;
  totImpostos, vlrTotCreditoICMS, vlrDescItens, vlrTotDesc, vlrAcrescItens,
    vlrTotAcresc, totQtnItens, vlrFreteItens, vlr_FretTemp, vlrOutras_Despesas,
    outros: Double;
  categoria_CFOP, tipoMovimentacao, tipoTemp: String;
  chaveXML, caminhoXML, destinoXML: string;
  parcela, totParcela, idReceber, formataData: String;
  valorParcela, vlrReceber: Double;
  parcelaVenc, mes: TDateTime;

begin
  try
    totImpostos := 0;
    vlrDescItens := 0;
    totQtnItens := 0;
    vlrTotDesc := 0;
    vlrAcrescItens := 0;
    vlrTotAcresc := 0;
    vlrTotCreditoICMS := 0;
    vlr_FretTemp := 0;
    vlrOutras_Despesas := 0;
    outros := 0;
    // vlrFreteItens := cdsNFeVLR_FRETE.AsFloat / cdsItensNFe ;
    tipoTemp := cdsNFeSTATUS.AsString;

    if cdsNFeVLR_DESCONTO.AsFloat > 0 then
    begin
      with frmNFe.qrySql do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(QTN) as QTNTOTALITEM, SUM(VLR_DESCONTO * QTN) AS TOTALDESCONTO FROM NFE_ITEM WHERE IDNFE = '
          + cdsNFeID.AsString + ' AND IDFILIAL = ' + cdsNFeIDFILIAL.AsString);
        Prepare;
        ExecQuery;
      end;
      if ((RoundTo(cdsNFeVLR_DESCONTO.AsFloat, -2) -
        RoundTo(frmNFe.qrySql.FieldByName('TOTALDESCONTO').AsFloat, -2)) > 0)
      then
      begin
        totQtnItens := frmNFe.qrySql.FieldByName('QTNTOTALITEM').AsFloat;
        vlrDescItens :=
          RoundTo((cdsNFeVLR_DESCONTO.AsFloat -
          RoundTo(frmNFe.qrySql.FieldByName('TOTALDESCONTO').AsFloat, -2)) /
          totQtnItens, -2);
      end;
    end;
    frmPrincipal.ACBrNFe1.NotasFiscais.Clear;

    NotaF := frmPrincipal.ACBrNFe1.NotasFiscais.Add;
    NotaF.NFe.Ide.cNF := cdsNFeCODIGO_NFE.AsInteger;
    NotaF.NFe.Ide.natOp := cdsNFeNATUREZA_OPERACAO.AsString;
    NotaF.NFe.Ide.indPag := ipVista; // utiliza a blibioteca pcnConversao
    NotaF.NFe.Ide.modelo := 55;
    NotaF.NFe.Ide.serie := DM.fdsConfigNFeSERIE_NFE.AsInteger;
    NotaF.NFe.Ide.nNF := cdsNFeCODIGO_NFE.AsInteger;
    NotaF.NFe.Ide.dEmi := now;
    NotaF.NFe.Ide.procEmi := peAplicativoContribuinte;

    // NotaF.NFe.Ide.indPag
    if cdsNFeDT_SAIDA.AsDateTime < now then
    begin
      with qryComand do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update NFe set DT_SAIDA = CURRENT_DATE where ID = ' +
          cdsNFeID.AsString);
        Prepare;
        ExecQuery;
        DM.Conexao.CommitRetaining;
      end;
      NotaF.NFe.Ide.dSaiEnt := now;
    end
    else
      NotaF.NFe.Ide.dSaiEnt := cdsNFeDT_SAIDA.AsDateTime;

    NotaF.NFe.Ide.hSaiEnt := now;

    with qryComand do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select TIPO_MOVIMENTACAO from NATUREZA_DE_OPERACAO where OPERACAO = '
        + QuotedStr(NotaF.NFe.Ide.natOp));
      Prepare;
      ExecQuery;
      tipoMovimentacao := FieldByName('TIPO_MOVIMENTACAO').AsString;
    end;

    NotaF.NFe.Ide.tpNF := TpcnTipoNfe(tnSaida);

    // Para NFe Avulsa preencha os campos abaixo

    { NotaF.NFe.Avulsa.CNPJ    := '03541856000162';
      NotaF.NFe.Avulsa.xOrgao  := '90';
      NotaF.NFe.Avulsa.matr    := '';
      NotaF.NFe.Avulsa.xAgente := '';
      NotaF.NFe.Avulsa.fone    := '';
      NotaF.NFe.Avulsa.UF      := DM.fdsConfigUF.AsString;
      NotaF.NFe.Avulsa.nDAR    := '';
      NotaF.NFe.Avulsa.dEmi    := now;
      NotaF.NFe.Avulsa.vDAR    := 0;
      NotaF.NFe.Avulsa.repEmi  := '';
      NotaF.NFe.Avulsa.dPag    := now; }

    if tipoMovimentacao = 'E ' then
    begin
      NotaF.NFe.Ide.tpNF := TpcnTipoNfe(tnEntrada);

      Referenciada := NotaF.NFe.Ide.NFRef.New;
      Referenciada.refNFe := cdsNFeCODIGO_NFE.AsString; // NFe Eletronica

      Referenciada.RefNFP.cUF := UFtoCUF(DM.fdsConfigUF.AsString);
      Referenciada.RefNFP.AAMM := FormatDateTime('yy', now) +
        FormatDateTime('MM', now);
      Referenciada.RefNFP.CNPJCPF := DM.fdsConfigCNPJ.AsString; // |
      Referenciada.RefNFP.IE := 'cds'; // |- NF produtor Rural
      Referenciada.RefNFP.modelo := '4'; // |
      Referenciada.RefNFP.serie := 890; // |
      Referenciada.RefNFP.nNF := cdsNFeCODIGO_NFE.AsInteger; // |

    end;
    // utiliza a blibioteca pcnConversaoNFe
    NotaF.NFe.Ide.tpEmis := TpcnTipoEmissao(teNormal);
    // utiliza a blibioteca pcnConversao
    NotaF.NFe.Ide.tpAmb := frmPrincipal.ACBrNFe1.Configuracoes.WebServices.
      Ambiente; // Lembre-se de trocar esta vari�vel quando for para ambiente de produ��o
    NotaF.NFe.Ide.cUF := UFtoCUF(DM.fdsConfigUF.AsString);
    NotaF.NFe.Ide.cMunFG := DM.fdsConfigCODIGO_MUNICIPIO.AsInteger;

    if cdsNFeUF.AsString = DM.fdsConfigUF.AsString then
      NotaF.NFe.Ide.idDest := doInterna
    else
      NotaF.NFe.Ide.idDest := doInterestadual;

    cdsItensNFe.First;

    with qryComand do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select CAT_SAIDA_CFOP from NATUREZA_DE_OPERACAO where OPERACAO = '
        + QuotedStr(NotaF.NFe.Ide.natOp));
      Prepare;
      ExecQuery;
      categoria_CFOP := FieldByName('CAT_SAIDA_CFOP').AsString;
    end;
    // Verifica se � devolu��o e faz com que em anoa��es adicionas da nota apare�a o valores informados em BICMS ST e VICMS ST

    if (categoria_CFOP = 'DV') then
    begin
      NotaF.NFe.Ide.finNFe := fnDevolucao;
      NotaF.NFe.Ide.indFinal := cfNao;

      cdsNF_Devolvidas.First;

      while not(cdsNF_Devolvidas.Eof) do
      begin
        NFRef := NotaF.NFe.Ide.NFRef.Add;
        NFRef.refNFe := cdsNF_DevolvidasCHAVE_NF_COMPRA.AsString;
        cdsNF_Devolvidas.Next;
      end;
    end;

    if categoria_CFOP = 'CP' then
    begin
      NotaF.NFe.Ide.finNFe := fnComplementar;
      NotaF.NFe.Ide.indFinal := cfNao;
    end;

    if categoria_CFOP = 'VD' then
    begin
      NotaF.NFe.Ide.finNFe := fnNormal;
      NotaF.NFe.Ide.indFinal := cfConsumidorFinal;
      NotaF.NFe.Ide.indPres := pcPresencial;
    end
    else
    begin
      NotaF.NFe.Ide.indPres := pcOutros;
      NotaF.NFe.Ide.indFinal := cfNao;
    end;

    // Dados do respons�vel T�cnico    (EM breve ser� solicitado)
    // NotaF.NFe.infRespTec.CNPJ :='';//CNPJ DA EMPRESA EMISSORA
    // NotaF.NFe.infRespTec.xContato:= '';// NOME DA PESSOA RESPONSAVEL PELA EMPRESA
    // NotaF.NFe.infRespTec.email:='';// EMAIL DE CONTATO DA EMPRESA
    // NotaF.NFe.infRespTec.fone:='';// TELEFONE DE CONTATO DAA EMPRESA
    // NotaF.NFe.infRespTec.idCSRT:='';// DA EMPRESA
    // NotaF.NFe.infRespTec.hashCSRT:='';// DA EMPRESA
    //

    // NotaF.NFe.Ide.tpImp     := tiN;

    NotaF.NFe.Emit.CNPJCPF := FormatarCNPJouCPF(DM.fdsConfigCNPJ.AsString);
    NotaF.NFe.Emit.IE := DM.fdsConfigIE.AsString;
    NotaF.NFe.Emit.xNome := DM.fdsConfigRAZAO.AsString;
    NotaF.NFe.Emit.xFant := DM.fdsConfigNOME.AsString;

    NotaF.NFe.Emit.EnderEmit.fone := DM.fdsConfigTELEFONE.AsString;
    NotaF.NFe.Emit.EnderEmit.CEP := DM.fdsConfigCEP.AsInteger;
    NotaF.NFe.Emit.EnderEmit.xLgr := DM.fdsConfigENDERECO.AsString;
    NotaF.NFe.Emit.EnderEmit.nro := DM.fdsConfigNUMERO.AsString;
    NotaF.NFe.Emit.EnderEmit.xCpl := '';
    NotaF.NFe.Emit.EnderEmit.xBairro := DM.fdsConfigBAIRRO.AsString;
    NotaF.NFe.Emit.EnderEmit.cMun := DM.fdsConfigCODIGO_MUNICIPIO.AsInteger;
    NotaF.NFe.Emit.EnderEmit.xMun := DM.fdsConfigCIDADE.AsString;
    NotaF.NFe.Emit.EnderEmit.UF := DM.fdsConfigUF.AsString;
    NotaF.NFe.Emit.EnderEmit.cPais := 1058;
    NotaF.NFe.Emit.EnderEmit.xPais := 'BRASIL';

    NotaF.NFe.Emit.IEST := '';
    // NotaF.NFe.Emit.IM                := '2648800'; // Preencher no caso de existir servi�os na nota
    // NotaF.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se � permitido
    // a inclus�o de servi�os na NFe
    NotaF.NFe.Emit.CRT := crtSimplesNacional;
    // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)

    // In�cio de informa��es do Cliente
    NotaF.NFe.Dest.CNPJCPF := cdsNFeDOCUMENTO.AsString;

    if cdsNFeINDICADOR_IE.AsString = 'IS' then
    begin
      NotaF.NFe.Dest.indIEDest := inIsento;
      NotaF.NFe.Dest.IE := cdsNFeIE.AsString;
      NotaF.NFe.Entrega.IE := cdsNFeIE.AsString;
    end;
    if cdsNFeINDICADOR_IE.AsString = 'C' then
    begin
      NotaF.NFe.Dest.indIEDest := inContribuinte;
      NotaF.NFe.Dest.IE := cdsNFeIE.AsString;
      NotaF.NFe.Entrega.IE := cdsNFeIE.AsString;
    end;
    if cdsNFeINDICADOR_IE.AsString = 'NC' then
    begin
      NotaF.NFe.Dest.indIEDest := inNaoContribuinte;
    end;

    // NotaF.NFe.Dest.ISUF              := cdsPedidoUF.AsString;
    if Trim(cdsNFeRAZAOSOCIAL.AsString) = '' then
      NotaF.NFe.Dest.xNome := cdsNFeCLIENTE.AsString
    else
      NotaF.NFe.Dest.xNome := cdsNFeRAZAOSOCIAL.AsString;

    NotaF.NFe.Dest.EnderDest.fone := cdsNFeTELEFONE.AsString;
    NotaF.NFe.Dest.EnderDest.CEP := cdsNFeCEP.AsInteger;
    NotaF.NFe.Dest.EnderDest.xLgr := cdsNFeENDERECO.AsString;
    NotaF.NFe.Dest.EnderDest.nro := cdsNFeNUMERO.AsString;
    NotaF.NFe.Dest.EnderDest.xCpl := cdsNFeCOMPLEMENTO.AsString;
    NotaF.NFe.Dest.EnderDest.xBairro := cdsNFeBAIRRO.AsString;
    NotaF.NFe.Dest.EnderDest.cMun := cdsNFeCIDADE_CODIGO.AsInteger;
    NotaF.NFe.Dest.EnderDest.xMun := cdsNFeCIDADE.AsString;
    NotaF.NFe.Dest.EnderDest.UF := cdsNFeUF.AsString;
    NotaF.NFe.Dest.EnderDest.cPais := 1058;
    NotaF.NFe.Dest.EnderDest.xPais := 'BRASIL';
    // Fim de informa��es do Cliente

    // Use os campos abaixo para informar o endere�o de entrega quando for diferente do Remetente/Destinat�rio

    // Inicio adicionando Produtos
    cdsItensNFe.First;

    while not(cdsItensNFe.Eof) do
    begin
      Produto := NotaF.NFe.Det.New;
      Produto.Prod.IndTot := itSomaTotalNFe;
      // informa se o item entr� no calculo total da nota
      Produto.Prod.nItem := cdsItensNFeITEM.AsInteger;
      // N�mero sequencial, para cada item deve ser incrementado
      if (categoria_CFOP = 'DV') or (categoria_CFOP = 'CP') then
        Produto.Prod.cProd := cdsItensNFeCOD_FABRICANTE.AsString
      else
        Produto.Prod.cProd := cdsItensNFeIDPROD_ITEM.AsString;

      if ACBrValidador.ValidarGTIN(cdsItensNFeCOD_FABRICA.AsString) = '' then
      begin
        Produto.Prod.cEAN := cdsItensNFeCOD_FABRICA.AsString;
        Produto.Prod.cEANTrib := cdsItensNFeCOD_FABRICA.AsString;
        // Explica��o pg 4 do Manual de Preenchimento_NFC-e
      end
      else
      begin
        Produto.Prod.cEAN := 'SEM GTIN';
        Produto.Prod.cEANTrib := 'SEM GTIN';
      end;

      Produto.Prod.xProd := StringReplace(cdsItensNFePRODUTO.AsString, '�', 'C',
        [rfReplaceAll]);
      Produto.Prod.NCM := cdsItensNFeNCM.AsString;
      // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
      Produto.Prod.EXTIPI := '';
      Produto.Prod.CFOP := cdsItensNFeCFOP.AsString;
      Produto.Prod.uCom := cdsItensNFeUNIDADE.AsString;
      Produto.Prod.qCom := cdsItensNFeQTN.AsFloat;
      Produto.Prod.vUnCom := cdsItensNFeVLR_UNITARIO.AsFloat;
      // Deve ser informado sem desconto;

      Produto.Prod.uTrib := cdsItensNFeUNIDADE.AsString;
      Produto.Prod.qTrib := cdsItensNFeQTN.AsFloat;
      Produto.Prod.vUnTrib := cdsItensNFeVLR_UNITARIO.AsFloat;

      Produto.Prod.vProd := RoundTo(cdsItensNFeQTN.AsFloat * cdsItensNFeVLR_UNITARIO.AsFloat, -2);
      // Deve ser informado sem desconto

      Produto.Prod.vOutro := cdsItensNFeVLR_OUTRAS_DESPESAS.AsFloat;
      Produto.Prod.vFrete := cdsItensNFeVLR_FRETE.AsFloat;
      Produto.Prod.vSeg := 0;
      // vlr_fretTemp := vlr_fretTemp + Produto.Prod.vFrete ;

      Produto.Prod.vDesc := (vlrDescItens + cdsItensNFeVLR_DESCONTO.AsFloat) *
        cdsItensNFeQTN.AsFloat;
      // Aqui eu somo o desconto aplicado no total rateado para os itens com o desconto unit�rio aplicado direto nos itens durante a venda
      vlrTotDesc := vlrTotDesc + Produto.Prod.vDesc;
      // Soma o total de desconto aplicado para informar no cabe�alho da nota

      Produto.Prod.CEST := cdsItensNFeCEST.AsString;

      Produto.infAdProd := cdsItensNFeINFO_ADICIONAL.AsString;

      // lei da transparencia nos impostos
      // Produto.Imposto.ICMS.CST          := cst50;
      Produto.Imposto.ICMS.CSOSN :=
        StrToCSOSNIcms(Ok, cdsItensNFeCST_CSOSN.AsString);
      Produto.Imposto.ICMS.orig := oeNacional;
      Produto.Imposto.ICMS.modBC := dbiValorOperacao;
      // Produto.Imposto.ICMS.vBC     := 100;   //V�tor Fazer o c�lculo dos impostos
      // Produto.Imposto.ICMS.pICMS   := 18;
      // Produto.Imposto.ICMS.vICMS   := 18;
      Produto.Imposto.ICMS.vBC := cdsItensNFeICMS_BCALC.AsFloat;
      Produto.Imposto.ICMS.pICMS := cdsItensNFeICMS_ALIQ.AsFloat;
      Produto.Imposto.ICMS.vICMS := cdsItensNFeICMS_VLR.AsFloat;
      Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
      Produto.Imposto.ICMS.pMVAST := cdsItensNFeICMS_MVAST.AsFloat;

      Produto.Imposto.ICMS.vBCST := cdsItensNFeICMS_ST_VBC.AsFloat;
      Produto.Imposto.ICMS.pICMSST := 0;
      Produto.Imposto.ICMS.vICMSST := cdsItensNFeICMS_ST_VLR.AsFloat;
      Produto.Imposto.ICMS.pRedBC := 0;

      // C�lculo do FCP - Fundo de Combate a Pobreza
      Produto.Imposto.ICMS.vBCFCP := 0;
      Produto.Imposto.ICMS.pFCP := 0;
      Produto.Imposto.ICMS.vFCP := 0;

      if cdsItensNFeCST_CSOSN.AsString = '101' then
        vlrTotCreditoICMS :=
          (vlrTotCreditoICMS + RoundTo(Produto.Prod.vProd * 0.0125, -2));

      // partilha do ICMS e fundo de probreza
      Produto.Imposto.ICMSUFDest.vBCUFDest := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSUFDest := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSInter := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSInterPart := 0.00;
      Produto.Imposto.ICMSUFDest.vICMSUFDest := 0.00;
      Produto.Imposto.ICMSUFDest.vICMSUFRemet := 0.00;
      Produto.Imposto.vTotTrib :=
        RoundTo(Produto.Prod.vUnTrib * (cdsItensNFeIBPT_NACIONA_FEDERAL.AsFloat
        / 100), -2);
      totImpostos := totImpostos + Produto.Imposto.vTotTrib;
      cdsItensNFe.Next;
    end;
    // Fim adicionando Produtos

    // In�cio impostos totais da Nota
    // NotaF.NFe.Total.ICMSTot.vBC     := 100;  //V�tor Fazer o c�lculo dos impostos
    NotaF.NFe.Total.ICMSTot.vBC := cdsNFeICMS_VBC.AsFloat;
    NotaF.NFe.Total.ICMSTot.vICMS := cdsNFeICMS_VLR.AsFloat;

    NotaF.NFe.Total.ICMSTot.vBCST := cdsNFeICMS_ST_VBC.AsFloat;
    NotaF.NFe.Total.ICMSTot.vST := cdsNFeICMS_ST_VLR.AsFloat;
    // end;

    NotaF.NFe.Total.ICMSTot.vOutro := vlrTotAcresc +
      cdsNFeOUTRAS_DESPESAS.AsFloat;
    NotaF.NFe.Total.ICMSTot.vProd := cdsNFeVLR_TOTITEM.AsFloat;
    // Informato sem descostos
    NotaF.NFe.Total.ICMSTot.vFrete := cdsNFeVLR_FRETE.AsFloat;
    NotaF.NFe.Total.ICMSTot.vSeg := 0;
    NotaF.NFe.Total.ICMSTot.vDesc := vlrTotDesc;
    // N�o foi usado o campo VLR_DESCONTO da tabela VENDA pois esse campo s� armazena o desconto dado direto no total da nota
    NotaF.NFe.Total.ICMSTot.vII := 0;
    NotaF.NFe.Total.ICMSTot.vIPI := 0;
    NotaF.NFe.Total.ICMSTot.vPIS := 0;
    NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
    NotaF.NFe.Total.ICMSTot.vNF := cdsNFeVLR_TOTAL.AsFloat;

    // lei da transparencia de impostos
    NotaF.NFe.Total.ICMSTot.vTotTrib := totImpostos;

    // partilha do icms e fundo de probreza
    NotaF.NFe.Total.ICMSTot.vFCPUFDest := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

    NotaF.NFe.Total.ISSQNtot.vServ := 0;
    NotaF.NFe.Total.ISSQNtot.vBC := 0;
    NotaF.NFe.Total.ISSQNtot.vISS := 0;
    NotaF.NFe.Total.ISSQNtot.vPIS := 0;
    NotaF.NFe.Total.ISSQNtot.vCOFINS := 0;

    NotaF.NFe.Total.ICMSTot.vFCPUFDest := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;
    // Fim impostos totais da Nota

    with NotaF.NFe.pag.New do
    begin
      if (categoria_CFOP = 'DV') or (cdsNFeIDFORMA_PAG.AsString = '11') then
      begin
        tPag := TpcnFormaPagamento(11);
        vPag := 0;
      end
      else
      begin
        with qryComand do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ID,VALOR,TOT_PARCELA FROM CNT_RECEBER where IDVENDA = '
            + QuotedStr(cdsNFeID.AsString) + 'AND IDFILIAL=' +
            QuotedStr(cdsNFeIDFILIAL.AsString));
          Prepare;
          ExecQuery;
          totParcela := FieldByName('TOT_PARCELA').AsString;
          idReceber := FieldByName('ID').AsString;
          vlrReceber := FieldByName('VALOR').AsFloat;
        end;

        case cdsNFeIDFORMA_PAG.AsInteger of
          1:
            begin
              tPag := TpcnFormaPagamento(0);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
            end;
          2:
            begin
              NotaF.NFe.Ide.indPag := ipPrazo;
              tPag := TpcnFormaPagamento(2);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
              with NotaF.NFe.Cobr do
              begin
                Fat.nFat := 'Numero da Fatura';
                Fat.vOrig := vlrReceber;
                Fat.vLiq := vlrReceber;
                Fat.vDesc := 0;
                with qryComand do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT DT_VENC,PARCELA,VALOR from CNT_RECEBER_ITEM WHERE IDRECEBER ='
                    + QuotedStr(idReceber));
                  Prepare;
                  ExecQuery;
                end;
                if qryComand.RecordCount > 0 then
                begin
                  while not qryComand.Eof do
                  begin
                    valorParcela := qryComand.FieldByName('VALOR').AsFloat;
                    parcela :=
                      copy(qryComand.FieldByName('PARCELA').AsString, 1, 3);
                    parcelaVenc := qryComand.FieldByName('DT_VENC').AsDateTime;
                    with NotaF.NFe.Cobr.Dup.New do
                    begin
                      nDup := parcela;
                      vDup := valorParcela;
                      dVenc := parcelaVenc;
                    end;
                    qryComand.Next;
                  end;
                end;
              end;
            end;
          3:
            begin
              tPag := TpcnFormaPagamento(3);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
            end;
          4:
            begin
              tPag := TpcnFormaPagamento(1);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
            end;
          6:
            begin
              NotaF.NFe.Ide.indPag := ipPrazo;
              tPag := TpcnFormaPagamento(9);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
              with NotaF.NFe.Cobr do
              begin
                Fat.nFat := 'Numero da Fatura';
                Fat.vOrig := vlrReceber;
                Fat.vLiq := vlrReceber;
                Fat.vDesc := 0;
                with qryComand do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT DT_VENC,PARCELA,VALOR from CNT_RECEBER_ITEM WHERE IDRECEBER ='
                    + QuotedStr(idReceber));
                  Prepare;
                  ExecQuery;
                end;
                if qryComand.RecordCount > 0 then
                begin
                  while not qryComand.Eof do
                  begin
                    valorParcela := qryComand.FieldByName('VALOR').AsFloat;
                    parcela :=
                      copy(qryComand.FieldByName('PARCELA').AsString, 1, 3);
                    parcelaVenc := qryComand.FieldByName('DT_VENC').AsDateTime;
                    with NotaF.NFe.Cobr.Dup.New do
                    begin
                      nDup := parcela;
                      vDup := valorParcela;
                      dVenc := parcelaVenc;
                    end;
                    qryComand.Next;
                  end;
                end;
              end;
            end;

        end;

      end;
    end;
    NotaF.NFe.pag.vTroco := 0;

    if cdsNFeTIPO_FRETE.AsInteger = 3 then
    begin
      NotaF.NFe.Transp.modFrete := mfSemFrete;
    end
    else
    begin
      if cdsNFeTIPO_FRETE.AsInteger = 1 then
        NotaF.NFe.Transp.modFrete := mfContaEmitente;

      if cdsNFeTIPO_FRETE.AsInteger = 2 then
        NotaF.NFe.Transp.modFrete := mfContaDestinatario;

      if cdsNFeTIPO_FRETE.AsInteger = 5 then
        NotaF.NFe.Transp.modFrete := mfContaTerceiros;

      if cdsNFeTIPO_FRETE.AsInteger = 4 then
        NotaF.NFe.Transp.modFrete := mfProprioRemetente;

      NotaF.NFe.Transp.Transporta.CNPJCPF := cdsNFeTRANSP_CNPJ_CPF.AsString;
      NotaF.NFe.Transp.Transporta.xNome := cdsNFeTRANSP_NOME.AsString;
      NotaF.NFe.Transp.Transporta.IE := cdsNFeTRANSP_IE.AsString;
      NotaF.NFe.Transp.Transporta.xEnder := cdsNFeTRANSP_ENDERECO.AsString;
      NotaF.NFe.Transp.Transporta.xMun := cdsNFeTRANSP_CIDADE.AsString;
      NotaF.NFe.Transp.Transporta.UF := cdsNFeTRANSP_UF.AsString;

      if (DM.fdsConfigUF.AsString <> NotaF.NFe.Dest.EnderDest.UF) and
        (NotaF.NFe.Dest.EnderDest.UF <> 'MG') then
      begin
        NotaF.NFe.Transp.veicTransp.placa := cdsNFeVEIC_PLACA.AsString;
        NotaF.NFe.Transp.veicTransp.UF := cdsNFeVEIC_UF.AsString;
        NotaF.NFe.Transp.veicTransp.RNTC := '';
      end;
      // //preencheLocal de entrega
      // NotaF.NFe.Entrega.CNPJCPF := cdsNFeDOCUMENTO.AsString;
      // NotaF.NFe.Entrega.xLgr    := cdsNFeENDERECO.AsString;
      // NotaF.NFe.Entrega.nro     := cdsNFeNUMERO.AsString;
      // NotaF.NFe.Entrega.xCpl    := cdsNFeCOMPLEMENTO.AsString;
      // NotaF.NFe.Entrega.xBairro := cdsNFeBAIRRO.AsString;
      // NotaF.NFe.Entrega.cMun    :=cdsNFeCIDADE_CODIGO.AsInteger;
      // NotaF.NFe.Entrega.xMun    := cdsNFeCIDADE.AsString;
      // NotaF.NFe.Entrega.UF      := cdsNFeUF.AsString;
      // NotaF.NFe.Entrega.CEP     := cdsNFeCEP.AsInteger  ;
      // NotaF.NFe.Entrega.cPais   := 1058;
      // NotaF.NFe.Entrega.xPais   :='BRASIL';
      // NotaF.NFe.Entrega.fone    := cdsNFeTELEFONE.AsString;
      // //NotaF.NFe.Entrega.Email   := ;
    end;

    Volume := NotaF.NFe.Transp.Vol.New;
    Volume.qVol := cdsNFeTRANSP_QTN_VOLUME.AsInteger;
    Volume.esp := cdsNFeTRANSP_ESPECIE.AsString;
    Volume.marca := cdsNFeTRANSP_MARCA.AsString;
    Volume.nVol := cdsNFeTRANSP_NUMERACAO.AsString;
    Volume.pesoL := cdsNFePESO.AsFloat;
    Volume.pesoB := cdsNFePESO.AsFloat;

    NotaF.NFe.InfAdic.infCpl := '';
    NotaF.NFe.InfAdic.infAdFisco := '';

    if frmNFe.fdsNFeCODIGO_NFE.AsInteger = 0 then
    begin
      frmNFe.fdsNFe.Edit;
      with frmNFe.qrySql do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT GEN_ID(GEN_CODIGO_NFE_PEDIDO,1) FROM RDB$DATABASE');
        Prepare;
        ExecQuery;
        frmNFe.fdsNFeCODIGO_NFE.AsInteger := FieldByName('GEN_ID').AsInteger;
        cdsNFe.Edit;
        cdsNFeCODIGO_NFE.AsString := FieldByName('GEN_ID').AsString;
        NotaF.NFe.Ide.cNF := cdsNFeCODIGO_NFE.AsInteger;
        NotaF.NFe.Ide.nNF := cdsNFeCODIGO_NFE.AsInteger;
        // Referenciada.refNFe       := cdsNFeCODIGO_NFE.AsString;
        // Referenciada.RefNFP.nNF     := cdsNFeCODIGO_NFE.AsInteger;
        cdsNFe.Post;
      end;
      frmNFe.fdsNFe.Post;
      frmNFe.transNFe.CommitRetaining;
    end;

    if (copy(NotaF.NFe.Ide.natOp, 1, 9) = 'DEVOLU��O') or
      (copy(NotaF.NFe.Ide.natOp, 1, 9) = 'Devolu��o') or
      (copy(NotaF.NFe.Ide.natOp, 1, 9) = 'devolu��o') or
      (NotaF.NFe.Ide.natOp = 'NOTA FISCAL COMPLEMENTAR DE ICMS') then
    begin
      cdsNF_Devolvidas.First;
      ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
      ObsComplementar.xTexto := ObsComplementar.xTexto + ';';
      ObsComplementar.xCampo := 'N NFAe Ref';
      while not(cdsNF_Devolvidas.Eof) do
      begin
        ObsComplementar.xTexto := ObsComplementar.xTexto +
          cdsNF_DevolvidasNOTA_NUM.AsString + ' - ';
        cdsNF_Devolvidas.Next;
      end;
      ObsComplementar.xTexto := ObsComplementar.xTexto + ';';

      ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
      ObsComplementar.xCampo := 'Obs.Fisco';
      ObsComplementar.xTexto :=
        'DOCUMENTO EMITIDO POR OPTANTE PELO SIMPLES NACIONAL;';

      ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
      ObsComplementar.xCampo := 'Obs.Fisco';
      ObsComplementar.xTexto :=
        'N�O GERA DIREITO A CR�DITO FISCAL DE ICMS, DE ISS E DE IPI;';
    end
    else
    begin

      NotaF.NFe.InfAdic.infAdFisco := 'Tributos aproximados ' +
        FormatFloat('R$ #,##0.00', totImpostos) + ';';
      if DM.fdsConfigNFeGERA_CREDITO_ICMS.AsString = 'S' then
      begin
        NotaF.NFe.InfAdic.infAdFisco := NotaF.NFe.InfAdic.infAdFisco +
          'NFA-e emitida por MEI. Caso o destinat�rio seja contribuinte do ICMS, � obrigat�ria a emiss�o de NF-e de entrada (art. 35, � 5�, do Anexo I do Livro VI do RICMS). ';
        NotaF.NFe.InfAdic.infAdFisco := NotaF.NFe.InfAdic.infAdFisco +
          'PERMITE O APROVEITAMENTO DO CR�DITO DE ICMS NO VALOR DE R$ ' +
          FormatFloat('R$ #,##0.00', vlrTotCreditoICMS) +
          ' , CORRESPONDENTE � AL�QUOTA DE 1,25%, NOS TERMORS DO Art.  23, da LC n� 123/06.. MERCADORIA COM ICMS RETIDO POR SUBSTITUICAO TRIBUTARIA.';
      end;
      // ObsFisco := NotaF.NFe.InfAdic.obsFisco.New;
      // ObsFisco.xCampo := 'ObsFisco';
      // ObsFisco.xTexto := 'NFA-e emitida por MEI.';
      // ObsFisco := NotaF.NFe.InfAdic.obsFisco.New;
      // ObsFisco.xCampo := 'ObsFisco';
      // ObsFisco.xTexto:= ObsFisco.xTexto + 'Caso o destinat�rio seja contribuinte do ICMS,';
      // ObsFisco := NotaF.NFe.InfAdic.obsFisco.New;
      // ObsFisco.xCampo := 'ObsFisco';
      // ObsFisco.xTexto:= ObsFisco.xTexto+' � obrigat�ria a emiss�o de NF-e de entrada';
      // ObsFisco := NotaF.NFe.InfAdic.obsFisco.New;
      // ObsFisco.xCampo := 'ObsFisco';
      // ObsFisco.xTexto:=('art. 35, � 5�, do Anexo I do Livro VI do RICMS).');
    end;
    // verifica se � devolu��o e faz com q o campo adiconal da nota receba os valores
    if categoria_CFOP = 'DV' then
    begin
      if (cdsNFeICMS_ST_VBC.AsFloat > 0) and (cdsNFeICMS_ST_VLR.AsFloat > 0)
      then
      begin
        cdsNFe.Open;
        cdsNFe.Edit;
        cdsNFeINFO_ADICIONAL.AsString :=
          (cdsNFeINFO_ADICIONAL.AsString + ' Valor da Base de ICMS ST: ' +
          cdsNFeICMS_ST_VBC.AsString + ' Valor de ICMS ST: ' +
          cdsNFeICMS_ST_VLR.AsString);
        cdsNFe.Post;
        NotaF.NFe.InfAdic.infAdFisco := cdsNFeINFO_ADICIONAL.AsString;
      end;
    end
    else
      NotaF.NFe.InfAdic.infAdFisco :=
        'NFA-e emitida por MEI. Caso o destinat�rio seja contribuinte do ICMS, � obrigat�ria a emiss�o de NF-e de entrada (art. 35, � 5�, do Anexo I do Livro VI do RICMS). ';;

    NotaF.NFe.exporta.UFembarq := '';;
    NotaF.NFe.exporta.xLocEmbarq := '';

    NotaF.NFe.compra.xNEmp := '';
    NotaF.NFe.compra.xPed := '';
    NotaF.NFe.compra.xCont := '';

    frmPrincipal.ACBrNFe1.Enviar(cdsNFeCODIGO_NFE.AsString, True, False);
    lblRetorno.Caption := frmPrincipal.ACBrNFe1.WebServices.Retorno.xMotivo;
    with frmNFe do
    begin
      fdsNFe.Edit;
      fdsNFeCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0]
        .NFe.infNFe.ID;
      fdsNFeNUMERO_PROTOCOLO.AsString :=
        frmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
      fdsNFeSTATUS.AsString := 'NF';
      fdsNFeDT_EMISSAO.AsDateTime := now;
      fdsNFe.Post;

      fdsNFe_Item.First;
      while not(fdsNFe_Item.Eof) do
      begin
        fdsNFe_Item.Edit;
        fdsNFe_ItemDT_EMISSAO.AsDateTime := now;
        fdsNFe_Item.Post;
        fdsNFe_Item.Next;
      end;
      transNFe.CommitRetaining;
    end;

    if tipoTemp = 'ER' then
    begin
      // Deletando da pasta erros
      chaveXML := StringReplace(cdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',
        [rfReplaceAll]) + '-nfe.xml';
      caminhoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\'
        + chaveXML;
      // caminhoXML :=ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\' + FormatDateTime('yyyy', Now) + FormatDateTime('MM', Now) + '\' + chaveXML;
      if FileExists(caminhoXML) then
        deleteFile(caminhoXML);
      // Fim da exclus�o
    end;

    // end;
    ModalResult := mrOk;
    exit;
    // end;

  Except
    on E: Exception do
    begin
      with frmNFe do
      begin
        fdsNFe.Edit;
        fdsNFeCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0]
          .NFe.infNFe.ID;
        fdsNFeSTATUS.AsString := 'ER';
        fdsNFe.Post;
        transNFe.CommitRetaining;
      end;

      chaveXML := StringReplace(cdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',
        [rfReplaceAll]) + '-nfe.xml';
      caminhoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Emitidas\' +
        FormatDateTime('yyyy', now) + FormatDateTime('MM', now) + '\' +
        chaveXML;
      destinoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\';
      destinoXML := destinoXML + chaveXML;
      if FileExists(destinoXML) then
        deleteFile(destinoXML);

      Movefile(pchar(caminhoXML), pchar(destinoXML));

      lblRetorno.Caption := 'Erro ao enviar Nota Fiscal para o SEFAZ.';
      mmoErro.Lines.Add(E.Message);
      btnOK.Enabled := True;

    end;

  end;
  btnOK.Enabled := True;
  btnOK.SetFocus;
end;

procedure TfrmStatusNFe.EncerraMDFe;
var
  caminhoXML: String;
  arquivoXMl: string;
begin
  // frmMDFe.ACBrMDFe1.Manifestos.Clear;
  //
  // arquivoXMl:=StringReplace(cdsManifestoCHAVE_MANIFESTO.AsString, 'MDFe', '',[rfReplaceAll])+'-mdfe.xml';
  // caminhoxml:= ExtractFilePath(Application.ExeName) + 'MDFeLogs\MDFe\'+arquivoXMl;
  // frmMDFe.ACBrMDFe1.Manifestos.LoadFromFile(caminhoXMl);
  // frmMDFe.ACBrMDFe1.WebServices.Consulta.MDFeChave := frmMDFe.fdsManifestoCHAVE_MANIFESTO.AsString;
  // frmMDFe.ACBrMDFe1.WebServices.Consulta.Executar;

  frmMDFe.ACBrMDFe1.EventoMDFe.Evento.Clear;
  try
    with frmMDFe.ACBrMDFe1.EventoMDFe.Evento.New do
    begin
      infEvento.chMDFe := StringReplace(cdsManifestoCHAVE_MANIFESTO.AsString,
        'MDFe', '', [rfReplaceAll]);
      infEvento.CNPJCPF := DM.fdsConfigMDFeCNPJ_CPF.AsString;
      infEvento.dhEvento := now;
      // TpcnTpEvento = (teCCe, teCancelamento, teManifDestConfirmacao, teManifDestCiencia,
      // teManifDestDesconhecimento, teManifDestOperNaoRealizada,
      // teEncerramento);
      infEvento.tpEvento := teEncerramento;
      infEvento.nSeqEvento := 1;

      infEvento.detEvento.nProt := cdsManifestoPROTOCOLO_MANIFESTO.AsString;
      infEvento.detEvento.dtEnc := Date;
      infEvento.detEvento.cUF := UFtoCUF(cdsManifestoUF_DESTINO.AsString);
      infEvento.detEvento.cMun := cdsManifestoCOD_CIDADE_DESTINO.AsInteger;
    end;

    frmMDFe.ACBrMDFe1.EnviarEvento(cdsManifestoCODIGO_MANIFESTO.AsInteger);
    // 1 = Numero do Lote

    lblRetorno.Caption := ACBrUTF8ToAnsi
      (frmMDFe.ACBrMDFe1.WebServices.EnvEvento.xMotivo);
    with frmMDFe do
    begin
      fdsManifesto.Edit;
      fdsManifestoSTATUS.AsString := 'FN';
      fdsManifestoCHAVE_ENCERRAMENTO.AsString :=
        frmMDFe.ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.infEvento.ID;
      fdsManifestoPROTOCOLO_ENCERRAMENTO.AsString :=
        frmMDFe.ACBrMDFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
        .RetInfEvento.nProt;
      fdsManifesto.Post;
    end;
    btnOK.Enabled := True;
  Except
    on E: Exception do
    begin
      lblRetorno.Caption := 'Erro ao Encerrar o Manifesto Eletr�nico.';
      mmoErro.Lines.Add(E.Message);
      btnOK.Enabled := True;
    end;
  end;
end;

procedure TfrmStatusNFe.FormShow(Sender: TObject);
begin
  if Assigned(frmNFe) then
  begin
    cdsNFe.Open;
    cdsItensNFe.Open;
    cdsNF_Devolvidas.Open;
    cdsCntReceber.CreateDataSet;
  end
  else
  begin
    if Assigned(frmMDFe) then
    begin
      cdsManifesto.Open;
      cdsItensManifesto.Open;
    end;
  end;
end;

procedure TfrmStatusNFe.GerarMDFe;
var
  chaveXML, caminhoXML: String;
begin
  try
    frmMDFe.ACBrMDFe1.Manifestos.Clear;
    with frmMDFe.ACBrMDFe1.Manifestos.Add.MDFe do
    begin
      // Dados de Identifica��o do MDF-e
      //
      Ide.cUF := UFtoCUF(DM.fdsConfigMDFeUF.AsString);
      Ide.tpAmb := frmMDFe.ACBrMDFe1.Configuracoes.WebServices.Ambiente;

      // TMDFeTpEmitente = ( teTransportadora, teTranspCargaPropria );
      if DM.fdsConfigMDFeTIPO_EMITENTE.AsString = 'teTranspCargaPropria' then
        Ide.tpEmit := teTranspCargaPropria
        // caique disse q n�o � necess�rio:se teTransportadora deve antes de emitir o manifesto emitir o CTe das NFes que ser�o transportadas e depois emitir o MDFe puxando esses CTes
      else
        Ide.tpEmit := teTransportadora;

      Ide.modelo := '58';
      Ide.serie := DM.fdsConfigMDFeSERIE_MANIFESTO.AsInteger;
      Ide.nMDF := cdsManifestoCODIGO_MANIFESTO.AsInteger;
      Ide.cMDF := cdsManifestoNUM_ALEATORIO_MDFE.AsInteger; // C�digo Aleat�rio
      // // TMDFeModal = ( moRodoviario, moAereo, moAquaviario, moFerroviario );
      Ide.modal := moRodoviario;
      Ide.dhEmi := now;
      // TpcnTipoEmissao = (teNormal, teContingencia, teSCAN, teDPEC, teFSDA);
      Ide.tpEmis := teNormal;
      // TpcnProcessoEmissao = (peAplicativoContribuinte, peAvulsaFisco, peAvulsaContribuinte, peContribuinteAplicativoFisco);
      Ide.procEmi := peAplicativoContribuinte;
      Ide.verProc := '1.0';
      Ide.UFIni := cdsManifestoUF.AsString;
      Ide.UFFim := cdsManifestoUF_DESTINO.AsString;
      if not cdsManifestoDT_SAIDA.IsNull then
      begin
        if cdsManifestoDT_SAIDA.AsDateTime >= Date then
        begin
          if not cdsManifestoHORA_SAIDA.IsNull then
            Ide.dhIniViagem := cdsManifestoDT_SAIDA.AsDateTime +
              cdsManifestoHORA_SAIDA.AsDateTime
          else
            Ide.dhIniViagem := cdsManifestoDT_SAIDA.AsDateTime + time;
        end;
      end
      else
        Ide.dhIniViagem := now;

      with Ide.infMunCarrega.New do
      begin
        cMunCarrega := cdsManifestoCOD_CIDADE_CARREGA.AsInteger;
        xMunCarrega := cdsManifestoCIDADE_CARREGA.AsString;
      end;

      if (cdsManifestoUF_PERCUCO.AsString <> EmptyStr) and
        (cdsManifestoUF_PERCUCO.AsString <> DM.fdsConfigMDFeWS_UF.AsString) then
      begin
        with Ide.infPercurso.New do
        begin
          UFPer := cdsManifestoUF_PERCUCO.AsString;
        end;
      end;

      if (cdsManifestoUF_PERCURCO2.AsString <> EmptyStr) and
        (cdsManifestoUF_PERCUCO.AsString <> DM.fdsConfigMDFeWS_UF.AsString) then
      begin
        with Ide.infPercurso.New do
        begin
          UFPer := cdsManifestoUF_PERCURCO2.AsString;
        end;
      end;

      // Dados do Emitente
      Emit.CNPJCPF := DM.fdsConfigMDFeCNPJ_CPF.AsString;
      Emit.IE := DM.fdsConfigMDFeIE.AsString;
      Emit.xNome := DM.fdsConfigMDFeRAZAO.AsString;
      Emit.xFant := DM.fdsConfigMDFeNOME.AsString;

      Emit.EnderEmit.xLgr := DM.fdsConfigMDFeENDERECO.AsString;
      Emit.EnderEmit.nro := DM.fdsConfigMDFeNUMERO.AsString;
      Emit.EnderEmit.xCpl := '';
      Emit.EnderEmit.xBairro := DM.fdsConfigMDFeBAIRRO.AsString;
      Emit.EnderEmit.cMun := DM.fdsConfigMDFeCODCIDADE.AsInteger;
      Emit.EnderEmit.xMun := DM.fdsConfigMDFeCIDADE.AsString;
      Emit.EnderEmit.CEP := StrToIntDef(DM.fdsConfigMDFeCEP.AsString, 0);
      Emit.EnderEmit.UF := DM.fdsConfigMDFeUF.AsString;
      Emit.EnderEmit.fone := DM.fdsConfigTELEFONE.AsString;
      Emit.EnderEmit.email := '';

      // Modal Rodovi�rio//////////////////////////////////////////////////////////////////////////
      with qryManifesto do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM MANIFESTO_VEICULO WHERE ID=' +
          QuotedStr(cdsManifestoIDVEICULO.AsString));
        Prepare;
        ExecQuery;
      end;
      if qryManifesto.RecordCount > 0 then
      Begin
        rodo.RNTRC := qryManifesto.FieldByName('RNTRC').AsString;
        // obrigat�rio transpordadores de carga de terceiros
        rodo.CIOT := qryManifesto.FieldByName('CIOT').AsString;
        // obrigat�rio para ve�culos de terceiros

        rodo.veicTracao.cInt := qryManifesto.FieldByName('ID').AsString;
        rodo.veicTracao.placa := qryManifesto.FieldByName('PLACA').AsString;
        rodo.veicTracao.RENAVAM := qryManifesto.FieldByName('RENAVAM').AsString;
        rodo.veicTracao.tara := qryManifesto.FieldByName('TARA').AsInteger;
        rodo.veicTracao.capKG := qryManifesto.FieldByName('CAPACIDADE_KG')
          .AsInteger;
        rodo.veicTracao.capM3 := qryManifesto.FieldByName('CAPACIDADE_M3')
          .AsInteger;

        // TpcteTipoRodado = (trNaoAplicavel, trTruck, trToco, trCavaloMecanico, trVAN, trUtilitario, trOutros);
        // Para o MDF-e n�o utilizar o trNaoAplicavel.
        rodo.veicTracao.tpRod :=
          TpcteTipoRodado(qryManifesto.FieldByName('TIPO_RODADO').AsInteger);
        // trTruck;

        // TpcteTipoCarroceria = (tcNaoAplicavel, tcAberta, tcFechada, tcGraneleira, tcPortaContainer, tcSider);
        rodo.veicTracao.tpCar := TpcteTipoCarroceria
          (qryManifesto.FieldByName('TIPO_CARROCERIA').AsInteger);
        // TpcteTipoCarroceria(tcAberta); //tcFechada; //vai pegar da NFe

        rodo.veicTracao.UF := qryManifesto.FieldByName('UF').AsString;
      end;

      // Dados do proprietario do transporte
      if ((not(cdsManifestoIDTRANSPORTADORA.AsInteger = 0)) and
        (DM.fdsConfigMDFeTIPO_EMITENTE.AsString = 'teTransportadora')) then
      begin
        with qryManifesto do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM TRANSPORTADORA WHERE ID=' +
            QuotedStr(cdsManifestoIDTRANSPORTADORA.AsString));
          Prepare;
          ExecQuery;
        end;
        if qryManifesto.RecordCount > 0 then
        Begin
          rodo.veicTracao.prop.CNPJCPF := qryManifesto.FieldByName
            ('CNPJ_CPF').AsString;
          rodo.veicTracao.prop.RNTRC := qryManifesto.FieldByName('RNTRC')
            .AsString; // '12345678';
          rodo.veicTracao.prop.xNome := qryManifesto.FieldByName('RAZAO_SOCIAL')
            .AsString;
          // n�O � OBRIGAT�RIO PARA EMITENTE TRANSPORTADOR DA PR�PRIA CARGA
          rodo.veicTracao.prop.IE := qryManifesto.FieldByName('IE').AsString;
          rodo.veicTracao.prop.UF := qryManifesto.FieldByName('UF').AsString;
          rodo.veicTracao.prop.tpProp :=
            TpcteProp(qryManifesto.FieldByName('TIPO_PROPRIETARIO').AsInteger);
        End;
      end;

      // Dados do Motorista
      with qryManifesto do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM MANIFESTO_CONDUTOR WHERE ID=' +
          QuotedStr(cdsManifestoIDMOTORISTA.AsString));
        Prepare;
        ExecQuery;
      end;
      if qryManifesto.RecordCount > 0 then
      Begin
        with rodo.veicTracao.condutor.New do
        begin
          xNome := qryManifesto.FieldByName('NOME').AsString; // obrigat�rio
          CPF := qryManifesto.FieldByName('CPF').AsString; // obrigat�rio
        end;
      End;
      /// ///////////////////////////////////////
      /// Dados do Reboque
      if not(cdsManifestoIDREBOQUE.AsInteger = 0) then
      begin
        with qryManifesto do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MANIFESTO_REBOQUE WHERE ID=' +
            QuotedStr(cdsManifestoIDREBOQUE.AsString));
          Prepare;
          ExecQuery;
        end;
        if qryManifesto.RecordCount > 0 then
        Begin
          with rodo.veicReboque.New do
          begin
            cInt := qryManifesto.FieldByName('ID').AsString;
            placa := qryManifesto.FieldByName('PLACA').AsString;
            RENAVAM := qryManifesto.FieldByName('RENAVAM').AsString;
            tara := qryManifesto.FieldByName('TARA').AsInteger;
            capKG := qryManifesto.FieldByName('CAPACIDADE_KG').AsInteger;
            capM3 := qryManifesto.FieldByName('CAPACIDADE_M3').AsInteger;

            // TpcteTipoCarroceria = (tcNaoAplicavel, tcAberta, tcFechada, tcGraneleira, tcPortaContainer, tcSider);
            tpCar := tcAberta; // tcFechada;
            UF := DM.fdsConfigUF.AsString;

            if qryManifesto.FieldByName('EMITENTE_MDFE').AsString = 'N' then
            // Se for do emitente ou o check na aba de reboque de 'informar proprieet�rio' estiver desmarcado n�o � necess�rio informar
            begin
              prop.xNome := qryManifesto.FieldByName('RAZAO').AsString;
              prop.CNPJCPF := qryManifesto.FieldByName('CNPJ_CPF_PROP')
                .AsString;
              prop.RNTRC := qryManifesto.FieldByName('RNTRC_PROP').AsString;
              prop.IE := qryManifesto.FieldByName('IE_PROP').AsString;
              prop.UF := qryManifesto.FieldByName('UF_PROP').AsString;
              prop.tpProp :=
                TpcteProp(qryManifesto.FieldByName('TIPO_PROPRIETARIO')
                .AsInteger);
            end;
          end;
        End;
      end;

      with infDoc.infMunDescarga.New do
      begin
        cMunDescarga := cdsManifestoCOD_CIDADE_DESTINO.AsInteger;
        xMunDescarga := cdsManifestoCIDADE_DESTINO.AsString;
        cdsItensManifesto.First;
        while not(cdsItensManifesto.Eof) do
        Begin
          with infNFe.New do
          begin
            chNFe := StringReplace(cdsItensManifestoCHAVE_NFE.AsString, 'NFe',
              '', [rfReplaceAll]);
            if cdsItensManifestoCHAVE_CONTIGENCIA.AsString <> EmptyStr then
            SegCodBarra:=cdsItensManifestoCHAVE_CONTIGENCIA.AsString;
          end;
          cdsItensManifesto.Next;
        End;
      end;
      tot.qNFe := cdsManifestoQTN_TOTAL_NF.AsInteger;
      tot.vCarga := RoundTo(cdsManifestoVLR_TOTAL_CARGA.AsFloat, -2);
      // UnidMed = (uM3,uKG, uTON, uUNIDADE, uLITROS);
      tot.cUnid := TUnidMed(cdsManifestoUNIDADE_CARGA.AsInteger);
      tot.qCarga := cdsManifestoPESO_BRUTO.AsFloat;

      // with lacres.New do
      // begin                           n�o precisa
      // nLacre := '123';
      // end;
      InfAdic.infCpl := 'Empresa optante pelo Simples Nacional.';
      InfAdic.infAdFisco := '';

      if frmMDFe.fdsManifestoCODIGO_MANIFESTO.AsInteger = 0 then
      begin
        frmMDFe.fdsManifesto.Edit;
        with qryManifesto do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT GEN_ID(GEN_CODIGO_MANIFESTO,1) FROM RDB$DATABASE');
          Prepare;
          ExecQuery;
          frmMDFe.fdsManifestoCODIGO_MANIFESTO.AsInteger :=FieldByName('GEN_ID').AsInteger;
          cdsManifesto.Edit;
          cdsManifestoCODIGO_MANIFESTO.AsString :=FieldByName('GEN_ID').AsString;
          cdsManifestoNUM_ALEATORIO_MDFE.AsInteger:=GerarCodigoNumerico(FieldByName('GEN_ID').AsInteger);
          Ide.cMDF := cdsManifestoNUM_ALEATORIO_MDFE.AsInteger;
          Ide.nMDF := cdsManifestoCODIGO_MANIFESTO.AsInteger;
          cdsManifesto.Post;
        end;
        frmMDFe.fdsManifesto.Post;
        DM.Conexao.CommitRetaining;
      end;
    end;

    frmMDFe.ACBrMDFe1.Enviar(cdsManifestoCODIGO_MANIFESTO.AsInteger, True);

    lblRetorno.Caption := frmMDFe.ACBrMDFe1.WebServices.Retorno.xMotivo;

    with frmMDFe do
    begin
      fdsManifesto.Edit;
      fdsManifestoCHAVE_MANIFESTO.AsString := frmMDFe.ACBrMDFe1.Manifestos[0]
        .MDFe.infMDFe.ID;
      fdsManifestoPROTOCOLO_MANIFESTO.AsString :=
        frmMDFe.ACBrMDFe1.WebServices.Retorno.Protocolo;
      fdsManifestoSTATUS.AsString := 'MF';
      fdsManifestoDT_EMISSAO.AsDateTime := now;
      fdsManifesto.Post;
      DM.Conexao.CommitRetaining;
    end;
  Except
    on E: Exception do
    begin
      with frmMDFe do
      begin
        fdsManifesto.Edit;
        fdsManifestoCHAVE_MANIFESTO.AsString := frmMDFe.ACBrMDFe1.Manifestos[0]
          .MDFe.infMDFe.ID;
        fdsManifestoSTATUS.AsString := 'ER';
        fdsManifesto.Post;
        DM.Conexao.CommitRetaining;
      end;
      lblRetorno.Caption := 'Erro ao Enviar Manifesto Eletr�nico para o SEFAZ.';
      mmoErro.Lines.Add(E.Message);
      btnOK.Enabled := True;
    end;
  end;
  btnOK.Enabled := True;
  btnOK.SetFocus;
end;

procedure TfrmStatusNFe.GerarNFe;
Var
  NotaF: NotaFiscal;
  Produto: TDetCollectionItem;
  NFRef: TNFrefCollectionItem; // Adiciona as notas fiscais que ser�o devolvidas
  Volume: TVolCollectionItem;
  ObsComplementar: TobsContCollectionItem;
  ObsFisco: TobsFiscoCollectionItem;
  InfoPgto: TpagCollectionItem;
  Ok: Boolean;
  totImpostos, vlrTotCreditoICMS, vlrDescItens, vlrTotDesc, vlrAcrescItens,
    vlrTotAcresc, totQtnItens, vlrFreteItens, vlr_FretTemp, vlrOutras_Despesas,
    outros, totTribFed,totTribEst,totTribMun: Double;
  categoria_CFOP, tipoMovimentacao, tipoTemp: String;
  chaveXML, caminhoXML, destinoXML: string;
  parcela, totParcela, idReceber, formataData: String;
  valorParcela, vlrReceber , vTribFed,pAliqFed,vTribEst,pAliqEst,vTribMun,pAliqMun: Double;
  parcelaVenc, mes: TDateTime;
  i: Integer;
begin
  try
    totImpostos        := 0;
    vlrDescItens       := 0;
    totQtnItens        := 0;
    vlrTotDesc         := 0;
    vlrAcrescItens     := 0;
    vlrTotAcresc       := 0;
    vlrTotCreditoICMS  := 0;
    vlr_FretTemp       := 0;
    vlrOutras_Despesas := 0;
    outros             := 0;
    i                  := 0;
    totTribFed:=0;totTribEst:=0;totTribMun:=0;
    vTribFed:=0;pAliqFed:=0;vTribEst:=0;pAliqEst:=0;vTribMun:=0;pAliqMun:=0;
    // vlrFreteItens := cdsNFeVLR_FRETE.AsFloat / cdsItensNFe ;
    tipoTemp           := cdsNFeSTATUS.AsString;

    if cdsNFeVLR_DESCONTO.AsFloat > 0 then
    begin
      with frmNFe.qrySql do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(QTN) as QTNTOTALITEM, SUM(VLR_DESCONTO * QTN) AS TOTALDESCONTO FROM NFE_ITEM WHERE IDNFE = '
          + cdsNFeID.AsString + ' AND IDFILIAL = ' + cdsNFeIDFILIAL.AsString);
        Prepare;
        ExecQuery;
      end;

      // ShowMessage(FloatToStr(cdsNFeVLR_DESCONTO.AsFloat));
      // ShowMessage(FloatToStr(frmNfe.qrySql.FieldByName('TOTALDESCONTO').AsFloat));
      // ShowMessage(FloatToStr());

      if ((RoundTo(cdsNFeVLR_DESCONTO.AsFloat, -2) - RoundTo(frmNFe.qrySql.FieldByName('TOTALDESCONTO').AsFloat, -2)) > 0)
      then
      begin
        totQtnItens  := frmNFe.qrySql.FieldByName('QTNTOTALITEM').AsFloat;
        vlrDescItens :=
          RoundTo((cdsNFeVLR_DESCONTO.AsFloat -
          RoundTo(frmNFe.qrySql.FieldByName('TOTALDESCONTO').AsFloat, -2)) /
          totQtnItens, -2);
      end;
    end;

    // if cdsPedidoTIPO_DESC_ACRESC.AsString = 'A' then
    // begin
    // vlrAcrescItens := RoundTo(cdsPedidoVLR_DESCONTO.AsFloat /  cdsItensPedido.RecordCount, -2);
    // vlrTotAcresc := cdsPedidoVLR_DESCONTO.AsFloat;
    // end;

    // if cdsPedidoTIPO_DESC_ACRESC.AsString = 'D' then

    frmPrincipal.ACBrNFe1.NotasFiscais.Clear;

    NotaF := frmPrincipal.ACBrNFe1.NotasFiscais.Add;
    NotaF.NFe.Ide.cNF    := cdsNFeNUM_ALEATORIO_NFE.AsInteger;
    NotaF.NFe.Ide.natOp  := cdsNFeNATUREZA_OPERACAO.AsString;
    NotaF.NFe.Ide.indPag := ipVista; // utiliza a blibioteca pcnConversao
    NotaF.NFe.Ide.modelo := 55;
    NotaF.NFe.Ide.serie  := DM.fdsConfigNFeSERIE_NFE.AsInteger;
    NotaF.NFe.Ide.nNF    := cdsNFeCODIGO_NFE.AsInteger;
    NotaF.NFe.Ide.dEmi   := now;
    // NotaF.NFe.Ide.indPag
    if cdsNFeDT_SAIDA.AsDateTime < now then
    begin
      with qryComand do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update NFe set DT_SAIDA = CURRENT_DATE where ID = ' +
          cdsNFeID.AsString);
        Prepare;
        ExecQuery;
        DM.Conexao.CommitRetaining;
      end;
      NotaF.NFe.Ide.dSaiEnt := now;
    end
    else
      NotaF.NFe.Ide.dSaiEnt := cdsNFeDT_SAIDA.AsDateTime;

    NotaF.NFe.Ide.hSaiEnt := now;

    with qryComand do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select TIPO_MOVIMENTACAO from NATUREZA_DE_OPERACAO where OPERACAO = '
        + QuotedStr(NotaF.NFe.Ide.natOp));
      Prepare;
      ExecQuery;
      tipoMovimentacao := FieldByName('TIPO_MOVIMENTACAO').AsString;
    end;

    NotaF.NFe.Ide.tpNF := TpcnTipoNfe(tnSaida);

    if tipoMovimentacao = 'E ' then
    begin
      NotaF.NFe.Ide.tpNF := TpcnTipoNfe(tnEntrada);
    end;
    // utiliza a blibioteca pcnConversaoNFe
    NotaF.NFe.Ide.tpEmis := TpcnTipoEmissao(teNormal);
    // utiliza a blibioteca pcnConversao
    NotaF.NFe.Ide.tpAmb  := frmPrincipal.ACBrNFe1.Configuracoes.WebServices.
      Ambiente; // Lembre-se de trocar esta vari�vel quando for para ambiente de produ��o
    NotaF.NFe.Ide.cUF    := UFtoCUF(DM.fdsConfigUF.AsString);
    NotaF.NFe.Ide.cMunFG := DM.fdsConfigCODIGO_MUNICIPIO.AsInteger;

    if cdsNFeUF.AsString = DM.fdsConfigUF.AsString then
      NotaF.NFe.Ide.idDest := doInterna
    else
      NotaF.NFe.Ide.idDest := doInterestadual;

    cdsItensNFe.First;

    with qryComand do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select CAT_SAIDA_CFOP from NATUREZA_DE_OPERACAO where OPERACAO = '
        + QuotedStr(NotaF.NFe.Ide.natOp));
      Prepare;
      ExecQuery;
      categoria_CFOP := FieldByName('CAT_SAIDA_CFOP').AsString;
    end;
    // Verifica se � devolu��o e faz com que em anoa��es adicionas da nota apare�a o valores informados em BICMS ST e VICMS ST

    // while not(cdsItensNFe.Eof) do
    // begin
    // vlr_fretTemp := vlr_fretTemp + cdsNFeVLR_FRETE.AsFloat * (RoundTo(cdsItensNFeVLR_TOTAL.AsFloat / cdsNFeVLR_TOTITEM.AsFloat,-2));
    // vlrOutras_Despesas := vlrOutras_Despesas + cdsNFeOUTRAS_DESPESAS.AsFloat *(RoundTo(cdsItensNFeVLR_TOTAL.AsFloat / cdsNFeVLR_TOTITEM.AsFloat,-2));
    // cdsItensNFe.Next;
    // end;
    // vlr_fretTemp := cdsNFeVLR_FRETE.AsFloat - vlr_fretTemp;
    // vlrOutras_Despesas := cdsNFeOUTRAS_DESPESAS.AsFloat - vlrOutras_Despesas;

    if (categoria_CFOP = 'DV') then
    begin
      NotaF.NFe.Ide.finNFe   := fnDevolucao;
      NotaF.NFe.Ide.indFinal := cfNao;

      cdsNF_Devolvidas.First;

      while not(cdsNF_Devolvidas.Eof) do
      begin
        NFRef        := NotaF.NFe.Ide.NFRef.Add;
        NFRef.refNFe := cdsNF_DevolvidasCHAVE_NF_COMPRA.AsString;
        cdsNF_Devolvidas.Next;
      end;
    end;

    if categoria_CFOP = 'CP' then
    begin
      NotaF.NFe.Ide.finNFe   := fnComplementar;
      NotaF.NFe.Ide.indFinal := cfNao;
    end;

    if categoria_CFOP = 'VD' then
    begin
      NotaF.NFe.Ide.finNFe   := fnNormal;
      NotaF.NFe.Ide.indFinal := cfConsumidorFinal;
      NotaF.NFe.Ide.indPres  := pcPresencial;
    end
    else
    begin
      NotaF.NFe.Ide.indPres  := pcOutros;
      NotaF.NFe.Ide.indFinal := cfNao;
    end;

    // Dados do respons�vel T�cnico    (EM breve ser� solicitado)
    // NotaF.NFe.infRespTec.CNPJ :='';//CNPJ DA EMPRESA EMISSORA
    // NotaF.NFe.infRespTec.xContato:= '';// NOME DA PESSOA RESPONSAVEL PELA EMPRESA
    // NotaF.NFe.infRespTec.email:='';// EMAIL DE CONTATO DA EMPRESA
    // NotaF.NFe.infRespTec.fone:='';// TELEFONE DE CONTATO DAA EMPRESA
    // NotaF.NFe.infRespTec.idCSRT:='';// DA EMPRESA
    // NotaF.NFe.infRespTec.hashCSRT:='';// DA EMPRESA

    // NotaF.NFe.Ide.tpImp     := tiN;

    NotaF.NFe.Emit.CNPJCPF := DM.fdsConfigCNPJ.AsString;
    NotaF.NFe.Emit.IE      := DM.fdsConfigIE.AsString;
    NotaF.NFe.Emit.xNome   := DM.fdsConfigRAZAO.AsString;
    NotaF.NFe.Emit.xFant   := DM.fdsConfigNOME.AsString;

    NotaF.NFe.Emit.EnderEmit.fone := DM.fdsConfigTELEFONE.AsString;
    NotaF.NFe.Emit.EnderEmit.CEP  := DM.fdsConfigCEP.AsInteger;
    NotaF.NFe.Emit.EnderEmit.xLgr := DM.fdsConfigENDERECO.AsString;
    NotaF.NFe.Emit.EnderEmit.nro  := DM.fdsConfigNUMERO.AsString;
    NotaF.NFe.Emit.EnderEmit.xCpl := '';
    NotaF.NFe.Emit.EnderEmit.xBairro := DM.fdsConfigBAIRRO.AsString;
    NotaF.NFe.Emit.EnderEmit.cMun    := DM.fdsConfigCODIGO_MUNICIPIO.AsInteger;
    NotaF.NFe.Emit.EnderEmit.xMun    := DM.fdsConfigCIDADE.AsString;
    NotaF.NFe.Emit.EnderEmit.UF      := DM.fdsConfigUF.AsString;
    NotaF.NFe.Emit.EnderEmit.cPais   := 1058;
    NotaF.NFe.Emit.EnderEmit.xPais   := 'BRASIL';

    NotaF.NFe.Emit.IEST := '';
    // NotaF.NFe.Emit.IM                := '2648800'; // Preencher no caso de existir servi�os na nota
    // NotaF.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se � permitido
    // a inclus�o de servi�os na NFe
    NotaF.NFe.Emit.CRT := crtSimplesNacional;
    // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)

    // In�cio de informa��es do Cliente
    NotaF.NFe.Dest.CNPJCPF := cdsNFeDOCUMENTO.AsString;


    // if cdsNFeTIPO.AsString = 'J' then
    // begin
    // if cdsNFeIE.AsString = 'ISENTO' then
    // begin
    // NotaF.NFe.Dest.indIEDest         := inIsento;
    // end
    // else
    // begin
    // NotaF.NFe.Dest.indIEDest         := inContribuinte;
    // NotaF.NFe.Dest.IE                := cdsNFeIE.AsString;
    // end;
    // end;
    // else
    // NotaF.NFe.Dest.indIEDest         := inNaoContribuinte;

    if cdsNFeINDICADOR_IE.AsString = 'IS' then
    begin
      NotaF.NFe.Dest.indIEDest := inIsento;
      NotaF.NFe.Dest.IE := cdsNFeIE.AsString;
    end;
    if cdsNFeINDICADOR_IE.AsString = 'C' then
    begin
      NotaF.NFe.Dest.indIEDest := inContribuinte;
      NotaF.NFe.Dest.IE := cdsNFeIE.AsString;
    end;
    if cdsNFeINDICADOR_IE.AsString = 'NC' then
    begin
      NotaF.NFe.Dest.indIEDest := inNaoContribuinte;
    end;

    // NotaF.NFe.Dest.ISUF              := cdsPedidoUF.AsString;
    if Trim(cdsNFeRAZAOSOCIAL.AsString) = '' then
      NotaF.NFe.Dest.xNome := cdsNFeCLIENTE.AsString
    else
      NotaF.NFe.Dest.xNome := cdsNFeRAZAOSOCIAL.AsString;

    NotaF.NFe.Dest.EnderDest.fone := cdsNFeTELEFONE.AsString;
    NotaF.NFe.Dest.EnderDest.CEP  := cdsNFeCEP.AsInteger;
    NotaF.NFe.Dest.EnderDest.xLgr := cdsNFeENDERECO.AsString;
    NotaF.NFe.Dest.EnderDest.nro  := cdsNFeNUMERO.AsString;
    NotaF.NFe.Dest.EnderDest.xCpl := cdsNFeCOMPLEMENTO.AsString;
    NotaF.NFe.Dest.EnderDest.xBairro := cdsNFeBAIRRO.AsString;;
    NotaF.NFe.Dest.EnderDest.cMun    := cdsNFeCIDADE_CODIGO.AsInteger;
    NotaF.NFe.Dest.EnderDest.xMun    := cdsNFeCIDADE.AsString;
    NotaF.NFe.Dest.EnderDest.UF      := cdsNFeUF.AsString;
    NotaF.NFe.Dest.EnderDest.cPais   := 1058;
    NotaF.NFe.Dest.EnderDest.xPais   := 'BRASIL';
    // Fim de informa��es do Cliente


    // NotaF.NFe.Entrega.Email   :=   ;

    // Inicio adicionando Produtos
    cdsItensNFe.First;

    while not(cdsItensNFe.Eof) do
    begin
      Produto := NotaF.NFe.Det.New;
      Produto.Prod.IndTot := itSomaTotalNFe;
      // informa se o item entr� no calculo total da nota
      Produto.Prod.nItem := cdsItensNFeITEM.AsInteger;
      // N�mero sequencial, para cada item deve ser incrementado
      if (categoria_CFOP = 'DV') or (categoria_CFOP = 'CP') then
        Produto.Prod.cProd := cdsItensNFeCOD_FABRICANTE.AsString
      else
        Produto.Prod.cProd := cdsItensNFeIDPROD_ITEM.AsString;

      if ACBrValidador.ValidarGTIN(cdsItensNFeCOD_FABRICA.AsString) = '' then
      begin
        Produto.Prod.cEAN := cdsItensNFeCOD_FABRICA.AsString;
        Produto.Prod.cEANTrib := cdsItensNFeCOD_FABRICA.AsString;
        // Explica��o pg 4 do Manual de Preenchimento_NFC-e
      end
      else
      begin
        Produto.Prod.cEAN     := 'SEM GTIN';
        Produto.Prod.cEANTrib := 'SEM GTIN';
      end;

      Produto.Prod.xProd := StringReplace(cdsItensNFePRODUTO.AsString, '�', 'C',
        [rfReplaceAll]);
      Produto.Prod.NCM := cdsItensNFeNCM.AsString;
      // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
      Produto.Prod.EXTIPI := '';
      Produto.Prod.CFOP   := cdsItensNFeCFOP.AsString;
      Produto.Prod.uCom   := cdsItensNFeUNIDADE.AsString;
      Produto.Prod.qCom   := cdsItensNFeQTN.AsFloat;
      Produto.Prod.vUnCom := cdsItensNFeVLR_UNITARIO.AsFloat;
      // Deve ser informado sem desconto;

      Produto.Prod.uTrib   := cdsItensNFeUNIDADE.AsString;
      Produto.Prod.qTrib   := cdsItensNFeQTN.AsFloat;
      Produto.Prod.vUnTrib := cdsItensNFeVLR_UNITARIO.AsFloat;

      Produto.Prod.vProd :=
        RoundTo(cdsItensNFeQTN.AsFloat * cdsItensNFeVLR_UNITARIO.AsFloat, -2);
      // Deve ser informado sem desconto

      // Produto.Prod.vOutro    := vlrAcrescItens + cdsNFeOUTRAS_DESPESAS.AsFloat *(RoundTo(cdsItensNFeVLR_TOTAL.AsFloat / cdsNFeVLR_TOTITEM.AsFloat,-2));
      // if(cdsItensNFe.RecNo = cdsItensNFe.RecordCount - 1) then
      // begin
      // Produto.Prod.vOutro  := Produto.Prod.vOutro + vlrOutras_Despesas;
      // end;

      // Produto.Prod.vFrete    := cdsNFeVLR_FRETE.AsFloat * (RoundTo(cdsItensNFeVLR_TOTAL.AsFloat / cdsNFeVLR_TOTITEM.AsFloat,-2)) ;
      // if(cdsItensNFe.RecNo = cdsItensNFe.RecordCount - 1) then
      // begin
      // Produto.Prod.vFrete  := Produto.Prod.vFrete + vlr_fretTemp;
      // end;
      Produto.Prod.vOutro := cdsItensNFeVLR_OUTRAS_DESPESAS.AsFloat;
      Produto.Prod.vFrete := cdsItensNFeVLR_FRETE.AsFloat;
      Produto.Prod.vSeg   := 0;
      // vlr_fretTemp := vlr_fretTemp + Produto.Prod.vFrete ;

      Produto.Prod.vDesc := (vlrDescItens + cdsItensNFeVLR_DESCONTO.AsFloat) *cdsItensNFeQTN.AsFloat;
      // Aqui eu somo o desconto aplicado no total rateado para os itens com o desconto unit�rio aplicado direto nos itens durante a venda
      vlrTotDesc := vlrTotDesc + Produto.Prod.vDesc;
      // Soma o total de desconto aplicado para informar no cabe�alho da nota

      Produto.Prod.CEST := cdsItensNFeCEST.AsString;

      Produto.infAdProd := cdsItensNFeINFO_ADICIONAL.AsString;

      // lei da transparencia nos impostos
      // Produto.Imposto.ICMS.CST          := cst50;
      Produto.Imposto.ICMS.CSOSN :=
        StrToCSOSNIcms(Ok, cdsItensNFeCST_CSOSN.AsString);
      Produto.Imposto.ICMS.orig  := oeNacional;
      Produto.Imposto.ICMS.modBC := dbiValorOperacao;

      if (cdsItensNFeICMS_VLR.AsFloat >0 )and (categoria_CFOP = 'DV')then
      begin
       // Produto.Imposto.ICMS.CST := 00;
        Produto.Imposto.ICMS.vBC   := cdsItensNFeICMS_BCALC.AsFloat;
        Produto.Imposto.ICMS.pICMS := cdsItensNFeICMS_ALIQ.AsFloat;
        Produto.Imposto.ICMS.vICMS := cdsItensNFeICMS_VLR.AsFloat;
      end
      else
      begin
        Produto.Imposto.ICMS.vBC   := 0;
        Produto.Imposto.ICMS.pICMS := 0;
        Produto.Imposto.ICMS.vICMS := 0;
      end;
      //ICMS EFETIVO
      if  cdsItensNFeCST_CSOSN.AsString = '500' then
      begin
        Produto.Imposto.ICMS.vBCEfet  := cdsItensNFeICMS_BCALC.AsFloat;
        Produto.Imposto.ICMS.pICMSEfet:= cdsItensNFeICMS_ALIQ.AsFloat;
        Produto.Imposto.ICMS.vICMSEfet:= cdsItensNFeICMS_VLR.AsFloat;
      end;

      Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
      Produto.Imposto.ICMS.pMVAST  := cdsItensNFeICMS_MVAST.AsFloat;
      Produto.Imposto.ICMS.vBCST   := cdsItensNFeICMS_ST_VBC.AsFloat;
      Produto.Imposto.ICMS.pICMSST := 0;
      Produto.Imposto.ICMS.vICMSST := cdsItensNFeICMS_ST_VLR.AsFloat;

      if cdsItensNFeICMS_REDUCAO_BC.AsString = EmptyStr then
        Produto.Imposto.ICMS.pRedBC := 0
      else
        Produto.Imposto.ICMS.pRedBC := cdsItensNFeICMS_REDUCAO_BC.AsFloat;

      // C�lculo do FCP - Fundo de Combate a Pobreza
      Produto.Imposto.ICMS.vBCFCP := cdsItensNFeICMS_BCALC.AsFloat;
      Produto.Imposto.ICMS.pFCP   := cdsItensNFeFCP.AsFloat;
      Produto.Imposto.ICMS.vFCP   := RoundTo((cdsItensNFeICMS_BCALC.AsFloat*cdsItensNFeFCP.AsFloat)/100,-2);

      if cdsItensNFeCST_CSOSN.AsString = '101' then
        vlrTotCreditoICMS := (vlrTotCreditoICMS + RoundTo(Produto.Prod.vProd * 0.0125, -2));

      //cst PIS E COFINS
      if cdsItensNFeCST_PIS.AsString=EmptyStr then
      begin
        Produto.Imposto.PIS.CST:= pis49;
      end
      else
      Produto.Imposto.PIS.CST := TpcnCstPis(cdsItensNFeCST_PIS.Asinteger-1);

      if cdsItensNFeCST_COFINS.AsString=EmptyStr then
      begin
        Produto.Imposto.COFINS.CST := cof99;
      end
      else
      Produto.Imposto.COFINS.CST := TpcnCstCofins(cdsItensNFeCST_COFINS.AsInteger-1);

     //calculo de IPI
     Produto.Imposto.IPI.CST      := ipi99;//tributa��o Normal
     if (cdsItensNFeICMS_VIPI.AsFloat>0) and (categoria_CFOP = 'DV') then
     begin
       Produto.infAdProd :=cdsItensNFeINFO_ADICIONAL.AsString+#13'Valor do IPI Devolvido:'+cdsItensNFeICMS_VIPI.AsString+'  Al�quota: '+cdsItensNFeICMS_ALIQIPI.AsString;
       Produto.vIPIDevol :=cdsItensNFeICMS_VIPI.AsFloat;
       Produto.pDevol:=cdsItensNFeICMS_PERCENTL_DEVOL.AsFloat;
     end
     else
     begin
      if cdsItensNFeICMS_VIPI.AsFloat > 0 then
      Begin
       Produto.Imposto.IPI.vBC    := cdsItensNFeVLR_TOTAL.AsFloat+cdsItensNFeVLR_OUTRAS_DESPESAS.AsFloat+cdsItensNFeVLR_FRETE.AsFloat;
       Produto.Imposto.IPI.pIPI   := cdsItensNFeICMS_ALIQIPI.AsFloat;
       Produto.Imposto.IPI.vIPI   := cdsItensNFeICMS_VIPI.AsFloat;
      End
      else
      begin
       Produto.Imposto.IPI.vBC    := 0;
       Produto.Imposto.IPI.pIPI   := 0;
       Produto.Imposto.IPI.vIPI   := 0;
      end;
     end;

      // partilha do ICMS e fundo de probreza
      Produto.Imposto.ICMSUFDest.vBCUFDest      := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSUFDest    := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSInter     := 0.00;
      Produto.Imposto.ICMSUFDest.pICMSInterPart := 0.00;
      Produto.Imposto.ICMSUFDest.vICMSUFDest    := 0.00;
      Produto.Imposto.ICMSUFDest.vICMSUFRemet   := 0.00;

      pAliqFed:= cdsItensNFeIBPT_NACIONA_FEDERAL.asFloat;
      vTribFed:= RoundTo(Produto.Prod.vUnTrib * (cdsItensNFeIBPT_NACIONA_FEDERAL.asFloat / 100), -2);
      pAliqEst:= cdsItensNFeIBPT_ESTADUAL.asFloat;
      vTribEst:= RoundTo(Produto.Prod.vUnTrib * (cdsItensNFeIBPT_ESTADUAL.asFloat / 100), -2);
      pAliqMun:= cdsItensNFeIBPT_MUNICIPAL.asFloat;
      vTribMun:= RoundTo(Produto.Prod.vUnTrib * (cdsItensNFeIBPT_MUNICIPAL.asFloat / 100), -2);

      Produto.Imposto.vTotTrib       := RoundTo(vTribFed + vTribEst+ vTribMun,-2);
      //Produto.Imposto.vTotTrib := RoundTo(Produto.Prod.vUnTrib * (cdsItensNFeIBPT_NACIONA_FEDERAL.AsFloat/ 100), -2);
      totImpostos := totImpostos + Produto.Imposto.vTotTrib;
      totTribFed:= totTribFed +vTribFed;
      totTribEst:= totTribEst + vTribEst;
      totTribMun:= totTribMun + vTribMun;
      cdsItensNFe.Next;
    end;
    // Fim adicionando Produtos

    // In�cio impostos totais da Nota
    // NotaF.NFe.Total.ICMSTot.vBC     := 100;  //V�tor Fazer o c�lculo dos impostos
    if (cdsNFeICMS_VLR.AsFloat >0) and (categoria_CFOP = 'DV')then
    begin
      NotaF.NFe.Total.ICMSTot.vBC := cdsNFeICMS_VBC.AsFloat;
      NotaF.NFe.Total.ICMSTot.vICMS := cdsNFeICMS_VLR.AsFloat;
    end;
    // Se for devolu��o, zera (categoria_CFOP = 'DV')
    // if categoria_CFOP = 'DV' then
    // begin
    // NotaF.NFe.Total.ICMSTot.vBCST   := 0;
    // NotaF.NFe.Total.ICMSTot.vST     := 0;
    // end
    // //Se n�o for pega o valor que foi digitado. Ver essa mesma l�gica para os itens
    // else
    // begin
    NotaF.NFe.Total.ICMSTot.vBCST := cdsNFeICMS_ST_VBC.AsFloat;
    NotaF.NFe.Total.ICMSTot.vST   := cdsNFeICMS_ST_VLR.AsFloat;
    // end;
    NotaF.NFe.Total.ICMSTot.vOutro := vlrTotAcresc +
      cdsNFeOUTRAS_DESPESAS.AsFloat;
    NotaF.NFe.Total.ICMSTot.vProd  := cdsNFeVLR_TOTITEM.AsFloat;
    // Informato sem descostos
    NotaF.NFe.Total.ICMSTot.vFrete := cdsNFeVLR_FRETE.AsFloat;
    NotaF.NFe.Total.ICMSTot.vSeg   := 0;
    NotaF.NFe.Total.ICMSTot.vDesc  := vlrTotDesc;
    // N�o foi usado o campo VLR_DESCONTO da tabela VENDA pois esse campo s� armazena o desconto dado direto no total da nota
    NotaF.NFe.Total.ICMSTot.vII    := 0;
    if (categoria_CFOP = 'DV') then
    begin
      NotaF.NFe.Total.ICMSTot.vIPIDevol:= cdsNFeICMS_VLR_IPI.AsFloat;
    end
    else
    begin
      NotaF.NFe.Total.ICMSTot.vIPI :=cdsNFeICMS_VLR_IPI.AsFloat;
    end;
    NotaF.NFe.Total.ICMSTot.vPIS    := 0;
    NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
    NotaF.NFe.Total.ICMSTot.vNF     := cdsNFeVLR_TOTAL.AsFloat;

    // lei da transparencia de impostos
    NotaF.NFe.Total.ICMSTot.vTotTrib := totImpostos;

    // partilha do icms e fundo de probreza
    NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

    NotaF.NFe.Total.ISSQNtot.vServ   := 0;
    NotaF.NFe.Total.ISSQNtot.vBC     := 0;
    NotaF.NFe.Total.ISSQNtot.vISS    := 0;
    NotaF.NFe.Total.ISSQNtot.vPIS    := 0;
    NotaF.NFe.Total.ISSQNtot.vCOFINS := 0;

    NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;
    // Fim impostos totais da Nota

    // add forma de pagamento

    // InfoPgto:= NotaF.NFe.pag.New;
    if (categoria_CFOP = 'DV') or (cdsNFeIDFORMA_PAG.AsString = '11') then
    begin
      with NotaF.NFe.pag.New do
      begin
        tPag := TpcnFormaPagamento(11);
        vPag := 0;
      end;
    end
    else // Caso nao seja devolu��o
    begin
      with qryComand do // pesquisa o contas a rceber referente ao tipo de venda
      begin
        Close;
        SQL.Clear;
        if cdsNFeORIGEM_PEDIDO_VENDA.AsString = 'PD' then// caso seja vindo de pedido
        begin
          SQL.Add('SELECT ID,VALOR,TOT_PARCELA,IDFORMA_PAG FROM CNT_RECEBER where IDVENDA = '
            + QuotedStr(cdsNFeIDPEDIDO.AsString) + 'AND IDFILIAL=' +
            QuotedStr(cdsNFeIDFILIAL.AsString) + 'AND TIPO_VENDA = ' +
            QuotedStr('PD'));
        end
        else
        begin
          if cdsNFeORIGEM_PEDIDO_VENDA.AsString = 'VE' then
          // caso seja vindo de venda
          begin
            SQL.Add('SELECT ID,VALOR,TOT_PARCELA,IDFORMA_PAG FROM CNT_RECEBER where IDVENDA = '
              + QuotedStr(cdsNFeIDPEDIDO.AsString) + 'AND IDFILIAL=' +
              QuotedStr(cdsNFeIDFILIAL.AsString) + 'AND TIPO_VENDA = ' +
              QuotedStr('VE'));
          end
          else // caso seja vindo de uma NFe
            SQL.Add('SELECT ID,VALOR,TOT_PARCELA,IDFORMA_PAG FROM CNT_RECEBER where IDVENDA = '
              + QuotedStr(cdsNFeID.AsString) + 'AND IDFILIAL=' +
              QuotedStr(cdsNFeIDFILIAL.AsString) + 'AND TIPO_VENDA = ' +
              QuotedStr('NF'));
        end;
        Prepare;
        ExecQuery;
        if qryComand.RecordCount>0 then
        Begin
          cdsCntReceber.Close;
          cdsCntReceber.Open;
          cdsCntReceber.EmptyDataSet;

          while not(qryComand.Eof) do
          begin
            cdsCntReceber.append;
            cdsCntReceberTOT_PARCELA.AsString :=
              qryComand.FieldByName('TOT_PARCELA').AsString;
            cdsCntReceberID_RECEBER.AsString :=
              qryComand.FieldByName('ID').AsString;
            cdsCntReceberVLR_RECEBER.AsFloat :=
              qryComand.FieldByName('VALOR').AsFloat;
            cdsCntReceberMOEDA.AsString :=
              qryComand.FieldByName('IDFORMA_PAG').AsString;
            cdsCntReceber.Post;
            qryComand.Next;
          end;
        End;
      end;

      /// //////////////////////////////////////////////////////////////////////
      if not(cdsNFeORIGEM_PEDIDO_VENDA.AsString = EmptyStr) then
      // verifica se tem origem uma venda ou de um pedido
      begin
        with qryPedidoVenda do
        begin
          Close;
          SQL.Clear;
          if cdsNFeORIGEM_PEDIDO_VENDA.AsString = 'PD' then
          // caso venha de pedido
          begin
            SQL.Add('SELECT ID,VLR_CHEQUE,VLR_CARTAO,VLR_NOTA,VLR_ENTRADA,TROCO FROM PEDIDO where ID = '
              + QuotedStr(cdsNFeIDPEDIDO.AsString) + 'AND IDFILIAL=' +
              QuotedStr(cdsNFeIDFILIAL.AsString) + 'AND PREFIXO= ' +
              QuotedStr('PD'));
          end
          else // caso venha de venda
          begin
            SQL.Add('SELECT ID,VLR_CHEQUE,VLR_CARTAO,VLR_NOTA,VLR_ENTRADA,TROCO FROM MOVIEMENTO_CAIXA where IDMOVIMENTO = '
              + QuotedStr(cdsNFeIDPEDIDO.AsString) + 'AND IDFILIAL=' +
              QuotedStr(cdsNFeIDFILIAL.AsString) + 'AND TIPO = ' +
              QuotedStr('VE'));
          end;
          Prepare;
          ExecQuery;
        end;
        if qryPedidoVenda.RecordCount > 0 then
        begin
          if qryPedidoVenda.FieldByName('VLR_ENTRADA').AsFloat > 0 then
          // pagamento em dinheiro
          begin
            with NotaF.NFe.pag.New do
            begin
              tPag := TpcnFormaPagamento(0);
              vPag := qryPedidoVenda.FieldByName('VLR_ENTRADA').AsFloat;
              i := i + 1;
            end;
          end;
          /// /////////////////////////////////////////////////////////////////////////////////
          if (qryPedidoVenda.FieldByName('VLR_CARTAO').AsFloat > 0) and cdsCntReceber.Locate('MOEDA',2,[]) then
          // pagamento em cart�o de credito
          begin
            i := i + 1;
            with NotaF.NFe.pag.New do
            begin
              indPag := ipPrazo;
              tPag   := TpcnFormaPagamento(2);
              vPag   := qryPedidoVenda.FieldByName('VLR_CARTAO').AsFloat;

              with cdsCntReceber do
              begin
                Close;
                Filtered := False;
                Filter := 'MOEDA =' + QuotedStr('2');
                // Funciona como uma Clausula Where do SQL
                Filtered := True;
                Open;
              end;
              with qryComand do
              begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT DT_VENC,PARCELA,VALOR from CNT_RECEBER_ITEM WHERE IDRECEBER ='
                  + QuotedStr(cdsCntReceberID_RECEBER.AsString));
                Prepare;
                ExecQuery;
              end;
              if qryComand.RecordCount > 0 then
              begin
                while not qryComand.Eof do
                begin
                  cdsCntReceberItens.Open;
                  cdsCntReceberItens.append;
                  cdsCntReceberItensID.AsInteger :=
                    cdsCntReceberItens.RecordCount + 1;
                  cdsCntReceberItensVALOR.AsFloat :=
                    qryComand.FieldByName('VALOR').AsFloat;
                  cdsCntReceberItensDT_PARCELA.AsDateTime :=
                    qryComand.FieldByName('DT_VENC').AsDateTime;
                  cdsCntReceberItens.Post;
                  qryComand.Next;
                end;
              end;
            end;
          end;
          /// ////////////////////////////////////////////////////////
           if (qryPedidoVenda.FieldByName('VLR_CARTAO').AsFloat >0) and (cdsCntReceber.Locate('MOEDA',3,[]))then  //pagamento em cart�o de d�bito
           begin
           with NotaF.NFe.pag.New do
            begin
             tPag := TpcnFormaPagamento(3);
             vPag := qryPedidoVenda.FieldByName('VLR_CARTAO').AsFloat;
            end;
           end;
          /// ////////////////////////////////////////////////////////
          if qryPedidoVenda.FieldByName('VLR_CHEQUE').AsFloat > 0 then // pagamento em Cheque
          begin
            with NotaF.NFe.pag.New do
            begin
              tPag := TpcnFormaPagamento(1);
              vPag := qryPedidoVenda.FieldByName('VLR_CHEQUE').AsFloat;
            end;
          end;
          /// //////////////////////////////////////////////////////
          if qryPedidoVenda.FieldByName('VLR_NOTA').AsFloat > 0 then // pagamento em crediario em loja(duplicata)
          begin
            with NotaF.NFe.pag.New do
            begin
              indPag := ipPrazo;
              tPag   := TpcnFormaPagamento(9);
              vPag   := qryPedidoVenda.FieldByName('VLR_NOTA').AsFloat;

              with cdsCntReceber do
              begin
                Close;
                Filtered := False;
                Filter   := 'MOEDA =' + QuotedStr('6');// Funciona como uma Clausula Where do SQL
                Filtered := True;
                Open;
              end;
              with qryComand do
              begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT DT_VENC,PARCELA,VALOR from CNT_RECEBER_ITEM WHERE IDRECEBER ='
                  + QuotedStr(cdsCntReceberID_RECEBER.AsString));
                Prepare;
                ExecQuery;
              end;
              if qryComand.RecordCount > 0 then
              begin
                while not qryComand.Eof do
                begin
                  cdsCntReceberItens.Open;
                  cdsCntReceberItens.append;
                  cdsCntReceberItensID.AsInteger :=
                    cdsCntReceberItens.RecordCount + 1;
                  cdsCntReceberItensVALOR.AsFloat :=
                    qryComand.FieldByName('VALOR').AsFloat;
                  cdsCntReceberItensDT_PARCELA.AsDateTime :=
                    qryComand.FieldByName('DT_VENC').AsDateTime;
                  cdsCntReceberItens.Post;
                  qryComand.Next;
                end;
              end;
            end;
          end;
          if cdsCntReceberItens.RecordCount > 0 then
          begin
            valorParcela := 0;
            cdsCntReceberItens.First;
            while not(cdsCntReceberItens.Eof) do
            begin
              with NotaF.NFe.Cobr.Dup.New do
              begin
                nDup  := '00' + cdsCntReceberItensID.AsString;
                vDup  := cdsCntReceberItensVALOR.AsFloat;
                dVenc := cdsCntReceberItensDT_PARCELA.AsDateTime;
              end;
              valorParcela := valorParcela + cdsCntReceberItensVALOR.AsFloat;
              cdsCntReceberItens.Next;
            end;
            with NotaF.NFe.Cobr do
            begin
              Fat.nFat  := 'Fatura Cat�o + Nota :';
              Fat.vOrig := valorParcela;
              Fat.vLiq  := valorParcela;
              Fat.vDesc := 0;
            end;
            cdsCntReceberItens.EmptyTable;
          end;

          NotaF.NFe.pag.vTroco := qryPedidoVenda.FieldByName('TROCO').AsFloat;
        end;

      end
      else // caso n�o venha de nenhum pedido ou venda
      Begin
        case cdsNFeIDFORMA_PAG.AsInteger of
          1: // Dinheiro
            begin
              with NotaF.NFe.pag.New do
              begin
              tPag := TpcnFormaPagamento(0);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
              end;
            end;
          2: // cart�o de credito
            begin
              NotaF.NFe.Ide.indPag := ipPrazo;
              with NotaF.NFe.pag.New do
              begin
              tPag := fpCartaoCredito;
              vPag := cdsNFeVLR_TOTAL.AsFloat;
              end;
              with NotaF.NFe.Cobr do
              begin
                Fat.nFat  := 'Numero da Fatura';
                Fat.vOrig := cdsCntReceberVLR_RECEBER.AsFloat;
                Fat.vLiq  := cdsCntReceberVLR_RECEBER.AsFloat;
                Fat.vDesc := 0;
                with qryComand do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT DT_VENC,PARCELA,VALOR from CNT_RECEBER_ITEM WHERE IDRECEBER ='
                    + QuotedStr(cdsCntReceberID_RECEBER.AsString));
                  Prepare;
                  ExecQuery;
                end;
                if qryComand.RecordCount > 0 then
                begin
                  while not qryComand.Eof do
                  begin
                    valorParcela := qryComand.FieldByName('VALOR').AsFloat;
                    parcela      :=copy(qryComand.FieldByName('PARCELA').AsString, 1, 3);
                    parcelaVenc  := qryComand.FieldByName('DT_VENC').AsDateTime;
                    with NotaF.NFe.Cobr.Dup.Add do
                    begin
                      nDup := parcela;
                      vDup := valorParcela;
                      dVenc := parcelaVenc;
                    end;
                    qryComand.Next;
                  end;
                end;
              end;
            end;
          3: // Cart�o de d�bito
            begin
            with NotaF.NFe.pag.New do
            begin
              tPag := TpcnFormaPagamento(3);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
            end;
            end;
          4:
            begin
            with NotaF.NFe.pag.New do
            begin
              tPag := TpcnFormaPagamento(1); // Cheque
              vPag := cdsNFeVLR_TOTAL.AsFloat;
            end;
            end;
          6: // Duplicata
            begin
              NotaF.NFe.Ide.indPag := ipPrazo;
              with NotaF.NFe.pag.New do
              begin
              tPag := TpcnFormaPagamento(9);
              vPag := cdsNFeVLR_TOTAL.AsFloat;
              end;
              with NotaF.NFe.Cobr do
              begin
                Fat.nFat  := 'Numero da Fatura';
                Fat.vOrig := cdsCntReceberVLR_RECEBER.AsFloat;
                Fat.vLiq  := cdsCntReceberVLR_RECEBER.AsFloat;
                Fat.vDesc := 0;
                with qryComand do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT DT_VENC,PARCELA,VALOR from CNT_RECEBER_ITEM WHERE IDRECEBER ='
                    + QuotedStr(cdsCntReceberID_RECEBER.AsString));
                  Prepare;
                  ExecQuery;
                end;
                if qryComand.RecordCount > 0 then
                begin
                  while not qryComand.Eof do
                  begin
                    valorParcela := qryComand.FieldByName('VALOR').AsFloat;
                    parcela      :=copy(qryComand.FieldByName('PARCELA').AsString, 1, 3);
                    parcelaVenc  := qryComand.FieldByName('DT_VENC').AsDateTime;
                    with NotaF.NFe.Cobr.Dup.New do
                    begin
                      nDup := parcela;
                      vDup := valorParcela;
                      dVenc := parcelaVenc;
                    end;
                    qryComand.Next;
                  end;
                end;
              end;
            end;

        end;
        NotaF.NFe.pag.vTroco := 0;
        // End;
        // tPag := TpcnFormaPagamento(0);

      end;
    end;

    if cdsNFeTIPO_FRETE.AsInteger = 3 then
    begin
      NotaF.NFe.Transp.modFrete := mfSemFrete;
    end
    else
    begin
      if cdsNFeTIPO_FRETE.AsInteger = 1 then
        NotaF.NFe.Transp.modFrete := mfContaEmitente;

      if cdsNFeTIPO_FRETE.AsInteger = 2 then
        NotaF.NFe.Transp.modFrete := mfContaDestinatario;

      if cdsNFeTIPO_FRETE.AsInteger = 5 then
        NotaF.NFe.Transp.modFrete := mfContaTerceiros;

      if cdsNFeTIPO_FRETE.AsInteger = 4 then
        NotaF.NFe.Transp.modFrete := mfProprioRemetente;

      NotaF.NFe.Transp.Transporta.CNPJCPF := cdsNFeTRANSP_CNPJ_CPF.AsString;
      NotaF.NFe.Transp.Transporta.xNome   := cdsNFeTRANSP_NOME.AsString;
      NotaF.NFe.Transp.Transporta.IE      := cdsNFeTRANSP_IE.AsString;
      NotaF.NFe.Transp.Transporta.xEnder  := cdsNFeTRANSP_ENDERECO.AsString;
      NotaF.NFe.Transp.Transporta.xMun    := cdsNFeTRANSP_CIDADE.AsString;
      NotaF.NFe.Transp.Transporta.UF      := cdsNFeTRANSP_UF.AsString;

      if (DM.fdsConfigUF.AsString <> NotaF.NFe.Dest.EnderDest.UF) and
        (NotaF.NFe.Dest.EnderDest.UF <> 'MG') then
      begin
        NotaF.NFe.Transp.veicTransp.placa := cdsNFeVEIC_PLACA.AsString;
        NotaF.NFe.Transp.veicTransp.UF    := cdsNFeVEIC_UF.AsString;
        NotaF.NFe.Transp.veicTransp.RNTC  := '';
      end;

      // endere�o de entrega quando for diferente do Remetente/Destinat�rio
      // if (DM.fdsConfigUF.AsString <> NotaF.NFe.Dest.EnderDest.UF) then
      // begin
      // NotaF.NFe.Entrega.CNPJCPF := cdsNFeENTREG_CNPJ_CPF.AsString;
      // NotaF.NFe.Entrega.xLgr    := cdsNFeENTREG_ENDERECO.AsString;
      // NotaF.NFe.Entrega.nro     := cdsNFeENTREG_NUMERO.AsString;
      // NotaF.NFe.Entrega.xCpl    := cdsNFeENTREG_COMPLEMENTO.AsString;
      // NotaF.NFe.Entrega.xBairro := cdsNFeENTREG_BAIRRO.AsString;
      // NotaF.NFe.Entrega.cMun    :=cdsNFeENTREG_CIDADE_CODIGO.AsInteger;
      // NotaF.NFe.Entrega.xMun    := cdsNFeENTREG_CIDADE.AsString;
      // NotaF.NFe.Entrega.UF      := cdsNFeENTREG_UF.AsString;
      // NotaF.NFe.Entrega.CEP     := StrToInt(cdsNFeENTREG_CEP.AsString);
      // NotaF.NFe.Entrega.cPais   := 1058;
      // NotaF.NFe.Entrega.xPais   :='BRASIL';
      // NotaF.NFe.Entrega.fone    := cdsNFeENTREG_TELEFONE.AsString;
      // end;
    end;

    {
      NotaF.NFe.Transp.retTransp.vServ    := 0;
      NotaF.NFe.Transp.retTransp.vBCRet   := 0;
      NotaF.NFe.Transp.retTransp.pICMSRet := 0;
      NotaF.NFe.Transp.retTransp.vICMSRet := 0;
      NotaF.NFe.Transp.retTransp.CFOP     := '';
      NotaF.NFe.Transp.retTransp.cMunFG   := 0;
    }

    Volume := NotaF.NFe.Transp.Vol.New;
    Volume.qVol  := cdsNFeTRANSP_QTN_VOLUME.AsInteger;
    Volume.esp   := cdsNFeTRANSP_ESPECIE.AsString;
    Volume.marca := cdsNFeTRANSP_MARCA.AsString;
    Volume.nVol  := cdsNFeTRANSP_NUMERACAO.AsString;
    Volume.pesoL := cdsNFePESO.AsFloat;
    Volume.pesoB := cdsNFePESO.AsFloat;

    NotaF.NFe.InfAdic.infCpl     := '';
    NotaF.NFe.InfAdic.infAdFisco := '';

    if frmNFe.fdsNFeCODIGO_NFE.AsInteger = 0 then
    begin
      frmNFe.fdsNFe.Edit;
      with frmNFe.qrySql do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT GEN_ID(GEN_CODIGO_NFE_PEDIDO,1) FROM RDB$DATABASE');
        Prepare;
        ExecQuery;
        frmNFe.fdsNFeCODIGO_NFE.AsInteger := FieldByName('GEN_ID').AsInteger;
        cdsNFe.Edit;
        cdsNFeCODIGO_NFE.AsString        := FieldByName('GEN_ID').AsString;
        cdsNFeNUM_ALEATORIO_NFE.AsInteger:= GerarCodigoNumerico(FieldByName('GEN_ID').AsInteger);
        frmNFe.fdsNFeNUM_ALEATORIO_NFE.AsInteger:= cdsNFeNUM_ALEATORIO_NFE.AsInteger;

        NotaF.NFe.Ide.cNF := cdsNFeNUM_ALEATORIO_NFE.AsInteger;
        NotaF.NFe.Ide.nNF := cdsNFeCODIGO_NFE.AsInteger;
        cdsNFe.Post;
      end;
      frmNFe.fdsNFe.Post;
      frmNFe.transNFe.CommitRetaining;
    end;

    if (copy(NotaF.NFe.Ide.natOp, 1, 9) = 'DEVOLU��O') or
      (copy(NotaF.NFe.Ide.natOp, 1, 9) = 'Devolu��o') or
      (copy(NotaF.NFe.Ide.natOp, 1, 9) = 'devolu��o') or
      (NotaF.NFe.Ide.natOp = 'NOTA FISCAL COMPLEMENTAR DE ICMS') then
    begin
      NotaF.NFe.InfAdic.infCpl := cdsNFeINFO_ADICIONAL.AsString ;
      cdsNF_Devolvidas.First;
      ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
      ObsComplementar.xTexto := ObsComplementar.xTexto + ';';
      ObsComplementar.xCampo := 'N NFe Ref';
      while not(cdsNF_Devolvidas.Eof) do
      begin
        ObsComplementar.xTexto := ObsComplementar.xTexto +
          cdsNF_DevolvidasNOTA_NUM.AsString + ' - ';
        cdsNF_Devolvidas.Next;
      end;
      ObsComplementar.xTexto := ObsComplementar.xTexto + ';';

//      ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
//      ObsComplementar.xCampo := 'Obs.Fisco';
//      ObsComplementar.xTexto := cdsNFeINFO_ADICIONAL.AsString;

      {ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
      ObsComplementar.xCampo := 'Obs.Fisco';
      ObsComplementar.xTexto :=
        'DOCUMENTO EMITIDO POR OPTANTE PELO SIMPLES NACIONAL;';

      ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
      ObsComplementar.xCampo := 'Obs.Fisco';
      ObsComplementar.xTexto :=
        'N�O GERA DIREITO A CR�DITO FISCAL DE ICMS, DE ISS E DE IPI;';}

    end
    else
    begin
      // ObsFisco := NotaF.NFe.InfAdic.obsFisco.Add;
      // ObsFisco.xCampo := 'Tributos aproximados';
      // ObsFisco.xTexto := FormatFloat('R$ #,##0.00', totImpostos) + ';';
      NotaF.NFe.InfAdic.infAdFisco := 'Tributos aproximados ' +
        FormatFloat('R$ #,##0.00', totImpostos) + ';';
      if DM.fdsConfigNFeGERA_CREDITO_ICMS.AsString = 'S' then
      begin
        NotaF.NFe.InfAdic.infAdFisco := NotaF.NFe.InfAdic.infAdFisco +
          'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL.; N�O GERA DIREITO A CR�DITO FISCAL DE IPI. ';
        NotaF.NFe.InfAdic.infAdFisco := NotaF.NFe.InfAdic.infAdFisco +
          'PERMITE O APROVEITAMENTO DO CR�DITO DE ICMS NO VALOR DE R$ ' +
          FormatFloat('R$ #,##0.00', vlrTotCreditoICMS) +
          ' , CORRESPONDENTE � AL�QUOTA DE 1,25%, NOS TERMORS DO Art.  23, da LC n� 123/06.. MERCADORIA COM ICMS RETIDO POR SUBSTITUICAO TRIBUTARIA.';
      end;
      // else
      // begin
      //
      // // NotaF.NFe.InfAdic.infAdFisco := NotaF.NFe.InfAdic.infAdFisco +  'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL.; N�O GERA DIREITO A CR�DITO FISCAL DE ICMS, DE ISS E DE IPI; ';
      //
      // end;

      // ObsComplementar := NotaF.NFe.InfAdic.obsCont.Add;
      // ObsComplementar.xCampo := 'Obs.Fisco';
      // ObsComplementar.xTexto := 'DOCUMENTO EMITIDO POR OPTANTE PELO SIMPLES NACIONAL;';
      //
      // ObsComplementar := NotaF.NFe.InfAdic.obsCont.Add;
      // ObsComplementar.xCampo := 'Obs.Fisco';
      // ObsComplementar.xTexto := 'N�O GERA DIREITO A CR�DITO FISCAL DE ICMS, DE ISS E DE IPI;';
      //
      // ObsComplementar := NotaF.NFe.InfAdic.obsCont.Add;
      // ObsComplementar.xCampo := 'Teste 2';
      // ObsComplementar.xTexto := 'Descri��o do teste 2';
    end;
    // verifica se � devolu��o e faz com q o campo adiconal da nota receba os valores
    if categoria_CFOP = 'DV' then
    begin
      if (cdsNFeICMS_ST_VBC.AsFloat > 0) and (cdsNFeICMS_ST_VLR.AsFloat > 0)
      then
      begin
        cdsNFe.Open;
        cdsNFe.Edit;
        cdsNFeINFO_ADICIONAL.AsString :=(cdsNFeINFO_ADICIONAL.AsString + ' Valor da Base de ICMS ST: ' +
          cdsNFeICMS_ST_VBC.AsString + ' Valor de ICMS ST: ' +
          cdsNFeICMS_ST_VLR.AsString);
        cdsNFe.Post;
        NotaF.NFe.InfAdic.infAdFisco := cdsNFeINFO_ADICIONAL.AsString;
      end;
    end
    else
    begin
      NotaF.NFe.InfAdic.infAdFisco := cdsNFeINFO_ADICIONAL.AsString;
      PROCON(dm.fdsConfigUF.AsString);
      NotaF.NFe.InfAdic.infCpl     :='Valor aproximado dos tributos: Federal R$ ' + FormatFloat('0.00', totTribFed) +
       ' Estadual R$ ' + FormatFloat('0.00', totTribEst) + ' e Municipal R$ ' + FormatFloat('0.00', totTribMun)+'Fonte:IBPT/empresometro.com.br PROCON-'+
       fdsProconUF.AsString+' TEL.:('+fdsProconDDD.AsString+')'+fdsProconTELEFONE.AsString+''+fdsProconENDERECO.AsString;
    end;

    NotaF.NFe.exporta.UFembarq := '';;
    NotaF.NFe.exporta.xLocEmbarq := '';

    NotaF.NFe.compra.xNEmp := '';
    NotaF.NFe.compra.xPed := '';
    NotaF.NFe.compra.xCont := '';

    if TestaConex�o = False then
    begin
      if frmNFe.fdsNFeSTATUS.AsString <> 'OF' then
      begin
        frmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao :=
          teContingencia;
        NotaF.NFe.Ide.tpEmis := teContingencia;
        NotaF.NFe.Ide.dhCont := now;
        NotaF.NFe.Ide.xJust := 'Problema com conex�o a Internet';
        frmPrincipal.ACBrNFe1.NotasFiscais.Assinar;
        frmPrincipal.ACBrNFe1.NotasFiscais.Validar;
        frmPrincipal.ACBrNFe1.NotasFiscais.Imprimir;

        with frmNFe do
        begin
          fdsNFe.Edit;
          fdsNFeCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0]
            .NFe.infNFe.ID;
          fdsNFeSTATUS.AsString := 'OF';
          fdsNFeDT_EMISSAO.AsDateTime:= now;
          fdsNFeSERIE.AsInteger:= frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;

          //frmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(frmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NomeArq, False);
          fdsNFeCHAVE_CONTIGENCIA.AsString := frmPrincipal.ACBrNFe1.GerarChaveContingencia(frmPrincipal.ACBrNFe1.NotasFiscais.Items[0].NFe);

          fdsNFe.Post;
          transNFe.CommitRetaining;
        end;
        frmPrincipal.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
      end;
    end
    else
    begin
      if frmNFe.fdsNFeSTATUS.AsString = 'OF' then
      begin
        // Parei ak vanessa
        frmPrincipal.ACBrNFe1.NotasFiscais.Clear;
        chaveXML := StringReplace(cdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',[rfReplaceAll]) + '-nfe.xml';
        caminhoXML := ExtractFilePath(Application.ExeName) +'\NFeLogs\Emitidas\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\' + chaveXML;
        if FileExists(caminhoXML) = False then
        begin
          Case MessageBox(Application.Handle,
            pchar('Essa nota ser� emitida em um prazo superior ao permitido pela legisla��o podendo ou n�o haver gera��o de custos.Deseja realmente transmitir essa NFe?'),
            'Aten��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
            idYes:
              begin
                mes := now;
                mes := INCMONTH(mes, -1);
                caminhoXML := ExtractFilePath(Application.ExeName) +'\NFeLogs\Emitidas\' + FormatDateTime('yyyy', now) +
                  FormatDateTime('MM', mes) + '\' + chaveXML;
              end;
          End;

        end;

        frmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(caminhoXML, False);

        frmPrincipal.ACBrNFe1.Enviar(cdsNFeCODIGO_NFE.AsString, True, False);
        lblRetorno.Caption := frmPrincipal.ACBrNFe1.WebServices.Retorno.xMotivo;
        with frmNFe do
        begin
          fdsNFe.Edit;
          fdsNFeNUMERO_PROTOCOLO.AsString :=
            frmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
          fdsNFeSTATUS.AsString := 'NF';
          fdsNFeSERIE.AsInteger:= frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
          fdsNFe.Post;
          transNFe.CommitRetaining;
        end;
      end
      else
      begin
        frmPrincipal.ACBrNFe1.Enviar(cdsNFeCODIGO_NFE.AsString, True, False);
        lblRetorno.Caption := frmPrincipal.ACBrNFe1.WebServices.Retorno.xMotivo;
        with frmNFe do
        begin
          fdsNFe.Edit;
          fdsNFeCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID;
          fdsNFeNUMERO_PROTOCOLO.AsString :=frmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
          fdsNFeSTATUS.AsString := 'NF';
          fdsNFeDT_EMISSAO.AsDateTime := now;
          fdsNFeSERIE.AsInteger:= frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
          fdsNFe.Post;
          transNFe.CommitRetaining;

          fdsNFe_Item.First;
          while not(fdsNFe_Item.Eof) do
          begin
            fdsNFe_Item.Edit;
            fdsNFe_ItemDT_EMISSAO.AsDateTime := now;
            fdsNFe_Item.Post;
            transNFe.CommitRetaining;
            fdsNFe_Item.Next;
          end;

        end;

        if tipoTemp = 'ER' then
        begin
          // Deletando da pasta erros
          chaveXML := StringReplace(cdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',
            [rfReplaceAll]) + '-nfe.xml';
          caminhoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\'
            + chaveXML;
          // caminhoXML :=ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\' + FormatDateTime('yyyy', Now) + FormatDateTime('MM', Now) + '\' + chaveXML;
          if FileExists(caminhoXML) then
            deleteFile(caminhoXML);
          // Fim da exclus�o
        end;

      end;
      ModalResult := mrOk;
      exit;
    end;

    // with frmPedidos.fdsPedido do
    // begin
    // Edit;
    // frmPedidos.fdsPedidoCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID;
    // frmPedidos.fdsPedidoNUMERO_PROTOCOLO.AsString := frmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
    // Post;
    // DM.conexao.CommitRetaining;
    // end;
  Except
    on E: Exception do
    begin
      with frmNFe do
      begin
        fdsNFe.Edit;
        fdsNFeCHAVE_CONSULTA.AsString := frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID;
        fdsNFeSTATUS.AsString := 'ER';
        fdsNFeSERIE.AsInteger:= frmPrincipal.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
        fdsNFe.Post;
        transNFe.CommitRetaining;
      end;

      chaveXML := StringReplace(cdsNFeCHAVE_CONSULTA.AsString, 'NFe', '',[rfReplaceAll]) + '-nfe.xml';
      caminhoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Emitidas\' +
        FormatDateTime('yyyy', now) + FormatDateTime('MM', now) + '\' +chaveXML;
      destinoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\';
      // destinoXML :=ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\' + FormatDateTime('yyyy', Now) + FormatDateTime('MM', Now) + '\';

      // if DirectoryExists(DestinoXML)= false then
      // CreateDir(DestinoXML);

      destinoXML := destinoXML + chaveXML;
      if FileExists(destinoXML)then
        deleteFile(destinoXML);

      Movefile(pchar(caminhoXML), pchar(destinoXML));

      if FileExists(caminhoXML) then
       Movefile(pchar(caminhoXML), pchar(destinoXML));

      lblRetorno.Caption := 'Erro ao enviar Nota Fiscal para o SEFAZ.';
      mmoErro.Lines.Add(E.Message);
      btnOK.Enabled := True;
      // mmoErro.Lines.SaveToFile(ExtractFilePath(Application.ExeName) +'\NFeLogs\Erros\' + FormatDateTime('hh-nn-ss', Now) + '.txt');
    end;
  end;
  btnOK.Enabled := True;
  btnOK.SetFocus;
end;

procedure TfrmStatusNFe.ImprimirDAMDFe;
var
  DAMDFE: string;
begin
  lblRetorno.Caption := 'Aguarde Reimprimindo DANFE';
  DAMDFE := frmMDFe.ACBrMDFe1.Configuracoes.Arquivos.PathSalvar + '\' +
    ACBrUtil.RemoveString('MDFe', cdsManifestoCHAVE_MANIFESTO.AsString) +
    '-mdfe.XML';

  frmMDFe.ACBrMDFe1.Manifestos.Clear;
  frmMDFe.ACBrMDFe1.Manifestos.LoadFromFile(DAMDFE, True);
  frmMDFe.ACBrMDFe1.Manifestos.Imprimir;
  lblRetorno.Caption := 'DAMDFE Reimpresso com sucesso.';
  btnOK.Enabled := True;
  btnOK.Click;
end;

procedure TfrmStatusNFe.ImprimirDANFE;
var
  DANFE: string;
  DiretorioMes: string;
begin
  lblRetorno.Caption := 'Aguarde Reimprimindo DANFE';
  DiretorioMes := IntToStr(YearOf(cdsNFeDT_INC.AsDateTime)) +
    PadLeft(IntToStr(MonthOf(cdsNFeDT_INC.AsDateTime)), 2, '0');
  DANFE := frmPrincipal.ACBrNFe1.Configuracoes.Arquivos.PathSalvar +
    '\Emitidas\' + DiretorioMes + '\' + ACBrUtil.RemoveString('NFe',
    cdsNFeCHAVE_CONSULTA.AsString) + '-nfe.XML';

  frmPrincipal.ACBrNFe1.NotasFiscais.Clear;
  frmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(DANFE, True);
  frmPrincipal.ACBrNFe1.NotasFiscais.Imprimir;
  lblRetorno.Caption := 'DANFE Reimpresso com sucesso.';
  btnOK.Enabled := True;
  btnOK.Click;
end;

procedure TfrmStatusNFe.InutizarNumeracao();
var
  chaveXML, caminhoXML, destinoXML, InutID: String;
begin
  try
    frmPrincipal.ACBrNFe1.EventoNFe.Evento.Clear;

    frmPrincipal.ACBrNFe1.WebServices.Inutiliza(DM.fdsConfigCNPJ.AsString,
      justificativa, StrToInt(FormatDateTime('YYYY', now)), modelo, serie,
      numInicial, numFinal);

    // mmoErro.Text := frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.RetornoWS;
    // frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.RetornoWS;
    // if (frmNFe.fdsNFeSTATUS.AsString ='OF') and (frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.cStat = 102) then
    // begin
    // chaveXML := StringReplace(chaveXML, 'NFe', '',[rfReplaceAll]) + '-nfe.xml';
    // caminhoXML :=ExtractFilePath(Application.ExeName) + 'NFeLogs\Emitidas\' + FormatDateTime('yyyy', Now) + FormatDateTime('MM', Now) + '\' + chaveXML;
    // // ShowMessage(caminhoXML);
    // Deletefile(caminhoXML);
    // end;
    if (frmNFe.fdsNFeSTATUS.AsString = 'ER') and
      (frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.cStat = 102) then
    begin
      chaveXML := StringReplace(chaveXML, 'NFe', '', [rfReplaceAll]) +
        '-nfe.xml';
      caminhoXML := ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\'
        + chaveXML;
      // caminhoXML :=ExtractFilePath(Application.ExeName) + 'NFeLogs\Erros\' + FormatDateTime('yyyy', Now) + FormatDateTime('MM', Now) + '\' + chaveXML;
      // ShowMessage(caminhoXML);
      deleteFile(caminhoXML);
    end;

    with frmNFe do
    begin
      fdsNF_Inutilizada.Open;
      fdsNF_Inutilizada.append;
      fdsNF_InutilizadaIDFILIAL.AsInteger := fdsNFeIDFILIAL.AsInteger;
      fdsNF_InutilizadaDT_INC.AsDateTime := now;
      fdsNF_InutilizadaIDNOTA.AsInteger := fdsNFeID.AsInteger;
      fdsNF_InutilizadaIDCLIENTE.AsInteger := fdsNFeIDCLIENTE.AsInteger;
      fdsNF_InutilizadaDT_EMISSAO.AsDateTime := fdsNFeDT_INC.AsDateTime;
      fdsNF_InutilizadaCODIGO_NF.AsInteger := fdsNFeCODIGO_NFE.AsInteger;
      fdsNF_InutilizadaCHAVE_NF.AsString := fdsNFeCHAVE_CONSULTA.AsString;
      fdsNF_InutilizadaVLR_TOTAL.AsFloat := fdsNFeVLR_TOTAL.AsFloat;
      fdsNF_InutilizadaPROTOCOLO_IN.AsString :=
        frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.Protocolo;
      fdsNF_InutilizadaENVIADO_WEB.AsString := 'N';
      fdsNF_InutilizadaMODELO_NOTA.AsString := 'NFe';
      fdsNF_Inutilizada.Post;
      fdsNF_Inutilizada.Close;
      DM.Conexao.CommitRetaining;
    end;

    with frmNFe do
    begin
      // showMessage(fdsNFeCODIGO_NFE.AsString);
      fdsNFe.Edit;
      fdsNFeSTATUS.AsString := 'IN';
      fdsNFe.Post;
      transNFe.CommitRetaining;
    end;

    lblRetorno.Caption := 'Numera��o inutilizada com sucesso';
    btnOK.Enabled := True;
  Except
    on E: Exception do
    begin

      if frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.cStat <> 102 then
      begin
        InutID := frmPrincipal.ACBrNFe1.WebServices.Inutilizacao.ID;

        // Movendo arquivo de erro procInutNFe.xml
        chaveXML := StringReplace(InutID, 'ID', '', [rfReplaceAll]) +
          '-procInutNFe.xml';
        caminhoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Inutilizados\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\' + chaveXML;
        destinoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Inutilizados\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\Rejeitados\';

        if DirectoryExists(destinoXML) = False then
          CreateDir(destinoXML);

        destinoXML := destinoXML + chaveXML;

        if FileExists(destinoXML) = True then
          deleteFile(destinoXML);

        Movefile(pchar(caminhoXML), pchar(destinoXML));
        // Fim Movendo arquivo de erro procInutNFe.xml

        // Movendo arquivo de erro -ped-inu .xml
        chaveXML := StringReplace(InutID, 'ID', '', [rfReplaceAll]) +
          '-ped-inu.xml';
        caminhoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Inutilizados\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\' + chaveXML;
        destinoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Inutilizados\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\Rejeitados\';
        destinoXML := destinoXML + chaveXML;

        if FileExists(destinoXML) = True then
          deleteFile(destinoXML);

        Movefile(pchar(caminhoXML), pchar(destinoXML));
        // Fim Movendo arquivo de erro -ped-inu .xml

        // Movendo arquivo de erro -inu .xml
        chaveXML := StringReplace(InutID, 'ID', '', [rfReplaceAll]) +
          '-inu.xml';
        caminhoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Inutilizados\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\' + chaveXML;
        destinoXML := ExtractFilePath(Application.ExeName) +
          'NFeLogs\Inutilizados\' + FormatDateTime('yyyy', now) +
          FormatDateTime('MM', now) + '\Rejeitados\';
        destinoXML := destinoXML + chaveXML;

        if FileExists(destinoXML) = True then
          deleteFile(destinoXML);

        Movefile(pchar(caminhoXML), pchar(destinoXML));
        // Fim Movendo arquivo de erro -inu .xml

      end;

      lblRetorno.Caption := 'Erro ao inutilizar numera��o.';
      mmoErro.Lines.Add(E.Message);
      btnOK.Enabled := True;
    end;
  end;

end;

procedure TfrmStatusNFe.PROCON(uf: String);
begin
 with fdsProcon do
 begin
  close;
  conditions.Clear;
  Conditions.AddCondition('UF','UF ='+QuotedStr(uf),true);
  Conditions.Apply;
  Prepare;
  Open;
 end;
end;

function TfrmStatusNFe.TestaConex�o: Boolean;
begin
  try
    try
      frmPrincipal.ACBrNFe1.WebServices.StatusServico.Executar;
      if frmPrincipal.ACBrNFe1.WebServices.StatusServico.cStat = 107 then
        Result := True
      else
        Result := False;
    Except
      on E: Exception do
      begin
        lblRetorno.Caption :=
          'Erro de Conex�o com o sistema da SEFAZ. Nota emitida Off-Line.';
        mmoErro.Lines.Add
          ('Aten�ao nota emitida em modo OFF-Line, para evitar multas junto ao SEFAZ, voc� deve transmitir esta nota em menos de 24h.');
        Result := False;
      end;
    end;

  finally
    btnOK.Enabled := True;
  end;
end;

procedure TfrmStatusNFe.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  // -----------------------------------------------------  NFe
  if param = 'EMITIR' then
  begin
    // if frmNfe.fdsNFeSTATUS.AsString = 'OF' then
    // TransmiteNFe
    // else
    GerarNFe;
  end;
  if param = 'ImprimirDANFE' then
    ImprimirDANFE;

  if param = 'CANCELAR' then
    CancelarNFe;

  if param = 'CartaCorrecao' then
    CartaCorrecao;

  if param = 'INUTILIZAR' then
    InutizarNumeracao;
  // --------------------------------------------------- NFAe
  if param = 'EmitirNFAE' then
    EmitirNFAE;
  // ------------------------------------------------------MDFe
  if param = 'EmitirMDFE' then
    GerarMDFe;
  if param = 'EncerrarMDFE' then
    EncerraMDFe;
  if param = 'CancelarMDFE' then
    CancelarMDFe;
  if param = 'EmitirDAMDFE' then
    ImprimirDAMDFe;
end;

procedure TfrmStatusNFe.TransmiteNFe;
var
  dirMes, chaveNFCe: string;
begin
  try
    dirMes := FormatDateTime('yyyyMM', now);
    chaveNFCe := cdsNFeCHAVE_CONSULTA.AsString.Substring(3,
      Length(cdsNFeCHAVE_CONSULTA.AsString));

    frmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile
      (ExtractFilePath(Application.ExeName) + '\NFeLogs\Emitidas\' + dirMes +
      '\' + chaveNFCe + '-nfe.xml');

    try
      if frmPrincipal.ACBrNFe1.Enviar(1, True) then
      begin
        lblRetorno.Caption := frmPrincipal.ACBrNFe1.WebServices.Retorno.xMotivo;
        with frmNFe do
        begin
          fdsNFe.Edit;
          fdsNFeNUMERO_PROTOCOLO.AsString :=
            frmPrincipal.ACBrNFe1.WebServices.Retorno.Protocolo;
          fdsNFeSTATUS.AsString := 'NF';
          fdsNFe.Post;
          transNFe.CommitRetaining;
        end;
      end;
    Except
      on E: Exception do
      begin
        // frmStatusNFCe.Height := 401;
        // btnOK.Top := 336;
        if frmNFe.fdsNFeSTATUS.AsString = 'AB' then
          lblRetorno.Caption :=
            'Erro ao enviar Nota Fiscal para o SEFAZ. Nota emitida Off-Line.'
        else
          lblRetorno.Caption := 'Erro de Conex�o com o sistema da SEFAZ.';
      end;
    end;
  finally
    btnOK.Enabled := True;
    btnOK.SetFocus;
  end;
end;

end.