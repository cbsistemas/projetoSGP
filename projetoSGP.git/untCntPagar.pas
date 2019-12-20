unit untCntPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, ComCtrls, RzDTP, RzDBDTP, DBCtrls, RzDBCmbo,
  RzCmboBx, Mask, RzEdit, RzDBEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  RzTabs, RzBckgnd, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  Vcl.ImgList, PngImageList, Vcl.Imaging.pngimage, JvExStdCtrls, JvButton,
  JvCtrls, JvCheckBox, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, RzRadGrp, Math;

type
  TfrmCntPagar = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblTituloTotal: TRzLabel;
    lblTotPagar: TRzLabel;
    RzBackground1: TRzBackground;
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsCntPagar: TpFIBDataSet;
    dsCntPagar: TDataSource;
    fdsCntPagarID: TFIBBCDField;
    fdsCntPagarIDFILIAL: TFIBBCDField;
    fdsCntPagarDT_INC: TFIBDateField;
    fdsCntPagarPOSICAO: TFIBStringField;
    fdsCntPagarPREFIXO: TFIBStringField;
    fdsCntPagarREFERENCIA: TFIBStringField;
    fdsCntPagarIDFORNECEDOR: TFIBBCDField;
    fdsCntPagarACRESCIMO: TFIBBCDField;
    fdsCntPagarDESCONTO: TFIBBCDField;
    fdsCntPagarVALOR: TFIBBCDField;
    fdsCntPagarVALOR_PAGO: TFIBBCDField;
    fdsCntPagarIDPORTADOR: TFIBBCDField;
    fdsCntPagarHISTORICO: TFIBStringField;
    fdsCntPagarIDFORMA_PAG: TFIBBCDField;
    fdsCntPagarIDCOMPRA: TFIBBCDField;
    fdsCntPagarTOT_PARCELA: TFIBStringField;
    fdsCntPagarPARCELAS_PG: TFIBIntegerField;
    fdsCntPagarDINHEIRO: TFIBBCDField;
    fdsCntPagarENVIADO_WEB: TFIBStringField;
    fdsCntPagarFORNECEDOR: TFIBStringField;
    rgbModoVisualizacao: TRzRadioGroup;
    rgbPosicao: TRzRadioGroup;
    pnlPeriodo: TRzGroupBox;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    chkPeriodo: TJvCheckBox;
    chkFornecedor: TJvCheckBox;
    pnlFornecedor: TRzGroupBox;
    edtPesqFornecedor: TRzEdit;
    pnlTipoDoc: TRzGroupBox;
    cbxTipoDoc: TRzComboBox;
    btnPesquisar: TJvImgBtn;
    PngImageList1: TPngImageList;
    RzLabel12: TRzLabel;
    lblTotPago: TRzLabel;
    chkTipoDoc: TJvCheckBox;
    pgcControl: TRzPageControl;
    tbsSintetico: TRzTabSheet;
    gdrReceberSintetico: TJvDBGrid;
    tbsAnalitico: TRzTabSheet;
    gdrReceberAnalitico: TJvDBGrid;
    tbsForm: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    lblNome: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    lblCompra: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel9: TRzLabel;
    edtFornecedorNome: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    gdrParcelas: TJvDBGrid;
    fdsCntPagarItens: TpFIBDataSet;
    dsCntPagarItens: TDataSource;
    fdsCntPagarItensID: TFIBBCDField;
    fdsCntPagarItensIDFILIAL: TFIBBCDField;
    fdsCntPagarItensPOSICAO: TFIBStringField;
    fdsCntPagarItensPREFIXO: TFIBStringField;
    fdsCntPagarItensREFERENCIA: TFIBStringField;
    fdsCntPagarItensIDPAGAR: TFIBBCDField;
    fdsCntPagarItensDT_VENC: TFIBDateField;
    fdsCntPagarItensDT_PAG: TFIBDateField;
    fdsCntPagarItensACRESCIMO: TFIBBCDField;
    fdsCntPagarItensDESCONTO: TFIBBCDField;
    fdsCntPagarItensVALOR: TFIBBCDField;
    fdsCntPagarItensVALOR_PAGO: TFIBBCDField;
    fdsCntPagarItensHISTORICO: TFIBStringField;
    fdsCntPagarItensPARCELA: TFIBStringField;
    fdsCntPagarItensENVIADO_WEB: TFIBStringField;
    fdsCntPagarItensNUM_DOCUMENTO: TFIBStringField;
    fdsCntPagarItensFORNECEDOR: TFIBStringField;
    fdsCntPagarItensForm: TpFIBDataSet;
    dsCntPagarItensForm: TDataSource;
    fdsCntPagarFORMA_PAG: TFIBStringField;
    fdsFornecedor: TpFIBDataSet;
    dsFornecedor: TDataSource;
    fdsFornecedorID: TFIBBCDField;
    fdsFornecedorNOME: TFIBStringField;
    fdsFornecedorTELEFONE: TFIBStringField;
    fdsFornecedorCIDADE: TFIBStringField;
    imgFlagYellow: TImage;
    imgFlagRed: TImage;
    imgFlagGreen: TImage;
    imgFlagYellow2: TImage;
    imgFlagRed2: TImage;
    imgFlagGreen2: TImage;
    btnPagar: TRzBitBtn;
    qrySomaPagar: TpFIBQuery;
    fdsCntPagarItensFormID: TFIBBCDField;
    fdsCntPagarItensFormIDFILIAL: TFIBBCDField;
    fdsCntPagarItensFormPOSICAO: TFIBStringField;
    fdsCntPagarItensFormPREFIXO: TFIBStringField;
    fdsCntPagarItensFormREFERENCIA: TFIBStringField;
    fdsCntPagarItensFormIDPAGAR: TFIBBCDField;
    fdsCntPagarItensFormDT_VENC: TFIBDateField;
    fdsCntPagarItensFormDT_PAG: TFIBDateField;
    fdsCntPagarItensFormACRESCIMO: TFIBBCDField;
    fdsCntPagarItensFormDESCONTO: TFIBBCDField;
    fdsCntPagarItensFormVALOR: TFIBBCDField;
    fdsCntPagarItensFormVALOR_PAGO: TFIBBCDField;
    fdsCntPagarItensFormHISTORICO: TFIBStringField;
    fdsCntPagarItensFormPARCELA: TFIBStringField;
    fdsCntPagarItensFormENVIADO_WEB: TFIBStringField;
    fdsCntPagarItensFormNUM_DOCUMENTO: TFIBStringField;
    fdsCntPagarItensFormFORNECEDOR: TFIBStringField;
    fdsCntPagarDT_ALT: TFIBDateField;
    RzDBEdit1: TRzDBEdit;
    RzLabel1: TRzLabel;
    fdsCntPagarItensBAIXA_AGRUPADA: TFIBStringField;
    fdsCntPagarItensPAGAMENTO_MOEDA: TFIBStringField;
    fdsCntPagarItensPAG_DESC_ACRE: TFIBBCDField;
    fdsCntPagarItensPAG_DINHEIRO: TFIBBCDField;
    fdsCntPagarItensID_PAG_ITEM: TFIBBCDField;
    fdsCntPagarItensFormBAIXA_AGRUPADA: TFIBStringField;
    fdsCntPagarItensFormPAGAMENTO_MOEDA: TFIBStringField;
    fdsCntPagarItensFormPAG_DESC_ACRE: TFIBBCDField;
    fdsCntPagarItensFormPAG_DINHEIRO: TFIBBCDField;
    fdsCntPagarItensFormID_PAG_ITEM: TFIBBCDField;
    edtValorSelect: TRzEdit;
    lblTotSelecionado: TRzLabel;
    fdsCntPagarItensFormPAG: TStringField;
    fdsCntPagarDESCRICAO: TFIBStringField;
    btnIncGasto: TRzBitBtn;
    fdsCntPagarItensIDCOMPRA: TFIBBCDField;
    fdsCntPagarItensREC_DINHEIRO: TFIBBCDField;
    fdsCntPagarItensFormREC_DINHEIRO: TFIBBCDField;
    fdsCntPagarItensFormIDCOMPRA: TFIBBCDField;
    fdsCntPagarItensSEL: TStringField;
    qryCmd: TpFIBQuery;
    fdsCntPagarItensIDFORNECEDOR: TFIBBCDField;
    pnlPlanoConta: TRzGroupBox;
    cbxPlanoConta: TRzComboBox;
    chkPlanoConta: TJvCheckBox;
    fdsPlanoConta: TpFIBDataSet;
    fdsPlanoContaID: TFIBBCDField;
    fdsPlanoContaDT_INC: TFIBDateField;
    fdsPlanoContaDT_ALT: TFIBDateField;
    fdsPlanoContaSTATUS: TFIBStringField;
    fdsPlanoContaNOME: TFIBStringField;
    fdsCntPagarIDPLANO_CONTA: TFIBBCDField;
    RzDBEdit10: TRzDBEdit;
    RzLabel5: TRzLabel;
    fdsCntPagarItensPLANO_CONTA: TFIBStringField;
    fdsCntPagarPLANO_CONTA: TFIBStringField;
    btnPesqFornec: TRzBitBtn;
    pnlNCheque: TRzGroupBox;
    edtPesqNCheque: TRzEdit;
    chkNCheque: TJvCheckBox;
    pnlReferencia: TRzGroupBox;
    edtPesqRef: TRzEdit;
    chkReferencia: TJvCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RetornaTotalPagar(index: Integer);
    procedure RetornaTotalPago(index: Integer);
    procedure PesquisarSintetico;
    procedure PesquisarAnalitico(index: Integer);
    procedure RetornaCntPagarIdPagarItem(idPagar: string);
    procedure RetornaIDFornecedor(fornecedor: string);
    procedure gdrReceberSinteticoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tbsSinteticoShow(Sender: TObject);
    procedure tbsAnaliticoShow(Sender: TObject);
    procedure tbsFormShow(Sender: TObject);
    procedure RetornaCntPagarIdPagaItem(idPagar: string);
    procedure RetornaCntPagarItemIDPagar(idPagar: string);
    procedure RetornaFornecedorId(idFornecedor: string);
    procedure VerificaValorPagar;
    procedure ZeraValorPagar;
    function ContaTotFornecPagar(): Integer;
    procedure rgbModoVisualizacaoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure gdrReceberAnaliticoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gdrReceberAnaliticoDblClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure chkPeriodoClick(Sender: TObject);
    procedure chkFornecedorClick(Sender: TObject);
    procedure chkTipoDocClick(Sender: TObject);
    procedure gdrParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrParcelasDblClick(Sender: TObject);
    procedure lblCompraMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lblCompraMouseLeave(Sender: TObject);
    procedure gdrReceberAnaliticoCellClick(Column: TColumn);
    procedure fdsCntPagarItensFormAfterScroll(DataSet: TDataSet);
    procedure gdrParcelasCellClick(Column: TColumn);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnIncGastoClick(Sender: TObject);
    procedure edtPesqFornecedorEnter(Sender: TObject);
    procedure edtPesqFornecedorExit(Sender: TObject);
    procedure gdrReceberAnaliticoTitleClick(Column: TColumn);
    procedure rgbPosicaoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure fdsPlanoContaAfterOpen(DataSet: TDataSet);
    procedure chkPlanoContaClick(Sender: TObject);
    procedure btnPesqFornecClick(Sender: TObject);
    procedure chkNChequeClick(Sender: TObject);
    procedure edtPesqNChequeEnter(Sender: TObject);
    procedure edtPesqNChequeExit(Sender: TObject);
    procedure chkReferenciaClick(Sender: TObject);
    procedure edtPesqRefEnter(Sender: TObject);
    procedure edtPesqRefExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCntPagar: TfrmCntPagar;
  vlrSelecionado: Double;
  selected: string[1];

