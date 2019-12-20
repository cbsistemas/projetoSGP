unit untPesqProdutoItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Mask, RzEdit, RzButton, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, RzBckgnd, RzRadGrp, RzRadChk,
  Vcl.Imaging.pngimage, pFIBClientDataSet, Datasnap.DBClient, Datasnap.Provider;

type
  TfrmPesqProdutoItens = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    btnTodos: TRzBitBtn;
    RzPanel2: TRzPanel;
    btnSelecionar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsProdutoItens: TpFIBDataSet;
    dsProdutoItens: TDataSource;
    fdsProdutoItensID: TFIBBCDField;
    fdsProdutoItensNOME: TFIBStringField;
    fdsProdutoItensREFERENCIA: TFIBStringField;
    fdsProdutoItensIDTAMANHO: TFIBBCDField;
    fdsProdutoItensIDCOR: TFIBBCDField;
    fdsProdutoItensPESO: TFIBBCDField;
    fdsProdutoItensPREC_VENDA: TFIBBCDField;
    fdsProdutoItensIDPRODUTO: TFIBBCDField;
    fdsTabelaPreco: TpFIBDataSet;
    fdsTabelaPrecoID: TFIBBCDField;
    fdsTabelaPrecoDESCRICAO1: TFIBStringField;
    fdsTabelaPrecoDESCRICAO2: TFIBStringField;
    fdsTabelaPrecoDESCRICAO3: TFIBStringField;
    fdsTabelaPrecoDESCRICAO4: TFIBStringField;
    fdsTabelaPrecoDESCRICAO5: TFIBStringField;
    fdsTabelaPrecoDESCRICAO6: TFIBStringField;
    fdsTabelaPrecoPDV_DES1: TFIBStringField;
    fdsTabelaPrecoPDV_DES2: TFIBStringField;
    fdsTabelaPrecoPDV_DES3: TFIBStringField;
    fdsTabelaPrecoPDV_DES4: TFIBStringField;
    fdsTabelaPrecoPDV_DES5: TFIBStringField;
    fdsTabelaPrecoPDV_DES6: TFIBStringField;
    fdsProdutoItensPREC_TAB1: TFIBBCDField;
    fdsProdutoItensPREC_TAB2: TFIBBCDField;
    fdsProdutoItensPREC_TAB3: TFIBBCDField;
    fdsProdutoItensPREC_TAB4: TFIBBCDField;
    fdsProdutoItensPREC_TAB5: TFIBBCDField;
    fdsProdutoItensPREC_TAB6: TFIBBCDField;
    fdsProdutoItensSALDO: TFIBBCDField;
    fdsProdutoItensDT_INC: TFIBDateField;
    fdsProdutoItensDT_ALT: TFIBDateField;
    fdsProdutoItensSTATUS: TFIBStringField;
    fdsProdutoItensPREC_CUSTO: TFIBBCDField;
    fdsProdutoItensENVIADO_WEB: TFIBStringField;
    fdsProdutoItensCOD_FABRICA: TFIBStringField;
    fdsProdutoItensPREC_ULTIMO_CUSTO: TFIBBCDField;
    fdsProdutoItensDT_VALIDADE: TFIBDateField;
    fdsProdutoItensMARGEM_LUCRO: TFIBBCDField;
    fdsProdutoItensDESC_MAX1: TFIBBCDField;
    fdsProdutoItensDESC_MAX2: TFIBBCDField;
    edtNome: TRzEdit;
    fdsProdutoItensCOD_FABRICANTE: TFIBStringField;
    fdsProdutoItensCOMISSAO_DN: TFIBBCDField;
    fdsProdutoItensCOMISSAO_CH: TFIBBCDField;
    fdsProdutoItensCOMISSAO_CT: TFIBBCDField;
    fdsProdutoItensUNIDADE: TFIBStringField;
    fdsProdutoItensIDITEM: TFIBBCDField;
    fdsProdutoItensIDFILIAL: TFIBBCDField;
    fdsProdutoItensSALDO_GERENCIAL: TFIBBCDField;
    fdsProdutoItensSALDO_MINIMO: TFIBBCDField;
    fdsProdutoItensENVIADO_WEB1: TFIBStringField;
    fdsProdutoItensCFOP: TFIBStringField;
    fdsProdutoItensCSOSN: TFIBStringField;
    fdsProdutoItensUTILIZA_BALANCA: TFIBStringField;
    fdsProdutoItensDESC_MAX3: TFIBBCDField;
    fdsProdutoItensDESC_MAX4: TFIBBCDField;
    fdsTabelaPrecoDESC_MAX_PORCENT1: TFIBBCDField;
    fdsTabelaPrecoDESC_MAX_PORCENT2: TFIBBCDField;
    fdsTabelaPrecoDESC_MAX_PORCENT3: TFIBBCDField;
    fdsTabelaPrecoDESC_MAX_PORCENT4: TFIBBCDField;
    fdsTabelaPrecoDESC_MAX_PORCENT5: TFIBBCDField;
    fdsTabelaPrecoDESC_MAX_PORCENT6: TFIBBCDField;
    fdsProdutoItensIDENTIFICADOR: TFIBIntegerField;
    fdsProdutoItensCST_PIS: TFIBStringField;
    fdsProdutoItensCST_COFINS: TFIBStringField;
    fdsProdutoItensALQ_IPI: TFIBBCDField;
    fdsProdutoItensALIQ_ICMS: TFIBFloatField;
    fdsProdutoItensIDGRUPO: TFIBBCDField;
    fdsProdutoItensPREC_CUSTO_MEDIO: TFIBBCDField;
    Panel1: TPanel;
    gdrItens: TJvDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VerificaTabelaPreco;
    procedure btnTodosClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure gdrItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure gdrItensDblClick(Sender: TObject);
    procedure edtNomeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Pesquisar;
  private
    { Private declarations }
  procedure SelectValoresTabelas(Tabela:Integer);
  public
    var
      precUnitario, vlrDescMax : Double;
      letra:String;
  end;

