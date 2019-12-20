unit untProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet, RzDBEdit, StdCtrls,
  Mask, RzEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzButton,
  RzLabel, dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage, RzPanel, RzBckgnd,
  RzCmboBx, RzDBCmbo, DBCtrls, ComCtrls, RzDTP, RzDBDTP, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, Vcl.Imaging.pngimage, Datasnap.Provider,
  pFIBClientDataSet, Datasnap.DBClient, RzSplit, JvExStdCtrls, JvCheckBox,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvButton, JvCtrls, Vcl.ImgList, PngImageList, frxClass, frxDBSet, Vcl.Menus,
  System.Actions, Vcl.ActnList;

type
  TfrmProducao = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblTotal: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsProducao: TpFIBDataSet;
    fdsProducaoItem: TpFIBDataSet;
    dsProducao: TDataSource;
    dsProducaoItem: TDataSource;
    fdsProducaoID: TFIBBCDField;
    fdsProducaoDT_INC: TFIBDateField;
    fdsProducaoTOTAL_ITENS: TFIBBCDField;
    fdsProducaoItemID_PRODUCAO: TFIBBCDField;
    fdsProducaoItemITEM: TFIBSmallIntField;
    fdsProducaoItemIDPROD_ITEM: TFIBBCDField;
    fdsProducaoItemQTN: TFIBBCDField;
    fdsProducaoItemNOME: TFIBStringField;
    cdsProducaoItem: TpFIBClientDataSet;
    dspProducaoItem: TpFIBDataSetProvider;
    cdsProducaoItemID_PRODUCAO: TpFIBClientBCDField;
    cdsProducaoItemITEM: TSmallintField;
    cdsProducaoItemIDPROD_ITEM: TpFIBClientBCDField;
    cdsProducaoItemQTN: TpFIBClientBCDField;
    cdsProducaoItemNOME: TStringField;
    fdsProducaoIDFUNCIONARIO: TFIBBCDField;
    fdsProducaoFUNCIONARIO: TFIBStringField;
    RzSplitter1: TRzSplitter;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    gdrProducao: TJvDBGrid;
    tbsForm: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    lblDtInc: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edtDt_Inc: TRzDBEdit;
    edtID: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    btnPesqFuncionario: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    JvDBGrid2: TJvDBGrid;
    pnlLancItens: TRzPanel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    edtQtnItem: TRzDBEdit;
    btnItemGravar: TRzBitBtn;
    btnItemCancelar: TRzBitBtn;
    btnItemExcluir: TRzBitBtn;
    btnItemAlterar: TRzBitBtn;
    btnItensIncluir: TRzBitBtn;
    edtProduto: TRzDBEdit;
    RzPanel3: TRzPanel;
    pnlPeriodo: TRzGroupBox;
    RzLabel3: TRzLabel;
    RzLabel11: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    chkPeriodo: TJvCheckBox;
    pnlFuncionario: TRzGroupBox;
    edtPesqFuncionario: TRzEdit;
    chkFuncionario: TJvCheckBox;
    btnPesquisar: TJvImgBtn;
    PngImageList1: TPngImageList;
    fdsFuncionario: TpFIBDataSet;
    fdsFuncionarioID: TFIBBCDField;
    fdsFuncionarioDT_INC: TFIBDateField;
    fdsFuncionarioDT_ALT: TFIBDateField;
    fdsFuncionarioSTATUS: TFIBStringField;
    fdsFuncionarioNOME: TFIBStringField;
    fdsFuncionarioDT_NASC: TFIBDateField;
    fdsFuncionarioTELEFONE: TFIBStringField;
    fdsFuncionarioENDERECO: TFIBStringField;
    fdsFuncionarioBAIRRO: TFIBStringField;
    fdsFuncionarioIDCIDADE: TFIBBCDField;
    fdsFuncionarioCEP: TFIBStringField;
    fdsFuncionarioRG: TFIBStringField;
    fdsFuncionarioCPF: TFIBStringField;
    fdsFuncionarioSEXO: TFIBStringField;
    fdsFuncionarioCELULAR: TFIBStringField;
    fdsFuncionarioENVIADO_WEB: TFIBStringField;
    qrySQL: TpFIBQuery;
    RzLabel4: TRzLabel;
    frxProducao: TfrxDBDataset;
    frxProducaoItem: TfrxDBDataset;
    ActionList1: TActionList;
    impProducaoFuncionario: TAction;
    ppmImprimir: TPopupMenu;
    ImprimirInventarioGeral: TMenuItem;
    btnInprimir: TRzBitBtn;
    frxFuncionario: TfrxDBDataset;
    fdsProducaoItemDT_INC: TFIBDateField;
    fdsProducaoSTATUS: TFIBStringField;
    imgFlagGreen: TImage;
    imgFlagYellow: TImage;
    imgFlagYellow2: TImage;
    imgFlagGreen2: TImage;
    btnConfirmar: TRzBitBtn;
    pnlPosicao: TRzGroupBox;
    cbxPosicao: TRzComboBox;
    chkPosicao: TJvCheckBox;
    actOrdemProducao: TAction;
    OrdemdeProduo1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure RetornaItensProducao;
    procedure ControlaBtnsItens;
    procedure PesquisarItem;
    function MyLocateItem(chave1: string): Boolean;
    procedure edtProfKeyPress(Sender: TObject; var Key: Char);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fdsProducaoAfterScroll(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnItemCancelarClick(Sender: TObject);
    procedure btnItensIncluirClick(Sender: TObject);
    procedure btnItemExcluirClick(Sender: TObject);
    procedure btnItemGravarClick(Sender: TObject);
    procedure btnItemAlterarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure tbsFormShow(Sender: TObject);
    procedure btnPesqFuncionarioClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure Pesquisar;
    procedure CalculaTotalItens;
    procedure RetornaIDFuncionario(funcionario: string);
    procedure chkPeriodoClick(Sender: TObject);
    procedure chkFuncionarioClick(Sender: TObject);
    procedure edtPesqFuncionarioEnter(Sender: TObject);
    procedure edtPesqFuncionarioExit(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnInprimirClick(Sender: TObject);
    procedure impProducaoFuncionarioExecute(Sender: TObject);
    procedure gdrProducaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure fdsProducaoAfterRefresh(DataSet: TDataSet);
    procedure chkPosicaoClick(Sender: TObject);
    procedure actOrdemProducaoExecute(Sender: TObject);
    procedure gdrProducaoDblClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmProducao: TfrmProducao;
  alterandoIten, imprimindo: Boolean;
  totItem: Double;
  item: Integer;

implementation

uses untPrincipal, untData, uUtils, untPesqCidade, untPesqCliente,
  untPesqProdutoItens, untPesqFuncionario;

{$R *.dfm}

procedure TfrmProducao.actOrdemProducaoExecute(Sender: TObject);
begin
  imprimindo := True;
  if (fdsProducao.RecordCount > 0) and (pgcControl.ActivePageIndex = 0) then
    RetornaItensProducao;

  DM.totItens := lblTotal.Caption;
  DM.frxReport1.Clear;
  DM.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '/Relatorios/frxProducaoOrdem.fr3');
  DM.frxReport1.PrepareReport(True);
  DM.frxReport1.ShowReport(True);
  imprimindo := False;
  Pesquisar;
end;

procedure TfrmProducao.btnAlterarClick(Sender: TObject);
begin
  fdsProducao.Edit;
  EditaInsere;
  alterandoIten := True;
end;

procedure TfrmProducao.btnConfirmarClick(Sender: TObject);
begin
  fdsProducao.Edit;
  fdsProducaoSTATUS.AsString := 'FC';
  fdsProducao.Post;
  DM.Conexao.CommitRetaining;
  fdsProducao.Refresh;
end;

procedure TfrmProducao.btnCancelarClick(Sender: TObject);
begin
  fdsProducao.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmProducao.btnFirstClick(Sender: TObject);
begin
  fdsProducao.Prior;
end;

procedure TfrmProducao.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
  i: Smallint;
begin
  if alterandoIten then
  begin
    Application.MessageBox
      ('Voc� est� incluindo ou alterando um item, grave a inclus�o/altera��o deste primeiro e depois grave o pedido.',
      'Ante��o', MB_OK + MB_ICONERROR);
    edtQtnItem.SetFocus;
    Abort;
  end;

  if cdsProducaoItem.RecordCount = 0 then
  begin
    Application.MessageBox('Voc� n�o pode gravar uma Produ��o sem itens.',
      'Ante��o', MB_OK + MB_ICONERROR);
    btnItensIncluir.SetFocus;
    Abort;
  end;

  fdsProducaoTOTAL_ITENS.AsFloat := totItem;
  fdsProducao.Post;

  cdsProducaoItem.ApplyUpdates(0);

  DM.Conexao.CommitRetaining;
  GravaCancela;
end;

procedure TfrmProducao.btnIncluirClick(Sender: TObject);
begin
  fdsProducaoItem.Close;
  cdsProducaoItem.Close;
  cdsProducaoItem.Open;
  cdsProducaoItem.EmptyDataSet;
  fdsProducao.Append;
  fdsProducaoSTATUS.AsString := 'AB';
  EditaInsere;
  btnItemAlterar.Enabled := False;
  btnItemExcluir.Enabled := False;
  btnItemGravar.Enabled := False;
  btnItemCancelar.Enabled := False;
  item := 1;
  totItem := 0;
end;

procedure TfrmProducao.btnInprimirClick(Sender: TObject);
begin
  ppmImprimir.Popup(frmProducao.Left + 254, frmProducao.top + 114);
end;

procedure TfrmProducao.btnItemAlterarClick(Sender: TObject);
begin
  cdsProducaoItem.Edit;
  edtQtnItem.SetFocus;
  ControlaBtnsItens;
end;

procedure TfrmProducao.btnItemCancelarClick(Sender: TObject);
begin
  cdsProducaoItem.Cancel;
  ControlaBtnsItens;
  btnItensIncluir.SetFocus;
end;

procedure TfrmProducao.btnItemExcluirClick(Sender: TObject);
begin
  cdsProducaoItem.Delete;
end;

procedure TfrmProducao.btnItemGravarClick(Sender: TObject);
begin
  if not(Trim(edtQtnItem.Text) = EmptyStr) and
    not(cdsProducaoItemQTN.AsInteger = 0) then
  begin
    totItem := totItem + cdsProducaoItemQTN.AsFloat;
    cdsProducaoItem.Post;
    ControlaBtnsItens;
    btnItensIncluir.SetFocus;
  end
  else
    edtQtnItem.SetFocus;
end;

procedure TfrmProducao.btnItensIncluirClick(Sender: TObject);
begin
  ControlaBtnsItens;
  PesquisarItem;
end;

procedure TfrmProducao.btnLastClick(Sender: TObject);
begin
  fdsProducao.Last;
end;

procedure TfrmProducao.btnNextClick(Sender: TObject);
begin
  fdsProducao.Next;
end;

procedure TfrmProducao.btnPesqFuncionarioClick(Sender: TObject);
begin
  Try
    frmPesqFuncionario := TfrmPesqFuncionario.Create(nil);
    frmPesqFuncionario.ShowModal;
  Finally
    if frmPesqFuncionario.ModalResult = mrOk then
    begin
      fdsProducaoFUNCIONARIO.AsString :=
        frmPesqFuncionario.fdsFuncionariosNOME.AsString;
      fdsProducaoIDFUNCIONARIO.AsInteger :=
        frmPesqFuncionario.fdsFuncionariosID.AsInteger;
    end;
    frmPesqFuncionario.Free;
  End;
end;

procedure TfrmProducao.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmProducao.btnPriorClick(Sender: TObject);
begin
  fdsProducao.First;
end;

procedure TfrmProducao.btnTodosClick(Sender: TObject);
begin
  chkPeriodo.Checked := False;
  chkFuncionario.Checked := False;
  Pesquisar;
end;

procedure TfrmProducao.CalculaTotalItens;
var
  tempTotal: string;
begin

  tempTotal := '';
  with qrySQL do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(PI.QTN) AS TOTAL FROM PRODUCAO_ITENS PI, PRODUCAO P, FUNCIONARIO F');
    SQL.Add(' WHERE P.ID = PI.ID_PRODUCAO AND F.ID = P.IDFUNCIONARIO');

    if chkPeriodo.Checked then
      SQL.Add(' AND P.DT_INC BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY',
        dtpInicio.Date)) + ' AND ' + QuotedStr(FormatDateTime('MM/DD/YYYY',
        dtpFim.Date)));

    if (chkFuncionario.Checked) and not(Trim(edtPesqFuncionario.Text) = 'Todos')
    then
    begin
      SQL.Add(' AND F.NOME like UPPER(' +
        QuotedStr(Trim(edtPesqFuncionario.Text) + '%') + ')');
    end;

    Prepare;
    ExecQuery;

    tempTotal := FormatFloat('#,###0.000', qrySQL.FieldByName('TOTAL').AsFloat);

    if tempTotal = '' then
      tempTotal := '0';
  end;

  lblTotal.Caption := tempTotal;

