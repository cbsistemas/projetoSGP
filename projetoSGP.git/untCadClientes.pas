unit untCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  vcl.Dialogs, FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet, RzDBEdit, StdCtrls,
  Mask, RzEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzButton,
  RzLabel, dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage, RzPanel, RzBckgnd,
  RzCmboBx, RzDBCmbo, DBCtrls, ComCtrls, RzDTP, RzDBDTP, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, ComObj, Menus,
  ActnList, ShellAPI, frxClass, frxDBSet, System.Actions, Vcl.Imaging.pngimage,
  RzRadChk, Datasnap.DBClient, pFIBClientDataSet, Vcl.ImgList, PngImageList,
  JvExStdCtrls, JvButton, JvCtrls, RzRadGrp, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, System.DateUtils;

type
  TfrmCadClientes = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblTituloTotal: TRzLabel;
    lblTotal: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    tbsForm: TRzTabSheet;
    JvDBGrid1: TJvDBGrid;
    lblCodigo: TRzLabel;
    lblDtAlt: TRzLabel;
    lblDtInc: TRzLabel;
    lblEndereco: TRzLabel;
    lblCEP: TRzLabel;
    lblBairro: TRzLabel;
    edtID: TRzDBEdit;
    edtCEP: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtDt_Alt: TRzDBEdit;
    edtEndereco: TRzDBEdit;
    edtBairro: TRzDBEdit;
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsClientes: TpFIBDataSet;
    dsClientes: TDataSource;
    qryGeral: TpFIBQuery;
    fdsClientesID: TFIBBCDField;
    fdsClientesDT_INC: TFIBDateField;
    fdsClientesDT_ALT: TFIBDateField;
    fdsClientesSTATUS: TFIBStringField;
    fdsClientesNOME: TFIBStringField;
    fdsClientesDT_NASC: TFIBDateField;
    fdsClientesTELEFONE: TFIBStringField;
    fdsClientesENDERECO: TFIBStringField;
    fdsClientesBAIRRO: TFIBStringField;
    fdsClientesIDCIDADE: TFIBBCDField;
    fdsClientesCEP: TFIBStringField;
    fdsClientesRG: TFIBStringField;
    fdsClientesCPF: TFIBStringField;
    fdsClientesSEXO: TFIBStringField;
    fdsClientesPROFISSAO: TFIBStringField;
    fdsClientesEMAIL: TFIBStringField;
    edtTelefone: TRzDBEdit;
    edtCelular: TRzDBEdit;
    edtEmail: TRzDBEdit;
    fdsClientesCELULAR: TFIBStringField;
    lblEmail: TRzLabel;
    lblTelefone: TRzLabel;
    lblCelular: TRzLabel;
    lblSexo: TRzLabel;
    lblStatus: TRzLabel;
    RzLabel1: TRzLabel;
    cbxSexo: TRzDBComboBox;
    cbxStatus: TRzDBComboBox;
    cbxTipo: TRzDBComboBox;
    fdsClientesTIPO: TFIBStringField;
    btnPesqCidade: TRzBitBtn;
    lblUF: TRzLabel;
    lblCidade: TRzLabel;
    fdsClientesCIDADE: TFIBStringField;
    fdsClientesUF: TFIBStringField;
    fdsClientesRAZAOSOCIAL: TFIBStringField;
    fdsClientesCONTATO: TFIBStringField;
    fdsClientesCNPJ: TFIBStringField;
    fdsClientesIE: TFIBStringField;
    lblVendedor: TRzLabel;
    fdsVendedor: TpFIBDataSet;
    dsVendedor: TDataSource;
    fdsClientesIDVENDEDOR: TFIBBCDField;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    lcbVendedor: TRzDBLookupComboBox;
    edtCidade: TRzDBEdit;
    edtUF: TRzDBEdit;
    fdsClientesEMAIL_NFE: TFIBStringField;
    edtEmailNFE: TRzDBEdit;
    lblEmailNFE: TRzLabel;
    edtNome: TRzDBEdit;
    lblNome: TRzLabel;
    pnlJuridico: TPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edtRazao: TRzDBEdit;
    edtContato: TRzDBEdit;
    lblDtNasc: TRzLabel;
    edtDtNasc: TRzDBDateTimePicker;
    pnlJuridico2: TPanel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    edtCNPJ: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    edtKMTotal: TRzDBEdit;
    RzLabel4: TRzLabel;
    fdsClientesKM_TOTAL: TFIBSmallIntField;
    RzGroupBox1: TRzGroupBox;
    RzLabel5: TRzLabel;
    RzDBDateTimePicker2: TRzDBDateTimePicker;
    RzLabel6: TRzLabel;
    lbcFormaPagamento: TRzDBLookupComboBox;
    RzDBEdit1: TRzDBEdit;
    RzLabel7: TRzLabel;
    fdsClientesDT_ULTIMO_CONTATO: TFIBDateField;
    fdsClientesLIMITE_CREDITO: TFIBBCDField;
    fdsFormaPagamento: TpFIBDataSet;
    FIBBCDField1: TFIBBCDField;
    FIBStringField1: TFIBStringField;
    dsFormaPagamento: TDataSource;
    fdsClientesIDFORMA_PAGAMENTO: TFIBBCDField;
    RzLabel10: TRzLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    fdsRota: TpFIBDataSet;
    FIBBCDField2: TFIBBCDField;
    FIBStringField2: TFIBStringField;
    dsRota: TDataSource;
    fdsClientesIDROTA: TFIBBCDField;
    btnMapa: TRzBitBtn;
    btnInprimir: TRzBitBtn;
    fdsClientesENVIADO_WEB: TFIBStringField;
    fdsClientesIDFILIAL: TFIBBCDField;
    ActionList1: TActionList;
    impEtiq: TAction;
    ppmImprimir: TPopupMenu;
    ImprimirPedidoAtual1: TMenuItem;
    frxClientes: TfrxDBDataset;
    fdsClientesREFERENCIA: TFIBStringField;
    pnlFisica: TPanel;
    lblRG: TRzLabel;
    lblCPF: TRzLabel;
    edtRG: TRzDBEdit;
    edtCPF: TRzDBEdit;
    RzLabel12: TRzLabel;
    edtIdCidade: TRzEdit;
    fdsCidade: TpFIBDataSet;
    fdsCidadeID: TFIBBCDField;
    fdsCidadeDT_INC: TFIBDateField;
    fdsCidadeDT_ALT: TFIBDateField;
    fdsCidadeSTATUS: TFIBStringField;
    fdsCidadeCODIGO: TFIBBCDField;
    fdsCidadeNOME: TFIBStringField;
    fdsCidadeUF: TFIBStringField;
    fdsCidadeCEP: TFIBStringField;
    RzLabel13: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    fdsClientesPROPRIETARIO: TFIBStringField;
    RzLabel14: TRzLabel;
    RzDBEdit5: TRzDBEdit;
    fdsClientesCREDITO: TFIBBCDField;
    chkEmpilhadeira: TRzCheckBox;
    fdsClientesTEM_EMPILHADEIRA: TFIBStringField;
    RzDBEdit6: TRzDBEdit;
    RzLabel15: TRzLabel;
    fdsClientesIDCLIENTE_APP: TFIBBCDField;
    tbsRazaoProduto: TRzTabSheet;
    RzPanel5: TRzPanel;
    lblNomeProduto: TRzLabel;
    pnlData: TRzGroupBox;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    rgbPeriodo: TRzRadioGroup;
    btnPesqRazaoProd: TJvImgBtn;
    gdrRazaoProduto: TJvDBGrid;
    PngImageList1: TPngImageList;
    cdsRazaoProduto: TpFIBClientDataSet;
    cdsRazaoProdutoDT_INC: TDateField;
    cdsRazaoProdutoMES_MOV: TStringField;
    fdsRazaoProdDia: TpFIBDataSet;
    dsRazaoProduto: TDataSource;
    fdsRazaoProdMes: TpFIBDataSet;
    cdsRazaoProdutoNOME_PRODUTO: TStringField;
    cdsRazaoProdutoIDPROD_ITEM: TIntegerField;
    cdsRazaoProdutoTOTAL_COMPRADO: TFloatField;
    fdsRazaoProdDiaDT_INC: TFIBDateField;
    fdsRazaoProdDiaQTN: TFIBBCDField;
    fdsRazaoProdDiaIDPROD_ITEM: TFIBBCDField;
    fdsRazaoProdDiaNOMEPRODUTO: TFIBStringField;
    fdsRazaoProdMesDT: TFIBDateField;
    fdsRazaoProdMesIDPROD_ITEM: TFIBBCDField;
    fdsRazaoProdMesNOMEPRODUTO: TFIBStringField;
    fdsRazaoProdMesQTN: TFIBBCDField;
    RzGroupBox2: TRzGroupBox;
    edtEANProduto: TRzEdit;
    RzLabel19: TRzLabel;
    fdsItens: TpFIBDataSet;
    fdsItensID: TFIBBCDField;
    fdsItensNOME: TFIBStringField;
    fdsItensCOD_FABRICA: TFIBStringField;
    edtNomeProduto: TRzEdit;
    fdsRazaoProdDiaEAN: TFIBStringField;
    fdsRazaoProdMesEAN: TFIBStringField;
    cdsRazaoProdutoEAN: TStringField;
    fdsClientesLOCAL_TRABALHO: TFIBStringField;
    fdsClientesNUMERO: TFIBStringField;
    RzLabel18: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    fdsClientesCOMPLEMENTO: TFIBStringField;
    pgcInfoAdicional: TRzPageControl;
    tbsReferencia: TRzTabSheet;
    RzDBMemo1: TRzDBMemo;
    tbsObservacao: TRzTabSheet;
    RzDBMemo2: TRzDBMemo;
    fdsClientesOBSERVACAO: TFIBStringField;
    fdsClientesSTATUS_DESCRICAO: TFIBStringField;
    pnlProdutorRural: TPanel;
    RzLabel11: TRzLabel;
    RzLabel20: TRzLabel;
    edtRG2: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzLabel21: TRzLabel;
    edtIE: TRzDBEdit;
    cbxIndicadorIE: TRzDBComboBox;
    fdsClientesINDICADOR_IE: TFIBStringField;
    RzLabel22: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtProfKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqCidadeClick(Sender: TObject);
    procedure tbsFormShow(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure btnDeleteClick(Sender: TObject);
    procedure fdsClientesAfterScroll(DataSet: TDataSet);
    procedure cbxTipoChange(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnMapaClick(Sender: TObject);
    procedure btnInprimirClick(Sender: TObject);
    procedure impEtiqExecute(Sender: TObject);
    procedure impContraExecute(Sender: TObject);
    procedure JvDBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure impEtiqSelectedExecute(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtIdCidadeExit(Sender: TObject);
    procedure edtDtNascExit(Sender: TObject);
    procedure RzDBEdit2Exit(Sender: TObject);
    procedure edtEmailNFEExit(Sender: TObject);
    procedure RzDBEdit1Exit(Sender: TObject);
    procedure chkEmpilhadeiraClick(Sender: TObject);
    procedure btnPesqRazaoProdClick(Sender: TObject);
    procedure tbsRazaoProdutoShow(Sender: TObject);
    procedure rgbPeriodoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure edtEANProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RzDBEdit8Exit(Sender: TObject);
    procedure edtIEExit(Sender: TObject);
    procedure RzDBEdit5Enter(Sender: TObject);

  private
    procedure PesquisaCliente(condicao: string);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure controlaTipoPessoa;
    procedure ImpEtiquetas;
    procedure ImpContrato;
    procedure ImpContrato2;
    procedure RazaoProdutoDia;
    procedure RetornaRazaoProdDia;
    procedure RazaoProdutoMes;
    procedure RetornaRazaoProdMes;
    procedure PesquisaProduto;
    procedure ControlaExibicaoPJ;
  public
    { Public declarations }
  end;

const
  tamPFisica: Integer = 601;
  tamPJuridica: Integer = 649;

var
  frmCadClientes: TfrmCadClientes;
  ordem: string[4]; // controla a ordena��o: Asc / Desc
  creditoTemp:Double;
implementation

uses untPrincipal, untData, uUtils, untPesqCidade, untPesqCliente, untWebMapa,
  untImpEtiquetasClientes, untPesqProdutoItens, untPesqClienteCodigo,
  uVerificaPermicao, untMsgUsuarioNaoPermitido;

{$R *.dfm}

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
  fdsClientes.Edit;
  fdsClientesDT_ALT.AsDateTime := Now;
  fdsClientesENVIADO_WEB.AsString := 'N';
  EditaInsere;
end;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  fdsClientes.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadClientes.btnDeleteClick(Sender: TObject);
 var
 uVerificaPermicao:TVerificaPermicao;
begin
  if uVerificaPermicao.Verifica('CAD_CLIENTE_EXCL') = true then
   begin
    if fdsClientes.RecordCount > 0 then
    begin
      Case MessageBox(Application.Handle,
        Pchar('Deseja realmente excluir o registro atual?'), 'Aten��o',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
        idYes:
          begin
            fdsClientes.Delete;
            DM.Conexao.CommitRetaining;
            lblTotal.Caption := intToStr(fdsClientes.RecordCount);
          end;
      end;
    end;
   end
  else
   TfrmMenssagens.Mensagem('Desculpe, Usu�rio sem permiss�o para Excluir clientes.','Sem permiss�o.','I',[mbOk]);
end;

procedure TfrmCadClientes.btnFirstClick(Sender: TObject);
begin
  fdsClientes.Prior;
end;

procedure TfrmCadClientes.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
  i: Smallint;
  campoVazio: Boolean;
  nomeCliente: string;
begin

  if Trim(fdsClientesIE.AsString).IsEmpty then
    fdsClientesIE.AsString := 'ISENTO';

  campoVazio := False;

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i].Tag = 15) then
    begin
      if utils.VerificaCampoObrigatorio(TRzDBEdit(Components[i])) then
        campoVazio := True;
    end;
  end;

  if campoVazio then
    Application.MessageBox('Existem campos obrigat�rios sem preencher.',
      'Ante��o', MB_OK + MB_ICONERROR)
  else
  begin
    nomeCliente := Trim(fdsClientesNOME.AsString);
    // if fdsClientes.State in [dsInsert] then
    // begin
    // nomeCliente := fdsClientesNOME.AsString;
    // fdsClientes.Post;
    // DM.Conexao.CommitRetaining;
    //
    // with qryGeral do
    // begin
    // Close;
    // SQL.Clear;
    // SQL.Add('SELECT N');
    // end;
    // end
    // else
    // begin
    fdsClientes.Post;
    DM.Conexao.CommitRetaining;
    // end;

    GravaCancela;
    if not(frmPesqCliente = nil) then
    begin
      frmPesqCliente.edtNome.Text := nomeCliente;
      frmCadClientes.Close;
    end;
    fdsClientes.Locate('NOME', nomeCliente, []);

  end;
end;

procedure TfrmCadClientes.btnIncluirClick(Sender: TObject);
begin
  fdsClientes.Append;
  fdsClientesDT_INC.AsDateTime := Now;
  fdsClientesSEXO.AsString := 'M';
  fdsClientesSTATUS.AsString := 'L';
  fdsClientesTIPO.AsString := 'F';
  fdsClientesDT_NASC.AsDateTime := Now;
  fdsClientesDT_ULTIMO_CONTATO.AsDateTime := Now;
  fdsClientesIDFORMA_PAGAMENTO.AsInteger := 1;
  fdsClientesIDROTA.AsInteger := 1;
  fdsClientesIDVENDEDOR.AsInteger := 1;
  fdsClientesIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsClientesIE.AsString := 'ISENTO';
  edtCidade.Clear;
  edtUF.Clear;
  controlaTipoPessoa;
  EditaInsere;
end;

procedure TfrmCadClientes.btnInprimirClick(Sender: TObject);
begin
  ppmImprimir.Popup(frmCadClientes.Left + 250, frmCadClientes.top + 95);
end;

procedure TfrmCadClientes.btnLastClick(Sender: TObject);
begin
  fdsClientes.Last;
end;

procedure TfrmCadClientes.btnNextClick(Sender: TObject);
begin
  fdsClientes.Next;
end;

procedure TfrmCadClientes.EditaInsere;
var
  i: Smallint;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzBitBtn) then
    begin
      if Components[i].Tag = 1 then
        TRzBitBtn(Components[i]).Enabled := False
      else
        TRzBitBtn(Components[i]).Enabled := True;
    end;
  end;

  pgcControl.ActivePageIndex := 1;
  pgcControl.Pages[0].TabVisible := False;
  pgcControl.Pages[2].TabVisible := False;
  cbxTipo.SetFocus;
end;

procedure TfrmCadClientes.edtCPFExit(Sender: TObject);
begin
  edtDtNasc.SetFocus;
end;

procedure TfrmCadClientes.edtDtNascExit(Sender: TObject);
begin
  if cbxTipo.Value = 'J' then
  begin
    edtRazao.SetFocus;
  end;

end;

procedure TfrmCadClientes.edtEANProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    edtNomeProduto.Clear;
    if not(fdsItens.Locate('COD_FABRICA', edtEANProduto.Text, [])) then
    begin
      edtEANProduto.Clear;
      PesquisaProduto;
    end
    else
      edtNomeProduto.Text := fdsItensNOME.AsString;
  end;
end;

procedure TfrmCadClientes.edtEmailNFEExit(Sender: TObject);
begin
  lbcFormaPagamento.SetFocus;
end;

procedure TfrmCadClientes.edtIdCidadeExit(Sender: TObject);
var
  utils: TUtils;
begin
  if fdsClientes.State in [dsInsert, dsEdit] then
  begin
    edtIdCidade.Text :=  FloatToStr(utils.ValidaInteiroFloat(edtIdCidade.Text, 'I'));

    if fdsCidade.Locate('ID', edtIdCidade.Text, []) then
    begin
      fdsClientesIDCIDADE.AsInteger := fdsCidadeID.AsInteger;
      edtCidade.Text := fdsCidadeNOME.AsString;
      edtUF.Text := fdsCidadeUF.AsString;
      edtCEP.SetFocus;
    end
    else
      btnPesqCidade.Click;
  end;
end;

procedure TfrmCadClientes.edtIEExit(Sender: TObject);
begin
  edtEndereco.SetFocus;
end;

procedure TfrmCadClientes.edtNomeExit(Sender: TObject);
begin
  if fdsClientesTIPO.AsString = 'F' then
    edtRG.SetFocus;
  if fdsClientesTIPO.AsString = 'R' then
    edtRG2.SetFocus;
end;

procedure TfrmCadClientes.edtProfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnGravar.SetFocus;
  end;
end;

procedure TfrmCadClientes.fdsClientesAfterScroll(DataSet: TDataSet);
begin
  if tbsForm.Showing then
  begin
    controlaTipoPessoa;
    edtIdCidade.Text := fdsClientesIDCIDADE.AsString;

    if fdsClientesTEM_EMPILHADEIRA.AsString = 'S' then
      chkEmpilhadeira.Checked := True
    else
      chkEmpilhadeira.Checked := False;

    if not(Trim(fdsClientesOBSERVACAO.AsString) = '') then
      tbsObservacao.Color := $008080FF
    else
      tbsObservacao.Color := clWhite;

  end;

end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadClientes := nil;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  ControlaExibicaoPJ;
  fdsClientes.OrderClause := 'NOME';
  fdsClientes.Open;
  lblTotal.Caption := intToStr(fdsClientes.RecordCount);
  fdsVendedor.Open;
  fdsVendedor.Last;
  fdsVendedor.First;
  fdsCidade.Open;
  fdsFormaPagamento.Open;
  fdsFormaPagamento.Last;
  fdsFormaPagamento.First;
  fdsRota.Open;
  fdsRota.Last;
  fdsRota.First;
  cdsRazaoProduto.CreateDataSet;
  dtpInicio.Date := StartOfTheMonth(Date);
  dtpFim.Date := Now;

end;

procedure TfrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    frmCadClientes.Close;
  end
end;

procedure TfrmCadClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadClientes.GravaCancela;
var
  i: Smallint;
  utils: TUtils;
  editando: Boolean;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzBitBtn) then
    begin
      if Components[i].Tag = 1 then
        TRzBitBtn(Components[i]).Enabled := True
      else
        TRzBitBtn(Components[i]).Enabled := False;
    end
    else
    begin
      if Components[i].Tag = 15 then
      begin
        if (Components[i] is TRzEdit) then
          utils.ResetColorCampo(TRzDBEdit(Components[i]), True)
        else
          utils.ResetColorCampo(TRzDBEdit(Components[i]), False);
      end;
    end;
  end;

  pgcControl.Pages[2].TabVisible := True;
  pgcControl.Pages[0].TabVisible := True;
  pgcControl.ActivePageIndex := 0;

  fdsClientes.Close;
  fdsClientes.OrderClause := 'NOME';
  fdsClientes.Open;
  lblTotal.Caption := intToStr(fdsClientes.RecordCount);
