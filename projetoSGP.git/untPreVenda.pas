unit untPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzPanel, RzRadGrp, Vcl.StdCtrls,
  RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls, JvExExtCtrls, JvImage, RzButton,
  RzBckgnd, Vcl.DBCtrls, RzDBEdit, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, RzTabs, JvExStdCtrls, JvButton, JvCtrls, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Vcl.Mask, RzEdit, JvCheckBox,
  RzCmboBx, RzSplit, Data.DB, FIBDataSet, pFIBDataSet, RzDBCmbo,
  Datasnap.DBClient, pFIBClientDataSet, Datasnap.Provider, FIBQuery, pFIBQuery,
  Math;

type
  TfrmPreVenda = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel2: TRzPanel;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    imgFlagYellow: TImage;
    imgFlagRed: TImage;
    imgFlagGreen: TImage;
    imgFlagYellow2: TImage;
    imgFlagRed2: TImage;
    imgFlagGreen2: TImage;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    btnInprimir: TRzBitBtn;
    rgbStatus: TRzRadioGroup;
    RzSplitter1: TRzSplitter;
    RzPanel4: TRzPanel;
    pnlFilial: TRzGroupBox;
    cbxFilial: TRzComboBox;
    chkFilial: TJvCheckBox;
    pnlNumVenda: TRzGroupBox;
    edtPesqNumVenda: TRzEdit;
    chkNumVenda: TJvCheckBox;
    pnlPeriodo: TRzGroupBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    chkPeriodo: TJvCheckBox;
    pnlCliente: TRzGroupBox;
    edtPesqCliente: TRzEdit;
    chkCliente: TJvCheckBox;
    pnlTipoDoc: TRzGroupBox;
    cbxTipoDoc: TRzComboBox;
    chkTipoDoc: TJvCheckBox;
    btnPesquisar: TJvImgBtn;
    pnlVendedor: TRzGroupBox;
    cbxVendedor: TRzComboBox;
    chkVendedor: TJvCheckBox;
    pgcControl: TRzPageControl;
    tbsVenda: TRzTabSheet;
    gdrVendas: TJvDBGrid;
    tbsItens: TRzTabSheet;
    fdsPreVenda: TpFIBDataSet;
    fdsPreVendaItens: TpFIBDataSet;
    dsPreVenda: TDataSource;
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
    RzGroupBox1: TRzGroupBox;
    lblCidade: TRzLabel;
    lblCodigo: TRzLabel;
    lblDtInc: TRzLabel;
    RzLabel1: TRzLabel;
    lblVendedor: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel17: TRzLabel;
    edtCliente: TRzEdit;
    btnPesqCliente: TRzBitBtn;
    edtPrefixo: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtID: TRzDBEdit;
    lcbVendedor: TRzDBLookupComboBox;
    lbcFormaPagamento: TRzDBLookupComboBox;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    gdrVendaItens: TJvDBGrid;
    pnlLancItens: TRzPanel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel20: TRzLabel;
    edtQtnItem: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    edtItemDesconto: TRzDBEdit;
    btnItemGravar: TRzBitBtn;
    btnItemCancelar: TRzBitBtn;
    btnItemExcluir: TRzBitBtn;
    btnItemAlterar: TRzBitBtn;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    cdsPreVendaItens: TpFIBClientDataSet;
    dsPreVendaItens: TDataSource;
    fdsVendedor: TpFIBDataSet;
    dsVendedor: TDataSource;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    edtIDVendedor: TRzDBEdit;
    fdsFormaPagamento: TpFIBDataSet;
    fdsFormaPagamentoID: TFIBBCDField;
    fdsFormaPagamentoDT_INC: TFIBDateField;
    fdsFormaPagamentoDT_ALT: TFIBDateField;
    fdsFormaPagamentoNOME: TFIBStringField;
    fdsFormaPagamentoPARCELA_MAXIMA: TFIBSmallIntField;
    fdsFormaPagamentoMOEDA: TFIBStringField;
    fdsFormaPagamentoENVIADO_WEB: TFIBStringField;
    dsFormaPagamento: TDataSource;
    dspPreVendaItens: TpFIBDataSetProvider;
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
    RzDBEdit2: TRzDBEdit;
    qryComando: TpFIBQuery;
    btnIncluir: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnItensIncluir: TRzBitBtn;
    cdsPreVendaItensCOD_FABRICA: TStringField;
    edtItemCodigo: TRzEdit;
    fdsPreVendaNUM_PROPIO: TFIBIntegerField;
    RzDBEdit1: TRzDBEdit;
    RzLabel5: TRzLabel;
    cbxTipoDesconto: TRzComboBox;
    procedure btnPesqClienteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtIDVendedorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fdsPreVendaAfterScroll(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure EditaInsere;
    procedure ControlaBtnsItens;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure GravaCancela;
    procedure btnGravarClick(Sender: TObject);
    procedure btnItemGravarClick(Sender: TObject);
    procedure btnItemCancelarClick(Sender: TObject);
    procedure btnItemExcluirClick(Sender: TObject);
    procedure lbcFormaPagamentoExit(Sender: TObject);
    procedure btnItensIncluirClick(Sender: TObject);
    procedure RetornaItem;
    procedure gdrVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrVendaItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsPreVendaItensReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsPreVendaItensAfterScroll(DataSet: TDataSet);
    procedure lcbVendedorExit(Sender: TObject);
    procedure CalculaTotais;
    procedure RetornaItens;
    procedure btnItemAlterarClick(Sender: TObject);
    procedure tbsItensShow(Sender: TObject);
    procedure gdrVendasTitleClick(Column: TColumn);
    procedure gdrVendasKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtItemCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VerificaDesconto;
    procedure CalculaDesconto(tempVlrDec: Double);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreVenda: TfrmPreVenda;
  alterandoIten: Boolean;
  ordem: string[4];
  vlrDescMax: Double;

implementation

{$R *.dfm}

uses untData, untPesqCliente, untPesqProdutoItens, uUtils, untLogin,
  untNumPreVenda;

procedure TfrmPreVenda.btnAlterarClick(Sender: TObject);
begin
  fdsPreVenda.Edit;
  EditaInsere;
end;

procedure TfrmPreVenda.btnCancelarClick(Sender: TObject);
begin

  if (cdsPreVendaItens.State in [dsInsert, dsEdit]) then
  begin
    cdsPreVendaItens.Post;
    ControlaBtnsItens;
  end;

  if fdsPreVenda.State in [dsInsert, dsEdit] then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente abandonar a venda?'), 'Aten��o',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin

          fdsPreVenda.Cancel;
          DM.Conexao.RollbackRetaining;
          GravaCancela;

        end;
    End;
  end;
end;

procedure TfrmPreVenda.btnDeleteClick(Sender: TObject);
begin
  if fdsPreVendaSTATUS.AsString = 'AB' then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente excluir essa venda?'), 'Aten��o',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin

          cdsPreVendaItens.Close;
          fdsPreVendaItens.Close;

          with qryComando do
          begin
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM PREVENDA_ITEM WHERE IDPREVENDA = ' +
              fdsPreVendaID.AsString);
            Prepare;
            ExecQuery;
          end;

          fdsPreVenda.Delete;
          DM.Conexao.CommitRetaining;
        end;
    End;
  end;

