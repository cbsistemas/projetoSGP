unit untPesqPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pFIBClientDataSet, Datasnap.DBClient,
  Datasnap.Provider, FIBDataSet, Data.DB, pFIBDataSet, RzButton, Vcl.DBCtrls,
  RzDBCmbo, RzDBEdit, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzPanel, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls, JvExExtCtrls, JvImage, RzBckgnd;

type
  TfrmPesqPreVenda = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    imgFlagYellow: TImage;
    imgFlagRed: TImage;
    imgFlagGreen: TImage;
    imgFlagYellow2: TImage;
    imgFlagRed2: TImage;
    imgFlagGreen2: TImage;
    pgcControl: TRzPageControl;
    tbsVenda: TRzTabSheet;
    gdrVendas: TJvDBGrid;
    tbsItens: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    lblCidade: TRzLabel;
    lblCodigo: TRzLabel;
    lblDtInc: TRzLabel;
    RzLabel1: TRzLabel;
    lblVendedor: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel2: TRzLabel;
    edtPrefixo: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtID: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    edtIDVendedor: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    gdrVendaItens: TJvDBGrid;
    RzPanel2: TRzPanel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edtQtnItem: TRzDBEdit;
    edtPrecCusto: TRzDBEdit;
    edtPreVenda: TRzDBEdit;
    btnItemGravar: TRzBitBtn;
    btnItemCancelar: TRzBitBtn;
    btnItemAlterar: TRzBitBtn;
    edtItemNome: TRzDBEdit;
    edtItemDesconto: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    btnGravar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnExcluir: TRzBitBtn;
    dsPreVenda: TDataSource;
    fdsPreVenda: TpFIBDataSet;
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
    fdsPreVendaNUM_PROPIO: TFIBIntegerField;
    fdsPreVendaItens: TpFIBDataSet;
    dspPreVendaItens: TpFIBDataSetProvider;
    dsPreVendaItens: TDataSource;
    cdsPreVendaItens: TpFIBClientDataSet;
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
    cdsPreVendaItensCOD_FABRICA: TStringField;
    cdsPreVendaItensSEL: TStringField;
    cdsPreVendaItensCONFIRMADO: TStringField;
    cdsPreVendaItensPREC_TAB1: TpFIBClientBCDField;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    btnReimprimir: TRzBitBtn;
    fdsPreVendaItensIDPREVENDA: TFIBBCDField;
    fdsPreVendaItensITEM: TFIBSmallIntField;
    fdsPreVendaItensIDPROD_ITEM: TFIBBCDField;
    fdsPreVendaItensDT_INC: TFIBDateField;
    fdsPreVendaItensQTN: TFIBBCDField;
    fdsPreVendaItensVLR_UNITARIO: TFIBBCDField;
    fdsPreVendaItensVLR_DESC: TFIBBCDField;
    fdsPreVendaItensVLR_TOTAL: TFIBBCDField;
    fdsPreVendaItensIDFILIAL: TFIBBCDField;
    fdsPreVendaItensCONFIRMADO: TFIBStringField;
    fdsPreVendaItensNOME: TFIBStringField;
    fdsPreVendaItensCOD_FABRICA: TFIBStringField;
    fdsPreVendaItensPREC_TAB1: TFIBBCDField;
    RzLabel5: TRzLabel;
    RzDBEdit12: TRzDBEdit;
    btnReabrir: TRzBitBtn;
    RzLabel8: TRzLabel;
    fdsPreVendaINFO_ADICINAL: TFIBStringField;
    RzDBMemo1: TRzDBMemo;
    RzLabel6: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure fdsPreVendaAfterScroll(DataSet: TDataSet);
    procedure tbsItensShow(Sender: TObject);
    procedure gdrVendaItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnReimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gdrVendasDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnReabrirClick(Sender: TObject);
  private
    procedure RetornaItens;
  public
    imprimir: Boolean;
  end;

var
  frmPesqPreVenda: TfrmPesqPreVenda;
  ordem: string[4];

implementation

{$R *.dfm}

uses untData, untPrincipal;

