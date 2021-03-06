unit untComissaoVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, PngImageList, RzDBEdit,
  RzPrgres, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzTabs, Vcl.StdCtrls,
  JvExStdCtrls, JvButton, JvCtrls, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, Vcl.Mask, RzEdit, JvCheckBox, RzCmboBx,
  RzPanel, RzSplit, RzRadGrp, RzButton, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls,
  JvExExtCtrls, JvImage, RzBckgnd, Data.DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, uContador, Vcl.Menus, System.Actions, Vcl.ActnList, frxClass,
  frxDBSet, pFIBClientDataSet, Datasnap.DBClient, Math;

type
  TfrmComissaoVendedor = class(TForm)
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
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    btnInprimir: TRzBitBtn;
    rgbStatus: TRzRadioGroup;
    RzPanel2: TRzPanel;
    btnSair: TRzBitBtn;
    RzSplitter1: TRzSplitter;
    RzPanel4: TRzPanel;
    pnlNumero: TRzGroupBox;
    edtPesqNumero: TRzEdit;
    chkNumero: TJvCheckBox;
    pnlPeriodo: TRzGroupBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    chkPeriodo: TJvCheckBox;
    btnPesquisar: TJvImgBtn;
    pnlVendedor: TRzGroupBox;
    cbxVendedor: TRzComboBox;
    chkVendedor: TJvCheckBox;
    pgcControl: TRzPageControl;
    tbsComissoes: TRzTabSheet;
    gdrComissoes: TJvDBGrid;
    pnlProgresso: TRzGroupBox;
    pgbProgresso: TRzProgressBar;
    tbsItens: TRzTabSheet;
    gdrItens: TJvDBGrid;
    RzPanel3: TRzPanel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel17: TRzLabel;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzLabel2: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    PngImageList1: TPngImageList;
    btnIncluir: TRzBitBtn;
    btnPagar: TRzBitBtn;
    btnRecalc: TRzBitBtn;
    fdsVendedor: TpFIBDataSet;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    qrySomaTotal: TpFIBQuery;
    fdsGrupo: TpFIBDataSet;
    fdsGrupoID: TFIBBCDField;
    fdsGrupoCOMISSAO: TFIBBCDField;
    fdsComissaoVend: TpFIBDataSet;
    fdsComissaoVendID: TFIBBCDField;
    fdsComissaoVendIDFILIAL: TFIBBCDField;
    fdsComissaoVendIDVENDEDOR: TFIBBCDField;
    fdsComissaoVendDT_INC: TFIBDateField;
    fdsComissaoVendDT_INICIAL: TFIBDateField;
    fdsComissaoVendDT_FINAL: TFIBDateField;
    fdsComissaoVendVLR_TOT_VENDAS: TFIBBCDField;
    fdsComissaoVendVLR_COMISSAO: TFIBBCDField;
    fdsComissaoVendNOME: TFIBStringField;
    dsComissaoVend: TDataSource;
    fdsComissaoVendDT_ALT: TFIBDateField;
    fdsComissaoVendPOSICAO: TFIBStringField;
    fdsItensVendidos: TpFIBDataSet;
    dsItensVendidos: TDataSource;
    ppmImprimir: TPopupMenu;
    ActionList1: TActionList;
    impComprovanteSintetico: TAction;
    RelatriodeComissodeVendedores1: TMenuItem;
    frxComissaoVendedores: TfrxDBDataset;
    cdsItensVendidos: TpFIBClientDataSet;
    cdsItensVendidosCOD_FABRICA: TStringField;
    cdsItensVendidosNOME: TStringField;
    cdsItensVendidosIDVENDA: TpFIBClientBCDField;
    cdsItensVendidosQTN: TpFIBClientBCDField;
    cdsItensVendidosVLR_UNITARIO: TpFIBClientBCDField;
    cdsItensVendidosVLR_TOTAL: TFloatField;
    cdsItensVendidosDT_INC: TDateField;
    cdsItensVendidosVLR_COMISSAO: TFloatField;
    cdsItensVendidosITEM: TFloatField;
    impComprovanteAnalitico: TAction;
    frxItensVendidos: TfrxDBDataset;
    ComissocomItens1: TMenuItem;
    fdsItensVendidosCOD_FABRICA: TFIBStringField;
    fdsItensVendidosIDVENDA: TFIBBCDField;
    fdsItensVendidosITEM: TFIBSmallIntField;
    fdsItensVendidosQTN: TFIBBCDField;
    fdsItensVendidosVLR_UNITARIO: TFIBBCDField;
    fdsItensVendidosIDFORMA_PAG: TFIBBCDField;
    fdsItensVendidosVLR_TOTAL: TFIBFloatField;
    fdsItensVendidosDT_INC: TFIBDateField;
    fdsItensVendidosCOMISSAO_DN: TFIBBCDField;
    fdsItensVendidosCOMISSAO_CH: TFIBBCDField;
    fdsItensVendidosCOMISSAO_CT: TFIBBCDField;
    fdsItensVendidosPORCENT_COMISSAO: TFloatField;
    fdsItensVendidosVLR_COMISSAO: TFloatField;
    fdsItensVendidosPREFIXO: TFIBStringField;
    fdsItensVendidosNOMEPRODUTO: TFIBStringField;
    procedure fdsVendedorAfterOpen(DataSet: TDataSet);
    procedure fdsVendedorAfterScroll(DataSet: TDataSet);
    function RetornaComissaoVendedor(idVendedor: Integer;
      dtInicio, dtFim: TDateTime): Double;
    function CalculaTotalVenda(idVendedor: Integer;
      dtInicio, dtFim: TDateTime): Double;
    procedure FormCreate(Sender: TObject);
    procedure Pesquisar(status: string);
    procedure IniciaContador;
    procedure TerminaContador;
    procedure RetornaItensVendidos;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gdrComissoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure chkNumeroClick(Sender: TObject);
    procedure edtPesqNumeroEnter(Sender: TObject);
    procedure edtPesqNumeroExit(Sender: TObject);
    procedure chkPeriodoClick(Sender: TObject);
    procedure chkVendedorClick(Sender: TObject);
    procedure rgbStatusChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure tbsItensShow(Sender: TObject);
    procedure fdsComissaoVendAfterScroll(DataSet: TDataSet);
    procedure btnPagarClick(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnInprimirClick(Sender: TObject);
    procedure impComprovanteSinteticoExecute(Sender: TObject);
    procedure impComprovanteAnaliticoExecute(Sender: TObject);
    procedure fdsItensVendidosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComissaoVendedor: TfrmComissaoVendedor;
  TrheadContador: TContador;
  imprimir: Boolean;
  tempo: Integer;

implementation

{$R *.dfm}

uses untData, untGerarComissao, uUtils;

procedure TfrmComissaoVendedor.btnFirstClick(Sender: TObject);
begin
  fdsComissaoVend.Prior;
end;

procedure TfrmComissaoVendedor.btnIncluirClick(Sender: TObject);
begin
  try
    frmGerarComissao := TfrmGerarComissao.Create(nil);
    frmGerarComissao.cbxVendedor.Items := cbxVendedor.Items;
    frmGerarComissao.cbxVendedor.Values := cbxVendedor.Values;
    frmGerarComissao.cbxVendedor.DeleteItemValue(0);
    frmGerarComissao.cbxVendedor.ItemIndex := 0;
    frmGerarComissao.ShowModal;
  finally
    if frmGerarComissao.ModalResult = mrOk then
    begin
      IniciaContador;
      fdsComissaoVend.Append;
      fdsComissaoVendIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
      fdsComissaoVendIDVENDEDOR.AsString := frmGerarComissao.cbxVendedor.Value;
      fdsComissaoVendDT_INICIAL.AsDateTime := frmGerarComissao.dtpInicio.Date;
      fdsComissaoVendDT_FINAL.AsDateTime := frmGerarComissao.dtpFim.Date;
      fdsComissaoVendVLR_TOT_VENDAS.AsFloat :=
        CalculaTotalVenda(fdsComissaoVendIDVENDEDOR.AsInteger,
        fdsComissaoVendDT_INICIAL.AsDateTime,
        fdsComissaoVendDT_FINAL.AsDateTime);
      fdsComissaoVendVLR_COMISSAO.AsFloat :=
        RetornaComissaoVendedor(fdsComissaoVendIDVENDEDOR.AsInteger,
        fdsComissaoVendDT_INICIAL.AsDateTime,
        fdsComissaoVendDT_FINAL.AsDateTime);
      fdsComissaoVend.Post;
      DM.Conexao.CommitRetaining;
      fdsComissaoVend.Close;
      fdsComissaoVend.Open;
      TerminaContador;
    end;
    frmGerarComissao.FreeOnRelease;
  end;
end;

procedure TfrmComissaoVendedor.btnInprimirClick(Sender: TObject);
begin
  ppmImprimir.Popup(frmComissaoVendedor.Left + 394,
    frmComissaoVendedor.top + 114);
end;

procedure TfrmComissaoVendedor.btnLastClick(Sender: TObject);
begin
  fdsComissaoVend.Last;
end;

procedure TfrmComissaoVendedor.btnNextClick(Sender: TObject);
begin
  fdsComissaoVend.Next;
end;

procedure TfrmComissaoVendedor.btnPagarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle,
    Pchar('Confirma o pagamento desta comiss�o?'), 'Aten��o',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        fdsComissaoVend.Edit;
        fdsComissaoVendPOSICAO.AsString := 'PG';
        fdsComissaoVendDT_ALT.AsDateTime := Now;
        fdsComissaoVend.Post;
        DM.Conexao.CommitRetaining;
        Application.MessageBox('Comiss�o paga com sucesso!', 'Sucesso',
          MB_OK + MB_ICONINFORMATION);
      end;
  End;
end;

procedure TfrmComissaoVendedor.btnPesquisarClick(Sender: TObject);
begin
  IniciaContador;

  if rgbStatus.ItemIndex = 0 then
    Pesquisar('AB')
  else if rgbStatus.ItemIndex = 1 then
    Pesquisar('PG')
  else
    Pesquisar('TD');

  TerminaContador;
end;

procedure TfrmComissaoVendedor.btnPriorClick(Sender: TObject);
begin
  fdsComissaoVend.First;
end;

procedure TfrmComissaoVendedor.btnRecalcClick(Sender: TObject);
begin
  try
    frmGerarComissao := TfrmGerarComissao.Create(nil);
    frmGerarComissao.cbxVendedor.Items := cbxVendedor.Items;
    frmGerarComissao.cbxVendedor.Values := cbxVendedor.Values;
    frmGerarComissao.cbxVendedor.Value := fdsComissaoVendIDVENDEDOR.AsString;
    frmGerarComissao.cbxVendedor.Enabled := False;
    frmGerarComissao.dtpInicio.Date := fdsComissaoVendDT_INICIAL.AsDateTime;
    frmGerarComissao.dtpFim.Date := fdsComissaoVendDT_FINAL.AsDateTime;
    frmGerarComissao.ShowModal;
  finally
    if frmGerarComissao.ModalResult = mrOk then
    begin
      IniciaContador;
      fdsComissaoVend.Edit;
      fdsComissaoVendDT_INICIAL.AsDateTime := frmGerarComissao.dtpInicio.Date;
      fdsComissaoVendDT_FINAL.AsDateTime := frmGerarComissao.dtpFim.Date;
      fdsComissaoVendVLR_TOT_VENDAS.AsFloat :=
        CalculaTotalVenda(fdsComissaoVendIDVENDEDOR.AsInteger,
        fdsComissaoVendDT_INICIAL.AsDateTime,
        fdsComissaoVendDT_FINAL.AsDateTime);
      fdsComissaoVendVLR_COMISSAO.AsFloat :=
        RetornaComissaoVendedor(fdsComissaoVendIDVENDEDOR.AsInteger,
        fdsComissaoVendDT_INICIAL.AsDateTime,
        fdsComissaoVendDT_FINAL.AsDateTime);
      fdsComissaoVend.Post;
      DM.Conexao.CommitRetaining;
      fdsComissaoVend.Close;
      fdsComissaoVend.Open;
      TerminaContador;
    end;
    frmGerarComissao.FreeOnRelease;
  end;
end;

procedure TfrmComissaoVendedor.btnSairClick(Sender: TObject);
begin
  frmComissaoVendedor.Close;
end;

procedure TfrmComissaoVendedor.btnTodosClick(Sender: TObject);
begin
  fdsComissaoVend.Close;
  fdsComissaoVend.Conditions.Clear;
  fdsComissaoVend.Conditions.Apply;
  fdsComissaoVend.Open;
end;

function TfrmComissaoVendedor.CalculaTotalVenda(idVendedor: Integer;
  dtInicio, dtFim: TDateTime): Double;
var
  vltTotVenda: Double; // Somente dos itens que possuem porcentagem
begin
  // with qrySomaTotal do
  // begin
  // Close;
  // SQL.Clear;
  // SQL.Add('SELECT SUM(V.VLR_TOTAL - V.VLR_RETORNADO) AS TOTAL FROM VENDA V WHERE V.IDVENDEDOR = :IDVENDEDOR');
  // SQL.Add(' AND V.DT_INC BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicio)) + ' AND ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFim)));
  // SQL.Add(' AND V.STATUS <> ' + QuotedStr('AB') + ' AND V.STATUS <> ' + QuotedStr('CA') + ' AND V.STATUS <> ' + QuotedStr('DV'));
  // SQL.Add(' AND V.ID NOT IN (SELECT IDVENDA FROM CNT_RECEBER WHERE POSICAO = ' + QuotedStr('AB')+ ')');
  // ParamByName('IDVENDEDOR').AsInteger := idVendedor;
  // Prepare;
  // ExecQuery;
  // end;

  vltTotVenda := 0;

  // fdsGrupo.Open;
  // fdsGrupo.First;
  //
  // while not(fdsGrupo.Eof) do
  // begin
  // with qrySomaTotal do
  // begin
  // Close;
  // SQL.Clear;
  // SQL.Add('SELECT SUM(((VI.QTN - VI.QTN_RETORNO) * VI.VLR_UNITARIO)) AS VLR_VENDIDO');
  // SQL.Add(' FROM VENDA_ITEM VI, VENDA V, PRODUTO_ITEM PI, PRODUTO P, GRUPO G');
  // SQL.Add(' WHERE VI.IDPROD_ITEM = PI.ID');
  // SQL.Add(' AND VI.IDVENDA = V.ID');
  // SQL.Add(' AND VI.IDFILIAL = V.IDFILIAL');
  // SQL.Add(' AND P.IDGRUPO = G.ID');
  // SQL.Add(' AND P.ID = PI.IDPRODUTO');
  // SQL.Add(' AND G.ID = :IDGRUPO');
  // SQL.Add(' AND V.IDFILIAL = :IDFILIAL');
  // SQL.Add(' AND V.IDVENDEDOR = :IDVENDEDOR');
  // SQL.Add(' AND V.STATUS <> ' + QuotedStr('AB') + ' AND V.STATUS <> ' + QuotedStr('CA')+ ' AND V.STATUS <> ' + QuotedStr('DV'));
  // SQL.Add(' AND V.DT_INC BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicio)) + ' AND ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFim)));
  // SQL.Add(' AND G.COMISSAO > 0');
  // SQL.Add(' AND V.ID NOT IN (SELECT IDVENDA FROM CNT_RECEBER WHERE POSICAO = ' + QuotedStr('AB')+ ')');
  // ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  // ParamByName('IDVENDEDOR').AsInteger := idVendedor;
  // ParamByName('IDGRUPO').AsInteger := fdsGrupoID.AsInteger;
  // Prepare;
  // ExecQuery;
  // vltTotVenda := vltTotVenda + qrySomaTotal.FieldByName('VLR_VENDIDO').AsFloat;
  // end;
  // fdsGrupo.Next;
  // end;
  //
  //
  // fdsGrupo.First;
  //
  // while not(fdsGrupo.Eof) do
  // begin
  // with qrySomaTotal do
  // begin
  // Close;
  // SQL.Clear;
  // SQL.Add('SELECT SUM(((VI.QTN - VI.QTN_RETORNO) * VI.VLR_UNITARIO)) AS VLR_VENDIDO');
  // SQL.Add(' FROM VENDA_ITEM VI, VENDA V, PRODUTO_ITEM PI, PRODUTO P, GRUPO G');
  // SQL.Add(' WHERE VI.IDPROD_ITEM = PI.ID');
  // SQL.Add(' AND VI.IDVENDA = V.ID');
  // SQL.Add(' AND VI.IDFILIAL = V.IDFILIAL');
  // SQL.Add(' AND P.IDGRUPO = G.ID');
  // SQL.Add(' AND P.ID = PI.IDPRODUTO');
  // SQL.Add(' AND G.ID = :IDGRUPO');
  // SQL.Add(' AND V.IDFILIAL = :IDFILIAL');
  // SQL.Add(' AND V.IDVENDEDOR = :IDVENDEDOR');
  // SQL.Add(' AND V.ID IN (SELECT IDVENDA FROM CNT_RECEBER WHERE DT_PAG_FINAL BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicio)) + ' AND ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFim)) + ')');
  // SQL.Add(' AND G.COMISSAO > 0');
  // ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  // ParamByName('IDVENDEDOR').AsInteger := idVendedor;
  // ParamByName('IDGRUPO').AsInteger := fdsGrupoID.AsInteger;
  // Prepare;
  // ExecQuery;
  // vltTotVenda := vltTotVenda + qrySomaTotal.FieldByName('VLR_VENDIDO').AsFloat;
  // end;
  // fdsGrupo.Next;
  // end;

  with qrySomaTotal do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(((VVPI.QTN - VVPI.QTN_RETORNO) * (VVPI.VLR_UNITARIO - VVPI.VLR_DESC_ACRE))) AS VLR_VENDIDO');
    SQL.Add(' FROM V_VENDA_PEDIDO_ITEM VVPI, V_VENDA_PEDIDO VVP, PRODUTO_ITEM PI');
    SQL.Add(' WHERE VVPI.IDPROD_ITEM = PI.ID');
    SQL.Add(' AND VVPI.PREFIXO = VVP.PREFIXO');
    SQL.Add(' AND VVP.NUMERO = VVPI.IDVENDA');
    SQL.Add(' AND VVP.IDFILIAL = VVPI.IDFILIAL');
    SQL.Add(' AND VVP.IDFILIAL = :IDFILIAL');
    SQL.Add(' AND VVP.IDVENDEDOR = :IDVENDEDOR');
    SQL.Add(' AND VVP.STATUS <> ' + QuotedStr('AB') + ' AND VVP.STATUS <> ' +
      QuotedStr('CA') + ' AND VVP.STATUS <> ' + QuotedStr('DV'));
    SQL.Add(' AND VVP.DT_PAGAMENTO BETWEEN ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicio)) + ' AND ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', dtFim)));
    SQL.Add(' AND ((PI.COMISSAO_DN > 0) OR (PI.COMISSAO_CT > 0) OR (PI.COMISSAO_CH > 0)) ');
    ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
    ParamByName('IDVENDEDOR').AsInteger := idVendedor;
    Prepare;
    ExecQuery;
    vltTotVenda := vltTotVenda + qrySomaTotal.FieldByName
      ('VLR_VENDIDO').AsFloat;
  end;

  Result := vltTotVenda;

end;

procedure TfrmComissaoVendedor.chkNumeroClick(Sender: TObject);
begin
  pnlNumero.Enabled := chkNumero.Checked;
  if not(chkNumero.Checked) then
  begin
    edtPesqNumero.Text := 'TODOS';
    edtPesqNumero.Font.Color := clGray;
  end;
end;

procedure TfrmComissaoVendedor.chkPeriodoClick(Sender: TObject);
begin
  pnlPeriodo.Enabled := chkPeriodo.Checked;
end;

procedure TfrmComissaoVendedor.chkVendedorClick(Sender: TObject);
begin
  pnlVendedor.Enabled := chkVendedor.Checked;
  if not(chkVendedor.Checked) then
  begin
    cbxVendedor.ItemIndex := 0;
  end;
end;

procedure TfrmComissaoVendedor.edtPesqNumeroEnter(Sender: TObject);
begin
  if Trim(edtPesqNumero.Text) = 'TODOS' then
  begin
    edtPesqNumero.Text := EmptyStr;
    edtPesqNumero.Font.Color := clBlack;
  end;
end;

procedure TfrmComissaoVendedor.edtPesqNumeroExit(Sender: TObject);
begin
  if Trim(edtPesqNumero.Text) = EmptyStr then
  begin
    edtPesqNumero.Text := 'TODOS';
    edtPesqNumero.Font.Color := clGray;
  end;
end;

procedure TfrmComissaoVendedor.fdsComissaoVendAfterScroll(DataSet: TDataSet);
begin
  if fdsComissaoVendPOSICAO.AsString <> 'AB' then
  begin
    btnRecalc.Enabled := False;
    btnPagar.Enabled := False;
  end
  else
  begin
    btnPagar.Enabled := True;
    btnRecalc.Enabled := True;
  end;

  if (pgcControl.ActivePageIndex = 1) or (imprimir = True) then
  begin
    RetornaItensVendidos;
  end;

end;

procedure TfrmComissaoVendedor.fdsItensVendidosCalcFields(DataSet: TDataSet);
var
  comissaoBase: Double;
begin
  if fdsItensVendidosIDFORMA_PAG.AsInteger = 1 then
  begin
    comissaoBase := RoundTo((fdsItensVendidosCOMISSAO_DN.AsFloat / 100), -4);
    fdsItensVendidosPORCENT_COMISSAO.AsFloat :=
      fdsItensVendidosCOMISSAO_DN.AsFloat;
  end;

  if fdsItensVendidosIDFORMA_PAG.AsInteger = 2 then
  begin
    comissaoBase := RoundTo((fdsItensVendidosCOMISSAO_CT.AsFloat / 100), -4);
    fdsItensVendidosPORCENT_COMISSAO.AsFloat :=
      fdsItensVendidosCOMISSAO_CT.AsFloat;
  end;

  if fdsItensVendidosIDFORMA_PAG.AsInteger = 4 then
  begin
    comissaoBase := RoundTo((fdsItensVendidosCOMISSAO_CH.AsFloat / 100), -4);
    fdsItensVendidosPORCENT_COMISSAO.AsFloat :=
      fdsItensVendidosCOMISSAO_CH.AsFloat;
  end;

  fdsItensVendidosVLR_COMISSAO.AsFloat :=
    RoundTo(fdsItensVendidosVLR_TOTAL.AsFloat * comissaoBase, -2);

end;

procedure TfrmComissaoVendedor.fdsVendedorAfterOpen(DataSet: TDataSet);
begin
  fdsVendedor.First;
  cbxVendedor.ClearItems;
  cbxVendedor.AddItemValue('TODOS', '0');
  while not(fdsVendedor.Eof) do
  begin
    cbxVendedor.AddItemValue(fdsVendedorNOME.AsString, fdsVendedorID.AsString);
    fdsVendedor.Next;
  end;
end;

procedure TfrmComissaoVendedor.fdsVendedorAfterScroll(DataSet: TDataSet);
begin
  if (imprimir = True) then
  begin
    cbxVendedor.Value := fdsVendedorID.AsString;
    Pesquisar('TD');
  end;
end;

procedure TfrmComissaoVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmComissaoVendedor := nil;
end;

procedure TfrmComissaoVendedor.FormCreate(Sender: TObject);
begin
  cdsItensVendidos.CreateDataSet;
  cdsItensVendidos.Open;
  imprimir := False;
  tempo := 0;
  fdsVendedor.Open;
  pgcControl.ActivePageIndex := 0;
  cbxVendedor.ItemIndex := 0;
  IniciaContador;
  Pesquisar('TD');
  TerminaContador;
end;

procedure TfrmComissaoVendedor.gdrComissoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  status: string;
  Bitmap: TBitmap;
begin
  if not odd(fdsComissaoVend.RecNo) then
  begin
    gdrComissoes.Canvas.Brush.Color := DM.gridOddColor;
    gdrComissoes.Canvas.FillRect(Rect);
    gdrComissoes.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.Index = 1) and not(fdsComissaoVend.IsEmpty) then
    begin
      status := fdsComissaoVendPOSICAO.AsString;
      if status = 'AB' then
      begin
        Bitmap := imgFlagYellow2.Picture.Bitmap
      end
      else if status = 'PG' then
        Bitmap := imgFlagGreen2.Picture.Bitmap
      else if status = 'CA' then
        Bitmap := imgFlagRed2.Picture.Bitmap;

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
      status := fdsComissaoVendPOSICAO.AsString;
      if status = 'AB' then
      begin
        Bitmap := imgFlagYellow.Picture.Bitmap
      end
      else if status = 'PG' then
        Bitmap := imgFlagGreen.Picture.Bitmap
      else if status = 'CA' then
        Bitmap := imgFlagRed.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.top - Bitmap.Height) div 2 + Rect.top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;