var
  frmPesqProdutoItens: TfrmPesqProdutoItens;

implementation

uses untData, untPrincipal, untMensagens, uVerificaPermicao;

{$R *.dfm}

procedure TfrmPesqProdutoItens.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqProdutoItens.btnSelecionarClick(Sender: TObject);
var
  temPermicao : Boolean;
  uVerificaPermicao : TVerificaPermicao;
  selecionouTabela : Boolean;
begin
  if fdsProdutoItens.RecordCount > 0 then
  begin
    //Verifica se Estoque zerado, para não realização de venda de produto zerado
    if Dm.fdsConfigN_VENDA_ESTOQUE_ZERO.AsString ='S' then
    begin
      if fdsProdutoItensSALDO.AsFloat <=0 then
      begin
        if (TfrmMensagens.Mensagem('Esse produto foi identificado com estoque zerado. Deseja continuar?',
          'Estoque Vazio.','Z',[mbSim,mbNao])) then
        begin
          temPermicao := uVerificaPermicao.Verifica('ESTOQUE_ZERADO_VENDER');

          if temPermicao = false then
          begin
            TFrmMensagens.Mensagem('Desculpe,Usuário sem permissão para vender produtos com estoque zerado.', 'Sem permissão.','I',[mbOK]);
            Abort;
          end;
        end
        else
        begin
          abort;
        end;
      end;
    end;
    //verifica Tabela de preços
    if DM.fdsConfigUTILIZAR_TABELA_PRECO.AsString = 'S' then
    begin
      selecionouTabela := False;

      if DM.fdsCaixaTAB_PRECO.AsInteger=1 then
      begin
        if fdsProdutoItensPREC_TAB1.AsFloat >0 then
        begin
          precUnitario := fdsProdutoItensPREC_TAB1.AsFloat;
          if fdsProdutoItensDESC_MAX1.AsFloat>0 then
          vlrDescMax := fdsProdutoItensDESC_MAX1.AsFloat
          else
           vlrDescMax :=fdsTabelaPrecoDESC_MAX_PORCENT1.AsFloat;
        end
        else
        SelectValoresTabelas(Dm.fdsConfigTAB_PADRAO_PDV.AsInteger);

        selecionouTabela := True;
      end;

      if DM.fdsCaixaTAB_PRECO.AsInteger=2 then
      begin
        if fdsProdutoItensPREC_TAB2.AsFloat >0 then
        begin
          precUnitario := fdsProdutoItensPREC_TAB2.AsFloat;
          if fdsProdutoItensDESC_MAX2.AsFloat>0 then
            vlrDescMax := fdsProdutoItensDESC_MAX2.AsFloat
          else
           vlrDescMax :=fdsTabelaPrecoDESC_MAX_PORCENT2.AsFloat;
        end
        else
        SelectValoresTabelas(Dm.fdsConfigTAB_PADRAO_PDV.AsInteger);

        selecionouTabela := True;
      end;

      if DM.fdsCaixaTAB_PRECO.AsInteger=3 then
      begin
        if fdsProdutoItensPREC_TAB3.AsFloat >0 then
        begin
          precUnitario := fdsProdutoItensPREC_TAB3.AsFloat;
          if fdsProdutoItensDESC_MAX3.AsFloat>0 then
            vlrDescMax := fdsProdutoItensDESC_MAX3.AsFloat
          else
           vlrDescMax := fdsTabelaPrecoDESC_MAX_PORCENT3.AsFloat;
        end
        else
        SelectValoresTabelas(Dm.fdsConfigTAB_PADRAO_PDV.AsInteger);

        selecionouTabela := True;
      end;

      if DM.fdsCaixaTAB_PRECO.AsInteger=4 then
      begin
        if fdsProdutoItensPREC_TAB4.AsFloat >0 then
        begin
          precUnitario := fdsProdutoItensPREC_TAB4.AsFloat;
          if fdsProdutoItensDESC_MAX4.AsFloat>0 then
            vlrDescMax := fdsProdutoItensDESC_MAX4.AsFloat
          else
           vlrDescMax := fdsTabelaPrecoDESC_MAX_PORCENT4.AsFloat;
        end
        else
        SelectValoresTabelas(Dm.fdsConfigTAB_PADRAO_PDV.AsInteger);

        selecionouTabela := True;
      end;

      if selecionouTabela then
        ModalResult := mrOk
      else
        Application.MessageBox('Selecione uma Tabela de Preço.', 'Atenção', MB_OK+MB_ICONEXCLAMATION);

    end
    else
      ModalResult := mrOk;
  end
  else
  begin
    Application.MessageBox('Nenhum Produto selecionado.', 'Atenção', MB_OK+MB_ICONEXCLAMATION);
    ModalResult := mrCancel;
  end;