end;

procedure TfrmCadClientes.impContraExecute(Sender: TObject);
begin
  ImpContrato2;
end;

procedure TfrmCadClientes.ImpContrato;
type
  twordreplaceflags = set of (wrfreplaceall, wrfmatchcase, wrfmatchwildcards);
const
  wdfindcontinue = 1;
  wdreplaceone = 1;
  wdreplaceall = 2;
  wddonotsavechanges = 0;
var
  wordapp: olevariant;

begin
  if not fileexists(extractfiledir(Application.exename) + '\Cartas\modelo1.doc')
  then
    raise exception.create('Arquivo n�o encontrato:' +
      extractfiledir(Application.exename) + '\Cartas\modelo1.doc');

  try
    wordapp := createoleobject('word.application');
  except
   // messagedlg('Microsoft Word n�o encontrato.',mterror,[mbok], 0);
  end;

  wordapp.visible := True;
  wordapp.documents.Open(extractfiledir(Application.exename) +
    '\Cartas\modelo1.doc');
  wordapp.selection.find.clearformatting;
  wordapp.selection.find.forward := True;

  wordapp.selection.find.wrap := wdfindcontinue;
  wordapp.selection.find.format := False;
  wordapp.selection.find.matchwholeword := True;
  wordapp.selection.find.matchsoundslike := False;
  wordapp.selection.find.matchallwordforms := False;

  // registro do cliente
  wordapp.selection.find.Text := '#Nome';
  wordapp.selection.find.replacement.Text := fdsClientesNOME.AsString;
  wordapp.selection.find.execute(replace := wdreplaceall);

  wordapp.selection.find.Text := '#Endereco';
  wordapp.selection.find.replacement.Text := fdsClientesENDERECO.AsString;
  wordapp.selection.find.execute(replace := wdreplaceall);

  wordapp.selection.find.Text := '#Bairro';
  wordapp.selection.find.replacement.Text := fdsClientesBAIRRO.AsString;
  wordapp.selection.find.execute(replace := wdreplaceall);

  wordapp.selection.find.Text := '#Cidade';
  wordapp.selection.find.replacement.Text := fdsClientesCIDADE.AsString;
  wordapp.selection.find.execute(replace := wdreplaceall);

  wordapp.selection.find.Text := '#Cep';
  wordapp.selection.find.replacement.Text := fdsClientesCEP.AsString;
  wordapp.selection.find.execute(replace := wdreplaceall);

  wordapp.selection.find.Text := '#Data';
  wordapp.selection.find.replacement.Text := DateToStr(Now);
  wordapp.selection.find.execute(replace := wdreplaceall);

  { wordapp.selection.find.text := '#scep';
    wordapp.selection.find.replacement.text := dmdados.sdsauxiliar.fieldbyname('cep').text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#suf';
    wordapp.selection.find.replacement.text := dmdados.sdsauxiliar.fieldbyname('uf').text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#scnpj';
    wordapp.selection.find.replacement.text := dmdados.sdsauxiliar.fieldbyname('cnpj').text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#snome';
    wordapp.selection.find.replacement.text := edit2.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#scargo';
    wordapp.selection.find.replacement.text := edit3.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#snacionalidade';
    wordapp.selection.find.replacement.text := edit4.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#scivil';
    wordapp.selection.find.replacement.text := edit5.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#scpf';
    wordapp.selection.find.replacement.text := edit6.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#slocal';
    wordapp.selection.find.replacement.text := 'S�o Paulo, '+
    formatdatetime('dd',date)+' de '+
    formatdatetime('mmmm',date)+' de '+
    formatdatetime('yyyy',date);
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#stest1';
    wordapp.selection.find.replacement.text := edit7.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#srg1';
    wordapp.selection.find.replacement.text := edit8.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#stest2';
    wordapp.selection.find.replacement.text := edit9.text;
    wordapp.selection.find.execute(replace := wdreplaceall);

    wordapp.selection.find.text := '#srg2';
    wordapp.selection.find.replacement.text := edit10.text;
    wordapp.selection.find.execute(replace := wdreplaceall); }

  // wordapp.activedocument.printout;
  // wordapp.activedocument.close(wddonotsavechanges);
  // wordapp.quit;

  wordapp := unassigned;
