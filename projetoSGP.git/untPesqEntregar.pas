unit untPesqEntregar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Mask, RzEdit, RzButton, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, RzBckgnd, Vcl.Imaging.pngimage,
  Datasnap.DBClient, Datasnap.Provider, RzCmboBx;

type
  TfrmPesqEntregar = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    btnTodos: TRzBitBtn;
    btnPesquisar: TRzBitBtn;
    edtNome: TRzEdit;
    gdrEntregar: TJvDBGrid;
    dsEntregar: TDataSource;
    fdsEntregar: TpFIBDataSet;
    RzLabel1: TRzLabel;
    edtNumero: TRzEdit;
    cdsEntregarBAckUp: TClientDataSet;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField2: TIntegerField;
    StringField7: TStringField;
    cdsEntregar: TClientDataSet;
    dspEntregar: TDataSetProvider;
    fdsEntregarNUMERO: TFIBBCDField;
    fdsEntregarIDFILIAL: TFIBBCDField;
    fdsEntregarSTATUS: TFIBStringField;
    fdsEntregarNOMEFILIAL: TFIBStringField;
    fdsEntregarDT_INC: TFIBDateField;
    fdsEntregarIDCLIENTE: TFIBBCDField;
    fdsEntregarNOMECLIENTE: TFIBStringField;
    fdsEntregarIDVENDEDOR: TFIBBCDField;
    fdsEntregarNOMEVENDEDOR: TFIBStringField;
    fdsEntregarIDFORMA_PAG: TFIBBCDField;
    fdsEntregarNOMEFORMA_PAG: TFIBStringField;
    fdsEntregarIDCIDADE: TFIBBCDField;
    fdsEntregarNOMECIDADE: TFIBStringField;
    fdsEntregarIDROTA: TFIBBCDField;
    fdsEntregarVLR_TOTAL: TFIBBCDField;
    fdsEntregarPREFIXO: TFIBStringField;
    fdsEntregarPESO: TFIBBCDField;
    fdsEntregarSELECIONAR: TFIBStringField;
    fdsEntregarSEL: TFIBStringField;
    fdsEntregarID: TIntegerField;
    cdsEntregarNUMERO: TBCDField;
    cdsEntregarIDFILIAL: TBCDField;
    cdsEntregarSTATUS: TStringField;
    cdsEntregarNOMEFILIAL: TStringField;
    cdsEntregarDT_INC: TDateField;
    cdsEntregarIDCLIENTE: TBCDField;
    cdsEntregarNOMECLIENTE: TStringField;
    cdsEntregarIDVENDEDOR: TBCDField;
    cdsEntregarNOMEVENDEDOR: TStringField;
    cdsEntregarIDFORMA_PAG: TBCDField;
    cdsEntregarNOMEFORMA_PAG: TStringField;
    cdsEntregarIDCIDADE: TBCDField;
    cdsEntregarNOMECIDADE: TStringField;
    cdsEntregarIDROTA: TBCDField;
    cdsEntregarVLR_TOTAL: TBCDField;
    cdsEntregarPREFIXO: TStringField;
    cdsEntregarPESO: TBCDField;
    cdsEntregarSELECIONAR: TStringField;
    cdsEntregarSEL: TStringField;
    cdsEntregarID: TIntegerField;
    cbxVendedor: TRzComboBox;
    fdsVendedor: TpFIBDataSet;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    procedure RetornaEntregar;
    procedure RetornaEntregarTodas;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gdrEntregarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure fdsEntregarAfterOpen(DataSet: TDataSet);
    procedure gdrEntregarCellClick(Column: TColumn);
    procedure fdsVendedorAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure cbxVendedorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idRota: Integer;
  end;

var
  frmPesqEntregar: TfrmPesqEntregar;

implementation

uses untLogin, untData, uUtils;

{$R *.dfm}

procedure TfrmPesqEntregar.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqEntregar.btnPesquisarClick(Sender: TObject);
begin
  RetornaEntregar;
end;

procedure TfrmPesqEntregar.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqEntregar.btnTodosClick(Sender: TObject);
begin
  edtNome.Clear;
  edtNumero.Text := '0';
  cbxVendedor.ItemIndex := 0;
  RetornaEntregarTodas;
end;

procedure TfrmPesqEntregar.cbxVendedorChange(Sender: TObject);
begin
  RetornaEntregar;
end;

procedure TfrmPesqEntregar.edtNomeChange(Sender: TObject);
begin
  RetornaEntregar;