end;

procedure TfrmComissaoVendedor.impComprovanteAnaliticoExecute(Sender: TObject);
var
  idComissao: string;
begin

  idComissao := fdsComissaoVendID.AsString;

  with fdsComissaoVend do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('ID', 'CV.ID = ' + idComissao, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;

  RetornaItensVendidos;

  DM.frxReport1.Clear;
  DM.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '/Relatorios/frxCompPagComissaoAnl.fr3');
  DM.frxReport1.PrepareReport(True);
  DM.frxReport1.ShowReport(True);

  with fdsComissaoVend do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    Prepare;
    Open;
  end;

  fdsComissaoVend.Locate('ID', idComissao, []);
end;

procedure TfrmComissaoVendedor.impComprovanteSinteticoExecute(Sender: TObject);
var
  idComissao: string;
begin

  idComissao := fdsComissaoVendID.AsString;

  with fdsComissaoVend do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('ID', 'CV.ID = ' + idComissao, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;

  DM.frxReport1.Clear;
  DM.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '/Relatorios/frxComprovantePagComissao.fr3');
  DM.frxReport1.PrepareReport(True);
  DM.frxReport1.ShowReport(True);

  with fdsComissaoVend do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    Prepare;
    Open;
  end;

  fdsComissaoVend.Locate('ID', idComissao, []);