end;

procedure TfrmCadClientes.ImpContrato2;
var
  WinWord, Docs, Doc: Variant;
begin
  WinWord := createoleobject('Word.Application');

  // Tornar o word visivel
  WinWord.visible := True;

  // Abrir arquivo para edi��o
  Doc := WinWord.documents.Open(ExtractFilePath(Application.exename) +
    '\Cartas\modelo1.doc');

  // Substituir itens do arquivo por texto escolhido
  Doc.Content.find.execute(FindText := '#Nome', ReplaceWith :=
    fdsClientesNOME.AsString);

  // Salvar Documento
  Doc.SaveAs(ExtractFilePath(Application.exename) + 'Contratos\' +
    fdsClientesID.AsString + '.doc');

  ShellExecute(Application.Handle, 'print',
    Pchar(ExtractFilePath(Application.exename) + 'Contratos\' +
    fdsClientesID.AsString + '.doc'), nil, nil, 0);

  WinWord.Quit; // Fechar

end;

procedure TfrmCadClientes.impEtiqExecute(Sender: TObject);
begin
  ImpEtiquetas;
end;

procedure TfrmCadClientes.impEtiqSelectedExecute(Sender: TObject);
begin
  //
end;

procedure TfrmCadClientes.ImpEtiquetas;
begin
  Try
    frmImpEtiquetasClientes := TfrmImpEtiquetasClientes.create(nil);
    frmImpEtiquetasClientes.ShowModal;
  Finally
    frmImpEtiquetasClientes.Free;

  End;
