unit untPesqProdutoItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Mask, RzEdit, RzButton, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, RzBckgnd, Vcl.Imaging.pngimage;

type
  TfrmPesqProdutoItens = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    btnTodos: TRzBitBtn;
    btnPesquisar: TRzBitBtn;
    edtNome: TRzEdit;
    JvDBGrid1: TJvDBGrid;
    RzPanel2: TRzPanel;
    btnSelecionar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsProdutoItens: TpFIBDataSet;
    dsProdutoItens: TDataSource;
    fdsProdutoItensNOME: TFIBStringField;
    fdsProdutoItensSALDO: TFIBBCDField;
    fdsProdutoItensID: TFIBBCDField;
    fdsProdutoItensDT_INC: TFIBDateField;
    fdsProdutoItensDT_ALT: TFIBDateField;
    fdsProdutoItensIDPRODUTO: TFIBBCDField;
    fdsProdutoItensSTATUS: TFIBStringField;
    fdsProdutoItensREFERENCIA: TFIBStringField;
    fdsProdutoItensIDTAMANHO: TFIBBCDField;
    fdsProdutoItensIDCOR: TFIBBCDField;
    fdsProdutoItensPESO: TFIBBCDField;
    fdsProdutoItensPREC_CUSTO: TFIBBCDField;
    fdsProdutoItensPREC_VENDA: TFIBBCDField;
    fdsProdutoItensENVIADO_WEB: TFIBStringField;
    fdsProdutoItensPREC_TAB1: TFIBBCDField;
    fdsProdutoItensPREC_TAB2: TFIBBCDField;
    fdsProdutoItensPREC_TAB3: TFIBBCDField;
    fdsProdutoItensPREC_TAB4: TFIBBCDField;
    fdsProdutoItensPREC_TAB5: TFIBBCDField;
    fdsProdutoItensPREC_TAB6: TFIBBCDField;
    fdsProdutoItensCOD_FABRICA: TFIBStringField;
    fdsProdutoItensPREC_ULTIMO_CUSTO: TFIBBCDField;
    fdsProdutoItensDT_VALIDADE: TFIBDateField;
    fdsProdutoItensMARGEM_LUCRO: TFIBBCDField;
    fdsProdutoItensDESC_MAX1: TFIBBCDField;
    fdsProdutoItensDESC_MAX2: TFIBBCDField;
    fdsProdutoItensCOD_FABRICANTE: TFIBStringField;
    fdsProdutoItensCOMISSAO_DN: TFIBBCDField;
    fdsProdutoItensCOMISSAO_CH: TFIBBCDField;
    fdsProdutoItensCOMISSAO_CT: TFIBBCDField;
    fdsProdutoItensUNIDADE: TFIBStringField;
    fdsProdutoItensCFOP: TFIBStringField;
    fdsProdutoItensTIPO: TFIBStringField;
    fdsProdutoItensSALDO_GERENCIAL: TFIBBCDField;
    fdsProdutoItensINFO_ADICIONAL: TFIBStringField;
    fdsProdutoItensCSOSN: TFIBStringField;
    fdsProdutoItensNCM: TFIBStringField;
    fdsProdutoItensPREC_CUSTO_MEDIO: TFIBBCDField;
    fdsProdutoItensIDENTIFICADOR: TFIBIntegerField;
    fdsProdutoItensDESC_MAX3: TFIBBCDField;
    fdsProdutoItensDESC_MAX4: TFIBBCDField;
    fdsProdutoItensUTILIZA_BALANCA: TFIBStringField;
    fdsProdutoItensOBS: TFIBStringField;
    fdsProdutoItensINFO_COMPLEMENTAR: TFIBStringField;
    fdsProdutoItensALIQ_ICMS: TFIBFloatField;
    fdsProdutoItensCEST: TFIBStringField;
    fdsProdutoItensFCP: TFIBBCDField;
    fdsProdutoItensCST_PIS: TFIBStringField;
    fdsProdutoItensCST_COFINS: TFIBStringField;
    fdsProdutoItensALQ_IPI: TFIBBCDField;
    fdsProdutoItensIDGRUPO: TFIBBCDField;
    fdsProdutoItensIBPT_NACIONA_FEDERAL: TFIBBCDField;
    fdsProdutoItensIBPT_ESTADUAL: TFIBBCDField;
    fdsProdutoItensIBPT_MUNICIPAL: TFIBBCDField;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Pesquisar;
    procedure RetornaTodos;
    procedure btnTodosClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure fdsProdutoItensBeforeOpen(DataSet: TDataSet);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    tipoProduto: string;

  end;

var
  frmPesqProdutoItens: TfrmPesqProdutoItens;

implementation

uses untData, uUtils;

{$R *.dfm}

procedure TfrmPesqProdutoItens.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqProdutoItens.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesqProdutoItens.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqProdutoItens.btnTodosClick(Sender: TObject);
begin
  RetornaTodos;
end;

procedure TfrmPesqProdutoItens.edtNomeKeyPress(Sender: TObject; var Key: Char);
var
 utils:Tutils;