end;

procedure TfrmPesqProdutoItens.btnTodosClick(Sender: TObject);
var
  sql : string;
begin
  edtNome.Clear;
  fdsProdutoItens.Close;
  fdsProdutoItens.SelectSQL.Clear;
  sql := 'SELECT PI.ID, PI.IDPRODUTO, PI.NOME, PI.REFERENCIA, PI.IDTAMANHO, PI.IDCOR, PI.PESO, PIE.PREC_VENDA, PIE.PREC_TAB1,  PIE.PREC_TAB2, PIE.PREC_TAB3, PIE.PREC_TAB4, PIE.PREC_TAB5, PIE.PREC_TAB6, PIE.SALDO, COMISSAO_DN, COMISSAO_CH, COMISSAO_CT';
  sql := sql + ' FROM PRODUTO_ITEM PI, PRODUTO_ITEM_ESTOQUE PIE WHERE PIE.IDITEM = PI.ID AND PIE.IDFILIAL = :IDFILIAL AND PI.STATUS = ' + QuotedStr('A');
  fdsProdutoItens.SelectSQL.Add(sql);
  fdsProdutoItens.OrderClause := 'PI.NOME';
  fdsProdutoItens.Prepare;
  fdsProdutoItens.Open;
end;

procedure TfrmPesqProdutoItens.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    gdrItens.SetFocus;
  end;
end;

procedure TfrmPesqProdutoItens.edtNomeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Pesquisar;
end;

procedure TfrmPesqProdutoItens.FormActivate(Sender: TObject);
begin
  edtNome.SetFocus;
  edtNome.Text:=letra;
  edtNome.SelStart:=Length(letra);
  frmPrincipal.PescCaixa;

//  if DM.fdsConfigUTILIZAR_TABELA_PRECO.AsString = 'S' then
//  begin
//    gdrItens.Columns[1].Visible := False;
 //  VerificaTabelaPreco;