end;

procedure TfrmCadClientes.JvDBGrid1DblClick(Sender: TObject);
begin
  if fdsClientes.RecordCount > 0 then
    tbsForm.Show;
end;

procedure TfrmCadClientes.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsClientes.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
      JvDBGrid1.Canvas.Brush.Color :=clHighlight;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadClientes.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  coluna: string;
begin
  if ((Key = 'p') or (Key = 'P')) then
  begin
    coluna := JvDBGrid1.SelectedField.FieldName;
    if coluna = 'NOME' then
    Begin
      Try
        frmPesqCliente := TfrmPesqCliente.create(nil);
        frmPesqCliente.ShowModal;
      Finally
        if frmPesqCliente.ModalResult = mrOk then
        begin
          PesquisaCliente('CL.ID = ' + frmPesqCliente.fdsClientesID.AsString);
        end;
        frmPesqCliente.Free;
        frmPesqCliente := nil;
      End;
    end;

    if coluna = 'CIDADE' then
    begin
      Try
        frmPesqCidade := TfrmPesqCidade.create(nil);
        frmPesqCidade.ShowModal;
      Finally
        if frmPesqCidade.ModalResult = mrOk then
        begin
          PesquisaCliente('CL.IDCIDADE = ' +
            frmPesqCidade.fdsCidadesID.AsString);
        end;
        frmPesqCidade.Free;
      End;
    end;

    if coluna = 'ID' then
    begin
      Try
        frmPesqClienteCodigo := TfrmPesqClienteCodigo.create(nil);
        frmPesqClienteCodigo.ShowModal;
      Finally
        if frmPesqClienteCodigo.ModalResult = mrOk then
        begin
          with fdsClientes do
          begin
            Close;
            Conditions.Clear;
            Conditions.Apply;
            Prepare;
            Open;
            if Locate('ID', frmPesqClienteCodigo.edtCodigo.Text, []) then
              tbsForm.Show
            else
              Application.MessageBox('Cliente n�o encontrado.', 'Aten��o',
                MB_OK + MB_ICONQUESTION);
          end;
        end;
        frmPesqClienteCodigo.Free;
      End;
    end;
  end;