procedure TfrmPesqPreVenda.btnCancelarClick(Sender: TObject);
begin
  if fdsPreVendaItens.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('Você está alterando ou incluindo um item, cancele ou grave este item primeiro', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Abort;
  end;
  modalResult := mrCancel;
end;

procedure TfrmPesqPreVenda.btnExcluirClick(Sender: TObject);
begin
  if not(fdsPreVenda.RecordCount = 0) then
  begin
    Case MessageBox(Application.Handle, Pchar('Deseja realmente excluir a Pré-Venda atual?'), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
            idNo: begin
                      Abort;
                   end;
          end;

    RetornaItens;
    cdsPreVendaItens.EmptyDataSet;
    cdsPreVendaItens.Close;
    fdsPreVendaItens.First;

    while not(fdsPreVendaItens.EOF) do
    begin
      fdsPreVendaItens.Delete;
      fdsPreVendaItens.First;
    end;

    DM.conexao.CommitRetaining;
    fdsPreVenda.Delete;
    DM.conexao.CommitRetaining;
    fdsPreVenda.First;
    pgcControl.ActivePageIndex := 0;
  end;
end;

procedure TfrmPesqPreVenda.btnGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqPreVenda.btnReabrirClick(Sender: TObject);
begin
 if fdsPreVenda.RecordCount>0 then
 begin
   editPrevenda:='S';
   statusCaixa := 'VE';
   idPreVenda := frmPesqPreVenda.fdsPreVendaID.AsInteger;
   vlrtotal:= frmPesqPreVenda.fdsPreVendaVLR_TOTAL.AsFloat;

   with frmPrincipal.fdsPreVenda do
   begin
    close;
    ParamByName('ID').AsInteger:= frmPesqPreVenda.fdsPreVendaID.AsInteger;
    prepare;
    open;
   end;

   with frmPrincipal.fdsPreVendaItens do
   begin
    close;
    ParamByName('IDPREVENDA').AsInteger:=frmPesqPreVenda.fdsPreVendaID.AsInteger;
    ParamByName('IDFILIAL').AsInteger:=frmPesqPreVenda.fdsPreVendaIDFILIAL.AsInteger;
    prepare;
    open;
   end;
   totItem:=frmPrincipal.fdsPreVendaItens.RecordCount;
   FreeOnRelease;
   btnCancelarClick(self);
 end;
end;

procedure TfrmPesqPreVenda.btnReimprimirClick(Sender: TObject);
begin
  imprimir := True;
  btnGravar.Click;
end;

procedure TfrmPesqPreVenda.fdsPreVendaAfterScroll(DataSet: TDataSet);
begin
  if (pgcControl.ActivePageIndex = 1) then
    RetornaItens;
end;

procedure TfrmPesqPreVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if cdsPreVendaItens.State in [dsEdit] then
  begin

  end;
end;

procedure TfrmPesqPreVenda.FormCreate(Sender: TObject);
begin
  pgcControl.ActivePageIndex := 0;
  ordem := 'ASC';
  fdsPreVenda.Open;
  fdsPreVenda.First;
  imprimir := False;
end;

procedure TfrmPesqPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
  begin
     btnCancelar.Click;
  end;
end;

procedure TfrmPesqPreVenda.FormShow(Sender: TObject);
begin
  gdrVendas.SetFocus;
end;

procedure TfrmPesqPreVenda.gdrVendaItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(cdsPreVendaItens.RecNo) then
  begin
    gdrVendaItens.Canvas.Brush.Color := DM.gridOddColor;
    gdrVendaItens.Canvas.FillRect(Rect);
    gdrVendaItens.DefaultDrawDataCell(rect,Column.Field,state);
  end;
end;

procedure TfrmPesqPreVenda.gdrVendasDblClick(Sender: TObject);
begin
  pgcControl.ActivePageIndex := 1;
end;

procedure TfrmPesqPreVenda.gdrVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsPreVenda.RecNo) then
  begin
    gdrVendas.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
    gdrVendas.Canvas.Brush.Color:=clHighlight;
    gdrVendas.Canvas.FillRect(Rect);
    gdrVendas.DefaultDrawDataCell(rect,Column.Field,state);
  end;
end;

procedure TfrmPesqPreVenda.RetornaItens;
begin
  if not(fdsPreVenda.RecordCount = 0) then
  begin
    cdsPreVendaItens.Close;
    with fdsPreVendaItens do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('PREVENDAID', 'IDPREVENDA = ' + fdsPreVendaID.AsString, True);
      Conditions.AddCondition('IDFILIAL', 'PVI.IDFILIAL = ' + DM.fdsConfigIDFILIAL.AsString, True);
      Conditions.Apply;
      Prepare;
     // SelectSQL.SaveToFile('d:\teste.slq');
      Open;
    end;
    cdsPreVendaItens.Open;
  end;
end;

procedure TfrmPesqPreVenda.tbsItensShow(Sender: TObject);
begin
  if not(fdsPreVenda.IsEmpty) then
    RetornaItens;
end;

end.