implementation

uses untData, uUtils, untCheque, untPagIncPagar, untIncluirGastos,
  untPesqFornecedor;

{$R *.dfm}

procedure TfrmCntPagar.btnIncGastoClick(Sender: TObject);
begin
  Try
    frmIncluirGastos := TfrmIncluirGastos.Create(nil);
    frmIncluirGastos.ShowModal;
  Finally
    if frmIncluirGastos.ModalResult = mrOk then
    begin
      Application.MessageBox('Gasto Lançado com Sucesso!', 'Gasto Lançado.',
        MB_OK + MB_ICONEXCLAMATION);
      btnPesquisar.Click;
    end;
  End;
end;

procedure TfrmCntPagar.btnIncluirClick(Sender: TObject);
begin
  Try
    frmPagIncPagar := TfrmPagIncPagar.Create(nil);

    frmPagIncPagar.valorDoc := 0;
    frmPagIncPagar.idFornec := 0;
    frmPagIncPagar.modo := 'Inclusão';

    frmPagIncPagar.ShowModal;
  Finally
    if frmPagIncPagar.ModalResult = mrOk then
    begin
      Application.MessageBox('Conta Lançada com Sucesso!', 'Conta Lançada.',
        MB_OK + MB_ICONEXCLAMATION);
      btnPesquisar.Click;
    end;
  End;
end;

procedure TfrmCntPagar.btnPagarClick(Sender: TObject);
var
  idPagarTemp, idPagarItemTemp: string;
  temVariosFornec: Boolean;
