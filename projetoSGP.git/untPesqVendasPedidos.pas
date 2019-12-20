unit untPesqVendasPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.ImgList, PngImageList, RzButton, RzBckgnd, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzRadGrp, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, JvCheckBox, RzCmboBx,
  Vcl.Mask, RzEdit, RzPanel, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls,
  JvExExtCtrls, JvImage, Data.DB, FIBDataSet, pFIBDataSet, System.DateUtils;

type
  TfrmPesqVendasPedidos = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    pnlNumVenda: TRzGroupBox;
    edtPesqNumVenda: TRzEdit;
    pnlVendedor: TRzGroupBox;
    cbxVendedor: TRzComboBox;
    chkNumVenda: TJvCheckBox;
    chkVendedor: TJvCheckBox;
    pnlPeriodo: TRzGroupBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    pnlCliente: TRzGroupBox;
    edtPesqCliente: TRzEdit;
    chkCliente: TJvCheckBox;
    pnlEAN: TRzGroupBox;
    edtPesqEan: TRzEdit;
    chkEAN: TJvCheckBox;
    rgbStatus: TRzRadioGroup;
    gbxVendas: TRzGroupBox;
    gdrVendas: TJvDBGrid;
    RzBackground1: TRzBackground;
    RzGroupBox1: TRzGroupBox;
    gdrItens: TJvDBGrid;
    btnSair: TRzBitBtn;
    PngImageList1: TPngImageList;
    btnPesquisar: TJvImgBtn;
    fdsVendasPedidos: TpFIBDataSet;
    dsVendasPedidos: TDataSource;
    dsItens: TDataSource;
    fdsItens: TpFIBDataSet;
    dsVendedores: TDataSource;
    fdsVendedores: TpFIBDataSet;
    fdsVendasPedidosNUMERO: TFIBBCDField;
    fdsVendasPedidosIDFILIAL: TFIBBCDField;
    fdsVendasPedidosSTATUS: TFIBStringField;
    fdsVendasPedidosNOMEFILIAL: TFIBStringField;
    fdsVendasPedidosDT_INC: TFIBDateField;
    fdsVendasPedidosIDCLIENTE: TFIBBCDField;
    fdsVendasPedidosNOMECLIENTE: TFIBStringField;
    fdsVendasPedidosIDVENDEDOR: TFIBBCDField;
    fdsVendasPedidosNOMEVENDEDOR: TFIBStringField;
    fdsVendasPedidosIDFORMA_PAG: TFIBBCDField;
    fdsVendasPedidosNOMEFORMA_PAG: TFIBStringField;
    fdsVendasPedidosIDCIDADE: TFIBBCDField;
    fdsVendasPedidosNOMECIDADE: TFIBStringField;
    fdsVendasPedidosIDROTA: TFIBBCDField;
    fdsVendasPedidosVLR_TOTAL: TFIBBCDField;
    fdsVendasPedidosPREFIXO: TFIBStringField;
    fdsVendasPedidosPESO: TFIBBCDField;
    fdsItensIDVENDA: TFIBBCDField;
    fdsItensIDFILIAL: TFIBBCDField;
    fdsItensITEM: TFIBSmallIntField;
    fdsItensIDPROD_ITEM: TFIBBCDField;
    fdsItensQTN: TFIBBCDField;
    fdsItensVLR_UNITARIO: TFIBBCDField;
    fdsItensVLR_DESC_ACRE: TFIBBCDField;
    fdsItensVLR_TOTAL: TFIBBCDField;
    fdsItensPESO: TFIBBCDField;
    fdsItensNOMEPRODUTO: TFIBStringField;
    fdsItensPREFIXO: TFIBStringField;
    fdsVendedoresID: TFIBBCDField;
    fdsVendedoresNOME: TFIBStringField;
    fdsItensQTN_RETORNO: TFIBBCDField;
    fdsItensCOD_FABRICA: TFIBStringField;
    fdsItensCFOP: TFIBStringField;
    fdsVendasPedidosTIPO: TFIBStringField;
    RzBitBtn1: TRzBitBtn;
    fdsVendasPedidosVLR_DESCONTO: TFIBBCDField;
    fdsItensINFO_ADICIONAL: TFIBStringField;
    fdsItensCST_CSOSN: TFIBStringField;
    fdsItensDESCONTO_FORMA: TFIBStringField;
    procedure fdsVendasPedidosAfterScroll(DataSet: TDataSet);
    procedure fdsVendedoresAfterOpen(DataSet: TDataSet);
    procedure chkNumVendaClick(Sender: TObject);
    procedure edtPesqNumVendaEnter(Sender: TObject);
    procedure edtPesqNumVendaExit(Sender: TObject);
    procedure chkVendedorClick(Sender: TObject);
    procedure chkClienteClick(Sender: TObject);
    procedure edtPesqClienteEnter(Sender: TObject);
    procedure edtPesqClienteExit(Sender: TObject);
    procedure chkEANClick(Sender: TObject);
    procedure edtPesqEanEnter(Sender: TObject);
    procedure edtPesqEanExit(Sender: TObject);
    procedure rgbStatusChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure gdrVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    procedure Pesquisar(tipo: string);
  public
    { Public declarations }
  end;