end;

procedure TfrmProducao.chkFuncionarioClick(Sender: TObject);
begin
  pnlFuncionario.Enabled := chkFuncionario.Checked;

  if not(chkFuncionario.Checked) then
  begin
    edtPesqFuncionario.Text := 'Todos';
    edtPesqFuncionario.Font.Color := clGray;
  end;
end;

procedure TfrmProducao.chkPeriodoClick(Sender: TObject);
begin
  pnlPeriodo.Enabled := chkPeriodo.Checked;
end;

procedure TfrmProducao.chkPosicaoClick(Sender: TObject);
begin
  pnlPosicao.Enabled := chkPosicao.Checked;

  if not(chkPosicao.Checked) then
  begin
    cbxPosicao.ItemIndex := 0;
  end;
end;

procedure TfrmProducao.ControlaBtnsItens;
begin
  btnItemCancelar.Enabled := not(alterandoIten);
  btnItemGravar.Enabled := not(alterandoIten);
  btnItensIncluir.Enabled := alterandoIten;
  btnItemAlterar.Enabled := alterandoIten;
  btnItemExcluir.Enabled := alterandoIten;
  alterandoIten := not(alterandoIten);
end;

procedure TfrmProducao.EditaInsere;
var
  i: Smallint;
begin

  pnlLancItens.Enabled := True;

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
  // edtNome.SetFocus;