begin
  temVariosFornec := False;
  if vlrSelecionado > 0 then
  begin
    Try
      frmPagIncPagar := TfrmPagIncPagar.Create(nil);
      frmPagIncPagar.Caption := 'Baixa de Documento de Fornecedor';
      frmPagIncPagar.lblTitulo.Caption := 'Baixa de Documento de Fornecedor';
      frmPagIncPagar.valorDoc := vlrSelecionado;

      if rgbModoVisualizacao.ItemIndex = 1 then
      begin
        frmPagIncPagar.edtDescricao.Text := 'PAGAMENTO CONTA(S): ';

        fdsCntPagarItens.First;
        while not(fdsCntPagarItens.Eof) do
        begin
          if fdsCntPagarItensPOSICAO.AsString = 'PG' then
            Break;

          if (fdsCntPagarItensBAIXA_AGRUPADA.AsString = 'S') then
          begin
            frmPagIncPagar.cdsDocumentos.Append;
            frmPagIncPagar.cdsDocumentosIdDoc.AsInteger :=
              fdsCntPagarItensID.AsInteger;
            frmPagIncPagar.cdsDocumentosIdVenda.AsInteger :=
              fdsCntPagarItensIDCOMPRA.AsInteger;
            frmPagIncPagar.cdsDocumentosREFERENCIA.AsString :=
              fdsCntPagarItensREFERENCIA.AsString;
            frmPagIncPagar.cdsDocumentosIdFilial.AsInteger :=
              fdsCntPagarItensIDFILIAL.AsInteger;
            frmPagIncPagar.cdsDocumentosVALOR_PAGO.AsFloat :=
              fdsCntPagarItensVALOR_PAGO.AsFloat;
            frmPagIncPagar.cdsDocumentosVALOR_DOC.AsFloat :=
              fdsCntPagarItensVALOR.AsFloat - fdsCntPagarItensDESCONTO.AsFloat;
            frmPagIncPagar.cdsDocumentosREC_DINHEIRO.AsFloat :=
              fdsCntPagarItensREC_DINHEIRO.AsFloat;
            frmPagIncPagar.cdsDocumentosPAGAMENTO_MOEDA.AsString :=
              fdsCntPagarItensPAGAMENTO_MOEDA.AsString;
            frmPagIncPagar.cdsDocumentosPARCELA.AsString :=
              fdsCntPagarItensPARCELA.AsString;
            frmPagIncPagar.cdsDocumentosIDRECEBER.AsInteger :=
              fdsCntPagarItensIDPAGAR.AsInteger;
            frmPagIncPagar.edtDescricao.Text := frmPagIncPagar.edtDescricao.Text
              + fdsCntPagarItensREFERENCIA.AsString + ' / ';
            frmPagIncPagar.cdsDocumentos.Post;
            frmPagIncPagar.idFornec := fdsCntPagarItensIDFORNECEDOR.AsInteger;
            frmPagIncPagar.edtCliente.Text :=
              fdsCntPagarItensFORNECEDOR.AsString;
          end;
          fdsCntPagarItens.Next;
        end;
      end
      else
      begin
        // frmPagIncReceber.idDoc := fdsCntReceberItensFormID.AsInteger;
        // frmPagIncReceber.idFilial := fdsCntReceberItensFormIDFILIAL.AsInteger;

        frmPagIncPagar.cdsDocumentos.Append;
        frmPagIncPagar.cdsDocumentosIdDoc.AsInteger :=
          fdsCntPagarItensFormID.AsInteger;
        frmPagIncPagar.cdsDocumentosIdVenda.AsInteger :=
          fdsCntPagarItensFormIDCOMPRA.AsInteger;
        frmPagIncPagar.cdsDocumentosREFERENCIA.AsString :=
          fdsCntPagarItensFormREFERENCIA.AsString;
        frmPagIncPagar.cdsDocumentosIdFilial.AsInteger :=
          fdsCntPagarItensFormIDFILIAL.AsInteger;
        frmPagIncPagar.cdsDocumentosVALOR_PAGO.AsFloat :=
          fdsCntPagarItensFormVALOR_PAGO.AsFloat;
        frmPagIncPagar.cdsDocumentosVALOR_DOC.AsFloat :=
          fdsCntPagarItensFormVALOR.AsFloat -
          fdsCntPagarItensFormDESCONTO.AsFloat;
        frmPagIncPagar.cdsDocumentosREC_DINHEIRO.AsFloat :=
          fdsCntPagarItensFormREC_DINHEIRO.AsFloat;
        frmPagIncPagar.cdsDocumentosPAGAMENTO_MOEDA.AsString :=
          fdsCntPagarItensFormPAGAMENTO_MOEDA.AsString;
        frmPagIncPagar.cdsDocumentosPARCELA.AsString :=
          fdsCntPagarItensFormPARCELA.AsString;
        frmPagIncPagar.cdsDocumentosIDRECEBER.AsInteger :=
          fdsCntPagarItensFormIDPAGAR.AsInteger;
        frmPagIncPagar.cdsDocumentos.Post;

        frmPagIncPagar.valorDoc := fdsCntPagarItensFormVALOR.AsFloat -
          fdsCntPagarItensFormDESCONTO.AsFloat -
          fdsCntPagarItensFormVALOR_PAGO.AsFloat;
      end;

      // frmPagIncReceber.valorJuros := vlrTotalJuros;
      DM.Conexao.CommitRetaining;
      if ContaTotFornecPagar > 1 then
      begin
        frmPagIncPagar.idFornec := 1;
        frmPagIncPagar.edtCliente.Text := 'BAIXA AGRUPADA';
      end;

      frmPagIncPagar.modo := 'Pagamento';
      frmPagIncPagar.edtNota.Enabled := False;
      frmPagIncPagar.edtParcelasNT.Enabled := False;

      // frmPagIncPagar.edtCliente.Text := fdsCntPagarFORNECEDOR.AsString;
      // frmPagIncPagar.edtPrefixoVenda.Text := fdsCntPagarItensPREFIXO.AsString;
      // frmPagIncPagar.edtPrefixoVenda.Text := 'CP';
      // frmPagIncReceber.edtDocumento.Text := fdsCntReceberItensREFERENCIA.AsString;

      frmPagIncPagar.ShowModal;
      btnPesquisar.Click;
    Finally
      if frmPagIncPagar.ModalResult = mrOk then
      begin
        // idPagarTemp := fdsCntPagarID.AsString;
        // RetornaCntPagarItemIDPagar(fdsCntPagarID.AsString);

        // if rgbModoVisualizacao.ItemIndex = 1 then
        // begin
        // fdsCntPagarItensForm.Close;
        // fdsCntPagarItensForm.Open;
        // fdsCntPagarItensForm.Locate('ID',idPagarItemTemp, []);
        // end
        // else
        // begin
        // fdsCntPagar.Close;
        // fdsCntPagar.Open;
        // fdsCntPagar.Locate('ID',idPagarTemp, []);
        // end;
      end;
      frmPagIncPagar.Free;
      btnPesquisar.Click;
    End;
  end;
end;

procedure TfrmCntPagar.btnPesqFornecClick(Sender: TObject);
begin
  Try
    frmPesqFornecedor := TfrmPesqFornecedor.Create(nil);
    frmPesqFornecedor.ShowModal;
  Finally
    if frmPesqFornecedor.ModalResult = mrOk then
    begin
      edtPesqFornecedor.Text := frmPesqFornecedor.fdsFornecedorNOME.AsString;
    end;
    frmPesqFornecedor.Free;
  End;
end;