//  end
//  else
//  begin
    //gbxTabela.Visible := False;
    if DM.fdsCaixaTAB_PRECO.AsInteger=1 then
    begin
      gdrItens.Columns[5].Visible := True;
      gdrItens.Columns[5].Title.Caption:='Tab.Preço 1';
    end
    else
     gdrItens.Columns[5].Visible := false;

    if DM.fdsCaixaTAB_PRECO.AsInteger=2 then
    begin
      gdrItens.Columns[6].Visible :=True;
      gdrItens.Columns[6].Title.Caption:='Tab.Preço 2';
    end
    else
     gdrItens.Columns[6].Visible :=false;

    if DM.fdsCaixaTAB_PRECO.AsInteger=3 then
    begin
      gdrItens.Columns[7].Visible := True;
      gdrItens.Columns[7].Title.Caption:='Tab.Preço 3';
    end
    else
     gdrItens.Columns[7].Visible := False;

    if DM.fdsCaixaTAB_PRECO.AsInteger=4 then
    begin
      gdrItens.Columns[8].Visible := True;
      gdrItens.Columns[8].Title.Caption:='Tab.Preço 4';
    end
    else
      gdrItens.Columns[8].Visible := false;

    if DM.fdsCaixaTAB_PRECO.AsInteger=5 then
    begin
      gdrItens.Columns[9].Visible := True;
      gdrItens.Columns[9].Title.Caption:='Tab.Preço 5';
    end
    else
      gdrItens.Columns[9].Visible := false;

    if DM.fdsCaixaTAB_PRECO.AsInteger=6 then
    begin
      gdrItens.Columns[10].Visible := True;
      gdrItens.Columns[10].Title.Caption:='Tab.Preço 4';
    end
    else
     gdrItens.Columns[10].Visible := false;
  //end;

end;

procedure TfrmPesqProdutoItens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btnSelecionar.Click;
  end
  else
    if Key = VK_ESCAPE then
    begin
      btnCancelar.Click;
    end;
end;

procedure TfrmPesqProdutoItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if (fdsProdutoItens.RecordCount > 0) and ((ActiveControl = gdrItens) or (fdsProdutoItens.RecordCount = 1)) then
if  (ActiveControl = gdrItens) or (fdsProdutoItens.RecordCount = 1) then
  begin
    if Key = #13 then
    begin
      btnSelecionar.Click;
    end;
  end;
end;

procedure TfrmPesqProdutoItens.gdrItensDblClick(Sender: TObject);
begin
  if fdsProdutoItens.RecordCount > 0 then
    btnSelecionar.Click;
end;

procedure TfrmPesqProdutoItens.gdrItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsProdutoItens.RecNo) then
  begin
    gdrItens.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
    gdrItens.Canvas.Brush.Color:=clHighlight;
    //gdrItens.Canvas.Font.Color := clNavy;
    gdrItens.Canvas.FillRect(Rect);
    gdrItens.DefaultDrawDataCell(rect,Column.Field,state);
  end;
end;

procedure TfrmPesqProdutoItens.Pesquisar;
var
  sql : string;
begin
  with fdsProdutoItens do
  begin
    Close;
    if (DM.fdsConfigN_VISUALIZAR_ESTOQ_ZERO.AsString = 'S') then
    begin
      Conditions.Clear;
      Conditions.AddCondition('ESTOQUE','PIE.SALDO > 0',true);
    end;
    ParamByName('TEXTO').AsString := edtNome.Text;
    ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
    OrderClause := 'PI.NOME';
    if DM.fdsConfigN_VISUALIZAR_ESTOQ_ZERO.AsString = 'S' then
    begin
      Conditions.Apply;
    end;
    Prepare;
    Open;
  end;
end;

procedure TfrmPesqProdutoItens.SelectValoresTabelas(Tabela: Integer);
begin
  if Tabela=1 then
  begin
    precUnitario := fdsProdutoItensPREC_TAB1.AsFloat;
    if fdsProdutoItensDESC_MAX1.AsFloat>0 then
    vlrDescMax := fdsProdutoItensDESC_MAX1.AsFloat
    else
     vlrDescMax :=fdsTabelaPrecoDESC_MAX_PORCENT1.AsFloat;
  end;

  if Tabela=2 then
  begin
    precUnitario := fdsProdutoItensPREC_TAB2.AsFloat;
    if fdsProdutoItensDESC_MAX2.AsFloat>0 then
    vlrDescMax := fdsProdutoItensDESC_MAX2.AsFloat
    else
     vlrDescMax :=fdsTabelaPrecoDESC_MAX_PORCENT2.AsFloat;
  end;

  if Tabela=3 then
  begin
    precUnitario := fdsProdutoItensPREC_TAB3.AsFloat;
    if fdsProdutoItensDESC_MAX3.AsFloat>0 then
      vlrDescMax := fdsProdutoItensDESC_MAX3.AsFloat
    else
     vlrDescMax := fdsTabelaPrecoDESC_MAX_PORCENT3.AsFloat;
  end;

  if Tabela=4 then
  begin
    precUnitario := fdsProdutoItensPREC_TAB4.AsFloat;
    if fdsProdutoItensDESC_MAX4.AsFloat>0 then
      vlrDescMax := fdsProdutoItensDESC_MAX4.AsFloat
    else
     vlrDescMax := fdsTabelaPrecoDESC_MAX_PORCENT4.AsFloat;
  end;