var
  frmPesqVendasPedidos: TfrmPesqVendasPedidos;

implementation

{$R *.dfm}

uses untData, uUtils;

procedure TfrmPesqVendasPedidos.btnPesquisarClick(Sender: TObject);
begin
  case rgbStatus.ItemIndex of
    0:
      Pesquisar('PD');
    1:
      Pesquisar('VE');
    2:
      Pesquisar('TD');
  end;
end;

procedure TfrmPesqVendasPedidos.btnSairClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqVendasPedidos.chkClienteClick(Sender: TObject);
begin
  pnlCliente.Enabled := chkCliente.Checked;
  if not(chkCliente.Checked) then
  begin
    edtPesqCliente.Text := 'TODOS';
    edtPesqCliente.Font.Color := clGray;
  end;
end;

procedure TfrmPesqVendasPedidos.chkEANClick(Sender: TObject);
begin
  pnlEAN.Enabled := chkEAN.Checked;
  if not(chkEAN.Checked) then
  begin
    edtPesqEan.Text := 'TODOS';
    edtPesqEan.Font.Color := clGray;
  end;
end;

procedure TfrmPesqVendasPedidos.chkNumVendaClick(Sender: TObject);
begin
  pnlNumVenda.Enabled := chkNumVenda.Checked;
  if not(chkNumVenda.Checked) then
  begin
    edtPesqNumVenda.Text := 'TODOS';
    edtPesqNumVenda.Font.Color := clGray;
  end;
end;

procedure TfrmPesqVendasPedidos.chkVendedorClick(Sender: TObject);
begin
  pnlVendedor.Enabled := chkVendedor.Checked;
  if not(chkVendedor.Checked) then
  begin
    cbxVendedor.ItemIndex := 0;
  end;
end;

procedure TfrmPesqVendasPedidos.edtPesqClienteEnter(Sender: TObject);
begin
  if Trim(edtPesqCliente.Text) = 'TODOS' then
  begin
    edtPesqCliente.Text := EmptyStr;
    edtPesqCliente.Font.Color := clBlack;
  end;
end;

procedure TfrmPesqVendasPedidos.edtPesqClienteExit(Sender: TObject);
begin
  if Trim(edtPesqCliente.Text) = EmptyStr then
  begin
    edtPesqCliente.Text := 'TODOS';
    edtPesqCliente.Font.Color := clGray;
  end;
end;

procedure TfrmPesqVendasPedidos.edtPesqEanEnter(Sender: TObject);
begin
  if Trim(edtPesqEan.Text) = 'TODOS' then
  begin
    edtPesqEan.Text := EmptyStr;
    edtPesqEan.Font.Color := clBlack;
  end;
end;

procedure TfrmPesqVendasPedidos.edtPesqEanExit(Sender: TObject);
begin
  if Trim(edtPesqEan.Text) = EmptyStr then
  begin
    edtPesqEan.Text := 'TODOS';
    edtPesqEan.Font.Color := clGray;
  end;
end;

procedure TfrmPesqVendasPedidos.edtPesqNumVendaEnter(Sender: TObject);
begin
  if Trim(edtPesqNumVenda.Text) = 'TODOS' then
  begin
    edtPesqNumVenda.Text := EmptyStr;
    edtPesqNumVenda.Font.Color := clBlack;
  end;
end;