end;

procedure TfrmProducao.edtPesqFuncionarioEnter(Sender: TObject);
begin
  if Trim(edtPesqFuncionario.Text) = 'TODOS' then
  begin
    edtPesqFuncionario.Text := EmptyStr;
    edtPesqFuncionario.Font.Color := clBlack;
  end;
end;

procedure TfrmProducao.edtPesqFuncionarioExit(Sender: TObject);
begin
  if Trim(edtPesqFuncionario.Text) = EmptyStr then
  begin
    edtPesqFuncionario.Text := 'Todos';
    edtPesqFuncionario.Font.Color := clGray;
  end;
end;

procedure TfrmProducao.edtProfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnGravar.SetFocus;
  end;
end;

procedure TfrmProducao.fdsProducaoAfterRefresh(DataSet: TDataSet);
begin
  if not(imprimindo) then
  begin
    if fdsProducaoSTATUS.AsString = 'AB' then
      btnConfirmar.Enabled := True
    else
      btnConfirmar.Enabled := False;
  end;
end;

procedure TfrmProducao.fdsProducaoAfterScroll(DataSet: TDataSet);
begin
  if not(imprimindo) then
  begin
    if not(fdsProducao.State in [dsInsert, dsEdit]) then
    begin
      if pgcControl.ActivePageIndex = 1 then
      begin
        RetornaItensProducao;
      end;

      if fdsProducaoSTATUS.AsString = 'AB' then
        btnConfirmar.Enabled := True
      else
        btnConfirmar.Enabled := False;
    end;
  end;