end;

procedure TfrmPreVenda.btnFirstClick(Sender: TObject);
begin
  fdsPreVenda.Prior;
end;

procedure TfrmPreVenda.btnGravarClick(Sender: TObject);
begin
  if (cdsPreVendaItens.State in [dsInsert, dsEdit]) then
  begin
    cdsPreVendaItens.Post;
    ControlaBtnsItens;
  end;

  if fdsPreVenda.State in [dsInsert] then
  begin
    try
      frmNumPreVenda := TfrmNumPreVenda.Create(nil);
      frmNumPreVenda.ShowModal;
    Finally
      if frmNumPreVenda.ModalResult = mrOk then
      begin
        fdsPreVendaNUM_PROPIO.AsInteger :=
          StrToInt(frmNumPreVenda.edtNumPreVenda.Text);
      end;
      frmNumPreVenda.Free;
    end;
  end;

  fdsPreVenda.Post;
  cdsPreVendaItens.ApplyUpdates(1);
  DM.Conexao.CommitRetaining;
  GravaCancela;

end;

procedure TfrmPreVenda.btnIncluirClick(Sender: TObject);
begin
  fdsPreVenda.Append;
  fdsPreVendaDT_INC.AsDateTime := Now;
  fdsPreVendaSTATUS.AsString := 'AB';
  fdsPreVendaIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsPreVendaPREFIXO.AsString := 'PV';
  fdsPreVendaVLR_TOTAL.AsFloat := 0;
  fdsPreVendaVLR_DESCONTO.AsFloat := 0;
  fdsPreVendaIDCLIENTE.AsString := DM.fdsConfigIDCLIENTEPADRAO.AsString;
  fdsPreVendaCLIENTE.AsString := 'CLIENTE PADR�O';
  edtCliente.Text := fdsPreVendaCLIENTE.AsString;
  cdsPreVendaItens.Open;
  cdsPreVendaItens.EmptyDataSet;
  alterandoIten := False;
  edtItemCodigo.Clear;
  EditaInsere;