end;

procedure TfrmPesqEntregar.fdsEntregarAfterOpen(DataSet: TDataSet);
begin
  // cdsEntregar.EmptyDataSet;
  // fdsEntregar.First;
  // while not(fdsEntregar.Eof) do
  // begin
  // cdsEntregar.Append;
  // cdsEntregarPrefixo.AsString := fdsEntregarPREFIXO.AsString;
  // cdsEntregarNumero.AsInteger := fdsEntregarNUMERO.AsInteger;
  // cdsEntregarStatus.AsString := fdsEntregarSTATUS.AsString;
  // cdsEntregarCliente.AsString := fdsEntregarNOMECLIENTE.AsString;
  // cdsEntregarVlr_Total.AsFloat := fdsEntregarVLR_TOTAL.AsFloat;
  // cdsEntregarPeso.AsFloat := fdsEntregarPESO.AsFloat;
  // cdsEntregarFilial.AsString := fdsEntregarNOMEFILIAL.AsString;
  // cdsEntregarIdFilial.AsInteger := fdsEntregarIDFILIAL.AsInteger;
  // cdsEntregarCidade.AsString := fdsEntregarNOMECIDADE.AsString;
  // cdsEntregar.Post;
  // fdsEntregar.Next;
  // end;
  // cdsEntregar.First;
end;

procedure TfrmPesqEntregar.fdsVendedorAfterOpen(DataSet: TDataSet);
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

procedure TfrmPesqEntregar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btnSelecionar.Click;
  end;
end;

procedure TfrmPesqEntregar.FormShow(Sender: TObject);
begin
  fdsVendedor.Open;
  edtNome.SetFocus;
  // cdsEntregar.CreateDataSet;
  RetornaEntregarTodas;

  if fdsEntregar.RecordCount = 0 then
  begin
    Application.MessageBox
      ('Nenhum Pedido, Venda ou Transferencia CONFIRMADO para a Região selecionada no Romaneio.',
      'Anteção', MB_OK + MB_ICONERROR);
    btnCancelar.SetFocus;
  end;
end;

procedure TfrmPesqEntregar.gdrEntregarCellClick(Column: TColumn);
begin
  if gdrEntregar.SelectedField.FieldName = 'SEL' then
  begin
    cdsEntregar.Edit;
    if cdsEntregarSELECIONAR.AsString = 'S' then
    begin
      cdsEntregarSELECIONAR.AsString := 'N';
    end
    else
    begin
      cdsEntregarSELECIONAR.AsString := 'S';
    end;
    cdsEntregar.Post;
  end;
end;

procedure TfrmPesqEntregar.gdrEntregarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if not odd(cdsEntregar.RecNo) then
  begin
    gdrEntregar.Canvas.Brush.Color := DM.gridOddColor;
    gdrEntregar.Canvas.FillRect(Rect);
    gdrEntregar.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    gdrEntregar.Canvas.FillRect(Rect);
    Check := 0;

    if cdsEntregarSELECIONAR.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -1, -1);
    DrawFrameControl(gdrEntregar.Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmPesqEntregar.RetornaEntregar;
var
  utils: TUtils;
begin
  edtNumero.Text := FloatToStr(utils.ValidaInteiroFloat(edtNumero.Text, 'I'));
  cdsEntregar.Close;
  with fdsEntregar do
  begin
    Close;
    Conditions.Clear;
    if (edtNumero.Text <> '0') and (Trim(edtNumero.Text) <> EmptyStr) then
      Conditions.AddCondition('NUMERO', 'NUMERO = ' + edtNumero.Text, True);

    Conditions.AddCondition('CLIENTE', 'NOMECLIENTE LIKE ' +
      QuotedStr(Trim(edtNome.Text) + '%'), True);
    Conditions.AddCondition('ROTA', 'IDROTA = ' + IntToStr(idRota), True);

    if not(cbxVendedor.Value = '0') then
      Conditions.AddCondition('IDVENDEDOR',
        'IDVENDEDOR = ' + cbxVendedor.Value, True);

    Conditions.Apply;
    Prepare;
    Open;
  end;
  cdsEntregar.Open;
end;

procedure TfrmPesqEntregar.RetornaEntregarTodas;
begin
  cdsEntregar.Close;
  with fdsEntregar do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('ROTA', 'IDROTA = ' + IntToStr(idRota), True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
  cdsEntregar.Open;
end;

end.