end;

procedure TfrmProducao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmProducao := nil;
end;

procedure TfrmProducao.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  alterandoIten := False;
  imprimindo := False;
  // cdsProducaoItem.CreateDataSet;
  fdsProducao.Open;
  CalculaTotalItens;
end;

procedure TfrmProducao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmProducao.GravaCancela;
var
  i: Smallint;
  utils: TUtils;
  editando: Boolean;
begin

  pnlLancItens.Enabled := False;

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
  end;

end;

procedure TfrmProducao.impProducaoFuncionarioExecute(Sender: TObject);
begin
  fdsProducao.Close;
  pgcControl.ActivePageIndex := 0;

  with fdsProducaoItem do
  begin
    Close;
    Conditions.Clear;

    if chkPeriodo.Checked then
      Conditions.AddCondition('DT_INC', 'P.DT_INC BETWEEN ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);

    if (chkFuncionario.Checked) and not(Trim(edtPesqFuncionario.Text) = 'Todos')
    then
    begin
      RetornaIDFuncionario(Trim(edtPesqFuncionario.Text));
      if fdsFuncionario.RecordCount > 0 then
        Conditions.AddCondition('IDFUNCIONARIO', 'P.IDFUNCIONARIO = ' +
          fdsFuncionarioID.AsString, True)
      else
      begin
        Application.MessageBox('Funcion�rio n�o encontrado.', 'Ante��o',
          MB_OK + MB_ICONERROR);
        Abort;
      end;
    end
    else
    begin
      Application.MessageBox('Informe um Funcion�rio no painel de pesquisa.',
        'Ante��o', MB_OK + MB_ICONERROR);
      Abort;
    end;

    Conditions.Apply;
    Prepare;
    Open;
  end;

  CalculaTotalItens;

  DM.totItens := lblTotal.Caption;
  DM.frxReport1.Clear;
  DM.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '/Relatorios/frxProducaoFuncionario.fr3');
  DM.frxReport1.PrepareReport(True);
  DM.frxReport1.ShowReport(True);
  Pesquisar;