end;

procedure TfrmPreVenda.btnItemAlterarClick(Sender: TObject);
begin
  cdsPreVendaItens.Edit;

  fdsPreVendaVLR_TOTAL.AsFloat :=
    RoundTo(fdsPreVendaVLR_TOTAL.AsFloat -
    cdsPreVendaItensVLR_TOTAL.AsFloat, -2);

  cdsPreVendaItensVLR_TOTAL.AsFloat := 0;

  ControlaBtnsItens;
  edtItemDesconto.SetFocus;
end;

procedure TfrmPreVenda.btnItemCancelarClick(Sender: TObject);
var
  editando: Boolean;

begin
  if cdsPreVendaItens.State in [dsEdit] then
  begin
    editando := True
  end
  else
    editando := False;

  cdsPreVendaItens.Cancel;

  if editando then
    CalculaTotais;

  ControlaBtnsItens;
  btnItensIncluir.SetFocus;
end;

procedure TfrmPreVenda.btnItemExcluirClick(Sender: TObject);
begin
  cdsPreVendaItens.Delete;
end;

procedure TfrmPreVenda.btnItemGravarClick(Sender: TObject);
var
  utils: TUtils;
begin
  edtQtnItem.Text := FloatToStr(utils.ValidaInteiroFloat(edtQtnItem.Text, 'F'));

  if edtQtnItem.Text = '0' then
  begin
    edtQtnItem.SetFocus;
    Abort;
  end;

  VerificaDesconto;
  CalculaTotais;
  cdsPreVendaItens.Post;
  ControlaBtnsItens;
  btnItensIncluir.SetFocus;
end;

procedure TfrmPreVenda.btnItensIncluirClick(Sender: TObject);
begin
  cdsPreVendaItens.Append;
  cdsPreVendaItensIDPREVENDA.AsInteger := fdsPreVendaID.AsInteger;
  cdsPreVendaItensIDFILIAL.AsInteger := fdsPreVendaIDFILIAL.AsInteger;
  cdsPreVendaItensDT_INC.AsDateTime := Now;
  cdsPreVendaItensVLR_TOTAL.AsFloat := 0;
  edtItemCodigo.SetFocus;
  alterandoIten := True;
  ControlaBtnsItens;
end;

procedure TfrmPreVenda.btnLastClick(Sender: TObject);
begin
  fdsPreVenda.Last;
end;

procedure TfrmPreVenda.btnNextClick(Sender: TObject);
begin
  fdsPreVenda.Next;
end;

procedure TfrmPreVenda.btnPesqClienteClick(Sender: TObject);
begin
  try
    frmPesqCliente := TfrmPesqCliente.Create(nil);
    frmPesqCliente.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin
      edtCliente.Text := frmPesqCliente.fdsClientesNOME.AsString;
      fdsPreVendaIDCLIENTE.AsInteger := frmPesqCliente.fdsClientesID.AsInteger;
      fdsPreVendaCLIENTE.AsString := frmPesqCliente.fdsClientesNOME.AsString;
      edtCliente.Text := frmPesqCliente.fdsClientesNOME.AsString;
      lbcFormaPagamento.SetFocus;
    end;
    frmPesqCliente.Free;
  end;
end;

procedure TfrmPreVenda.btnPriorClick(Sender: TObject);
begin
  fdsPreVenda.First;
end;

procedure TfrmPreVenda.btnTodosClick(Sender: TObject);
begin
  fdsPreVendaItens.Close;
  fdsPreVenda.Close;
  fdsPreVenda.Conditions.Clear;
  fdsPreVenda.Open;
end;

procedure TfrmPreVenda.CalculaDesconto(tempVlrDec: Double);
var
  itemVlrUnitario: Double;
begin
  itemVlrUnitario := cdsPreVendaItensVLR_UNITARIO.AsFloat;

  if cbxTipoDesconto.Value = 'V' then
  begin
    itemVlrUnitario := itemVlrUnitario - tempVlrDec;
  end
  else
    itemVlrUnitario :=
      RoundTo((itemVlrUnitario - (itemVlrUnitario *
      cdsPreVendaItensVLR_DESC.AsFloat / 100)), -2);

  cdsPreVendaItensVLR_TOTAL.AsFloat := itemVlrUnitario *
    cdsPreVendaItensQTN.AsFloat;

  cbxTipoDesconto.Value := 'P';