end;

procedure TfrmCadClientes.JvDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
// var
// pPosicao: TGridCoord;
begin
  // pPosicao := TDBGrid(Sender).MouseCoord(x,y);
  // ShowMessage('Lina: ' + IntToStr(pPosicao.y));
end;

procedure TfrmCadClientes.JvDBGrid1TitleClick(Column: TColumn);
begin
  fdsClientes.Close;
  fdsClientes.OrderClause := Column.FieldName + ' ' + ordem;
  fdsClientes.Open;

  if ordem = 'ASC' then
    ordem := 'DESC'
  else
    ordem := 'ASC';
end;

procedure TfrmCadClientes.PesquisaCliente(condicao: string);
var
  tempIdCliente: string;
begin
  with fdsClientes do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('PESQ', condicao, True);
    Conditions.Apply;
    Prepare;
    OrderClause := 'CL.ID';
    Open;
  end;
end;

procedure TfrmCadClientes.PesquisaProduto;
begin
  Try
    frmPesqProdutoItens := TfrmPesqProdutoItens.create(nil);
    frmPesqProdutoItens.ShowModal;
  Finally
    if frmPesqProdutoItens.ModalResult = mrOk then
    begin
      edtEANProduto.Text :=
        frmPesqProdutoItens.fdsProdutoItensCOD_FABRICA.AsString;
      edtNomeProduto.Text := frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
    end;
  end;