end;

procedure TfrmProducao.gdrProducaoDblClick(Sender: TObject);
begin
  if fdsProducao.RecordCount > 0 then
    tbsForm.Show;
end;

procedure TfrmProducao.gdrProducaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  status: string;
  Bitmap: TBitmap;
begin
  if not odd(fdsProducao.RecNo) then
  begin
    gdrProducao.Canvas.Brush.Color := DM.gridOddColor;
    gdrProducao.Canvas.FillRect(Rect);
    gdrProducao.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.Index = 1) and not(fdsProducao.IsEmpty) then
    begin
      status := fdsProducaoSTATUS.AsString;
      if status = 'AB' then
      begin
        Bitmap := imgFlagYellow2.Picture.Bitmap
      end
      else
        Bitmap := imgFlagGreen2.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.top - Bitmap.Height) div 2 + Rect.top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end
  else
  begin
    if Column.Index = 1 then
    begin
      status := fdsProducaoSTATUS.AsString;
      if status = 'AB' then
      begin
        Bitmap := imgFlagYellow.Picture.Bitmap
      end
      else
        Bitmap := imgFlagGreen.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.top - Bitmap.Height) div 2 + Rect.top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;
end;

function TfrmProducao.MyLocateItem(chave1: string): Boolean;
begin
  Result := False;
  cdsProducaoItem.First;
  while not(cdsProducaoItem.EoF) do
  begin
    if cdsProducaoItemIDPROD_ITEM.AsString = chave1 then
    begin
      Result := True;
      Break;
    end;
    cdsProducaoItem.Next;
  end;
end;