end;

procedure TfrmPesqProdutoItens.VerificaTabelaPreco;
var
  tempLeft : integer;
begin
  tempLeft := 8;
  fdsTabelaPreco.Open;

  if fdsTabelaPrecoPDV_DES1.AsString = 'N' then
  begin
    //rdbTabela1.Visible := False;
    gdrItens.Columns[2].Visible := False;
  end
  else
  begin
   // rdbTabela1.Caption := fdsTabelaPrecoDESCRICAO1.AsString;
    gdrItens.Columns[2].Title.Caption := fdsTabelaPrecoDESCRICAO1.AsString;
    //rdbTabela1.Left := tempLeft;
    tempLeft := tempLeft + 80;
    if fdsTabelaPrecoPDV_DES1.AsString = 'P' then
     // rdbTabela1.Checked := True;

  end;

  if fdsTabelaPrecoPDV_DES2.AsString = 'N' then
  begin
    //rdbTabela2.Visible := False;
    gdrItens.Columns[4].Visible := False;
  end
  else
  begin
    //rdbTabela2.Caption := fdsTabelaPrecoDESCRICAO2.AsString;
    gdrItens.Columns[4].Title.Caption := fdsTabelaPrecoDESCRICAO2.AsString;
    //rdbTabela2.Left := tempLeft;
    tempLeft := tempLeft + 80;
    if fdsTabelaPrecoPDV_DES2.AsString = 'P' then
      //rdbTabela2.Checked := True;

  end;

  if fdsTabelaPrecoPDV_DES3.AsString = 'N' then
  begin
    //rdbTabela3.Visible := False;
    gdrItens.Columns[5].Visible := False;
  end
  else
  begin
    //rdbTabela3.Caption := fdsTabelaPrecoDESCRICAO3.AsString;
    gdrItens.Columns[5].Title.Caption := fdsTabelaPrecoDESCRICAO3.AsString;
    //rdbTabela3.Left := tempLeft;
    tempLeft := tempLeft + 80;
    if fdsTabelaPrecoPDV_DES3.AsString = 'P' then
      //rdbTabela3.Checked := True;

  end;

  if fdsTabelaPrecoPDV_DES4.AsString = 'N' then
  begin
   // rdbTabela4.Visible := False;
    gdrItens.Columns[6].Visible := False;
  end
  else
  begin
   // rdbTabela4.Caption := fdsTabelaPrecoDESCRICAO4.AsString;
    gdrItens.Columns[6].Title.Caption := fdsTabelaPrecoDESCRICAO4.AsString;
    //rdbTabela4.Left := tempLeft;
    tempLeft := tempLeft + 80;
    if fdsTabelaPrecoPDV_DES4.AsString = 'P' then
      //rdbTabela4.Checked := True;

  end;

  if fdsTabelaPrecoPDV_DES5.AsString = 'N' then
  begin
   // rdbTabela5.Visible := False;
    gdrItens.Columns[7].Visible := False;
  end
  else
  begin
    //rdbTabela5.Caption := fdsTabelaPrecoDESCRICAO5.AsString;
    gdrItens.Columns[7].Title.Caption := fdsTabelaPrecoDESCRICAO5.AsString;
    //rdbTabela5.Left := tempLeft;
    tempLeft := tempLeft + 80;
    if fdsTabelaPrecoPDV_DES5.AsString = 'P' then
      //rdbTabela5.Checked := True;
  end;

  if fdsTabelaPrecoPDV_DES6.AsString = 'N' then
  begin
    //rdbTabela6.Visible := False;
    gdrItens.Columns[8].Visible := False;
  end
  else
  begin
    //rdbTabela6.Caption := fdsTabelaPrecoDESCRICAO6.AsString;
    gdrItens.Columns[8].Title.Caption := fdsTabelaPrecoDESCRICAO6.AsString;
   // rdbTabela6.Left := tempLeft;
    tempLeft := tempLeft + 80;
    if fdsTabelaPrecoPDV_DES6.AsString = 'P' then
     // rdbTabela6.Checked := True;

  end;
end;

end.