end;

procedure TfrmCadClientes.RazaoProdutoDia;
begin
  if fdsClientes.RecordCount > 0 then
  begin
    gdrRazaoProduto.Columns[0].visible := True;
    gdrRazaoProduto.Columns[1].visible := False;

    cdsRazaoProduto.EmptyDataSet;
    RetornaRazaoProdDia;

    while not(fdsRazaoProdDia.Eof) do
    begin
      cdsRazaoProduto.Append;
      cdsRazaoProdutoDT_INC.AsDateTime := fdsRazaoProdDiaDT_INC.AsDateTime;
      cdsRazaoProdutoTOTAL_COMPRADO.AsFloat := fdsRazaoProdDiaQTN.AsFloat;
      cdsRazaoProdutoNOME_PRODUTO.AsString :=
        fdsRazaoProdDiaNOMEPRODUTO.AsString;
      cdsRazaoProdutoIDPROD_ITEM.AsInteger :=
        fdsRazaoProdDiaIDPROD_ITEM.AsInteger;
      cdsRazaoProdutoEAN.AsString := fdsRazaoProdDiaEAN.AsString;
      cdsRazaoProduto.Post;
      fdsRazaoProdDia.Next;
    end;
  end;
  cdsRazaoProduto.First;
end;

procedure TfrmCadClientes.RazaoProdutoMes;
begin
  if fdsClientes.RecordCount > 0 then
  begin
    gdrRazaoProduto.Columns[1].visible := True;
    gdrRazaoProduto.Columns[0].visible := False;

    cdsRazaoProduto.EmptyDataSet;
    RetornaRazaoProdMes;

    while not(fdsRazaoProdMes.Eof) do
    begin
      cdsRazaoProduto.Append;
      cdsRazaoProdutoDT_INC.AsDateTime := fdsRazaoProdDiaDT_INC.AsDateTime;
      cdsRazaoProdutoMES_MOV.AsString := FormatDateTime('mmmm "de" yyyy',
        fdsRazaoProdMesDT.AsDateTime).ToUpper;
      cdsRazaoProdutoTOTAL_COMPRADO.AsFloat := fdsRazaoProdMesQTN.AsFloat;
      cdsRazaoProdutoIDPROD_ITEM.AsInteger :=
        fdsRazaoProdMesIDPROD_ITEM.AsInteger;
      cdsRazaoProdutoNOME_PRODUTO.AsString :=
        fdsRazaoProdMesNOMEPRODUTO.AsString;
      cdsRazaoProdutoEAN.AsString := fdsRazaoProdMesEAN.AsString;
      cdsRazaoProduto.Post;
      fdsRazaoProdMes.Next;
    end;
  end;
  cdsRazaoProduto.First;