end;

procedure TfrmComissaoVendedor.IniciaContador;
begin
  tempo := 0;
  pnlProgresso.Visible := True;
  TrheadContador := TContador.Create(True);
  // TrheadContador.FreeOnTerminate := True;
  TrheadContador.Resume;
end;

procedure TfrmComissaoVendedor.Pesquisar(status: string);
var
  numComissao: Double;
  utils: TUtils;
begin
  fdsComissaoVend.Close;
  tbsComissoes.Show;

  with fdsComissaoVend do
  begin
    Close;
    Conditions.Clear;

    if (chkNumero.Checked) then
    begin
      numComissao := utils.ValidaInteiroFloat(edtPesqNumero.Text, 'I');

      if numComissao > 0 then
        Conditions.AddCondition('ID',
          ' CV.ID = ' + QuotedStr(FloatToStr(numComissao)), True);
    end;

    if (chkPeriodo.Checked) then
      Conditions.AddCondition('DTINC', 'CV.DT_INC BETWEEN ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpInicio.Date)) + ' AND ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtpFim.Date)), True);

    if (chkVendedor.Checked) and not(cbxVendedor.ItemIndex = 0) then
    begin
      Conditions.AddCondition('IDVENDEDOR', 'CV.IDVENDEDOR = ' +
        cbxVendedor.Value, True);
    end;

    if status <> 'TD' then
      Conditions.AddCondition('POSICAO', 'CV.POSICAO = ' +
        QuotedStr(status), True);

    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

