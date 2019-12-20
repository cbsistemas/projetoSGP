unit untPesqPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Mask, RzEdit, RzButton, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, RzBckgnd, Vcl.Imaging.pngimage, RzCmboBx;

type
  TfrmPesqPedido = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    btnTodos: TRzBitBtn;
    JvDBGrid1: TJvDBGrid;
    dsPedidos: TDataSource;
    fdsPedidos: TpFIBDataSet;
    fdsItensPedido: TpFIBDataSet;
    fdsVendedor: TpFIBDataSet;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    edtNome: TRzEdit;
    lblNome: TRzLabel;
    edtNumero: TRzEdit;
    RzLabel1: TRzLabel;
    cbxVendedor: TRzComboBox;
    btnPesquisar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    fdsPedidosID: TFIBBCDField;
    fdsPedidosDT_INC: TFIBDateField;
    fdsPedidosIDFILIAL: TFIBBCDField;
    fdsPedidosCODIGO: TFIBStringField;
    fdsPedidosVLR_TOTAL: TFIBBCDField;
    fdsPedidosPESO: TFIBBCDField;
    fdsPedidosCLIENTE: TFIBStringField;
    fdsPedidosKM_TOTAL: TFIBSmallIntField;
    fdsPedidosCIDADE: TFIBStringField;
    fdsItensPedidoIDPEDIDO: TFIBBCDField;
    fdsItensPedidoIDFILIAL: TFIBBCDField;
    fdsItensPedidoITEM: TFIBSmallIntField;
    fdsItensPedidoIDPROD_ITEM: TFIBBCDField;
    fdsItensPedidoDT_INC: TFIBDateField;
    fdsItensPedidoDT_ALT: TFIBDateField;
    fdsItensPedidoQTN: TFIBBCDField;
    fdsItensPedidoVLR_UNITARIO: TFIBBCDField;
    fdsItensPedidoVLR_DESCONTO: TFIBBCDField;
    fdsItensPedidoVLR_TOTAL: TFIBBCDField;
    fdsItensPedidoPESO: TFIBBCDField;
    fdsItensPedidoQTN_RETORNO: TFIBBCDField;
    fdsItensPedidoMOTIVO_RETORNO: TFIBStringField;
    fdsItensPedidoENTREGUE: TFIBStringField;
    fdsItensPedidoENVIADO_WEB: TFIBStringField;
    fdsItensPedidoORDEM: TFIBIntegerField;
    fdsItensPedidoNCM: TFIBStringField;
    fdsItensPedidoCEST: TFIBStringField;
    fdsItensPedidoCSOSN: TFIBStringField;
    fdsItensPedidoPROD_CFOP: TFIBStringField;
    fdsItensPedidoIBPT_NACIONA_FEDERAL: TFIBBCDField;
    fdsItensPedidoNOME: TFIBStringField;
    fdsItensPedidoCOD_FABRICA: TFIBStringField;
    fdsItensPedidoUNIDADE: TFIBStringField;
    procedure btnTodosClick(Sender: TObject);
    procedure Pesquisar;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdsVendedorAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idRota: Integer;
    isRomaneio: Boolean;
  end;

var
  frmPesqPedido: TfrmPesqPedido;

implementation

uses untLogin, untData, uUtils;

{$R *.dfm}

procedure TfrmPesqPedido.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqPedido.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesqPedido.btnSelecionarClick(Sender: TObject);
begin
  if not(fdsPedidos.RecordCount = 0) then
  begin
    with fdsItensPedido do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('IDPEDIDO',
        'IDPEDIDO = ' + fdsPedidosID.AsString, True);
      Conditions.AddCondition('IDFILIAL',
        'IDFILIAL = ' + fdsPedidosIDFILIAL.AsString, True);
      Conditions.Apply;
      Prepare;
      Open;
    end;

    ModalResult := mrOk;
  end
  else
  begin
    Application.MessageBox('Nenhum Pedido encontrado.', 'Atenção',
      MB_OK + MB_ICONEXCLAMATION);
  end;
end;

procedure TfrmPesqPedido.btnTodosClick(Sender: TObject);
begin
  // fdsPedidos.Close;
end;

procedure TfrmPesqPedido.edtNomeChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesqPedido.fdsVendedorAfterOpen(DataSet: TDataSet);
begin
  fdsVendedor.First;
  cbxVendedor.ClearItems;
  cbxVendedor.AddItemValue('TODOS', '0');
  while not(fdsVendedor.Eof) do
  begin
    cbxVendedor.AddItemValue(fdsVendedorNOME.AsString, fdsVendedorID.AsString);
    fdsVendedor.Next;
  end;
  fdsVendedor.Close;
end;

procedure TfrmPesqPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btnSelecionar.Click;
  end;
end;

procedure TfrmPesqPedido.FormShow(Sender: TObject);
begin
  edtNome.SetFocus;

  fdsVendedor.Open;
  Pesquisar;
end;

procedure TfrmPesqPedido.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsPedidos.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmPesqPedido.Pesquisar;
var
  utils: TUtils;
begin
  edtNumero.Text := FloatToStr(utils.ValidaInteiroFloat(edtNumero.Text, 'I'));
  fdsPedidos.Close;
  with fdsPedidos do
  begin
    Close;
    Conditions.Clear;
    if (edtNumero.Text <> '0') and (Trim(edtNumero.Text) <> EmptyStr) then
      Conditions.AddCondition('ID', 'P.ID = ' + edtNumero.Text, True);

    Conditions.AddCondition('CLIENTE', 'C.NOME LIKE ' +
      QuotedStr(Trim(edtNome.Text) + '%'), True);

    if (cbxVendedor.ItemIndex > 0) then
      Conditions.AddCondition('IDVENDEDOR', 'P.IDVENDEDOR = ' +
        cbxVendedor.Value, True);

    Conditions.Apply;
    Prepare;
    Open;
  end;
  fdsPedidos.Open;

end;

end.