end;

procedure TfrmCadClientes.RetornaRazaoProdDia;
begin
  with fdsRazaoProdDia do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('IDCLIENTE',
      'IDCLIENTE = ' + fdsClientesID.AsString, True);
    Conditions.AddCondition('DT_INC', 'DT_INC BETWEEN ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);
    if not(edtEANProduto.Text = EmptyStr) then
      Conditions.AddCondition('EAN',
        'EAN = ' + QuotedStr(edtEANProduto.Text), True);
    Conditions.Apply;
    Prepare;
    Open;
    First;
  end;
end;

procedure TfrmCadClientes.RetornaRazaoProdMes;
begin
  with fdsRazaoProdMes do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('IDCLIENTE',
      'IDCLIENTE = ' + fdsClientesID.AsString, True);
    Conditions.AddCondition('DT_INC', 'DT_INC BETWEEN ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);
    if not(edtEANProduto.Text = EmptyStr) then
      Conditions.AddCondition('EAN',
        'EAN = ' + QuotedStr(edtEANProduto.Text), True);
    Conditions.Apply;
    Prepare;
    Open;
    First;
  end;
end;

procedure TfrmCadClientes.rgbPeriodoChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if NewIndex = 0 then
    RazaoProdutoDia
  else
    RazaoProdutoMes;
end;

procedure TfrmCadClientes.RzDBEdit1Exit(Sender: TObject);
var
 uVerificaPermicao: TVerificaPermicao;
begin
  if fdsClientes.State in [dsInsert, dsEdit] then
    btnGravar.SetFocus;
  if fdsClientes.State in [dsEdit] then
  begin
   if (uVerificaPermicao.Verifica('CAD_CLIENTE_EDIT_CREDITO') = false)and  not(RZDBEdit5.Text=FloatToStr(creditoTemp)) then
   begin
    TfrmMenssagens.Mensagem('Desculpe,Usu�rio sem permiss�o para alterar cr�dito de clientes.','Sem permiss�o.','I',[mbOk]);
    fdsClientesCREDITO.AsFloat:= creditoTemp;
   end;
  end;
end;

procedure TfrmCadClientes.RzDBEdit2Exit(Sender: TObject);
begin
  edtEndereco.SetFocus;
end;

procedure TfrmCadClientes.RzDBEdit5Enter(Sender: TObject);
begin
  if fdsClientes.State in [dsEdit] then
  begin
     creditoTemp:= fdsClientesCREDITO.AsFloat;
  end;
end;

procedure TfrmCadClientes.RzDBEdit8Exit(Sender: TObject);
begin
  edtIE.SetFocus;
end;

procedure TfrmCadClientes.btnMapaClick(Sender: TObject);
begin
  Try
    frmWebMapa := TfrmWebMapa.create(nil);
    frmWebMapa.lblNome.Caption := fdsClientesNOME.AsString;
    frmWebMapa.lblEndereco.Caption := fdsClientesENDERECO.AsString;
    frmWebMapa.lblBairroCidade.Caption := fdsClientesBAIRRO.AsString + ' ,' +
      fdsClientesCIDADE.AsString + '-' + fdsClientesUF.AsString;
    frmWebMapa.ShowModal;
  Finally
    frmWebMapa.Free;
  End;
end;

procedure TfrmCadClientes.tbsFormShow(Sender: TObject);
begin
  controlaTipoPessoa;
  edtIdCidade.Text := fdsClientesIDCIDADE.AsString;

  if fdsClientesTEM_EMPILHADEIRA.AsString = 'S' then
    chkEmpilhadeira.Checked := True
  else
    chkEmpilhadeira.Checked := False;

  pgcInfoAdicional.ActivePageIndex := 0;

  if not(Trim(fdsClientesOBSERVACAO.AsString) = '') then
    tbsObservacao.Color := clActiveCaption
  else
    tbsObservacao.Color := clWhite;
end;

procedure TfrmCadClientes.tbsRazaoProdutoShow(Sender: TObject);
begin
  lblNomeProduto.Caption := fdsClientesNOME.AsString;
  fdsItens.Open;
  if rgbPeriodo.ItemIndex = 0 then
    RazaoProdutoDia
  else
    RazaoProdutoMes;
end;

procedure TfrmCadClientes.btnPesqCidadeClick(Sender: TObject);
begin
  Try
    frmPesqCidade := TfrmPesqCidade.create(nil);
    frmPesqCidade.ShowModal;
  Finally
    if frmPesqCidade.ModalResult = mrOk then
    begin
      edtIdCidade.Text := frmPesqCidade.fdsCidadesID.AsString;
      fdsClientesIDCIDADE.AsInteger := frmPesqCidade.fdsCidadesID.AsInteger;
      edtCidade.Text := frmPesqCidade.fdsCidadesNOME.AsString;
      edtUF.Text := frmPesqCidade.fdsCidadesUF.AsString;
    end;
    frmPesqCidade.Free;
  End;
  edtCEP.SetFocus;
end;

procedure TfrmCadClientes.btnPesqRazaoProdClick(Sender: TObject);
begin
  if Trim(edtEANProduto.Text) = EmptyStr then
    edtNomeProduto.Text := EmptyStr;

  if rgbPeriodo.ItemIndex = 0 then
    RazaoProdutoDia
  else
    RazaoProdutoMes;
end;

procedure TfrmCadClientes.btnPriorClick(Sender: TObject);
begin
  fdsClientes.First;
end;

procedure TfrmCadClientes.btnTodosClick(Sender: TObject);
begin
  with fdsClientes do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCadClientes.cbxTipoChange(Sender: TObject);
begin
  if fdsClientes.State in [dsEdit, dsInsert] then
    controlaTipoPessoa;
end;

procedure TfrmCadClientes.chkEmpilhadeiraClick(Sender: TObject);
begin
  if fdsClientes.State in [dsInsert, dsEdit] then
  begin
    if chkEmpilhadeira.Checked then
      fdsClientesTEM_EMPILHADEIRA.AsString := 'S'
    else
      fdsClientesTEM_EMPILHADEIRA.AsString := 'N';
  end;
end;

procedure TfrmCadClientes.ControlaExibicaoPJ;
begin
  if DM.fdsConfigCLIENTE_EXIBIR_PJ.AsString = 'N' then
  begin
    fdsClientes.Conditions.AddCondition('TIPO',
      'TIPO = ' + QuotedStr('F'), True);
    fdsClientes.Conditions.Apply;
  end;
end;

procedure TfrmCadClientes.controlaTipoPessoa;
begin
  if cbxTipo.Value = 'F' then
  begin
    frmCadClientes.Height := tamPFisica;
    pnlFisica.visible := True;
    pnlFisica.Enabled := True;
    pnlJuridico.visible := False;
    pnlJuridico.Enabled := False;
    pnlJuridico2.visible := False;
    pnlJuridico2.Enabled := False;
    pnlProdutorRural.visible := False;
    pnlProdutorRural.Enabled := False;
    lblEmailNFE.visible := False;
    edtEmailNFE.visible := False;
    lblNome.Caption := 'Nome';
    edtNome.Tag:=15;
    edtCPF.Tag := 0;
    edtCNPJ.Tag := 0;
    edtRazao.Tag := 0;
    // lblProficao.Caption := 'Profiss�o';
    // lblProficao.Top := 249;
    // lblProficao.Left := 317;
    // edtProf.Width := 326;
    // edtProf.Top := 269;
    // edtProf.Left := 317;
  end;
  if cbxTipo.Value = 'J' then
  begin
    pnlJuridico.visible := True;
    pnlJuridico.Enabled := True;
    pnlJuridico2.visible := True;
    pnlJuridico2.Enabled := True;
    pnlFisica.visible := False;
    pnlFisica.Enabled := False;
    pnlProdutorRural.visible := False;
    pnlProdutorRural.Enabled := False;
    lblEmailNFE.visible := True;
    edtEmailNFE.visible := True;
    frmCadClientes.Height := tamPJuridica;
    lblNome.Caption := 'Nome Fantasia';
    edtCPF.Tag := 0;
    edtCNPJ.Tag := 15;
    edtRazao.Tag := 15;
    // lblProficao.Caption := 'Cargo';
    // lblProficao.Top := 107;
    // lblProficao.Left := 490;
    // edtProf.Width := 153;
    // edtProf.Top := 126;
    // edtProf.Left := 490;
  end;
  if cbxTipo.Value = 'R' then
  begin
    frmCadClientes.Height := tamPFisica;
    pnlFisica.visible := False;
    pnlFisica.Enabled := False;
    pnlJuridico.visible := False;
    pnlJuridico.Enabled := False;
    pnlJuridico2.visible := False;
    pnlJuridico2.Enabled := False;
    pnlProdutorRural.visible := True;
    pnlProdutorRural.Enabled := True;
    lblEmailNFE.visible := False;
    edtEmailNFE.visible := False;
    lblNome.Caption := 'Nome';
    edtNome.Tag:=15;
    edtCPF.Tag := 0;
    edtCNPJ.Tag := 0;
    edtRazao.Tag := 0;
  end;

end;

End.