begin
  Key:=utils.TiraCaracterEspecialEdit(Key);
  if Key = #13 then
  begin
    //TDBGrid(Sender).DataSource.DataSet.Filter := 'NOME'  + ' LIKE ' + edtNome.Text;
    Pesquisar;
    Key := #0;
  end;
end;

procedure TfrmPesqProdutoItens.fdsProdutoItensBeforeOpen(DataSet: TDataSet);
begin
  fdsProdutoItens.ParamByName('IDFILIAL').AsInteger :=
    DM.fdsConfigIDFILIAL.AsInteger;
end;

procedure TfrmPesqProdutoItens.FormActivate(Sender: TObject);
begin
  edtNome.SetFocus;
  // RetornaTodos;
end;

procedure TfrmPesqProdutoItens.FormCreate(Sender: TObject);
begin
  tipoProduto := EmptyStr;
end;

procedure TfrmPesqProdutoItens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btnSelecionar.Click;
  end;
end;

procedure TfrmPesqProdutoItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (ActiveControl = JvDBGrid1) or (fdsProdutoItens.RecordCount = 1) then
  begin
    if Key = #13 then
    begin
      btnSelecionar.Click;
    end;
  end;
end;

procedure TfrmPesqProdutoItens.JvDBGrid1DblClick(Sender: TObject);
begin
  if fdsProdutoItens.RecordCount > 0 then
    btnSelecionar.Click;
end;

procedure TfrmPesqProdutoItens.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsProdutoItens.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
      JvDBGrid1.Canvas.Brush.Color :=clHighlight;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmPesqProdutoItens.Pesquisar;
var
  sql: string;
begin
  fdsProdutoItens.Close;
  fdsProdutoItens.SelectSQL.Clear;
  sql := 'SELECT PI.*, P.CFOP, P.CSOSN, P.TIPO, P.NCM,P.ALIQ_ICMS,P.CEST, P.FCP, P.CST_PIS,P.CST_COFINS, P.IBPT_NACIONA_FEDERAL,P.IBPT_ESTADUAL,P.IBPT_MUNICIPAL, P.INFO_ADICIONAL,P.ALQ_IPI,P.IDGRUPO, PIE.* FROM PRODUTO_ITEM PI, PRODUTO_ITEM_ESTOQUE PIE, PRODUTO P ';
  sql := sql + 'WHERE((UPPER(PI.NOME) LIKE ' +QuotedStr('%' + edtNome.Text + '%')+')';
  sql := sql + 'OR (PI.REFERENCIA LIKE ' +QuotedStr('%' + edtNome.Text + '%')+')';
  sql := sql + 'OR (PI.COD_FABRICANTE LIKE ' +QuotedStr('%' + edtNome.Text + '%')+')';
  sql := sql + 'OR (PI.COD_FABRICA LIKE ' +QuotedStr('%' + edtNome.Text + '%')+')';
  sql := sql + 'OR (PI.IDENTIFICADOR LIKE ' +QuotedStr('%' + edtNome.Text + '%')+'))';
  sql := sql + ' AND PIE.IDITEM = PI.ID AND PIE.IDFILIAL = :IDFILIAL AND P.ID = PI.IDPRODUTO';

  if tipoProduto = 'MP' then
    sql := sql + ' AND P.TIPO = ' + QuotedStr('MP');

  if tipoProduto = 'FP' then
    sql := sql + ' AND P.TIPO = ' + QuotedStr('FP');


  fdsProdutoItens.SelectSQL.Add(sql);
  fdsProdutoItens.OrderClause := 'PI.NOME';
  fdsProdutoItens.Prepare;
  fdsProdutoItens.Open;
end;

procedure TfrmPesqProdutoItens.RetornaTodos;
var
  sql: string;
begin
  fdsProdutoItens.Close;
  fdsProdutoItens.SelectSQL.Clear;
  sql := 'SELECT PI.*, P.CFOP, P.CSOSN, P.TIPO, P.NCM,P.ALIQ_ICMS,P.CEST,P.FCP,P.CST_PIS,P.CST_COFINS,P.ALQ_IPI,P.IDGRUPO,P.INFO_ADICIONAL,P.IBPT_NACIONA_FEDERAL,P.IBPT_ESTADUAL,P.IBPT_MUNICIPAL,PIE.*';
  sql := sql+ 'FROM PRODUTO_ITEM PI, PRODUTO_ITEM_ESTOQUE PIE, PRODUTO P ';
  sql := sql + 'WHERE PIE.IDITEM = PI.ID AND PIE.IDFILIAL = :IDFILIAL AND P.ID = PI.IDPRODUTO';

  if tipoProduto = 'MP' then
    sql := sql + ' AND P.TIPO = ' + QuotedStr('MP');

  if tipoProduto = 'FP' then
    sql := sql + ' AND P.TIPO = ' + QuotedStr('FP');

  fdsProdutoItens.SelectSQL.Add(sql);
  fdsProdutoItens.OrderClause := 'UPPER(PI.NOME)';
  fdsProdutoItens.Prepare;
  fdsProdutoItens.Open;
end;

end.