end;

procedure TfrmPreVenda.CalculaTotais;
begin
  fdsPreVendaVLR_TOTAL.AsFloat := RoundTo(cdsPreVendaItensVLR_TOTAL.AsFloat +
    fdsPreVendaVLR_TOTAL.AsFloat, -2);
end;

procedure TfrmPreVenda.cdsPreVendaItensAfterScroll(DataSet: TDataSet);
begin
  if cdsPreVendaItens.State in [dsInsert, dsEdit] then
  begin
    edtItemCodigo.Text := cdsPreVendaItensCOD_FABRICA.AsString;
  end;
end;

procedure TfrmPreVenda.cdsPreVendaItensReconcileError
  (DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  ShowMessage(E.Message);
end;

procedure TfrmPreVenda.ControlaBtnsItens;
begin
  btnItemCancelar.Enabled := alterandoIten;
  btnItemGravar.Enabled := alterandoIten;
  btnItensIncluir.Enabled := not(alterandoIten);
  btnItemAlterar.Enabled := not(alterandoIten);
  btnItemExcluir.Enabled := not(alterandoIten);
  alterandoIten := not(alterandoIten);
end;

procedure TfrmPreVenda.EditaInsere;
var
  i: Smallint;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).ActivePageIndex := 1;
      TRzPageControl(Components[i]).Pages[0].TabVisible := False;
    end;

    if (Components[i] is TRzBitBtn) then
    begin
      if Components[i].Tag = 1 then
        TRzBitBtn(Components[i]).Enabled := False
      else
        TRzBitBtn(Components[i]).Enabled := True;
    end;
  end;
  // cdsItensPedido.Close;

  edtIDVendedor.SetFocus;
  ControlaBtnsItens;
end;

procedure TfrmPreVenda.fdsPreVendaAfterScroll(DataSet: TDataSet);
begin
  if (pgcControl.ActivePageIndex = 1) then
    RetornaItens;
end;

procedure TfrmPreVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fdsPreVenda.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox
      ('Salve ou Cancele a Inclus�o/Altera��o antes de sair.', 'Aten��o',
      MB_OK + MB_ICONWARNING);
    Abort;
  end
  else
  begin
    Action := caFree;
    frmPreVenda := nil;
  end;
end;

procedure TfrmPreVenda.FormCreate(Sender: TObject);
begin
  ordem := 'ASC';
  fdsPreVenda.Open;
  fdsVendedor.Open;
  fdsVendedor.Last;
  fdsVendedor.First;
  fdsFormaPagamento.Open;
  fdsFormaPagamento.Last;
  fdsFormaPagamento.First;
  tbsVenda.Show;
end;

procedure TfrmPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btnGravar.Click;
  end
  else if Key = VK_ESCAPE then
  begin
    btnCancelar.Click;
  end
end;

procedure TfrmPreVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmPreVenda.gdrVendaItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if not odd(cdsPreVendaItens.RecNo) then
  begin
    gdrVendaItens.Canvas.Brush.Color := DM.gridOddColor;
    gdrVendaItens.Canvas.FillRect(Rect);
    gdrVendaItens.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmPreVenda.gdrVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  status: string;
  Bitmap: TBitmap;
begin

  // gdrVendasConfirmadas.Canvas.Font.Color:= clYellow; // coloque aqui a cor desejada para a fonte

  if not odd(fdsPreVenda.RecNo) then
  begin
    gdrVendas.Canvas.Brush.Color := DM.gridOddColor;
    gdrVendas.Canvas.FillRect(Rect);
    gdrVendas.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.Index = 1) and not(fdsPreVenda.IsEmpty) then
    begin
      status := fdsPreVendaSTATUS.AsString;
      if status = 'AB' then
      begin
        Bitmap := imgFlagYellow2.Picture.Bitmap
      end
      else if status = 'FC' then
        Bitmap := imgFlagGreen2.Picture.Bitmap
      else if status = 'CA' then
        Bitmap := imgFlagRed2.Picture.Bitmap;

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
    if Column.Index = 1 then
    begin
      status := fdsPreVendaSTATUS.AsString;
      if status = 'AB' then
      begin
        Bitmap := imgFlagYellow.Picture.Bitmap
      end
      else if status = 'FC' then
        Bitmap := imgFlagGreen.Picture.Bitmap
      else if status = 'CA' then
        Bitmap := imgFlagRed.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;