procedure TfrmCntPagar.btnPesquisarClick(Sender: TObject);
begin
  if rgbModoVisualizacao.ItemIndex = 0 then
  begin
    PesquisarSintetico;
  end
  else
  begin
    PesquisarAnalitico(rgbPosicao.ItemIndex);
    tbsAnalitico.Show;
  end;

  RetornaTotalPagar(rgbPosicao.ItemIndex);
  RetornaTotalPago(rgbPosicao.ItemIndex);

  // case rgbPosicao.ItemIndex of
  // 0 :
  // begin
  // RetornaTotalPagar(rgbPosicao.ItemIndex);
  // RetornaTotalPago(rgbPosicao.ItemIndex);
  // end;
  // 1 :
  // begin
  // RetornaTotalPagar(rgbPosicao.ItemIndex);
  // lblTotPago.Caption := 'R$ 0,00';
  // end;
  // 2 :
  // begin
  // RetornaTotalPagar(rgbPosicao.ItemIndex);
  // lblTotPago.Caption := 'R$ 0,00';
  // end;
  // 3 :
  // begin
  // RetornaTotalPago(rgbPosicao.ItemIndex);
  // lblTotPagar.Caption := 'R$ 0,00';
  // end;
  // end;
end;

procedure TfrmCntPagar.VerificaValorPagar;
var
  utils: TUtils;
begin
  if fdsCntPagarItensBAIXA_AGRUPADA.AsString = 'S' then
  begin;
    vlrSelecionado := RoundTo(vlrSelecionado + (fdsCntPagarItensVALOR.AsFloat -
      fdsCntPagarItensVALOR_PAGO.AsFloat), -2);
  end
  else
  begin
    vlrSelecionado := RoundTo(vlrSelecionado - (fdsCntPagarItensVALOR.AsFloat -
      fdsCntPagarItensVALOR_PAGO.AsFloat), -2);
  end;

  if vlrSelecionado > 0 then
  begin
    btnPagar.Enabled := True;
  end
  else
  begin
    btnPagar.Enabled := False;
  end;

  edtValorSelect.Text := FloatToStr(vlrSelecionado);
  edtValorSelect.Text := utils.AdicionaMascaraDinheiro(edtValorSelect.Text);
end;

procedure TfrmCntPagar.ZeraValorPagar;
var
  utils: TUtils;
begin
  DM.Conexao.CommitRetaining;

  qryCmd.Close;
  qryCmd.SQL.Clear;
  qryCmd.SQL.Add
    ('UPDATE CNT_PAGAR_ITEM SET BAIXA_AGRUPADA = NULL WHERE BAIXA_AGRUPADA = ' +
    QuotedStr('S'));
  qryCmd.Prepare;
  qryCmd.ExecQuery;

  DM.Conexao.CommitRetaining;

  vlrSelecionado := 0;
  edtValorSelect.Text := FloatToStr(vlrSelecionado);
  edtValorSelect.Text := utils.AdicionaMascaraDinheiro(edtValorSelect.Text);
end;

procedure TfrmCntPagar.chkFornecedorClick(Sender: TObject);
begin
  pnlFornecedor.Enabled := chkFornecedor.Checked;
  if not(chkFornecedor.Checked) then
  begin
    edtPesqFornecedor.Text := 'Todos';
    edtPesqFornecedor.Font.Color := clGray;
  end
  else
    edtPesqFornecedor.Font.Color := clBtnText;
end;

procedure TfrmCntPagar.chkNChequeClick(Sender: TObject);
begin
  pnlNCheque.Enabled := chkNCheque.Checked;

  if not(chkNCheque.Checked) then
  begin
    edtPesqNCheque.Text := 'TODOS';
    edtPesqNCheque.Font.Color := clGray;
  end;
end;

procedure TfrmCntPagar.chkPeriodoClick(Sender: TObject);
begin
  pnlPeriodo.Enabled := chkPeriodo.Checked;
end;

procedure TfrmCntPagar.chkPlanoContaClick(Sender: TObject);
begin
  pnlPlanoConta.Enabled := chkPlanoConta.Checked;

  if not(chkPlanoConta.Checked) then
    cbxPlanoConta.ItemIndex := 0;
end;

procedure TfrmCntPagar.chkReferenciaClick(Sender: TObject);
begin
  pnlReferencia.Enabled := chkReferencia.Checked;

  if not(chkReferencia.Checked) then
  begin
    edtPesqRef.Text := 'TODOS';
    edtPesqRef.Font.Color := clGray;
  end;
end;

procedure TfrmCntPagar.chkTipoDocClick(Sender: TObject);
begin
  pnlTipoDoc.Enabled := chkTipoDoc.Checked;
end;

function TfrmCntPagar.ContaTotFornecPagar: Integer;
begin
  qryCmd.Close;
  qryCmd.SQL.Clear;
  qryCmd.SQL.Add
    ('SELECT P.IDFORNECEDOR FROM CNT_PAGAR_ITEM PI, CNT_PAGAR P WHERE PI.BAIXA_AGRUPADA = '
    + QuotedStr('S'));
  qryCmd.SQL.Add(' AND P.ID = PI.IDPAGAR GROUP BY P.IDFORNECEDOR');
  qryCmd.Prepare;
  qryCmd.ExecQuery;
  while not(qryCmd.Eof) do
  begin
    qryCmd.Next;
  end;
  Result := qryCmd.RecordCount;

end;

procedure TfrmCntPagar.edtPesqFornecedorEnter(Sender: TObject);
begin
  if Trim(edtPesqFornecedor.Text) = 'TODOS' then
  begin
    edtPesqFornecedor.Text := EmptyStr;
    edtPesqFornecedor.Font.Color := clBlack;
  end;
end;

procedure TfrmCntPagar.edtPesqFornecedorExit(Sender: TObject);
begin
  if Trim(edtPesqFornecedor.Text) = EmptyStr then
  begin
    edtPesqFornecedor.Text := 'Todos';
    edtPesqFornecedor.Font.Color := clGray;
  end;
end;

procedure TfrmCntPagar.edtPesqNChequeEnter(Sender: TObject);
begin
  if Trim(edtPesqNCheque.Text) = 'TODOS' then
  begin
    edtPesqNCheque.Text := EmptyStr;
    edtPesqNCheque.Font.Color := clBlack;
  end;
end;

procedure TfrmCntPagar.edtPesqNChequeExit(Sender: TObject);
begin
  if Trim(edtPesqNCheque.Text) = EmptyStr then
  begin
    edtPesqNCheque.Text := 'Todos';
    edtPesqNCheque.Font.Color := clGray;
  end;
end;

procedure TfrmCntPagar.edtPesqRefEnter(Sender: TObject);
begin
  if Trim(edtPesqRef.Text) = 'TODOS' then
  begin
    edtPesqRef.Text := EmptyStr;
    edtPesqRef.Font.Color := clBlack;
  end;
end;

procedure TfrmCntPagar.edtPesqRefExit(Sender: TObject);
begin
  if Trim(edtPesqRef.Text) = EmptyStr then
  begin
    edtPesqRef.Text := 'Todos';
    edtPesqRef.Font.Color := clGray;
  end;
end;

procedure TfrmCntPagar.fdsCntPagarItensFormAfterScroll(DataSet: TDataSet);
begin
  if fdsCntPagarItensFormPOSICAO.AsString = 'AB' then
    btnPagar.Enabled := True
  else
    btnPagar.Enabled := False;
end;

procedure TfrmCntPagar.fdsPlanoContaAfterOpen(DataSet: TDataSet);
begin
  fdsPlanoConta.First;
  cbxPlanoConta.ClearItems;
  cbxPlanoConta.AddItemValue('TODOS', '0');
  while not(fdsPlanoConta.Eof) do
  begin
    cbxPlanoConta.AddItemValue(fdsPlanoContaNOME.AsString,
      fdsPlanoContaID.AsString);
    fdsPlanoConta.Next;
  end;
  fdsPlanoConta.Close;
