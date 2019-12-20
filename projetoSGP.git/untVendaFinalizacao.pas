unit untVendaFinalizacao;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms,uUtils,
  Dialogs, DBCtrls, RzDBCmbo, StdCtrls, Mask, RzEdit, RzDBEdit, DB, FIBDataSet,
  pFIBDataSet, RzLabel, dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage,
  RzPanel, RzBckgnd, Grids, DBGrids, RzDBGrid, RzTabs, RzButton, JvExMask,
  JvToolEdit, JvMaskEdit, RzCmboBx, FIBQuery, pFIBQuery, pFIBClientDataSet,
  DBClient, Math, JvExDBGrids, JvDBGrid, RzRadChk, Vcl.Imaging.pngimage,
  frxClass, frxDBSet;

type
  TfrmVendaFinalizacao = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    RzLabel1: TRzLabel;
    RzPanel3: TRzPanel;
    lblTituloTotal: TRzLabel;
    lblCidade: TRzLabel;
    edtCliente: TRzEdit;
    dsFormaPagamento: TDataSource;
    dsCntReceber: TDataSource;
    pgcParcelas: TRzPageControl;
    tbsNota: TRzTabSheet;
    tbsCheque: TRzTabSheet;
    gdrNota: TRzDBGrid;
    gdrCheque: TRzDBGrid;
    edtValorVenda: TRzEdit;
    qryGenDoc: TpFIBQuery;
    cdsCntReceber_Item: TpFIBClientDataSet;
    cdsCntReceber_ItemID: TpFIBClientBCDField;
    cdsCntReceber_ItemPOSICAO: TStringField;
    cdsCntReceber_ItemPREFIXO: TStringField;
    cdsCntReceber_ItemREFERENCIA: TStringField;
    cdsCntReceber_ItemDT_VENC: TDateField;
    cdsCntReceber_ItemDT_PAG: TDateField;
    cdsCntReceber_ItemACRESCIMO: TpFIBClientBCDField;
    cdsCntReceber_ItemDESCONTO: TpFIBClientBCDField;
    cdsCntReceber_ItemVALOR: TpFIBClientBCDField;
    cdsCntReceber_ItemVALOR_PAGO: TpFIBClientBCDField;
    cdsCntReceber_ItemHISTORICO: TStringField;
    cdsCntReceber_ItemPARCELA: TStringField;
    cdsChequeCntReceber: TpFIBClientDataSet;
    dsChequeCntReceber: TDataSource;
    cdsChequeCntReceberIDBANCO: TpFIBClientBCDField;
    cdsChequeCntReceberAGENCIA: TStringField;
    cdsChequeCntReceberCONTA: TStringField;
    cdsChequeCntReceberNUM_CHEQUE: TStringField;
    cdsChequeCntReceberEMITENTE: TStringField;
    cdsChequeCntReceberVALOR: TpFIBClientBCDField;
    cdsChequeCntReceberDT_VENCIMENTO: TDateField;
    cdsChequeCntReceberPREFIXO: TStringField;
    cdsChequeCntReceberNUM_BANCO: TIntegerField;
    cdsChequeCntReceberPARCELA: TStringField;
    qryRetornaIDCntReceber_Item: TpFIBQuery;
    fdsCntReceber: TpFIBDataSet;
    fdsCntReceberID: TFIBBCDField;
    fdsCntReceberDT_INC: TFIBDateField;
    fdsCntReceberDT_ALT: TFIBDateField;
    fdsCntReceberPOSICAO: TFIBStringField;
    fdsCntReceberPREFIXO: TFIBStringField;
    fdsCntReceberREFERENCIA: TFIBStringField;
    fdsCntReceberIDCLIENTE: TFIBBCDField;
    fdsCntReceberACRESCIMO: TFIBBCDField;
    fdsCntReceberDESCONTO: TFIBBCDField;
    fdsCntReceberVALOR: TFIBBCDField;
    fdsCntReceberVALOR_PAGO: TFIBBCDField;
    fdsCntReceberIDPORTADOR: TFIBBCDField;
    fdsCntReceberHISTORICO: TFIBStringField;
    fdsCntReceberIDFORMA_PAG: TFIBBCDField;
    fdsCntReceberIDVENDA: TFIBBCDField;
    fdsCntReceberTIPO_VENDA: TFIBStringField;
    fdsCntReceberTOT_PARCELA: TFIBStringField;
    fdsCntReceberPARCELAS_PG: TFIBIntegerField;
    fdsCntReceberDINHEIRO: TFIBBCDField;
    cdsChequeCntReceberIDRECEBER_ITEM: TIntegerField;
    lblCodigo: TRzLabel;
    RzLabel5: TRzLabel;
    edtIDVenda: TRzEdit;
    edtPrefixoVenda: TRzEdit;
    btnPesqCliente: TRzBitBtn;
    edtVendedor: TRzEdit;
    RzLabel7: TRzLabel;
    btnPesqVendedor: TRzBitBtn;
    gbxEntregar: TRzGroupBox;
    mmoOBS: TRzMemo;
    fdsCntReceberIDFILIAL: TFIBBCDField;
    fdsCntReceberENVIADO_WEB: TFIBStringField;
    cdsCntReceber_ItemIDFILIAL: TIntegerField;
    cdsChequeCntReceberIDFILIAL: TIntegerField;
    fdsVendedor: TpFIBDataSet;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    RzPanel2: TRzPanel;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    edtDinheiro: TRzEdit;
    RzLabel2: TRzLabel;
    edtCheque: TRzEdit;
    RzLabel3: TRzLabel;
    edtCartao: TRzEdit;
    btnGerarParcelas: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnGravar: TRzBitBtn;
    fdsCntReceber_Item: TpFIBDataSet;
    fdsCntReceber_ItemID: TFIBBCDField;
    fdsCntReceber_ItemPOSICAO: TFIBStringField;
    fdsCntReceber_ItemPREFIXO: TFIBStringField;
    fdsCntReceber_ItemREFERENCIA: TFIBStringField;
    fdsCntReceber_ItemIDRECEBER: TFIBBCDField;
    fdsCntReceber_ItemDT_VENC: TFIBDateField;
    fdsCntReceber_ItemDT_PAG: TFIBDateField;
    fdsCntReceber_ItemACRESCIMO: TFIBBCDField;
    fdsCntReceber_ItemDESCONTO: TFIBBCDField;
    fdsCntReceber_ItemVALOR: TFIBBCDField;
    fdsCntReceber_ItemVALOR_PAGO: TFIBBCDField;
    fdsCntReceber_ItemHISTORICO: TFIBStringField;
    fdsCntReceber_ItemPARCELA: TFIBStringField;
    fdsCntReceber_ItemENVIADO_WEB: TFIBStringField;
    fdsCntReceber_ItemIDFILIAL: TFIBBCDField;
    fdsCntReceber_ItemBAIXA_AGRUPADA: TFIBStringField;
    fdsCntReceber_ItemPAGAMENTO_MOEDA: TFIBStringField;
    fdsCntReceber_ItemREC_DESC_ACRE: TFIBBCDField;
    fdsCntReceber_ItemREC_DINHEIRO: TFIBBCDField;
    fdsCntReceber_ItemID_REC_ITEM: TFIBBCDField;
    frxReceber: TfrxDBDataset;
    frxReceber_Item: TfrxDBDataset;
    fdsCliente: TpFIBDataSet;
    fdsClienteID: TFIBBCDField;
    fdsClienteDT_INC: TFIBDateField;
    fdsClienteDT_ALT: TFIBDateField;
    fdsClienteSTATUS: TFIBStringField;
    fdsClienteNOME: TFIBStringField;
    fdsClienteDT_NASC: TFIBDateField;
    fdsClienteTELEFONE: TFIBStringField;
    fdsClienteENDERECO: TFIBStringField;
    fdsClienteBAIRRO: TFIBStringField;
    fdsClienteIDCIDADE: TFIBBCDField;
    fdsClienteCEP: TFIBStringField;
    fdsClienteRG: TFIBStringField;
    fdsClienteCPF: TFIBStringField;
    fdsClienteSEXO: TFIBStringField;
    fdsClientePROFISSAO: TFIBStringField;
    fdsClienteEMAIL: TFIBStringField;
    fdsClienteCELULAR: TFIBStringField;
    fdsClienteTIPO: TFIBStringField;
    fdsClienteRAZAOSOCIAL: TFIBStringField;
    fdsClienteCONTATO: TFIBStringField;
    fdsClienteCNPJ: TFIBStringField;
    fdsClienteIE: TFIBStringField;
    fdsClienteIDVENDEDOR: TFIBBCDField;
    fdsClienteEMAIL_NFE: TFIBStringField;
    fdsClienteKM_TOTAL: TFIBSmallIntField;
    fdsClienteDT_ULTIMO_CONTATO: TFIBDateField;
    fdsClienteLIMITE_CREDITO: TFIBBCDField;
    fdsClienteIDFORMA_PAGAMENTO: TFIBBCDField;
    fdsClienteIDROTA: TFIBBCDField;
    fdsClienteENVIADO_WEB: TFIBStringField;
    fdsClienteIDFILIAL: TFIBBCDField;
    fdsClienteREFERENCIA: TFIBStringField;
    frxCliente: TfrxDBDataset;
    fdsClienteCIDADE: TFIBStringField;
    fdsClienteUF: TFIBStringField;
    edtNota: TRzEdit;
    RzLabel4: TRzLabel;
    edtParcelasNT: TRzEdit;
    RzLabel11: TRzLabel;
    RzLabel9: TRzLabel;
    edtParcelasCT: TRzEdit;
    RzLabel10: TRzLabel;
    RzLabel13: TRzLabel;
    edtParcelasCH: TRzEdit;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    qryInsertCntReceber_Item: TpFIBQuery;
    qryInsertChequeCntReceber: TpFIBQuery;
    btnOutrosPagamentos: TRzBitBtn;
    RzLabel6: TRzLabel;
    edtIdVendedor: TRzEdit;
    cbxTipoDesconto: TRzComboBox;
    edtDesconto: TRzEdit;
    fdsClienteLOCAL_TRABALHO: TFIBStringField;
    fdsClientePROPRIETARIO: TFIBStringField;
    fdsClienteCREDITO: TFIBBCDField;
    fdsClienteTEM_EMPILHADEIRA: TFIBStringField;
    fdsClienteIDCLIENTE_APP: TFIBBCDField;
    fdsClienteNUMERO: TFIBStringField;
    qrySQL: TpFIBQuery;
    qryComand: TpFIBQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtDinheiroExit(Sender: TObject);
    procedure edtDinheiroEnter(Sender: TObject);
    procedure edtChequeEnter(Sender: TObject);
    procedure edtCartaoEnter(Sender: TObject);
    procedure edtCartaoExit(Sender: TObject);
    procedure edtChequeExit(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure RzDBComboBox1Change(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure gdrChequeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrNotaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesqClienteClick(Sender: TObject);
    procedure btnPesqVendedorClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtVendedorExit(Sender: TObject);
    procedure edtDescontoEnter(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure btnOutrosPagamentosClick(Sender: TObject);
    procedure cdsCntReceber_ItemAfterEdit(DataSet: TDataSet);
    procedure cdsCntReceber_ItemAfterPost(DataSet: TDataSet);
    procedure edtIdVendedorExit(Sender: TObject);
    procedure cbxTipoDescontoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNotaExit(Sender: TObject);
    procedure edtNotaEnter(Sender: TObject);
    procedure edtParcelasNTExit(Sender: TObject);
    procedure edtParcelasCTExit(Sender: TObject);

  private
    procedure RetornaCliente;
    procedure RetornaVendedor;
    procedure GerarDocumentos();
    procedure GeraNotaAVista();
    procedure VerificaFormaPagamento;
    procedure VerificaTroco;
    procedure CalculaValorParcelar;
    procedure CalculaValorRestante();
    procedure GravaCntReceberItem(prefixo, parcela: string; dtVenc: TDate;
      valor: Double);
    function RetornaCntReceberItemID(idFilial: Integer; valor: Double;
      dt_venc: TDate): Integer;
    procedure RecalculaParcelas(vlrAlterado: Double; prefixo: string;
      index: Integer);
    procedure GravaCntReceber(valorTotal: Double; parcelasTotal: string;
      idFormaPag: Integer);
    procedure GeraParcelaCheque(prefixo: string; parcelas: Integer;
      vlrParcelar: Double);
    procedure GeraParcelaNota(prefixo: string; parcelas: Integer;
      vlrParcelar: Double);
    procedure PopulaComboBox;
    procedure CalculaDescontoTotal;
    procedure BaixaCartaoAVista();
    function  NotasAtraso(IDCliente:Integer):TlCredito;
  public
  var
    idVenda, idReceber, idFormaPag, idBanco, nBanco, nAgencia, nConta, celula,
      parcelas: Integer;
    idCliente, idVendedor, nParcelasFinanceira: Integer;
    tipoVenda, moeda, tipoCartao,prefixoIdentCartao: string[2];
    valorDoc, valorParcelar, valorDinheiro, valorDesconto, valorCheque,
      valorCartao, troco: Double;
    valorFinanceira, valorValeDesconto, valorTicket: Double;
    cliente, emitente: string;
    vendaEntregar, editouParcela, autoParcela, gerouParcelas: Boolean;
    pesoEntregar, prazo,valorRestante: Double;

  end;

var
  frmVendaFinalizacao: TfrmVendaFinalizacao;

implementation

uses untData, untLancDadosBasicCheque, untPesqCliente, untPesqVendedor,
  untOutrosPagamentos,
  untTipoCartaoCredito, untTroco, untMsgUsuarioNaoPermitido,uVerificaPermicao;

{$R *.dfm}
{ TfrmVendaFinalizacao }

procedure TfrmVendaFinalizacao.FormCreate(Sender: TObject);
begin
  prazo := 30;
end;

procedure TfrmVendaFinalizacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    btnCancelar.Click;
  end
  else if Key = VK_F10 then
  begin
    SelectNext(ActiveControl, True, True);
    btnGravar.Click;
  end;
end;

procedure TfrmVendaFinalizacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
   if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;

   if (Key = #110) or (Key = #78) then
  begin
    Key := #0;
    edtNota.Enabled := True;
    edtParcelasNT.Enabled := True;
    edtNota.Color := clMoneyGreen;
    edtParcelasNT.Color := clMoneyGreen;
    edtNota.SetFocus;
  end;

  if (Key = #100) or (Key = #68) then
  begin
    Key := #0;
    edtDinheiro.Enabled := True;
    edtDinheiro.Color := clMoneyGreen;
    edtDinheiro.SetFocus;
  end;

  if (Key = #104) or (Key =#72) then
  begin
    Key := #0;
    edtCheque.Enabled := True;
    edtParcelasCH.Enabled := True;
    edtCheque.Color := clMoneyGreen;
    edtParcelasCH.Color := clMoneyGreen;
    edtCheque.SetFocus;
  end;

  if (Key = #116) or ( Key = #84) then
  begin
    Key := #0;
    edtCartao.Enabled := True;
    edtParcelasCT.Enabled := True;
    edtCartao.Color := clMoneyGreen;
    edtParcelasCT.Color := clMoneyGreen;
    edtCartao.SetFocus;
  end;
end;

procedure TfrmVendaFinalizacao.FormShow(Sender: TObject);
var
  utils: TUtils;
begin
  edtValorVenda.Text := utils.AdicionaMascaraDinheiro(FloatToStr(valorDoc));
  valorDinheiro := 0;
  valorDesconto := 0;
  valorCheque := 0;
  valorCartao := 0;
  valorFinanceira := 0;
  valorValeDesconto := 0;
  valorTicket := 0;
 // valorParcelar := valorDoc;
  valorParcelar:=0;
  CalculaValorRestante;
  cdsCntReceber_Item.CreateDataSet;
  cdsChequeCntReceber.CreateDataSet;
  cdsCntReceber_Item.Open;
  fdsVendedor.Open;
  edtIdVendedor.Text := IntToStr(idVendedor);
  fdsVendedor.Locate('ID', IntToStr(idVendedor), []);
  edtVendedor.Text := fdsVendedorNOME.AsString;
  moeda := 'DN';
  editouParcela := False;
  autoParcela := False;
  gerouParcelas := False;

  if edtIdVendedor.Enabled then
    edtIdVendedor.SetFocus
  else
    edtDesconto.SetFocus;

  if not(idFormaPag > 0) then
    idFormaPag := DM.fdsConfigIDFORM_PAG_PAD.AsInteger
  else
  begin
    case idFormaPag of
      2:
        begin
          valorCartao := valorDoc;
          edtCartao.Text := FloatToStr(valorDoc);
          edtCartao.Text := utils.AdicionaMascaraDinheiro(edtCartao.Text);
        end;
      3:
        begin
          valorCartao := valorDoc;
          edtCartao.Text := FloatToStr(valorDoc);
          edtCartao.Text := utils.AdicionaMascaraDinheiro(edtCartao.Text);
        end;
      4:
        begin
          valorCheque := valorDoc;
          edtCheque.Text := FloatToStr(valorDoc);
          edtCheque.Text := utils.AdicionaMascaraDinheiro(edtCheque.Text);
        end;
      6:
        begin
          valorParcelar := valorDoc;
          edtNota.Text := FloatToStr(valorDoc);
          edtNota.Text := utils.AdicionaMascaraDinheiro(edtNota.Text);
        end;
      10:
        begin
          valorParcelar := valorDoc;
          edtNota.Text := FloatToStr(valorDoc);
          edtNota.Text := utils.AdicionaMascaraDinheiro(edtNota.Text);
        end;
    end;
  end;
end;

procedure TfrmVendaFinalizacao.gdrChequeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(cdsChequeCntReceber.RecNo) then
  begin
    gdrCheque.Canvas.Brush.Color := DM.gridOddColor;
    gdrCheque.Canvas.FillRect(Rect);
    gdrCheque.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmVendaFinalizacao.gdrNotaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(cdsCntReceber_Item.RecNo) then
  begin
    gdrNota.Canvas.Brush.Color := DM.gridOddColor;
    gdrNota.Canvas.FillRect(Rect);
    gdrNota.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmVendaFinalizacao.GeraNotaAVista;
begin
  fdsCntReceber.Open;
  fdsCntReceber.Append;
  idReceber := fdsCntReceberID.AsInteger;
  fdsCntReceberIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsCntReceberDT_INC.AsDateTime := Now;
  fdsCntReceberPOSICAO.AsString := 'PG';
  fdsCntReceberPREFIXO.AsString := 'CR';
  fdsCntReceberIDCLIENTE.AsInteger := idCliente;
  fdsCntReceberDINHEIRO.AsFloat := valorDinheiro;
  fdsCntReceberVALOR_PAGO.AsFloat := valorDinheiro;
  fdsCntReceberVALOR.AsFloat := valorDoc - valorDesconto;
  fdsCntReceberIDPORTADOR.AsInteger := DM.fdsConfigIDPORTADOR_PADRAO.AsInteger;
  fdsCntReceberIDFORMA_PAG.AsInteger := 1;
  fdsCntReceberIDVENDA.AsInteger := idVenda;
  fdsCntReceberTIPO_VENDA.AsString := 'PD';
  fdsCntReceberTOT_PARCELA.AsString := '001';

  fdsCntReceber.Post;
  DM.conexao.CommitRetaining;

  qryInsertCntReceber_Item.Close;

  qryInsertCntReceber_Item.ParamByName('POSICAO').AsString := 'PG';
  qryInsertCntReceber_Item.ParamByName('PREFIXO').AsString := 'NT';
  qryInsertCntReceber_Item.ParamByName('DT_VENC').AsDateTime := Now;
  qryInsertCntReceber_Item.ParamByName('DT_PAG').AsDateTime := Now;
  qryInsertCntReceber_Item.ParamByName('VALOR').AsFloat := valorDinheiro;
  qryInsertCntReceber_Item.ParamByName('VALOR_PAGO').AsFloat := valorDinheiro;
  qryInsertCntReceber_Item.ParamByName('REC_DINHEIRO').AsFloat := valorDinheiro;
  qryInsertCntReceber_Item.ParamByName('PARCELA').AsString := '001001';
  qryInsertCntReceber_Item.ParamByName('PAGAMENTO_MOEDA').AsString := 'DN';
  qryInsertCntReceber_Item.ParamByName('IDRECEBER').AsInteger := idReceber;
  qryInsertCntReceber_Item.ParamByName('IDFILIAL').AsInteger :=
    DM.fdsConfigIDFILIAL.AsInteger;

  qryInsertCntReceber_Item.Prepare;
  qryInsertCntReceber_Item.ExecQuery;

  DM.conexao.CommitRetaining;

end;

procedure TfrmVendaFinalizacao.GeraParcelaCheque(prefixo: string;
  parcelas: Integer; vlrParcelar: Double);
var
  i: Integer;
  parcelasTemp: string[3];
  valorParcela: Double;
  dataParcela: TDateTime;
  utils: TUtils;
begin
  i := 1;

  parcelasTemp := utils.FormataParcelas(IntToStr(parcelas));

  valorParcela := vlrParcelar / parcelas;

  valorParcela := RoundTo(valorParcela, -2);

  dataParcela := Now;

  for i := 1 to parcelas do
  begin
    cdsChequeCntReceber.Append;
    cdsChequeCntReceberIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
    cdsChequeCntReceberEMITENTE.AsString := emitente;
    cdsChequeCntReceberIDBANCO.AsInteger := idBanco;
    cdsChequeCntReceberAGENCIA.AsInteger := nAgencia;
    cdsChequeCntReceberCONTA.AsInteger := nConta;
    cdsChequeCntReceberNUM_BANCO.AsInteger := nBanco;
    dataParcela := dataParcela + prazo;
    cdsChequeCntReceberDT_VENCIMENTO.AsDateTime := dataParcela;
    cdsChequeCntReceberPARCELA.AsString := utils.FormataParcelas(IntToStr(i)) +
      parcelasTemp;

    if i = parcelas then
      valorParcela := valorParcela + (vlrParcelar - (valorParcela * parcelas));
    // joga os centavos faltando para a �ltima parcela. Devido ao arredondamento
    cdsChequeCntReceberVALOR.AsFloat := valorParcela;

    cdsChequeCntReceber.Post;
    tbsCheque.Show;
  end;
end;

procedure TfrmVendaFinalizacao.GeraParcelaNota(prefixo: string;
  parcelas: Integer; vlrParcelar: Double);
var
  i: Integer;
  parcelasTemp: string[3];
  valorParcela: Double;
  dataParcela: TDateTime;
  utils: TUtils;
begin
  i := 1;

  parcelasTemp := utils.FormataParcelas(IntToStr(parcelas));

  valorParcela := RoundTo(vlrParcelar / parcelas, -2);

  if (DM.fdsConfigTARIFA_BOLETO.AsFloat > 0) and (prefixo = 'BL') then
    valorParcela :=
      RoundTo(valorParcela + DM.fdsConfigTARIFA_BOLETO.AsFloat, -2);

  dataParcela := Now;

  for i := 1 to parcelas do
  begin
    cdsCntReceber_Item.Append;
    cdsCntReceber_ItemIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
    cdsCntReceber_ItemPOSICAO.AsString := 'AB';
    cdsCntReceber_ItemPARCELA.AsString := utils.FormataParcelas(IntToStr(i)) +
      parcelasTemp;
    cdsCntReceber_ItemPREFIXO.AsString := prefixo;
    if ((prefixo = 'CT') and (DM.fdsConfigCARTAO_CREDITO_AVISTA.AsString = 'S'))
      or (prefixo = 'CD') then
      dataParcela := Now
    else
      dataParcela := dataParcela + prazo;
    cdsCntReceber_ItemDT_VENC.AsDateTime := dataParcela;

    if i = parcelas then
    begin
      if (DM.fdsConfigTARIFA_BOLETO.AsFloat > 0) and (prefixo = 'BL') then
      begin
        valorParcela := RoundTo(vlrParcelar / parcelas, -2);
        valorParcela := valorParcela +
          (vlrParcelar - (valorParcela * parcelas));
        valorParcela :=
          RoundTo(valorParcela + DM.fdsConfigTARIFA_BOLETO.AsFloat, -2);
      end
      else
        valorParcela := valorParcela + (vlrParcelar - (valorParcela * parcelas)
          ); // joga os centavos faltando para a �ltima parcela. Devido ao arredondamento
    end;
    cdsCntReceber_ItemVALOR.AsFloat := valorParcela;

    cdsCntReceber_Item.Post;
  end;
end;

procedure TfrmVendaFinalizacao.GerarDocumentos;
var
  prefixoTemp: string[2];
  idReceberItem: Integer;
begin

  cdsChequeCntReceber.First;

  if cdsChequeCntReceber.RecordCount > 0 then
  begin
    GravaCntReceber(valorCheque, edtParcelasCH.Text, 4);

    while not(cdsChequeCntReceber.Eof) do
    begin
      GravaCntReceberItem('CH', cdsChequeCntReceberPARCELA.AsString,
        cdsChequeCntReceberDT_VENCIMENTO.AsDateTime,
        cdsChequeCntReceberVALOR.AsFloat);
      idReceberItem := RetornaCntReceberItemID(cdsChequeCntReceberIDFILIAL.AsInteger,cdsChequeCntReceberVALOR.AsFloat,
        cdsChequeCntReceberDT_VENCIMENTO.AsDateTime);

      qryInsertChequeCntReceber.Close;
      qryInsertChequeCntReceber.ParamByName('IDRECEBER_ITEM').AsString := IntToStr(idReceberItem);
      qryInsertChequeCntReceber.ParamByName('IDFILIAL').AsInteger :=cdsChequeCntReceberIDFILIAL.AsInteger;
      qryInsertChequeCntReceber.ParamByName('IDBANCO').AsString :=IntToStr(idBanco);
      qryInsertChequeCntReceber.ParamByName('AGENCIA').AsString :=IntToStr(nAgencia);
      qryInsertChequeCntReceber.ParamByName('CONTA').AsString :=IntToStr(nConta);
      qryInsertChequeCntReceber.ParamByName('NUM_CHEQUE').AsString :=cdsChequeCntReceberNUM_CHEQUE.AsString;
      qryInsertChequeCntReceber.ParamByName('DT_EMISSAO').AsDateTime := Now;
      qryInsertChequeCntReceber.ParamByName('EMITENTE').AsString :=cdsChequeCntReceberEMITENTE.AsString;
      qryInsertChequeCntReceber.ParamByName('VALOR').AsFloat :=cdsChequeCntReceberVALOR.AsFloat;
      qryInsertChequeCntReceber.ParamByName('DT_VENCIMENTO').AsDateTime :=cdsChequeCntReceberDT_VENCIMENTO.AsDateTime;
      qryInsertChequeCntReceber.Prepare;
      qryInsertChequeCntReceber.ExecQuery;

      cdsChequeCntReceber.Next;
    end;
    moeda := 'CH';

    DM.conexao.CommitRetaining;
  end;

  cdsCntReceber_Item.First;

  prefixoTemp := cdsCntReceber_ItemPREFIXO.AsString;

  while not(cdsCntReceber_Item.Eof) do
  Begin
    if (prefixoTemp = 'CT') or (prefixoTemp = 'CD') then
    begin
      if prefixoTemp = 'CT' then
        begin
        GravaCntReceber(valorCartao, edtParcelasCT.Text, 2);
        prefixoIdentCartao:= 'CT';
        end;

      if prefixoTemp = 'CD' then
      begin
        GravaCntReceber(valorCartao, edtParcelasCT.Text, 3);
        prefixoIdentCartao:='CD';
      end;

      while ((prefixoTemp = 'CT') or (prefixoTemp = 'CD')) and
        not(cdsCntReceber_Item.Eof) do
      begin
        GravaCntReceberItem(prefixoTemp, cdsCntReceber_ItemPARCELA.AsString,
          cdsCntReceber_ItemDT_VENC.AsDateTime,
          cdsCntReceber_ItemVALOR.AsFloat);
        cdsCntReceber_Item.Next;
        prefixoTemp := cdsCntReceber_ItemPREFIXO.AsString;
      end;

      moeda := prefixoTemp;
    end;

    if (prefixoTemp = 'NT') or (prefixoTemp = 'BL') then
    begin
      if prefixoTemp = 'NT' then
        GravaCntReceber(valorParcelar, edtParcelasNT.Text, 6);

      if prefixoTemp = 'BL' then
        GravaCntReceber
          (RoundTo(valorParcelar + (DM.fdsConfigTARIFA_BOLETO.AsFloat *
          StrToInt(edtParcelasNT.Text)), -2), edtParcelasNT.Text, 10);

      while ((prefixoTemp = 'NT') or (prefixoTemp = 'BL')) and
        not(cdsCntReceber_Item.Eof) do
      begin
        GravaCntReceberItem(prefixoTemp, cdsCntReceber_ItemPARCELA.AsString,
          cdsCntReceber_ItemDT_VENC.AsDateTime,
          cdsCntReceber_ItemVALOR.AsFloat);
        cdsCntReceber_Item.Next;
        prefixoTemp := cdsCntReceber_ItemPREFIXO.AsString;
      end;
      moeda := prefixoTemp;
    end;

    if prefixoTemp = 'FN' then
    begin
      GravaCntReceber(valorCartao, edtParcelasCT.Text, 5);

      while (prefixoTemp = 'FN') and not(cdsCntReceber_Item.Eof) do
      begin
        GravaCntReceberItem(prefixoTemp, cdsCntReceber_ItemPARCELA.AsString,
          cdsCntReceber_ItemDT_VENC.AsDateTime,
          cdsCntReceber_ItemVALOR.AsFloat);
        cdsCntReceber_Item.Next;
        prefixoTemp := cdsCntReceber_ItemPREFIXO.AsString;
      end;
      moeda := prefixoTemp;
    end;
  End;
end;

procedure TfrmVendaFinalizacao.GravaCntReceber(valorTotal: Double;
  parcelasTotal: string; idFormaPag: Integer);
var
  utils: TUtils;
begin
  fdsCntReceber.Open;
  fdsCntReceber.Append;
  idReceber := fdsCntReceberID.AsInteger;
  fdsCntReceberIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsCntReceberDT_INC.AsDateTime := Now;
  fdsCntReceberPOSICAO.AsString := 'AB';
  fdsCntReceberPREFIXO.AsString := 'CR';
  fdsCntReceberIDCLIENTE.AsInteger := idCliente;
  fdsCntReceberDINHEIRO.AsFloat := valorDinheiro;
  fdsCntReceberVALOR.AsFloat := valorTotal;
  fdsCntReceberVALOR_PAGO.AsFloat := 0;
  fdsCntReceberIDPORTADOR.AsInteger := DM.fdsConfigIDPORTADOR_PADRAO.AsInteger;
  fdsCntReceberIDFORMA_PAG.AsInteger := idFormaPag;
  fdsCntReceberIDVENDA.AsInteger := idVenda;
  fdsCntReceberTIPO_VENDA.AsString := tipoVenda;
  fdsCntReceberTOT_PARCELA.AsString := utils.FormataParcelas(parcelasTotal);

  fdsCntReceber.Post;
  DM.conexao.CommitRetaining;
end;

procedure TfrmVendaFinalizacao.GravaCntReceberItem(prefixo, parcela: string;
  dtVenc: TDate; valor: Double);
begin
  qryInsertCntReceber_Item.Close;

  qryInsertCntReceber_Item.ParamByName('POSICAO').AsString := 'AB';
  qryInsertCntReceber_Item.ParamByName('PREFIXO').AsString := prefixo;
  qryInsertCntReceber_Item.ParamByName('DT_VENC').AsDateTime := dtVenc;
  qryInsertCntReceber_Item.ParamByName('VALOR').AsFloat := valor;
  qryInsertCntReceber_Item.ParamByName('VALOR_PAGO').AsFloat := 0;
  qryInsertCntReceber_Item.ParamByName('PARCELA').AsString := parcela;
  qryInsertCntReceber_Item.ParamByName('IDRECEBER').AsInteger := idReceber;
  qryInsertCntReceber_Item.ParamByName('IDFILIAL').AsInteger :=
    DM.fdsConfigIDFILIAL.AsInteger;

  qryInsertCntReceber_Item.Prepare;
  qryInsertCntReceber_Item.ExecQuery;

  DM.conexao.CommitRetaining;
end;

function TfrmVendaFinalizacao.NotasAtraso(IDCliente: Integer): TlCredito;
var
 impedido, temPermicao : Boolean;
 diasRestantes, diasTolerancia,vTotal: Double;
begin
  diasTolerancia := DM.fdsConfigDIAS_ATRASO_BLOQUEIO.AsInteger;
  impedido := False;
  vTotal := 0;
  with qryComand do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT RI.DT_VENC,(((RI.VALOR + RI.ACRESCIMO + VALOR_JUROS_PAGO)- DESCONTO) - RI.VALOR_PAGO) AS VALOR FROM CNT_RECEBER_ITEM RI ');
    SQL.Add('WHERE RI.IDRECEBER IN (SELECT ID FROM CNT_RECEBER R WHERE R.IDCLIENTE = :IDCLIENTE AND R.IDFORMA_PAG <> 2) ');
    SQL.Add('AND POSICAO = :POSICAO');
    ParamByName('IDCLIENTE').AsInteger := IDCliente;
    ParamByName('POSICAO').AsString := 'AB';
    Prepare;
    try
    ExecQuery;
    except
      On E:Exception do
        ShowMessage('Ocorreu um erro ao Executar a Query: ' + E.Message);
    end;
  end;

  if qryComand.RecordCount > 0 then
  begin
    while not(qryComand.Eof) do
    begin
      diasRestantes := qryComand.FieldByName('DT_VENC').AsDate - Now - diasTolerancia;

      if diasRestantes <= 0 then
      begin
        impedido := True;
        Break;
      end
      else
        qryComand.Next;
    end;

    while not(qryComand.Eof) do
    begin
      vTotal:= vTotal + qryComand.FieldByName('VALOR').AsFloat;
      qryComand.Next;
    end;
  end;
  result.Bloqueado:= impedido;
  result.vDevedor := vTotal;
end;

procedure TfrmVendaFinalizacao.PopulaComboBox;
begin
  // fdsFormaPagamento.First;
  // while not(fdsFormaPagamento.EOF) do
  // begin
  // cbxFormaPag.AddItemValue(fdsFormaPagamentoNOME.AsString, fdsFormaPagamentoID.AsString);
  // fdsFormaPagamento.Next;
  // end;
  // cbxFormaPag.ItemIndex := cbxFormaPag.Values.IndexOf(IntToStr(idFormaPag));

end;

procedure TfrmVendaFinalizacao.btnGerarParcelasClick(Sender: TObject);
var
temPermicao:Boolean;
uVerificaPermicao : TVerificaPermicao;
begin
  cdsCntReceber_Item.EmptyDataSet;
  cdsChequeCntReceber.EmptyDataSet;
  parcelas := 0;

  if valorCheque > 0 then
  begin
    Try
      frmLancDadosBasicCheque := TfrmLancDadosBasicCheque.Create(nil);
      frmLancDadosBasicCheque.edtEmitente.Text := edtCliente.Text;
      frmLancDadosBasicCheque.ShowModal;
    Finally
      if frmLancDadosBasicCheque.ModalResult = mrOk then
      begin
        idBanco := frmLancDadosBasicCheque.idBanco;
        nBanco := frmLancDadosBasicCheque.fdsBancoNUM_BANCO.AsInteger;
        emitente := frmLancDadosBasicCheque.edtEmitente.Text;
        nAgencia := StrToInt(frmLancDadosBasicCheque.edtAgencia.Text);
        nConta := StrToInt(frmLancDadosBasicCheque.edtConta.Text);
        parcelas := StrToInt(edtParcelasCH.Text);
        GeraParcelaCheque('CH', parcelas, valorCheque);
      end;
      frmLancDadosBasicCheque.Free;
    End;
  end;

  parcelas := 0;

  if valorCartao > 0 then
  begin
    parcelas := StrToInt(edtParcelasCT.Text);
    GeraParcelaNota(tipoCartao, parcelas, valorCartao);
  end;

  parcelas := 0;

  if valorParcelar > 0 then
  begin
    if (fdsClienteLIMITE_CREDITO.AsFloat > 0) and ((valorParcelar+NotasAtraso(idCliente).vDevedor)>fdsClienteLIMITE_CREDITO.AsFloat) then
    begin
      TfrmMenssagens.Mensagem('O limite de credi�rio para esse cliente � de R$'+FloatToStr(fdsClienteLIMITE_CREDITO.AsFloat), 'Cliente Bloqueado','T',[MBOK]);

      temPermicao := uVerificaPermicao.Verifica('LIBERAR_CLIENTE_BLOQ');

      if not(temPermicao) then
      begin
        TFrmMenssagens.Mensagem('Desculpe,usu�rio sem permiss�o para ultrapassar o limite de credi�rio de cliente.', 'Credi�rio n�o permitido.','I',[mbOk]);
        abort;
      end;
    end;
    parcelas := StrToInt(edtParcelasNT.Text);
//    if idFormaPag = 10 then
//      GeraParcelaNota('BL', parcelas, valorParcelar)
//    else
      GeraParcelaNota('NT', parcelas, valorParcelar);
  end;

  parcelas := 0;

  if valorFinanceira > 0 then
  begin
    parcelas := nParcelasFinanceira;
    GeraParcelaNota('FN', parcelas, valorFinanceira);
  end;

  gerouParcelas := True;
  btnGravar.SetFocus;
end;

procedure TfrmVendaFinalizacao.RecalculaParcelas(vlrAlterado: Double;
  prefixo: string; index: Integer);
var
  valorTotConta, valorParcela: Double;
  i: Integer;
begin

  autoParcela := True;

  parcelas := 0;

  if prefixo = 'CH' then
  begin

    valorTotConta := valorCheque - vlrAlterado;

    parcelas := StrToInt(edtParcelasCH.Text);

    valorParcela := (valorTotConta / (parcelas - 1));

    valorParcela := RoundTo(valorParcela, -2);

    cdsChequeCntReceber.First;

    while not(cdsChequeCntReceber.Eof) do
    begin
      if not(cdsChequeCntReceber.RecNo = index) then
      begin
        cdsChequeCntReceber.Edit;
        cdsChequeCntReceberVALOR.AsFloat := valorParcela;
        cdsChequeCntReceber.Post;
      end;
      cdsChequeCntReceber.Next;
    end;
  end
  else
  begin
    parcelas := 0;

    if prefixo = 'NT' then
    begin
      valorTotConta := valorParcelar - vlrAlterado;
      parcelas := StrToInt(edtParcelasNT.Text)
    end
    else
    begin
      if prefixo = 'CT' then
      begin
        valorTotConta := valorCartao - vlrAlterado;
        parcelas := StrToInt(edtParcelasCT.Text);
      end;
    end;

    valorParcela := (valorTotConta / (parcelas - 1));

    valorParcela := RoundTo(valorParcela, -2);

    cdsCntReceber_Item.First;

    while not(cdsCntReceber_Item.Eof) do
    begin
      if (cdsCntReceber_ItemPREFIXO.AsString = prefixo) and
        not(cdsCntReceber_Item.RecNo = index) then
      begin
        cdsCntReceber_Item.Edit;
        cdsCntReceber_ItemVALOR.AsFloat := valorParcela;
        cdsCntReceber_Item.Post;
      end;
      cdsCntReceber_Item.Next;
    end;
  end;

  editouParcela := False;

  autoParcela := False;

end;

procedure TfrmVendaFinalizacao.RetornaCliente;
begin
  try
    frmPesqCliente := TfrmPesqCliente.Create(nil);
    frmPesqCliente.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin
      edtCliente.Text := frmPesqCliente.fdsClientesNOME.AsString;
      idCliente := frmPesqCliente.fdsClientesID.AsInteger;
      // fdsFormaPagamento.Locate('ID', frmPesqCliente.fdsClientesIDFORMA_PAGAMENTO.AsString, []);
    end;
    frmPesqCliente.Free;
  end;
end;

function TfrmVendaFinalizacao.RetornaCntReceberItemID(idFilial: Integer;
  valor: Double; dt_venc: TDate): Integer;
begin
  qryRetornaIDCntReceber_Item.Close;
  qryRetornaIDCntReceber_Item.ParamByName('IDRECEBER').AsInteger := idReceber;
  qryRetornaIDCntReceber_Item.ParamByName('IDFILIAL').AsInteger := idFilial;
  qryRetornaIDCntReceber_Item.ParamByName('VALOR').AsFloat := valor;
  qryRetornaIDCntReceber_Item.ParamByName('DT_VENC').AsDateTime := dt_venc;
  qryRetornaIDCntReceber_Item.Prepare;
  qryRetornaIDCntReceber_Item.ExecQuery;
  Result := qryRetornaIDCntReceber_Item.FieldByName('ID').AsInteger;
end;

procedure TfrmVendaFinalizacao.RetornaVendedor;
begin
  try
    frmPesqVendedor := TfrmPesqVendedor.Create(nil);
    frmPesqVendedor.ShowModal;
  Finally
    if frmPesqVendedor.ModalResult = mrOk then
    begin
      edtIdVendedor.Text := frmPesqVendedor.fdsVendedoresID.AsString;
      edtVendedor.Text := frmPesqVendedor.fdsVendedoresNOME.AsString;
      idVendedor := frmPesqVendedor.fdsVendedoresID.AsInteger;
      edtDesconto.SetFocus;
    end;
    frmPesqVendedor.Free;
  end;
end;

procedure TfrmVendaFinalizacao.RzDBComboBox1Change(Sender: TObject);
begin
  // VerificaFormaPagamento;
end;

procedure TfrmVendaFinalizacao.BaixaCartaoAVista;
begin
  with qrySQL do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE CNT_RECEBER SET POSICAO = ' + QuotedStr('PG') +
      ', VALOR_PAGO = VALOR WHERE ID = ' + IntToStr(idReceber));
    Prepare;
    ExecQuery;

    DM.conexao.CommitRetaining;

    Close;
    SQL.Clear;
    SQL.Add('UPDATE CNT_RECEBER_ITEM SET POSICAO = ' + QuotedStr('PG') +
      ', VALOR_PAGO = VALOR');
    Prepare;
    ExecQuery;

    // qryInsertCntReceber_Item.ParamByName('POSICAO').AsString := 'AB';
    // qryInsertCntReceber_Item.ParamByName('PREFIXO').AsString := prefixo;
    // qryInsertCntReceber_Item.ParamByName('DT_VENC').AsDateTime := dtVenc;
    // qryInsertCntReceber_Item.ParamByName('VALOR').AsFloat := valor;
    // qryInsertCntReceber_Item.ParamByName('VALOR_PAGO').AsFloat := 0;
    // qryInsertCntReceber_Item.ParamByName('PARCELA').AsString := parcela;
    // qryInsertCntReceber_Item.ParamByName('IDRECEBER').AsInteger := idReceber;
  end;
end;

procedure TfrmVendaFinalizacao.btnCancelarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle,
    Pchar('Deseja realmente cancelar a finaliza��o da Venda?'), 'Aten��o',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) of
    idYes:
      begin
        ModalResult := mrCancel;
      end;
  end;
end;

procedure TfrmVendaFinalizacao.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
begin
  if valorRestante > 0 then
  begin
    Application.MessageBox('Total da Venda n�o atingido.', 'Aten��o', MB_OK+MB_ICONEXCLAMATION);
    edtDinheiro.SetFocus;
    Abort;
  end;
  if ((valorCheque > 0) or (valorParcelar > 0)) and (idCliente = 99999) then
  begin
    Application.MessageBox
      ('Informe um cliente para parcelar a conta ou informe outra modea para a venda.',
      'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    btnPesqCliente.SetFocus;
    Abort;
  end;

  if ((valorCheque > 0) or (valorParcelar > 0) or (valorCartao > 0)) and
    (gerouParcelas = False) then
  begin
    Application.MessageBox('Primeiro gere as parcelas a receber.', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION);
    btnGerarParcelas.SetFocus;
    Abort;
  end;

  cdsChequeCntReceber.First;
  if cdsChequeCntReceber.RecordCount > 0 then
  begin
    while not(cdsChequeCntReceber.Eof) do
    begin
      if Trim(cdsChequeCntReceberNUM_CHEQUE.AsString) = '' then
      begin
        Application.MessageBox('Voc� deve preencher o n� de todos os cheques.',
          'Aten��o', MB_OK + MB_ICONEXCLAMATION);
        Abort;
      end
      else
        cdsChequeCntReceber.Next;
    end;
  end;

  VerificaFormaPagamento;
  VerificaTroco;

  if valorDinheiro + valorDesconto < valorDoc then
    GerarDocumentos
  else
    GeraNotaAVista;

  ModalResult := mrOk;
end;

procedure TfrmVendaFinalizacao.btnOutrosPagamentosClick(Sender: TObject);
begin
  Try
    frmOutrosPagamentos := TfrmOutrosPagamentos.Create(nil);
    frmOutrosPagamentos.valorFinanceira := valorFinanceira;
    frmOutrosPagamentos.valorValeDesconto := valorValeDesconto;
    frmOutrosPagamentos.valorTicket := valorTicket;
    frmOutrosPagamentos.ShowModal;
  Finally
    if frmOutrosPagamentos.ModalResult = mrOk then
    begin
      valorFinanceira := frmOutrosPagamentos.valorFinanceira;
      nParcelasFinanceira := StrToInt(frmOutrosPagamentos.edtParcelasFN.Text);
      valorValeDesconto := frmOutrosPagamentos.valorValeDesconto;
      valorTicket := frmOutrosPagamentos.valorTicket;
    end;

    frmOutrosPagamentos.Free;
    CalculaValorParcelar;
    btnGerarParcelas.SetFocus;
  End;
end;

procedure TfrmVendaFinalizacao.btnPesqClienteClick(Sender: TObject);
begin
  RetornaCliente;
  edtDinheiro.SetFocus;
end;

procedure TfrmVendaFinalizacao.btnPesqVendedorClick(Sender: TObject);
begin
  RetornaVendedor;
end;

procedure TfrmVendaFinalizacao.CalculaDescontoTotal;
var
  utils: TUtils;
begin
  valorDesconto := utils.ValidaInteiroFloat(edtDesconto.Text, 'F');

  if valorDesconto > 0 then
  begin
    if cbxTipoDesconto.Value = 'P' then
    begin
    valorDesconto := RoundTo(valorDoc * valorDesconto / 100, -2);
    end;
    if not(edtNota.Text='R$ 0,00') then
    //CalculaValorParcelar;
  end;
end;

procedure TfrmVendaFinalizacao.CalculaValorParcelar;
var
  utils: TUtils;
begin
  valorParcelar := RoundTo(valorDoc - valorDesconto - valorDinheiro -
    valorCheque - valorCartao - valorFinanceira - valorValeDesconto -
    valorTicket, -2);

  if valorParcelar < 0 then
    valorParcelar := 0;

  edtNota.Text := utils.AdicionaMascaraDinheiro(FloatToStr(valorParcelar));
  gerouParcelas := False;

end;

procedure TfrmVendaFinalizacao.CalculaValorRestante;
var
  utils : TUtils;
begin
    valorRestante := RoundTo(valorDoc - valorParcelar - valorDinheiro - valorCheque - valorCartao - valorFinanceira - valorValeDesconto - valorTicket, -2);
   // if cbxDescAcre.Value = 'D' then
      valorRestante := valorRestante - valorDesconto;
   // else
     // valorRestante := valorRestante + valorDesconto;

    if valorRestante < 0 then
      valorRestante := 0;

    if (valorParcelar > 0) or (valorCheque > 0) or (valorCartao> 0) or (valorFinanceira> 0) then
    begin
      btnGerarParcelas.Enabled := True;
      gerouParcelas := False;
    end
    else
    begin
      btnGerarParcelas.Enabled := False;
      gerouParcelas := True;
    end;
end;

procedure TfrmVendaFinalizacao.cbxTipoDescontoChange(Sender: TObject);
begin
  edtDesconto.SetFocus;
end;

procedure TfrmVendaFinalizacao.cdsCntReceber_ItemAfterEdit(DataSet: TDataSet);
begin
  editouParcela := True;
end;

procedure TfrmVendaFinalizacao.cdsCntReceber_ItemAfterPost(DataSet: TDataSet);
begin
  if (editouParcela) and not(autoParcela) then
    RecalculaParcelas(cdsCntReceber_ItemVALOR.AsFloat,
      cdsCntReceber_ItemPREFIXO.AsString, cdsCntReceber_Item.RecNo);
end;

procedure TfrmVendaFinalizacao.edtCartaoEnter(Sender: TObject);
var
  utils: TUtils;
begin
//  edtCartao.Text := utils.RetiraMascaraDinheiro(edtCartao.Text);
//  edtCartao.SelectAll;

  edtNota.Enabled := false;
  edtParcelasNT.Enabled := false;
  edtCheque.Enabled := false;
  edtParcelasCH.Enabled := false;
  edtCartao.Enabled := True;
  edtParcelasCT.Enabled := True;
  edtCartao.Text := utils.RetiraMascaraDinheiro(edtCartao.Text);
  if valorCartao = 0  then
  begin
    edtCartao.Text := FloatTOStr(valorRestante);
  end;
  edtCartao.SelectAll;
end;

procedure TfrmVendaFinalizacao.edtCartaoExit(Sender: TObject);
var
  utils: TUtils;
begin
  edtCartao.Text := FloatToStr(utils.ValidaInteiroFloat(edtCartao.Text, 'F'));
  valorCartao :=  StrToFloat(edtCartao.Text);

  if(edtCartao.Text = '0') then
  begin
   valorRestante:= valorRestante;
   edtCartao.Text := utils.AdicionaMascaraDinheiro(edtCartao.Text);
   edtCartao.Enabled := false;
   edtParcelasCT.Enabled := false;
  end;

  edtCartao.Text := utils.AdicionaMascaraDinheiro(edtCartao.Text);

  CalculaValorRestante;

  if valorCartao > 0 then
  begin
    Try
      frmTipoCartaoCredito := TfrmTipoCartaoCredito.Create(nil);
      frmTipoCartaoCredito.ShowModal;
    Finally
      if not(frmTipoCartaoCredito.ModalResult = mrOk) then
      begin
        tipoCartao := EmptyStr;
        valorCartao :=  0;
        edtCartao.Text := utils.AdicionaMascaraDinheiro('0,00');
        CalculaValorRestante;
        edtCartao.SetFocus;
      end;
//      else
//        btnGerarParcelas.SetFocus;

      frmTipoCartaoCredito.Free;
    End;
  end
  else
    tipoCartao := EmptyStr;





//  edtCartao.Text := FloatToStr(utils.ValidaInteiroFloat(edtCartao.Text, 'F'));
//  valorCartao := StrToFloat(edtCartao.Text);
//  edtCartao.Text := utils.AdicionaMascaraDinheiro(edtCartao.Text);
//
//  CalculaValorParcelar;
//
//  if valorCartao > 0 then
//  begin
//    Try
//      frmTipoCartaoCredito := TfrmTipoCartaoCredito.Create(nil);
//      frmTipoCartaoCredito.ShowModal;
//    Finally
//      if not(frmTipoCartaoCredito.ModalResult = mrOk) then
//      begin
//        tipoCartao := EmptyStr;
//        valorCartao := 0;
//        edtCartao.Text := utils.AdicionaMascaraDinheiro('0,00');
//        CalculaValorParcelar;
//        edtCartao.SetFocus;
//      end;
//      // else
//      // btnGerarParcelas.SetFocus;
//
//      frmTipoCartaoCredito.Free;
//    End;
//  end
//  else
//    tipoCartao := EmptyStr;
//  // btnGerarParcelas.SetFocus;

end;

procedure TfrmVendaFinalizacao.edtChequeEnter(Sender: TObject);
var
  utils: TUtils;
begin
//  edtCheque.Text := utils.RetiraMascaraDinheiro(edtCheque.Text);
//  edtCheque.SelectAll;
  edtCartao.Enabled := false;
  edtParcelasCT.Enabled := false;
  edtNota.Enabled := false;
  edtParcelasNT.Enabled := false;

  edtCheque.Enabled := True;
  edtParcelasCH.Enabled := True;
  edtCheque.Text := utils.RetiraMascaraDinheiro(edtCheque.Text);
  if valorCheque = 0  then
  begin
    edtCheque.Text := FloatTOStr(valorRestante);
  end;
  edtCheque.SelectAll;
end;

procedure TfrmVendaFinalizacao.edtChequeExit(Sender: TObject);
var
  utils: TUtils;
begin
//  edtCheque.Text := FloatToStr(utils.ValidaInteiroFloat(edtCheque.Text, 'F'));
//  valorCheque := StrToFloat(edtCheque.Text);
//  edtCheque.Text := utils.AdicionaMascaraDinheiro(edtCheque.Text);
//
//  CalculaValorParcelar;


  edtCheque.Text := FloatToStr(utils.ValidaInteiroFloat(edtCheque.Text, 'F'));
  valorCheque :=  StrToFloat(edtCheque.Text);
  if (edtCheque.Text = '0') then
  begin
    valorRestante:= valorRestante;
    edtCheque.Text := utils.AdicionaMascaraDinheiro(edtCheque.Text);
    edtCheque.Enabled := false;
    edtParcelasCH.Enabled := false;
  end;

    edtCheque.Text := utils.AdicionaMascaraDinheiro(edtCheque.Text);
    CalculaValorRestante;
end;

procedure TfrmVendaFinalizacao.edtClienteExit(Sender: TObject);
begin
  if Trim(edtCliente.Text) = EmptyStr then
    RetornaCliente;
end;

procedure TfrmVendaFinalizacao.edtDescontoEnter(Sender: TObject);
var
  utils: TUtils;
begin
  edtDesconto.SelectAll;
end;

procedure TfrmVendaFinalizacao.edtDescontoExit(Sender: TObject);
var
  utils: TUtils;
begin
  CalculaDescontoTotal;
  CalculaValorRestante;
end;

procedure TfrmVendaFinalizacao.edtDinheiroEnter(Sender: TObject);
var
  utils: TUtils;
begin
//  edtDinheiro.Text := utils.RetiraMascaraDinheiro(edtDinheiro.Text);
//  edtDinheiro.SelectAll;
  btnGerarParcelas.Enabled := False;
  edtDinheiro.Text := utils.RetiraMascaraDinheiro(edtDinheiro.Text);
  if valorDinheiro = 0  then
  begin
    edtDinheiro.Text := FloatTOStr(valorRestante);
  end;
  edtDinheiro.SelectAll;
end;

procedure TfrmVendaFinalizacao.edtDinheiroExit(Sender: TObject);
var
  utils: TUtils;
begin
   edtDinheiro.Text := FloatToStr(utils.ValidaInteiroFloat(edtDinheiro.Text, 'F'));
  valorDinheiro :=  StrToFloat(edtDinheiro.Text);

//  edtDinheiro.Text :=
//    FloatToStr(utils.ValidaInteiroFloat(edtDinheiro.Text, 'F'));
//  valorDinheiro := StrToFloat(edtDinheiro.Text);
//  edtDinheiro.Text := utils.AdicionaMascaraDinheiro(edtDinheiro.Text);
  edtDinheiro.Text := utils.AdicionaMascaraDinheiro(edtDinheiro.Text);
  CalculaValorRestante;
  //CalculaValorParcelar;
end;

procedure TfrmVendaFinalizacao.edtIdVendedorExit(Sender: TObject);
var
  utils: TUtils;
begin
  edtIdVendedor.Text :=
    FloatToStr(utils.ValidaInteiroFloat(edtIdVendedor.Text, 'I'));

  if fdsVendedor.Locate('ID', edtIdVendedor.Text, []) then
  begin
    edtIdVendedor.Text := fdsVendedorID.AsString;
    edtVendedor.Text := fdsVendedorNOME.AsString;
    idVendedor := fdsVendedorID.AsInteger;
    edtDesconto.SetFocus;
  end
  else
    RetornaVendedor;
end;

procedure TfrmVendaFinalizacao.edtNotaEnter(Sender: TObject);
  var
  utils : TUtils;
begin                               //n�o existia vvc quem colocu
  edtCartao.Enabled := false;
  edtParcelasCT.Enabled := false;
  edtCheque.Enabled := false;
  edtParcelasCH.Enabled := false;


  edtParcelasNT.Enabled := True;
  edtNota.Text := utils.RetiraMascaraDinheiro(edtNota.Text);
  if valorParcelar = 0  then
  begin
    edtNota.Text := FloatTOStr(valorRestante);
  end;
  edtNota.SelectAll;
end;

procedure TfrmVendaFinalizacao.edtNotaExit(Sender: TObject);
var
utils:TUtils;
begin           //n�o existia vvc quem colocu
 edtNota.Text := FloatToStr(utils.ValidaInteiroFloat(edtNota.Text, 'F'));
 valorParcelar :=  StrToFloat(edtNota.Text);

 if edtNota.Text = '0'then
 begin
   valorRestante:= valorRestante;
   edtNota.Text := utils.AdicionaMascaraDinheiro(edtNota.Text);
   edtNota.Enabled := false;
   edtParcelasNT.Enabled := false;
 end;
  edtNota.Text := utils.AdicionaMascaraDinheiro(edtNota.Text);
  CalculaValorRestante;
end;

procedure TfrmVendaFinalizacao.edtParcelasCTExit(Sender: TObject);
begin
if (valorCartao > 0) and (edtParcelasCT.Text = '0') then
    edtParcelasCT.Text := '1';
end;

procedure TfrmVendaFinalizacao.edtParcelasNTExit(Sender: TObject);
begin
  if (valorParcelar > 0) and (edtParcelasNT.Text = '0') then
    edtParcelasNT.Text := '1';
  if (edtParcelasNT.Text = '0') then
    edtParcelasNT.Text := '1';
end;

procedure TfrmVendaFinalizacao.edtVendedorExit(Sender: TObject);
begin
  if Trim(edtVendedor.Text) = EmptyStr then
    RetornaVendedor;
end;

procedure TfrmVendaFinalizacao.VerificaFormaPagamento;
var
  i: SmallInt;
begin

  i := 0;

  if valorDinheiro > 0 then
  begin
    Inc(i);
    idFormaPag := 1;
  end;

  if valorCheque > 0 then
  begin
    Inc(i);
    idFormaPag := 4;
  end;

  if valorCartao > 0 then
  begin
    Inc(i);
    if tipoCartao = 'CT' then
      idFormaPag := 2;

    if tipoCartao = 'CD' then
      idFormaPag := 3;
  end;

  if valorParcelar > 0 then
  begin
    Inc(i);

    idFormaPag := 6;
  end;

  if valorFinanceira > 0 then
  begin
    Inc(i);
    idFormaPag := 5;
  end;

  if valorValeDesconto > 0 then
  begin
    Inc(i);
    idFormaPag := 7;
  end;

  if valorTicket > 0 then
  begin
    Inc(i);
    idFormaPag := 8;
  end;

  if i > 1 then
  begin
    idFormaPag := 0;
  end;
end;

procedure TfrmVendaFinalizacao.VerificaTroco;
var
utils:TUtils;
begin

  troco := RoundTo((valorDinheiro + valorCheque)- (valorDoc - valorCartao - valorParcelar - valorFinanceira - valorTicket - valorValeDesconto), -2);

  if valorDesconto > 0 then
  begin
      troco := RoundTo(troco + valorDesconto, -2)
  end;

  if (troco > 0) then
  begin
    try
        frmTroco := TfrmTroco.Create(nil);
        frmTroco.edtSubtotal.Text := edtValorVenda.Text;
        frmTroco.edtDesconto.Text := utils.AdicionaMascaraDinheiro(FloatToStr(valorDesconto));

        frmTroco.edtTotal.Text := utils.AdicionaMascaraDinheiro(FloatToStr(valorDoc - valorDesconto - valorCheque - valorCartao - valorParcelar - valorFinanceira - valorTicket - valorValeDesconto));
        frmTroco.edtRecebido.Text := utils.AdicionaMascaraDinheiro(FloatToStr(valorDinheiro+ valorCheque));
        frmTroco.edtTroco.Text := utils.AdicionaMascaraDinheiro(FloatToStr(Troco));
        frmTroco.ShowModal;
      finally
        frmTroco.Free;
      end;
  end
  else
    troco := 0;
end;

// ShowMessage(gdrNota.SelectedField.AsString);  L� o conte�do da c�lula celecionada
end.