procedure TfrmProducao.Pesquisar;
begin
  pgcControl.ActivePageIndex := 0;

  with fdsProducao do
  begin
    Close;
    Conditions.Clear;

    if chkPeriodo.Checked then
      Conditions.AddCondition('DT_INC', 'P.DT_INC BETWEEN ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);

    if (chkFuncionario.Checked) and not(Trim(edtPesqFuncionario.Text) = 'Todos')
    then
    begin
      // RetornaIDFuncionario(Trim(edtPesqFuncionario.Text));
      // if fdsFuncionario.RecordCount > 0 then
      // Conditions.AddCondition('IDFUNCIONARIO', 'P.IDFUNCIONARIO = ' + fdsFuncionarioID.AsString, True)
      // else
      // Conditions.AddCondition('IDFUNCIONARIO', 'P.IDFUNCIONARIO = 0', True);
      Conditions.AddCondition('NOMEFUNCIONARIO', 'F.NOME like UPPER(' +
        QuotedStr(Trim(edtPesqFuncionario.Text) + '%') + ')', True);
      Conditions.AddCondition('IDFUNCIONARIO', 'P.IDFUNCIONARIO = F.ID', True);
    end;

    if (chkPosicao.Checked) and (cbxPosicao.Value <> 'TD') then
      Conditions.AddCondition('STATUS', ' P.STATUS = ' +
        QuotedStr(cbxPosicao.Value), True);

    Conditions.Apply;
    Prepare;
    Open;
  end;

  CalculaTotalItens;
end;

procedure TfrmProducao.PesquisarItem;
var
  tempIDItem: Integer;
  continuar: Boolean;
begin
  Try
    continuar := False;

    frmPesqProdutoItens := TfrmPesqProdutoItens.Create(nil);
    frmPesqProdutoItens.tipoProduto := 'FP';
    frmPesqProdutoItens.ShowModal;
  Finally
    if frmPesqProdutoItens.ModalResult = mrOk then
    begin
      tempIDItem := frmPesqProdutoItens.fdsProdutoItensID.AsInteger;

      if (MyLocateItem(IntToStr(tempIDItem))) then
      begin
        Application.MessageBox
          ('Este item j� foi incluso no Pedido, voc� n�o pode duplic�-lo!',
          'Aten��o', MB_OK + MB_ICONWARNING);
        continuar := False;
      end
      else
        continuar := True;

      if continuar then
      begin
        cdsProducaoItem.Append;

        cdsProducaoItemID_PRODUCAO.AsInteger := fdsProducaoID.AsInteger;
        cdsProducaoItemIDPROD_ITEM.AsInteger := tempIDItem;
        cdsProducaoItemITEM.AsInteger := item;
        cdsProducaoItemNOME.AsString :=
          frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
        Inc(item);
        edtQtnItem.SetFocus;
      end
      else
      begin
        btnItemCancelar.Click;
      end;
    end
    else
      btnItemCancelar.Click;

    frmPesqProdutoItens.Free;

  End;
end;

procedure TfrmProducao.RetornaIDFuncionario(funcionario: string);
begin
  with fdsFuncionario do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('NOMEFUNCIONARIO', 'F.NOME like UPPER(' +
      QuotedStr(funcionario + '%') + ')', True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmProducao.RetornaItensProducao;
begin
  if (fdsProducao.RecordCount > 0) and
    not(fdsProducao.State in [dsEdit, dsInsert]) then
  begin
    with fdsProducaoItem do
    begin
      cdsProducaoItem.Close;
      Close;
      Conditions.Clear;
      Conditions.Apply;
      Conditions.AddCondition('ID_PRODUCAO', 'ID_PRODUCAO = ' +
        fdsProducaoID.AsString, True);
      Conditions.Apply;
      Prepare;
      Open;
      cdsProducaoItem.Open;
      cdsProducaoItem.First;
    end;
  end;
end;

procedure TfrmProducao.tbsFormShow(Sender: TObject);
begin
  RetornaItensProducao;
end;

end.