end;

procedure TfrmCntPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZeraValorPagar;
  Action := caFree;
  frmCntPagar := nil;
end;

procedure TfrmCntPagar.FormCreate(Sender: TObject);
begin
  pgcControl.Pages[0].TabVisible := False;
  fdsPlanoConta.Open;
  fdsCntPagarItens.Open;
  chkTipoDoc.Enabled := True;
  tbsAnalitico.Show;
  RetornaTotalPagar(0);
  RetornaTotalPago(0);
  vlrSelecionado := 0;
  selected := 'S';
end;

procedure TfrmCntPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCntPagar.gdrParcelasCellClick(Column: TColumn);
var
  utils: TUtils;
begin
  // if gdrParcelas.SelectedField.FieldName = 'PAG' then
  // begin
  // if fdsCntPagarItensFormPOSICAO.AsString = 'AB' then
  // begin
  // fdsCntPagarItensForm.Edit;
  //
  // if fdsCntPagarItensFormBAIXA_AGRUPADA.AsString = 'S' then
  // begin
  // fdsCntPagarItensFormBAIXA_AGRUPADA.AsString := 'N';
  // vlrSelecionado := vlrSelecionado - (fdsCntPagarItensFormVALOR.AsFloat - fdsCntPagarItensFormVALOR_PAGO.AsFloat);
  // end
  // else
  // begin
  // fdsCntPagarItensFormBAIXA_AGRUPADA.AsString := 'S';
  // vlrSelecionado := vlrSelecionado + (fdsCntPagarItensFormVALOR.AsFloat - fdsCntPagarItensFormVALOR_PAGO.AsFloat);
  // end;
  //
  // fdsCntPagarItensForm.Post;
  //
  // edtValorSelect.Text := FloatToStr(vlrSelecionado);
  // edtValorSelect.Text := utils.AdicionaMascaraDinheiro(edtValorSelect.Text);
  //
  // if vlrSelecionado > 0 then
  // begin
  // lblTotSelecionado.Visible := True;
  // edtValorSelect.Visible := True;
  // end
  // else
  // begin
  // lblTotSelecionado.Visible := False;
  // edtValorSelect.Visible := False;
  // end;
  // end;
  // end;
end;

procedure TfrmCntPagar.gdrParcelasDblClick(Sender: TObject);
var
  prefixo: string[2];
begin
  prefixo := fdsCntPagarItensFormPREFIXO.AsString;

  if prefixo = 'CH' then
  begin
    Try
      frmCheque := TfrmCheque.Create(nil);
      frmCheque.tipo := 'Pagar';
      frmCheque.idDoc := fdsCntPagarItensFormID.AsInteger;
      frmCheque.posicao := fdsCntPagarItensFormPOSICAO.AsString;
      frmCheque.ShowModal;
    Finally
      frmCheque.Free;
    End;
  end
  else if prefixo = 'BL' then
  begin
    Try

    Finally

    End;
  end;
end;

procedure TfrmCntPagar.gdrParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  posicao: string[2];
  Bitmap: TBitmap;
  Check: Integer;
  R: TRect;
begin
  if not odd(fdsCntPagarItensForm.RecNo) then
  begin
    gdrParcelas.Canvas.Brush.Color := DM.gridOddColor;
    gdrParcelas.Canvas.FillRect(Rect);
    gdrParcelas.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.index = 1) and not(fdsCntPagarItensForm.IsEmpty) then
    begin
      posicao := fdsCntPagarItensFormPOSICAO.AsString;
      if posicao = 'AB' then
      begin
        if fdsCntPagarItensFormDT_VENC.AsDateTime >= Now then
        begin
          Bitmap := imgFlagYellow2.Picture.Bitmap
        end
        else
          Bitmap := imgFlagRed2.Picture.Bitmap
      end
      else if posicao = 'PG' then
        Bitmap := imgFlagGreen2.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end
  else
  begin
    if Column.index = 1 then
    begin
      posicao := fdsCntPagarItensFormPOSICAO.AsString;
      if posicao = 'AB' then
      begin
        if fdsCntPagarItensFormDT_VENC.AsDateTime >= Now then
        begin
          Bitmap := imgFlagYellow.Picture.Bitmap
        end
        else
          Bitmap := imgFlagRed.Picture.Bitmap
      end
      else if posicao = 'PG' then
        Bitmap := imgFlagGreen.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;

  // if Column.FieldName =  'PAG' then
  // begin
  // gdrParcelas.Canvas.FillRect(Rect);
  // Check := 0;
  //
  // if fdsCntPagarItensFormBAIXA_AGRUPADA.AsString = 'S' then
  // Check := DFCS_CHECKED
  // else
  // Check := 0;
  //
  // R := Rect;
  // InflateRect(R, -1,-1);
  // DrawFrameControl(gdrParcelas.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  // end;
end;

procedure TfrmCntPagar.gdrReceberAnaliticoCellClick(Column: TColumn);
var
  utils: TUtils;
begin
  // if gdrReceberAnalitico.SelectedIndex = SelectedField.FieldName = 'SEL' then
  if gdrReceberAnalitico.SelectedIndex = 9 then
  begin
    if fdsCntPagarItensPOSICAO.AsString = 'AB' then
    begin
      fdsCntPagarItens.Edit;

      if fdsCntPagarItensBAIXA_AGRUPADA.AsString = 'S' then
      begin
        fdsCntPagarItensBAIXA_AGRUPADA.AsString := 'N';
      end
      else
      begin
        fdsCntPagarItensBAIXA_AGRUPADA.AsString := 'S';
      end;

      fdsCntPagarItens.Post;

      VerificaValorPagar;
    end;
  end;
end;

procedure TfrmCntPagar.gdrReceberAnaliticoDblClick(Sender: TObject);
begin
  if fdsCntPagarItensPREFIXO.AsString = 'CH' then
  begin
    Try
      frmCheque := TfrmCheque.Create(nil);
      frmCheque.idDoc := fdsCntPagarItensID.AsInteger;
      frmCheque.posicao := fdsCntPagarItensPOSICAO.AsString;
      frmCheque.ShowModal;
    Finally
      frmCheque.Free;
    End;
  end;
end;

procedure TfrmCntPagar.gdrReceberAnaliticoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  posicao: string[2];
  Bitmap: TBitmap;
  Check: Integer;
  R: TRect;