end;

procedure TfrmPreVenda.gdrVendasKeyPress(Sender: TObject; var Key: Char);
var
  coluna: string;
begin
  // if (KEY = 'p') then
  // begin
  // coluna := gdrVendas.SelectedField.FieldName;
  // if coluna = 'CLIENTE' then
  // Begin
  // Try
  // frmPesqProdutos := TfrmPesqProdutos.Create(nil);
  // frmPesqProdutos.ShowModal;
  // Finally
  // if frmPesqProdutos.ModalResult = mrOk then
  // begin
  // PesquisaProduto('P.ID = ' + frmPesqProdutos.fdsProdutosID.AsString);
  // end;
  // frmPesqProdutos.Free;
  // End;
  // end
  // end;
end;

procedure TfrmPreVenda.gdrVendasTitleClick(Column: TColumn);
begin
  fdsPreVenda.Close;
  fdsPreVenda.OrderClause := Column.FieldName + ' ' + ordem;
  fdsPreVenda.Open;

  if ordem = 'ASC' then
    ordem := 'DESC'
  else
    ordem := 'ASC';
end;

procedure TfrmPreVenda.GravaCancela;
var
  i: Smallint;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).Pages[0].TabVisible := True;
      TRzPageControl(Components[i]).ActivePageIndex := 0;
    end
    else
    begin
      if (Components[i] is TRzBitBtn) then
      begin
        if Components[i].Tag = 1 then
          TRzBitBtn(Components[i]).Enabled := True
        else
          TRzBitBtn(Components[i]).Enabled := False;
      end;
    end;
  end;
  alterandoIten := False;
end;

procedure TfrmPreVenda.lbcFormaPagamentoExit(Sender: TObject);
begin
  if fdsPreVenda.State in [dsInsert, dsEdit] then
  begin
    btnItensIncluir.SetFocus;
  end;
end;

procedure TfrmPreVenda.lcbVendedorExit(Sender: TObject);
begin
  if cdsPreVendaItens.State in [dsInsert, dsEdit] then
  begin
    fdsPreVendaVENDEDOR.AsString := fdsVendedorNOME.AsString;
  end;
end;

procedure TfrmPreVenda.RetornaItem;
begin
  if cdsPreVendaItens.State in [dsInsert, dsEdit] then
  begin
    with qryComando do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM PRODUTO_ITEM WHERE COD_FABRICA = :COD_FABRICA');
      ParamByName('COD_FABRICA').AsString := edtItemCodigo.Text;
      Prepare;
      ExecQuery;
    end;

    if qryComando.RecordCount = 0 then
    begin
      Try
        frmPesqProdutoItens := TfrmPesqProdutoItens.Create(nil);
        frmPesqProdutoItens.ShowModal;
      Finally
        if frmPesqProdutoItens.ModalResult = mrOk then
        begin
          cdsPreVendaItensIDPROD_ITEM.AsInteger :=
            frmPesqProdutoItens.fdsProdutoItensID.AsInteger;
          cdsPreVendaItensNOME.AsString :=
            frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
          cdsPreVendaItensVLR_UNITARIO.AsFloat :=
            frmPesqProdutoItens.fdsProdutoItensPREC_VENDA.AsFloat;
          // vitor ver sobre tabela de pre�o
          cdsPreVendaItensCOD_FABRICA.AsString :=
            frmPesqProdutoItens.fdsProdutoItensCOD_FABRICA.AsString;
          vlrDescMax := frmPesqProdutoItens.fdsProdutoItensDESC_MAX1.AsFloat;
          cdsPreVendaItensQTN.AsInteger := 1;
          edtItemCodigo.Text := cdsPreVendaItensCOD_FABRICA.AsString;
        end;
      end;
    end
    else
    begin
      cdsPreVendaItensIDPROD_ITEM.AsInteger := qryComando.FieldByName('ID')
        .AsInteger;
      cdsPreVendaItensNOME.AsString := qryComando.FieldByName('NOME').AsString;
      cdsPreVendaItensVLR_UNITARIO.AsFloat :=
        qryComando.FieldByName('PREC_VENDA').AsFloat;
      // vitor ver sobre tabela de pre�o
      cdsPreVendaItensCOD_FABRICA.AsString :=
        qryComando.FieldByName('COD_FABRICA').AsString;
      edtItemCodigo.Text := cdsPreVendaItensCOD_FABRICA.AsString;
      vlrDescMax := qryComando.FieldByName('DESC_MAX1').AsFloat;
      cdsPreVendaItensQTN.AsInteger := 1;
    end;
  end;