procedure TfrmPesqVendasPedidos.edtPesqNumVendaExit(Sender: TObject);
begin
  if Trim(edtPesqNumVenda.Text) = EmptyStr then
  begin
    edtPesqNumVenda.Text := 'TODOS';
    edtPesqNumVenda.Font.Color := clGray;
  end;
end;

procedure TfrmPesqVendasPedidos.fdsVendasPedidosAfterScroll(DataSet: TDataSet);
begin
  if fdsVendasPedidos.RecordCount > 0 then
  begin
    with fdsItens do
    begin
      Close;
      ParamByName('IDVENDA').AsInteger := fdsVendasPedidosNUMERO.AsInteger;
      ParamByName('IDFILIAL').AsInteger := fdsVendasPedidosIDFILIAL.AsInteger;
      ParamByName('PREFIXO').AsString := fdsVendasPedidosPREFIXO.AsString;
      Prepare;
      Open;
    end;
  end;
end;

procedure TfrmPesqVendasPedidos.fdsVendedoresAfterOpen(DataSet: TDataSet);
begin
  fdsVendedores.First;
  cbxVendedor.ClearItems;
  cbxVendedor.AddItemValue('TODOS', '0');
  while not(fdsVendedores.Eof) do
  begin
    cbxVendedor.AddItemValue(fdsVendedoresNOME.AsString,
      fdsVendedoresID.AsString);
    fdsVendedores.Next;
  end;
end;

procedure TfrmPesqVendasPedidos.FormShow(Sender: TObject);
begin
  dtpInicio.Date := StartOfTheYear(Date);
  dtpFim.Date := Now;
  fdsVendedores.Open;
  cbxVendedor.ItemIndex := 0;
  Pesquisar('TD');
end;

procedure TfrmPesqVendasPedidos.gdrItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsItens.RecNo) then
  begin
    gdrItens.Canvas.Brush.Color := DM.gridOddColor;
    gdrItens.Canvas.FillRect(Rect);
    gdrItens.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmPesqVendasPedidos.gdrVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsVendasPedidos.RecNo) then
  begin
    gdrVendas.Canvas.Brush.Color := DM.gridOddColor;
    gdrVendas.Canvas.FillRect(Rect);
    gdrVendas.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmPesqVendasPedidos.Pesquisar(tipo: string);
var
  utils: TUtils;
  numVenda: Double;
begin
  with fdsVendasPedidos do
  begin
    Close;
    Conditions.Clear;

    Conditions.AddCondition('DTVENDA', 'DT_INC BETWEEN ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);

    if tipo <> 'TD' then
    begin
      Conditions.AddCondition('TIPO', ' PREFIXO = ' + QuotedStr(tipo), True);
    end;

    if (chkNumVenda.Checked) then
    begin
      numVenda := utils.ValidaInteiroFloat(edtPesqNumVenda.Text, 'I');

      if numVenda > 0 then
        Conditions.AddCondition('NUMERO',
          ' NUMERO = ' + QuotedStr(FloatToStr(numVenda)), True);
    end;

    if (chkCliente.Checked) and not(Trim(edtPesqCliente.Text) = 'TODOS') then
    begin
      Conditions.AddCondition('NOMECLIENTE', 'NOMECLIENTE like UPPER(' +
        QuotedStr(edtPesqCliente.Text + '%') + ')', True);
    end;

    if (chkVendedor.Checked) and not(cbxVendedor.ItemIndex = 0) then
    begin
      if fdsVendedores.RecordCount > 0 then
        Conditions.AddCondition('IDVENDEDOR', 'V.IDVENDEDOR = ' +
          cbxVendedor.Value, True)
    end;

    if (chkEAN.Checked) and not(Trim(edtPesqEan.Text) = 'TODOS') then
    begin
      Conditions.AddCondition('EAN',
        'V.ID IN (SELECT VI.IDVENDA FROM VENDA_ITEM VI, PRODUTO_ITEM PI WHERE VI.IDPROD_ITEM = PI.ID AND PI.COD_FABRICA = '
        + QuotedStr(edtPesqEan.Text) + ')', True);
    end;

    Conditions.Apply;
    Prepare;
    Open;

  end;
end;

procedure TfrmPesqVendasPedidos.rgbStatusChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  if NewIndex = 0 then
    Pesquisar('PD');

  if NewIndex = 1 then
    Pesquisar('VE');

  if NewIndex = 2 then
    Pesquisar('TD');
end;

procedure TfrmPesqVendasPedidos.RzBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