begin
  if not odd(fdsCntPagarItens.RecNo) then
  begin
    gdrReceberAnalitico.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
      gdrReceberAnalitico.Brush.Color :=clHighlight;
    gdrReceberAnalitico.Canvas.FillRect(Rect);
    gdrReceberAnalitico.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.index = 1) and not(fdsCntPagarItens.IsEmpty) then
    begin
      posicao := fdsCntPagarItensPOSICAO.AsString;
      if posicao = 'AB' then
      begin
        if fdsCntPagarItensDT_VENC.AsDateTime >= Now then
        begin
          Bitmap := imgFlagYellow2.Picture.Bitmap
        end
        else
          Bitmap := imgFlagRed2.Picture.Bitmap
      end
      else if posicao = 'PG' then
        Bitmap := imgFlagGreen2.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end
  else
  begin
    if Column.index = 1 then
    begin
      posicao := fdsCntPagarItensPOSICAO.AsString;
      if posicao = 'AB' then
      begin
        if fdsCntPagarItensDT_VENC.AsDateTime >= Now then
        begin
          Bitmap := imgFlagYellow.Picture.Bitmap
        end
        else
          Bitmap := imgFlagRed.Picture.Bitmap
      end
      else if posicao = 'PG' then
        Bitmap := imgFlagGreen.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;

  if Column.FieldName = 'SEL' then
  begin
    gdrReceberAnalitico.Canvas.FillRect(Rect);
    Check := 0;

    if fdsCntPagarItensBAIXA_AGRUPADA.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -1, -1);
    DrawFrameControl(gdrReceberAnalitico.Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCntPagar.gdrReceberAnaliticoTitleClick(Column: TColumn);
begin
  if Column.index = 9 then
  begin
    fdsCntPagarItens.First;
    while not(fdsCntPagarItens.Eof) do
    begin
      if fdsCntPagarItensPOSICAO.AsString <> 'AB' then
        Break;

      fdsCntPagarItens.Edit;
      fdsCntPagarItensBAIXA_AGRUPADA.AsString := selected;
      fdsCntPagarItens.Post;
      VerificaValorPagar;
      fdsCntPagarItens.Next;
    end;

    if selected = 'S' then
      selected := 'N'
    else
      selected := 'S';
  end;

end;

procedure TfrmCntPagar.gdrReceberSinteticoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  posicao: string[2];
  Bitmap: TBitmap;
begin
  if not odd(fdsCntPagar.RecNo) then
  begin
    gdrReceberSintetico.Canvas.Brush.Color := DM.gridOddColor;
    gdrReceberSintetico.Canvas.FillRect(Rect);
    gdrReceberSintetico.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.index = 1) and not(fdsCntPagar.IsEmpty) then
    begin
      posicao := fdsCntPagarPOSICAO.AsString;
      if posicao = 'AB' then
      begin
        Bitmap := imgFlagYellow2.Picture.Bitmap
      end
      else if posicao = 'PG' then
        Bitmap := imgFlagGreen2.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end
  else
  begin
    if Column.index = 1 then
    begin
      posicao := fdsCntPagarPOSICAO.AsString;
      if posicao = 'AB' then
      begin
        Bitmap := imgFlagYellow.Picture.Bitmap
      end
      else if posicao = 'PG' then
        Bitmap := imgFlagGreen.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;
end;

procedure TfrmCntPagar.lblCompraMouseLeave(Sender: TObject);
begin
  lblCompra.Font.Color := clWindowText;
  lblCompra.Cursor := crDefault;
end;

procedure TfrmCntPagar.lblCompraMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  lblCompra.Font.Color := clBlue;
  lblCompra.Cursor := crHandPoint;
end;

procedure TfrmCntPagar.PesquisarAnalitico(index: Integer);
begin
  ZeraValorPagar;

  selected := 'S';

  with fdsCntPagarItens do
  begin
    Close;
    Conditions.Clear;

    if (chkFornecedor.Checked) and not(Trim(edtPesqFornecedor.Text) = 'Todos')
    then
    begin
      RetornaIDFornecedor(Trim(edtPesqFornecedor.Text));
      if fdsFornecedor.RecordCount > 0 then
        Conditions.AddCondition('IDFORNECEDOR', 'P.IDFORNECEDOR = ' +
          fdsFornecedorID.AsString, True)
      else
        Conditions.AddCondition('IDFORNECEDOR', 'P.IDFORNECEDOR = 0', True);
    end;

    // Início Pesquisa Por Periodo
    if index = 0 then
    begin
      if (chkPeriodo.Checked) then
        Conditions.AddCondition('DT_VENC', 'PI.DT_VENC BETWEEN ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);
    end;

    if index = 1 then
    begin
      Conditions.AddCondition('POSICAO', 'PI.POSICAO = ' +
        QuotedStr('AB'), True);
      if (chkPeriodo.Checked) then
        Conditions.AddCondition('DT_VENC', 'PI.DT_VENC BETWEEN ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True)
      else
        Conditions.AddCondition('DT_VENC', 'PI.DT_VENC > ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', Now)), True);
    end;

    if index = 2 then
    begin
      Conditions.AddCondition('POSICAO', 'PI.POSICAO = ' +
        QuotedStr('AB'), True);
      Conditions.AddCondition('DT_VENC', 'PI.DT_VENC <= ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', Now)), True);
    end;

    if index = 3 then
    begin
      Conditions.AddCondition('POSICAO', 'PI.POSICAO = ' +
        QuotedStr('PG'), True);
      if (chkPeriodo.Checked) then
        Conditions.AddCondition('DT_PAG', 'PI.DT_PAG BETWEEN ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);
    end;
    // Fim Pesquisa Por Periodo

    if (chkTipoDoc.Checked) and not(cbxTipoDoc.Value = 'TD') then
      Conditions.AddCondition('DOCUMENTO', 'PI.PREFIXO = ' +
        QuotedStr(cbxTipoDoc.Value), True);

    if (chkPlanoConta.Checked) and not(cbxPlanoConta.ItemIndex = 0) then
      Conditions.AddCondition('IDPLANO_CONTA', 'P.IDPLANO_CONTA = ' +
        cbxPlanoConta.Value, True);

    if (chkNCheque.Checked) and not(Trim(edtPesqNCheque.Text) = 'TODOS') then
      Conditions.AddCondition('NCHEQUE',
        'PI.ID IN (SELECT CH.IDPAGAR_ITEM FROM CNT_PAGAR_CHEQUE CH WHERE NUM_CHEQUE = '
        + QuotedStr(edtPesqNCheque.Text) + ')', True);

    if (chkReferencia.Checked) and not(Trim(edtPesqRef.Text) = 'TODOS') then
      Conditions.AddCondition('REF', 'PI.REFERENCIA = ' +
        QuotedStr(edtPesqRef.Text), True);

    Conditions.Apply;
    Prepare;
    Open;
  end;

  ShowScrollBar(gdrReceberAnalitico.Handle, SB_VERT, True);
end;

procedure TfrmCntPagar.PesquisarSintetico;
var
  posicao: string[2];
begin
  case rgbPosicao.ItemIndex of
    1:
      posicao := 'AB';
    2:
      posicao := 'AB';
    3:
      posicao := 'PG';
  end;

  with fdsCntPagar do
  begin
    Close;
    Conditions.Clear;
    if (chkPeriodo.Checked) then
    begin
      if rgbPosicao.ItemIndex <> 3 then
      begin
        Conditions.AddCondition('VENCIMENTO',
          'P.ID IN (SELECT IDPAGAR FROM CNT_PAGAR_ITEM WHERE DT_VENC BETWEEN ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)) + ')', True);
      end;
    end;

    if (chkFornecedor.Checked) and not(Trim(edtPesqFornecedor.Text) = 'Todos')
    then
    begin
      RetornaIDFornecedor(Trim(edtPesqFornecedor.Text));
      if fdsFornecedor.RecordCount > 0 then
        Conditions.AddCondition('IDFORNCEDOR', 'P.IDFORNECEDOR = ' +
          fdsFornecedorID.AsString, True)
      else
        Conditions.AddCondition('IDFORNECEDOR', 'P.IDFORNECEDOR = 0', True);
    end;

    if rgbPosicao.ItemIndex = 1 then
    begin
      Conditions.AddCondition('POSICAO',
        'P.ID IN (SELECT IDPAGAR FROM CNT_PAGAR_ITEM WHERE POSICAO  = ' +
        QuotedStr('AB') + ' AND DT_VENC > ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', Now)) + ')', True);
    end
    else
    begin
      if rgbPosicao.ItemIndex = 2 then
      begin
        Conditions.AddCondition('POSICAO',
          'P.ID IN (SELECT IDPAGAR FROM CNT_PAGAR_ITEM WHERE POSICAO  = ' +
          QuotedStr('AB') + ' AND DT_VENC <= ' +
          QuotedStr(FormatDateTime('MM/DD/YYYY', Now)) + ')', True);
      end
      else
      begin
        if rgbPosicao.ItemIndex = 3 then
        begin
          Conditions.AddCondition('POSICAO',
            'P.POSICAO = ' + QuotedStr('PG'), True);
          if (chkPeriodo.Checked) then
          begin
            Conditions.AddCondition('DT_PAG', 'P.DT_PAG BETWEEN ' +
              QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND '
              + QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);
          end;
        end
      end;
    end;

    if (chkPlanoConta.Checked) and not(cbxPlanoConta.ItemIndex = 0) then
      Conditions.AddCondition('IDPLANO_CONTA', 'P.IDPLANO_CONTA = ' +
        cbxPlanoConta.Value, True);

    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCntPagar.RetornaCntPagarIdPagaItem(idPagar: string);