end;

procedure TfrmPreVenda.RetornaItens;
begin
  if not(fdsPreVenda.RecordCount = 0) then
  begin
    cdsPreVendaItens.Close;
    with fdsPreVendaItens do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('PREVENDAID',
        'IDPREVENDA = ' + fdsPreVendaID.AsString, True);
      Conditions.Apply;
      Prepare;
      Open;
    end;
    cdsPreVendaItens.Open;
  end;
end;

procedure TfrmPreVenda.tbsItensShow(Sender: TObject);
begin
  if not(fdsPreVenda.State in [dsInsert, dsEdit]) then
    RetornaItens;
end;

procedure TfrmPreVenda.VerificaDesconto;
var
  temPermicao: Boolean;
  idUsuarioTemp: Integer;
  tempVlrDec: Double;
begin
  temPermicao := False;
  tempVlrDec := 0;
  if cdsPreVendaItensVLR_DESC.AsFloat > 0 then
  begin

    if cbxTipoDesconto.Value = 'V' then
    begin
      tempVlrDec := cdsPreVendaItensVLR_DESC.AsFloat;
      cdsPreVendaItensVLR_DESC.AsFloat := cdsPreVendaItensVLR_UNITARIO.AsFloat -
        cdsPreVendaItensVLR_DESC.AsFloat;
      cdsPreVendaItensVLR_DESC.AsFloat := 100 -
        (RoundTo((cdsPreVendaItensVLR_DESC.AsFloat * 100) /
        cdsPreVendaItensVLR_UNITARIO.AsFloat, -2));
    end;

    if cdsPreVendaItensVLR_DESC.AsFloat > vlrDescMax then
    begin
      Application.MessageBox
        (Pchar('Desconto m�ximo permitido para esse item �: ' +
        FloatToStr(vlrDescMax) + '%'), 'Desconto n�o permitido.',
        MB_OK + MB_ICONERROR);

      try
        frmLogin := TfrmLogin.Create(nil);
        frmLogin.ShowModal;
      finally
        if frmLogin.ModalResult = mrOk then
        begin
          idUsuarioTemp := frmLogin.fdsUserID.AsInteger;

          with DM.fdsUsuarioPermicPDV do
          begin
            Close;
            ParamByName('IDUSUARIO').AsInteger := idUsuarioTemp;
            ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
            Open;
          end;

          if DM.fdsUsuarioPermicPDVDESC_MAX_ITEM.AsString = 'S' then
            temPermicao := True
          else
            temPermicao := False;

          with DM.fdsUsuarioPermicPDV do
          begin
            Close;
            ParamByName('IDUSUARIO').AsInteger := DM.idUsuario;
            ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
            Open;
          end;

        end
        else
        begin
          temPermicao := False;
        end;

        frmLogin.Free;
      end;

    end
    else
    begin
      temPermicao := True;
    end;

    if temPermicao then
    begin
      CalculaDesconto(tempVlrDec);
    end
    else
    begin
      Application.MessageBox
        ('Desculpe, voc� n�o tem permiss�o para ultrapassar o desconto m�ximo',
        'Desconto n�o permitido.', MB_OK + MB_ICONERROR);
      edtItemDesconto.SetFocus;
      Abort;
    end;
  end
  else
    cdsPreVendaItensVLR_TOTAL.AsFloat :=
      RoundTo(cdsPreVendaItensQTN.AsFloat *
      cdsPreVendaItensVLR_UNITARIO.AsFloat, -2);
end;

procedure TfrmPreVenda.edtItemCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    RetornaItem;
  end;
end;

procedure TfrmPreVenda.edtItemCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    RetornaItem;
  end;
end;

procedure TfrmPreVenda.edtIDVendedorExit(Sender: TObject);
begin
  if not(edtIDVendedor.Text = EmptyStr) then
  begin
    if fdsPreVenda.State in [dsInsert, dsEdit] then
    begin
      if not(fdsVendedor.Locate('ID', edtIDVendedor.Text, [])) then
      begin
        Application.MessageBox('C�digo de vendedor inv�lido.', 'Aten��o',
          MB_OK + MB_ICONWARNING);
      end
      else
        fdsPreVendaVENDEDOR.AsString := fdsVendedorNOME.AsString;
    end;
  end;
end;

end.