function TfrmComissaoVendedor.RetornaComissaoVendedor(idVendedor: Integer;
  dtInicio, dtFim: TDateTime): Double;
const
  formaPagamentoIDs: array [0 .. 2] of string = ('1', '2', '4');
  nomeCampoComissao: array [0 .. 2] of string = ('COMISSAO_DN', 'COMISSAO_CT',
    'COMISSAO_CH');
var
  vltTotComissao: Double;
  i: Integer;
begin
  vltTotComissao := 0;

  for i := 0 to 2 do
  begin
    with qrySomaTotal do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(((VVPI.QTN - VVPI.QTN_RETORNO) * (VVPI.VLR_UNITARIO - VVPI.VLR_DESC_ACRE)) * (PI.'
        + nomeCampoComissao[i] + ' / 100)) AS VLR_COMISSAO');
      // vitor O desconto da venda ter� que ser rateado como desconto do item, e o desconto no recebimento da nota tbm, depois multiplicar pelo valor da comiss�o baseado na moeda de pagamento
      SQL.Add(' FROM V_VENDA_PEDIDO_ITEM VVPI, V_VENDA_PEDIDO VVP, PRODUTO_ITEM PI');
      SQL.Add(' WHERE PI.ID = VVPI.IDPROD_ITEM');
      SQL.Add(' AND VVPI.IDVENDA = VVP.NUMERO');
      SQL.Add(' AND VVPI.IDFILIAL = VVP.IDFILIAL');
      SQL.Add(' AND VVPI.PREFIXO = VVP.PREFIXO');
      SQL.Add(' AND VVP.IDFILIAL = :IDFILIAL');
      SQL.Add(' AND VVP.IDFORMA_PAG = :IDFORMA_PAG');
      SQL.Add(' AND VVP.IDVENDEDOR = :IDVENDEDOR');
      SQL.Add(' AND VVP.STATUS <> ' + QuotedStr('AB') + ' AND VVP.STATUS <> ' +
        QuotedStr('CA') + ' AND VVP.STATUS <> ' + QuotedStr('DV'));
      SQL.Add(' AND VVP.DT_PAGAMENTO BETWEEN ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicio)) + ' AND ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY', dtFim)));
      SQL.Add(' AND PI.' + nomeCampoComissao[i] + ' > 0');
      ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
      ParamByName('IDVENDEDOR').AsInteger := idVendedor;
      ParamByName('IDFORMA_PAG').AsString := formaPagamentoIDs[i];
      Prepare;
      ExecQuery;
      vltTotComissao := vltTotComissao + qrySomaTotal.FieldByName
        ('VLR_COMISSAO').AsFloat;
    end;
  end;

  Result := vltTotComissao;
end;

procedure TfrmComissaoVendedor.RetornaItensVendidos;
var
  total: Double;
begin
  total := 0;
  IniciaContador;
  cdsItensVendidos.EmptyDataSet;
  if fdsComissaoVend.RecordCount > 0 then
  begin
    with fdsItensVendidos do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('IDFILIAL', ' VVP.IDFILIAL = ' +
        DM.fdsConfigIDFILIAL.AsString, True);
      Conditions.AddCondition('VENDEDOR', ' VVP.IDVENDEDOR = ' +
        fdsComissaoVendIDVENDEDOR.AsString, True);
      Conditions.AddCondition('VENDAFECHADA', ' VVP.DT_PAGAMENTO BETWEEN ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY',
        fdsComissaoVendDT_INICIAL.AsDateTime)) + ' AND ' +
        QuotedStr(FormatDateTime('MM/DD/YYYY',
        fdsComissaoVendDT_FINAL.AsDateTime)), True);
      Conditions.Apply;
      Prepare;
      Open;
      First;

      // while not(Eof) do
      // begin
      // if fdsItensVendidosPORCENT_COMISSAO.AsFloat > 0 then
      // total := total + fdsItensVendidosVLR_TOTAL.AsFloat;
      // Next;
      // end;
      // ShowMessage(FloatToStr(total));
    end;

    // while not(fdsItensVendidos.Eof) do
    // begin
    // cdsItensVendidos.Append;
    // cdsItensVendidosCOD_FABRICA.AsString := fdsItensVendidosCOD_FABRICA.AsString;
    // cdsItensVendidosNOME.AsString := fdsItensVendidosNOME.AsString;
    // cdsItensVendidosIDVENDA.AsInteger := fdsItensVendidosIDVENDA.AsInteger;
    // cdsItensVendidosITEM.AsFloat := fdsItensVendidosITEM.AsFloat;
    // cdsItensVendidosQTN.AsFloat := fdsItensVendidosQTN.AsFloat;
    // cdsItensVendidosVLR_UNITARIO.AsFloat := fdsItensVendidosVLR_UNITARIO.AsFloat;
    // cdsItensVendidosVLR_TOTAL.AsFloat := fdsItensVendidosVLR_TOTAL.AsFloat;
    // cdsItensVendidosDT_INC.AsDateTime := fdsItensVendidosDT_INC.AsDateTime;
    // cdsItensVendidosVLR_COMISSAO.AsFloat := fdsItensVendidosVLR_COMISSAO.AsFloat;
    // cdsItensVendidosCOMISSAO.AsFloat := fdsItensVendidosCOMISSAO.AsFloat;
    // cdsItensVendidos.Post;
    // fdsItensVendidos.Next;
    // end;

    // with fdsItensVendidos do
    // begin
    // Close;
    // Conditions.Clear;
    // Conditions.AddCondition('VENDEDOR', ' V.IDVENDEDOR = ' + fdsComissaoVendIDVENDEDOR.AsString, True);
    // Conditions.AddCondition('CONTAPAGA', ' V.ID IN (SELECT IDVENDA FROM CNT_RECEBER WHERE DT_PAG_FINAL BETWEEN ' + QuotedStr(FormatDateTime('MM/DD/YYYY', fdsComissaoVendDT_INICIAL.AsDateTime)) + ' AND ' + QuotedStr(FormatDateTime('MM/DD/YYYY', fdsComissaoVendDT_FINAL.AsDateTime)) + ')', True);
    // Conditions.Apply;
    // Prepare;
    // Open;
    // First;
    // end;
    //
    // while not(fdsItensVendidos.Eof) do
    // begin
    /// /      if not(cdsItensVendidos.Locate('IDVENDA; ITEM', VarArrayOf([fdsItensVendidosIDVENDA.AsString, fdsItensVendidosITEM.AsString]), [])) then
    /// /      begin
    // cdsItensVendidos.Append;
    // cdsItensVendidosCOD_FABRICA.AsString := fdsItensVendidosCOD_FABRICA.AsString;
    // cdsItensVendidosNOME.AsString := fdsItensVendidosNOME.AsString;
    // cdsItensVendidosIDVENDA.AsInteger := fdsItensVendidosIDVENDA.AsInteger;
    // cdsItensVendidosITEM.AsFloat := fdsItensVendidosITEM.AsFloat;
    // cdsItensVendidosQTN.AsFloat := fdsItensVendidosQTN.AsFloat;
    // cdsItensVendidosVLR_UNITARIO.AsFloat := fdsItensVendidosVLR_UNITARIO.AsFloat;
    // cdsItensVendidosVLR_TOTAL.AsFloat := fdsItensVendidosVLR_TOTAL.AsFloat;
    // cdsItensVendidosDT_INC.AsDateTime := fdsItensVendidosDT_INC.AsDateTime;
    // cdsItensVendidosVLR_COMISSAO.AsFloat := fdsItensVendidosVLR_COMISSAO.AsFloat;
    // cdsItensVendidosCOMISSAO.AsFloat := fdsItensVendidosCOMISSAO.AsFloat;
    // cdsItensVendidos.Post;
    // // end;
    // fdsItensVendidos.Next;
    // end;

  end;
  TerminaContador;
end;

procedure TfrmComissaoVendedor.rgbStatusChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  if NewIndex = 0 then
    Pesquisar('AB');

  if NewIndex = 1 then
    Pesquisar('PG');

  if NewIndex = 2 then
    Pesquisar('TD');
end;

procedure TfrmComissaoVendedor.tbsItensShow(Sender: TObject);
begin
  RetornaItensVendidos;
end;

procedure TfrmComissaoVendedor.TerminaContador;
begin
  TrheadContador.Terminate();
  pnlProgresso.Visible := False;
  pgbProgresso.Percent := 0;
  tempo := 0;
end;

end.