begin
  with fdsCntPagar do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('ID', 'P.ID = ' + idPagar + ' AND P.IDFILIAL = ' +
      fdsCntPagarItensIDFILIAL.AsString, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCntPagar.RetornaCntPagarItemIDPagar(idPagar: string);
begin
  with fdsCntPagarItensForm do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('IDPAGAR', 'PI.IDPAGAR = ' + idPagar +
      ' AND PI.IDFILIAL = ' + fdsCntPagarIDFILIAL.AsString, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCntPagar.RetornaCntPagarIdPagarItem(idPagar: string);
begin
  with fdsCntPagar do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('ID', 'P.ID = ' + idPagar + ' AND P.IDFILIAL = ' +
      fdsCntPagarItensIDFILIAL.AsString, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCntPagar.RetornaFornecedorId(idFornecedor: string);
begin
  with fdsFornecedor do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('IDFORNECEDOR', 'F.ID = ' + idFornecedor, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCntPagar.RetornaIDFornecedor(fornecedor: string);
begin
  with fdsFornecedor do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('NOMEFORNECEDOR', 'F.NOME like UPPER(' +
      QuotedStr(fornecedor + '%') + ')', True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCntPagar.RetornaTotalPagar(index: Integer);
var
  utils: TUtils;
  posicao, tempTotal: string;
begin

  tempTotal := '0';
  if index <> 3 then
  begin
    with qrySomaPagar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VALOR - VALOR_PAGO) AS TOTAL FROM CNT_PAGAR_ITEM PI ');

      if index = 0 then
      begin
        SQL.Add('WHERE PI.POSICAO <> :POSICAO');
        ParamByName('POSICAO').AsString := 'PG';

        if (chkPeriodo.Checked) then
        begin
          SQL.Add(' AND PI.DT_VENC BETWEEN :DT_INC1 AND :DT_INC2');
          ParamByName('DT_INC1').AsDateTime := dtpInicio.Date;
          ParamByName('DT_INC2').AsDateTime := dtpFim.Date;
        end;
      end;

      if index = 1 then
      begin
        if (chkPeriodo.Checked) then
        begin
          SQL.Add('WHERE PI.POSICAO = :POSICAO AND PI.DT_VENC BETWEEN :DT_INC1 AND :DT_INC2');
          ParamByName('DT_INC1').AsDateTime := dtpInicio.Date;
          ParamByName('DT_INC2').AsDateTime := dtpFim.Date;
        end
        else
        begin
          SQL.Add('WHERE PI.POSICAO = :POSICAO AND PI.DT_VENC > :DT_VENC');
          ParamByName('DT_VENC').AsDateTime := Now;
        end;
        ParamByName('POSICAO').AsString := 'AB';
      end;

      if index = 2 then
      begin
        SQL.Add('WHERE PI.POSICAO = :POSICAO AND PI.DT_VENC <= :DT_VENC');
        ParamByName('POSICAO').AsString := 'AB';
        ParamByName('DT_VENC').AsDateTime := Now;
      end;

      if (chkFornecedor.Checked) and not(Trim(edtPesqFornecedor.Text) = 'Todos')
      then
      begin
        RetornaIDFornecedor(Trim(edtPesqFornecedor.Text));
        if fdsFornecedor.RecordCount > 0 then
        begin
          SQL.Add(' AND PI.IDPAGAR IN (SELECT ID FROM CNT_PAGAR P WHERE P.IDFORNECEDOR = :IDFORNECEDOR)');
          ParamByName('IDFORNECEDOR').AsInteger := fdsFornecedorID.AsInteger;
        end
      end;

      if (chkTipoDoc.Checked) and not(cbxTipoDoc.Value = 'TD') then
      begin
        SQL.Add(' AND PI.PREFIXO = :PREFIXO');
        ParamByName('PREFIXO').AsString := cbxTipoDoc.Value;
      end;

      if (chkPlanoConta.Checked) and not(cbxPlanoConta.ItemIndex = 0) then
      begin
        SQL.Add(' AND PI.IDPAGAR IN (SELECT ID FROM CNT_PAGAR P WHERE P.IDPLANO_CONTA = :IDPLANO_CONTA)');
        ParamByName('IDPLANO_CONTA').AsString := cbxPlanoConta.Value;
      end;

      if (chkNCheque.Checked) and not(Trim(edtPesqNCheque.Text) = 'TODOS') then
      begin
        SQL.Add(' AND PI.ID IN (SELECT CH.IDPAGAR_ITEM FROM CNT_PAGAR_CHEQUE CH WHERE NUM_CHEQUE = :NUM_CHEQUE)');
        ParamByName('NUM_CHEQUE').AsString := edtPesqNCheque.Text;
      end;

      if (chkReferencia.Checked) and not(Trim(edtPesqRef.Text) = 'TODOS') then
      begin
        SQL.Add(' AND PI.REFERENCIA = :REFERENCIA');
        ParamByName('REFERENCIA').AsString := edtPesqRef.Text;
      end;

      Prepare;
      ExecQuery;

      tempTotal := qrySomaPagar.FieldByName('TOTAL').AsString;

      if tempTotal = '' then
        tempTotal := '0';
    end;
  end;

  lblTotPagar.Caption := utils.AdicionaMascaraDinheiro(tempTotal);
end;

procedure TfrmCntPagar.RetornaTotalPago(index: Integer);
var
  utils: TUtils;
  posicao, tempTotal: string;
begin
  tempTotal := '';
  with qrySomaPagar do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(VALOR_PAGO) AS TOTAL FROM CNT_PAGAR_ITEM PI ');

    if index = 0 then
    begin
      SQL.Add('WHERE PI.POSICAO <> :POSICAO');
      ParamByName('POSICAO').AsString := 'CA';
    end
    else
      SQL.Add('WHERE PI.POSICAO = :POSICAO');

    if index = 1 then
      ParamByName('POSICAO').AsString := 'AB';

    if index = 2 then
    begin
      ParamByName('POSICAO').AsString := 'AB';
      SQL.Add(' AND PI.DT_VENC <= CURRENT_DATE');
    end;

    if index = 3 then
      ParamByName('POSICAO').AsString := 'PG';

    if (chkPeriodo.Checked) then
    begin
      if ((index = 0) or (index = 1)) then
        SQL.Add(' AND PI.DT_VENC BETWEEN :DT_INC1 AND :DT_INC2');

      if index = 3 then
        SQL.Add(' AND PI.DT_PAG BETWEEN :DT_INC1 AND :DT_INC2');

      ParamByName('DT_INC1').AsDateTime := dtpInicio.Date;
      ParamByName('DT_INC2').AsDateTime := dtpFim.Date;
    end;

    if (chkFornecedor.Checked) and not(Trim(edtPesqFornecedor.Text) = 'Todos')
    then
    begin
      RetornaIDFornecedor(Trim(edtPesqFornecedor.Text));
      if fdsFornecedor.RecordCount > 0 then
      begin
        SQL.Add(' AND PI.IDPAGAR IN (SELECT ID FROM CNT_PAGAR P WHERE P.IDFORNECEDOR = :IDFORNECEDOR)');
        ParamByName('IDFORNECEDOR').AsInteger := fdsFornecedorID.AsInteger;
      end
    end;

    if (chkTipoDoc.Checked) and not(cbxTipoDoc.Value = 'TD') then
    begin
      SQL.Add(' AND PI.PREFIXO = :PREFIXO');
      ParamByName('PREFIXO').AsString := cbxTipoDoc.Value;
    end;

    if (chkPlanoConta.Checked) and not(cbxPlanoConta.ItemIndex = 0) then
    begin
      SQL.Add(' AND PI.IDPAGAR IN (SELECT ID FROM CNT_PAGAR P WHERE P.IDPLANO_CONTA = :IDPLANO_CONTA)');
      ParamByName('IDPLANO_CONTA').AsString := cbxPlanoConta.Value;
    end;

    if (chkNCheque.Checked) and not(Trim(edtPesqNCheque.Text) = 'TODOS') then
    begin
      SQL.Add(' AND PI.ID IN (SELECT CH.IDPAGAR_ITEM FROM CNT_PAGAR_CHEQUE CH WHERE NUM_CHEQUE = :NUM_CHEQUE)');
      ParamByName('NUM_CHEQUE').AsString := edtPesqNCheque.Text;
    end;

    if (chkReferencia.Checked) and not(Trim(edtPesqRef.Text) = 'TODOS') then
    begin
      SQL.Add(' AND PI.REFERENCIA = :REFERENCIA');
      ParamByName('REFERENCIA').AsString := edtPesqRef.Text;
    end;

    Prepare;
    ExecQuery;

    tempTotal := qrySomaPagar.FieldByName('TOTAL').AsString;

    if tempTotal = '' then
      tempTotal := '0';
  end;

  lblTotPago.Caption := utils.AdicionaMascaraDinheiro(tempTotal);
end;

procedure TfrmCntPagar.rgbModoVisualizacaoChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  if rgbModoVisualizacao.ItemIndex = 0 then
  begin
    fdsCntPagar.Close;
    fdsCntPagarItens.Close;
    fdsCntPagarItens.Conditions.Clear;
    fdsCntPagarItens.Conditions.Apply;
    fdsCntPagarItens.Open;
    pgcControl.Pages[0].TabVisible := False;
    pgcControl.Pages[1].TabVisible := True;
    pgcControl.ActivePageIndex := 1;
    chkTipoDoc.Enabled := True;
    pnlPeriodo.Caption := 'Vencimento';
  end
  else
  begin
    fdsCntPagarItens.Close;
    fdsCntPagar.Close;
    fdsCntPagar.Conditions.Clear;
    fdsCntPagar.Conditions.Apply;
    fdsCntPagar.Open;
    pgcControl.Pages[0].TabVisible := True;
    pgcControl.Pages[1].TabVisible := False;
    pgcControl.ActivePageIndex := 0;
    chkTipoDoc.Enabled := False;
    pnlPeriodo.Caption := 'Lançamento';
  end;

  chkPeriodo.Checked := False;
  chkFornecedor.Checked := False;
  chkTipoDoc.Checked := False;
  edtPesqFornecedor.Text := 'Todos';
  edtPesqFornecedor.Font.Color := clGray;
  rgbPosicao.ItemIndex := 0;
end;

procedure TfrmCntPagar.rgbPosicaoChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if NewIndex = 2 then
    chkPeriodo.Checked := False;

  if NewIndex = 3 then
    pnlPeriodo.Caption := 'Pagamento'
  else
    pnlPeriodo.Caption := 'Vencimento';

  PesquisarAnalitico(NewIndex);

  RetornaTotalPagar(NewIndex);
  RetornaTotalPago(NewIndex);

  tbsAnalitico.Show;

  // case NewIndex of
  // 0 :
  // begin
  // RetornaTotalPagar(NewIndex);
  // RetornaTotalPago(NewIndex);
  // end;
  // 1 :
  // begin
  // RetornaTotalPagar(NewIndex);
  // lblTotPago.Caption := 'R$ 0,00';
  // end;
  // 2 :
  // begin
  // RetornaTotalPagar(NewIndex);
  // lblTotPago.Caption := 'R$ 0,00';
  // end;
  // 3 :
  // begin
  // RetornaTotalPago(NewIndex);
  // lblTotPagar.Caption := 'R$ 0,00';
  // end;
  // end;
end;

procedure TfrmCntPagar.tbsAnaliticoShow(Sender: TObject);
begin
  fdsCntPagar.Close;
  fdsCntPagarItensForm.Close;
  btnPagar.Visible := True;

  if fdsCntPagarItensPOSICAO.AsString = 'AB' then
    btnPagar.Enabled := True
  else
    btnPagar.Enabled := False;

end;

procedure TfrmCntPagar.tbsFormShow(Sender: TObject);
begin
  if rgbModoVisualizacao.ItemIndex = 1 then
    RetornaCntPagarIdPagaItem(fdsCntPagarItensIDPAGAR.AsString);

  RetornaCntPagarItemIDPagar(fdsCntPagarID.AsString);

  RetornaFornecedorId(fdsCntPagarIDFORNECEDOR.AsString);

  btnPagar.Visible := True;
end;

procedure TfrmCntPagar.tbsSinteticoShow(Sender: TObject);
begin
  fdsCntPagarItens.Close;
  fdsCntPagarItensForm.Close;
  btnPagar.Visible := False;
end;

end.
