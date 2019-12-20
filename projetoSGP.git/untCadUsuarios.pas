unit untCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, RzButton, RzEdit, StdCtrls, Mask,
  RzDBEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzLabel,
  dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage, RzPanel, RzBckgnd,
  JvComponentBase, JvCipher, Vcl.Imaging.pngimage, Vcl.ComCtrls, RzTreeVw,
  dxtree, dxdbtree, Vcl.CustomizeDlg, JvExComCtrls, JvComCtrls, JvCheckTreeView;

type
  TfrmCadUsuarios = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    RzLabel1: TRzLabel;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    JvDBGrid1: TJvDBGrid;
    tbsForm: TRzTabSheet;
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsUsuarios: TpFIBDataSet;
    fdsUsuariosID: TFIBBCDField;
    fdsUsuariosNOME: TFIBStringField;
    fdsUsuariosLOGIN: TFIBStringField;
    fdsUsuariosSENHA: TFIBStringField;
    fdsUsuariosDT_INC: TFIBDateField;
    fdsUsuariosDT_ALT: TFIBDateField;
    dsUsuarios: TDataSource;
    fdsUsuariosENVIADO_WEB: TFIBStringField;
    fdsUsuariosIDFILIAL: TFIBBCDField;
    JvVigenereCipher1: TJvVigenereCipher;
    RzGroupBox1: TRzGroupBox;
    RzLabel2: TRzLabel;
    edtID: TRzDBEdit;
    RzLabel5: TRzLabel;
    edtNome: TRzDBEdit;
    RzLabel6: TRzLabel;
    edtLogin: TRzDBEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    edtDt_Alt: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzLabel3: TRzLabel;
    edtDt_Inc: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    fdsUsuarioPermicSGP: TpFIBDataSet;
    fdsUsuarioPermicSGPIDUSUARIO: TFIBBCDField;
    fdsUsuarioPermicSGPIDFILIAL: TFIBBCDField;
    fdsUsuarioPermicSGPDT_INC: TFIBDateField;
    fdsUsuarioPermicSGPDT_ALT: TFIBDateField;
    fdsUsuarioPermicSGPADMINISTRACAO: TFIBStringField;
    fdsUsuarioPermicSGPFINANCEIRO: TFIBStringField;
    fdsUsuarioPermicSGPCADASTRO: TFIBStringField;
    fdsUsuarioPermicSGPADM_PEDIDO: TFIBStringField;
    fdsUsuarioPermicSGPADM_PREVENDA: TFIBStringField;
    fdsUsuarioPermicSGPADM_ROMANEIO: TFIBStringField;
    fdsUsuarioPermicSGPADM_ESTOQUE: TFIBStringField;
    fdsUsuarioPermicSGPADM_MOVINTERNA: TFIBStringField;
    fdsUsuarioPermicSGPADM_VENDAS: TFIBStringField;
    fdsUsuarioPermicSGPADM_MOVCAIXA: TFIBStringField;
    fdsUsuarioPermicSGPADM_COMPRAS: TFIBStringField;
    fdsUsuarioPermicSGPADM_OS: TFIBStringField;
    fdsUsuarioPermicSGPADM_COMISSAO: TFIBStringField;
    cktConfigPDV: TRzCheckTree;
    edtRepSenha: TRzEdit;
    edtSenha: TRzEdit;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    fdsUsuarioPermicSGPCAD_PRODUTOS: TFIBStringField;
    fdsUsuarioPermicSGPCAD_GRUPO: TFIBStringField;
    fdsUsuarioPermicSGPCAD_USUARIO: TFIBStringField;
    fdsUsuarioPermicSGPCAD_PRODUTOS_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_PRODUTOS_INSERT: TFIBStringField;
    fdsUsuarioPermicPDV: TpFIBDataSet;
    fdsUsuarioPermicPDVIDUSUARIO: TFIBBCDField;
    fdsUsuarioPermicPDVIDFILIAL: TFIBBCDField;
    fdsUsuarioPermicPDVDT_INC: TFIBDateField;
    fdsUsuarioPermicPDVDT_ALT: TFIBDateField;
    fdsUsuarioPermicPDVRECEBIMENTO: TFIBStringField;
    fdsUsuarioPermicPDVDESC_MAX_ITEM: TFIBStringField;
    fdsUsuarioPermicPDVDESC_MAX_TOT_VENDA: TFIBStringField;
    fdsUsuarioPermicPDVVER_MOVIMENTO: TFIBStringField;
    fdsUsuarioPermicPDVSANGRIA: TFIBStringField;
    fdsUsuarioPermicPDVSUPRIMENTO: TFIBStringField;
    fdsUsuarioPermicPDVFECHAMENTO: TFIBStringField;
    fdsUsuarioPermicPDVALTERAR_PREC_UNIT: TFIBStringField;
    fdsUsuarioPermicPDVDEVOLUCAO: TFIBStringField;
    fdsUsuarioPermicPDVESTOQUE_ZERADO_VENDER: TFIBStringField;
    fdsUsuarioPermicPDVLIBERAR_CLIENTE_BLOQ: TFIBStringField;
    fdsUsuarioPermicSGPFIN_RECEBER: TFIBStringField;
    fdsUsuarioPermicSGPFIN_PAGAR: TFIBStringField;
    fdsUsuarioPermicSGPFIN_FLUXOCAIXA: TFIBStringField;
    fdsUsuarioPermicSGPADM_BALANCO: TFIBStringField;
    fdsUsuarioPermicSGPEXIBIR_VENDAS_DIA: TFIBStringField;
    fdsUsuarioPermicSGPEXIBIR_PEDIDOS_DIA: TFIBStringField;
    fdsUsuarioPermicSGPCONFIGURACOES: TFIBStringField;
    cktConfigSGP3: TRzCheckTree;
    fdsUsuarioPermicSGPACESSO_SGP: TFIBStringField;
    fdsUsuarioPermicSGPCAD_GRUPO_INSERT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_GRUPO_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_GRUPO_EXCL: TFIBStringField;
    fdsUsuarioPermicSGPCAD_USUARIO_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_USUARIO_INSERT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_PRODUTOS_EXCL: TFIBStringField;
    fdsUsuarioPermicSGPCAD_PROD_EDIT_DESC_MAX: TFIBStringField;
    fdsUsuarioPermicSGPCAD_PROD_EDIT_PRECOS: TFIBStringField;
    fdsUsuarioPermicSGPCAD_PROD_MARGEM_LUCRO: TFIBStringField;
    fdsUsuarioPermicSGPEXPORTAR_PROD_BALANCA: TFIBStringField;
    fdsUsuarioPermicSGPCAD_VENDEDOR: TFIBStringField;
    fdsUsuarioPermicSGPCAD_VENDEDOR_EDT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_VENDEDOR_INSERT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_VENDEDOR_EXCL: TFIBStringField;
    cktConfigSGP: TRzCheckTree;
    fdsUsuarioPermicSGPCAD_TAB_PRECO: TFIBStringField;
    fdsUsuarioPermicSGPCAD_USUARIO_EDIT_PERMIC: TFIBStringField;
    fdsUsuarioPermicSGPCAD_USUARIO_VER_PERMIC: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTES: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTE_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_CREDITO: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_LIMITE: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_STATUS: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTE_INSERT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_CLIENTE_EXCL: TFIBStringField;
    fdsUsuarioPermicSGPCAD_FORNRCEDOR: TFIBStringField;
    fdsUsuarioPermicSGPCAD_FORNEC_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_FORNRC_EXCL: TFIBStringField;
    fdsUsuarioPermicSGPCAD_FORNEC_INSERT: TFIBStringField;
    fdsUsuarioPermicSGPPLANO_CONTAS: TFIBStringField;
    fdsUsuarioPermicSGPCAD_FUNCIONARIO: TFIBStringField;
    fdsUsuarioPermicSGPADM_MANIFESTO: TFIBStringField;
    fdsUsuarioPermicSGPADM_NFE: TFIBStringField;
    fdsUsuarioPermicSGPADM_NFE_EXCL: TFIBStringField;
    fdsUsuarioPermicSGPADM_PEDIDO_FATURAMENTO: TFIBStringField;
    fdsUsuarioPermicSGPADM_PEDIDO_ORCAMENTO: TFIBStringField;
    fdsUsuarioPermicSGPADM_ESTOQUE_IMP_ETIQUETA: TFIBStringField;
    fdsUsuarioPermicSGPADM_ESTOQUE_INVENTARIO: TFIBStringField;
    fdsUsuarioPermicSGPADM_VENDAS_ENTREGA: TFIBStringField;
    fdsUsuarioPermicSGPADM_VENDAS_RELATORIO: TFIBStringField;
    fdsUsuarioPermicSGPADM_COMPRAS_EXCL: TFIBStringField;
    fdsUsuarioPermicSGPADM_COMPRAS_REL: TFIBStringField;
    fdsUsuarioPermicSGPCAD_ENTREGA: TFIBStringField;
    fdsUsuarioPermicSGPCAD_ENTREGA_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPCAD_ENTREGA_INSERT: TFIBStringField;
    fdsUsuarioPermicSGPADM_NFE_EDIT: TFIBStringField;
    fdsUsuarioPermicSGPADM_NFE_EMITIR: TFIBStringField;
    fdsUsuarioPermicPDVABRIR_GAVETA: TFIBStringField;
    fdsUsuarioPermicPDVLIMITE_CREDITO: TFIBStringField;
    fdsUsuarioPermicSGPADMIN_1: TFIBStringField;
    fdsUsuarioPermicPDVDESC_ACRE_RECEBER: TFIBStringField;
    fdsUsuarioPermicPDVNAO_USAR_JUROS_RECEBER: TFIBStringField;
    fdsUsuarioPermicSGPLIBERAR_CLIENTE_BLOQ: TFIBStringField;
    fdsUsuarioPermicSGPESTOQUE_ZERADO_VENDER: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditaInsere;
    procedure GravaCancela;
    function RetornaSouN(valor: integer): string;
    function Retorna1ou2(valor: string): SmallInt;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure GravarPermicoesSGP;
    procedure CarregarPermicoesSGP;
    procedure CarregarPermicoesPDV;
    procedure GravarPermicoesPDV;
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure fdsUsuariosAfterScroll(DataSet: TDataSet);
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
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses untData, untPrincipal, uVerificaPermicao, untMsgUsuarioNaoPermitido;

{$R *.dfm}

procedure TfrmCadUsuarios.btnAlterarClick(Sender: TObject);
var
  uVerificaPermicao: TVerificaPermicao;
begin
  if (uVerificaPermicao.Verifica('CAD_USUARIO_EDIT') = True) then
  begin
    fdsUsuarios.Edit;
    fdsUsuariosDT_ALT.AsDateTime := Now;
    edtRepSenha.Text := edtSenha.Text;
    EditaInsere;
    cktConfigSGP.Enabled := True;
    cktConfigPDV.Enabled := True;
    CarregarPermicoesSGP;
    CarregarPermicoesPDV;
  end
  else
   TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para Alterar cadastros de Usu�rios.','Sem Permiss�o','I',[mbOk]);
end;

procedure TfrmCadUsuarios.btnCancelarClick(Sender: TObject);
begin
  fdsUsuarios.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadUsuarios.btnFirstClick(Sender: TObject);
begin
  fdsUsuarios.Prior;
end;

procedure TfrmCadUsuarios.btnGravarClick(Sender: TObject);
begin
  if (edtNome.Text = '') or (edtLogin.Text = '') then
  begin
    Application.MessageBox('Nome e Login obrigat�rios.', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    Abort;
  end;

  if fdsUsuarios.State in [dsInsert] then
  begin
    if (Trim(edtSenha.Text) = '') or (Trim(edtRepSenha.Text) = '') then
    begin
      Application.MessageBox('Senha e confirma��o de senha Obrigat�rio.',
        'Aten��o', MB_OK + MB_ICONEXCLAMATION);
      edtSenha.SetFocus;
      Abort;
    end;
  end;

  if (edtSenha.Text <> edtRepSenha.Text) then
  begin
    Application.MessageBox('Senha n�o confere.', 'Aten��o',
      MB_OK + MB_ICONEXCLAMATION);
    edtSenha.Clear;
    edtRepSenha.Clear;
    edtSenha.SetFocus;
    Abort;
  end
  else
  begin
    if not(Trim(edtSenha.Text) = '') then
    begin
      JvVigenereCipher1.Decoded := edtSenha.Text;
      fdsUsuariosSENHA.AsString := JvVigenereCipher1.Encoded;
    end;
  end;

  edtSenha.Clear;
  edtRepSenha.Clear;
  if fdsUsuarios.State = dsEdit then
  begin
    fdsUsuarios.Post;
    GravarPermicoesSGP;
    GravarPermicoesPDV;
  end
  else
    fdsUsuarios.Post;
 DM.Conexao.CommitRetaining;
  GravaCancela;
  Application.MessageBox('As Alter��es feitas s� estar�o dispon�veis na pr�xima vez que o usu�rio alterado fizer login.', 'Aten��o',
      MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadUsuarios.btnIncluirClick(Sender: TObject);
var
  uVerificaPermicao: TVerificaPermicao;
begin
  if (uVerificaPermicao.Verifica('CAD_USUARIO_INSERT') = True) then
  begin
    fdsUsuarios.Append;
    fdsUsuariosDT_INC.AsDateTime := Now;
    fdsUsuariosIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
    fdsUsuariosENVIADO_WEB.AsString := 'N';
    EditaInsere;
  end
  else
    TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para Inserir Usu�rios.','Sem Permiss�o','I',[mbOk]);
end;

procedure TfrmCadUsuarios.btnLastClick(Sender: TObject);
begin
  fdsUsuarios.Last;
end;

procedure TfrmCadUsuarios.btnNextClick(Sender: TObject);
begin
  fdsUsuarios.Next;
end;

procedure TfrmCadUsuarios.btnPriorClick(Sender: TObject);
begin
  fdsUsuarios.First;
end;

procedure TfrmCadUsuarios.btnTodosClick(Sender: TObject);
begin
  fdsUsuarios.Close;
  fdsUsuarios.Conditions.Clear;
  fdsUsuarios.Conditions.Apply;
  fdsUsuarios.Open;
  fdsUsuarios.First;
end;

procedure TfrmCadUsuarios.CarregarPermicoesPDV;
begin
  with fdsUsuarioPermicPDV do
  begin
    Close;
    ParamByName('IDFILIAL').AsInteger := fdsUsuariosIDFILIAL.AsInteger;;
    ParamByName('IDUSUARIO').AsInteger := fdsUsuariosID.AsInteger;
    Prepare;
    Open;
  end;

  if fdsUsuarioPermicPDV.RecordCount <> 0 then
  begin
    cktConfigPDV.Items[0].Expand(True);
    cktConfigPDV.Items[0].Item[0].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVRECEBIMENTO.AsString);
    cktConfigPDV.Items[0].Item[1].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVDESC_MAX_ITEM.AsString);
    cktConfigPDV.Items[0].Item[2].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVDESC_MAX_TOT_VENDA.AsString);
    cktConfigPDV.Items[0].Item[3].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVVER_MOVIMENTO.AsString);
    cktConfigPDV.Items[0].Item[4].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVSANGRIA.AsString);
    cktConfigPDV.Items[0].Item[5].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVSUPRIMENTO.AsString);
    cktConfigPDV.Items[0].Item[6].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVFECHAMENTO.AsString);
    cktConfigPDV.Items[0].Item[7].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVDEVOLUCAO.AsString);
    cktConfigPDV.Items[0].Item[8].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVALTERAR_PREC_UNIT.AsString);
    cktConfigPDV.Items[0].Item[9].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVESTOQUE_ZERADO_VENDER.AsString);
    cktConfigPDV.Items[0].Item[10].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVLIBERAR_CLIENTE_BLOQ.AsString);
    cktConfigPDV.Items[0].Item[11].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVABRIR_GAVETA.AsString);
    cktConfigPDV.Items[0].Item[12].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVLIMITE_CREDITO.AsString);
    cktConfigPDV.Items[0].Item[13].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVNAO_USAR_JUROS_RECEBER.AsString);
    cktConfigPDV.Items[0].Item[14].StateIndex :=
      Retorna1ou2(fdsUsuarioPermicPDVDESC_ACRE_RECEBER.AsString);
  end;
end;

procedure TfrmCadUsuarios.CarregarPermicoesSGP;
begin
  with fdsUsuarioPermicSGP do
  begin
    Close;
    ParamByName('IDFILIAL').AsInteger := fdsUsuariosIDFILIAL.AsInteger;;
    ParamByName('IDUSUARIO').AsInteger := fdsUsuariosID.AsInteger;
    Prepare;
    Open;
  end;

//  if fdsUsuarioPermicSGP.RecordCount <> 0 then
//  begin
//    cktConfigSGP.Items[0].Expand(True);
//    cktConfigSGP.Items[0].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCADASTRO.AsString);
//    cktConfigSGP.Items[0].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADMINISTRACAO.AsString);
//    cktConfigSGP.Items[0].Item[2].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFINANCEIRO.AsString);
//    cktConfigSGP.Items[0].Item[2].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFIN_RECEBER.AsString);
//    cktConfigSGP.Items[0].Item[2].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFIN_PAGAR.AsString);
//    cktConfigSGP.Items[0].Item[2].Item[2].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFIN_FLUXOCAIXA.AsString);
//    cktConfigSGP.Items[0].Item[3].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_PEDIDO.AsString);
//    cktConfigSGP.Items[0].Item[4].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_PREVENDA.AsString);
//    cktConfigSGP.Items[0].Item[5].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_ROMANEIO.AsString);
//    cktConfigSGP.Items[0].Item[6].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_ESTOQUE.AsString);
//    cktConfigSGP.Items[0].Item[7].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_MOVINTERNA.AsString);
//    cktConfigSGP.Items[0].Item[8].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_VENDAS.AsString);
//    cktConfigSGP.Items[0].Item[9].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_MOVCAIXA.AsString);
//    cktConfigSGP.Items[0].Item[10].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_COMPRAS.AsString);
//    cktConfigSGP.Items[0].Item[11].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_OS.AsString);
//    cktConfigSGP.Items[0].Item[12].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_COMISSAO.AsString);
//    cktConfigSGP.Items[0].Item[13].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS_INSERT.AsString);
//    cktConfigSGP.Items[0].Item[13].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS_EDIT.AsString);
//    cktConfigSGP.Items[0].Item[13].Item[2].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS.AsString);
//    cktConfigSGP.Items[0].Item[14].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCAD_GRUPO.AsString);
//    cktConfigSGP.Items[0].Item[15].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCAD_USUARIO.AsString);
//    cktConfigSGP.Items[0].Item[16].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_BALANCO.AsString);
//    cktConfigSGP.Items[0].Item[17].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPEXIBIR_VENDAS_DIA.AsString);
//    cktConfigSGP.Items[0].Item[17].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPEXIBIR_PEDIDOS_DIA.AsString);
//  end;

  if fdsUsuarioPermicSGP.RecordCount <> 0 then
  begin
    cktConfigSGP.Items[0].Expand(True);
    cktConfigSGP.Items[0].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCADASTRO.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[0].StateIndex:= Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS_EDIT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[0].Item[0].StateIndex:= Retorna1ou2(fdsUsuarioPermicSGPCAD_PROD_EDIT_DESC_MAX.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[0].Item[1].StateIndex:= Retorna1ou2(fdsUsuarioPermicSGPCAD_PROD_EDIT_PRECOS.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[1].StateIndex:= Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS_INSERT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[2].StateIndex:= Retorna1ou2(fdsUsuarioPermicSGPCAD_PRODUTOS_EXCL.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[3].StateIndex:= Retorna1ou2(fdsUsuarioPermicSGPCAD_PROD_MARGEM_LUCRO.AsString);

    cktConfigSGP.Items[0].Item[0].Item[0].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPEXPORTAR_PROD_BALANCA.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_GRUPO.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[2].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_GRUPO_EDIT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[2].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_GRUPO_EXCL.AsString);
    cktConfigSGP.Items[0].Item[0].Item[0].Item[2].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_GRUPO_INSERT.AsString);
   // cktConfigSGP.Items[0].Item[0].Item[0].Item[3].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_TAB_PRECO.AsString);

    cktConfigSGP.Items[0].Item[0].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTES.AsString);
    cktConfigSGP.Items[0].Item[0].Item[1].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTE_EDIT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[1].Item[0].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_CREDITO.AsString);
    cktConfigSGP.Items[0].Item[0].Item[1].Item[0].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_LIMITE.AsString);
    cktConfigSGP.Items[0].Item[0].Item[1].Item[0].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_STATUS.AsString);
    cktConfigSGP.Items[0].Item[0].Item[1].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTE_EXCL.AsString);
    cktConfigSGP.Items[0].Item[0].Item[1].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_CLIENTE_INSERT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_ENTREGA.AsString);
    cktConfigSGP.Items[0].Item[0].Item[2].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_ENTREGA_EDIT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[2].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_ENTREGA_INSERT.AsString);

    cktConfigSGP.Items[0].Item[0].Item[3].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_FORNRCEDOR.AsString);
    cktConfigSGP.Items[0].Item[0].Item[3].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_FORNEC_EDIT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[3].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_FORNRC_EXCL.AsString);
    cktConfigSGP.Items[0].Item[0].Item[3].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_FORNEC_INSERT.AsString);

    cktConfigSGP.Items[0].Item[0].Item[4].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_FUNCIONARIO.AsString);
    cktConfigSGP.Items[0].Item[0].Item[5].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPPLANO_CONTAS.AsString);
    cktConfigSGP.Items[0].Item[0].Item[6].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_TAB_PRECO.AsString);

    cktConfigSGP.Items[0].Item[0].Item[7].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_USUARIO.AsString);
    cktConfigSGP.Items[0].Item[0].Item[7].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_USUARIO_EDIT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[7].Item[0].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_USUARIO_EDIT_PERMIC.AsString);
    cktConfigSGP.Items[0].Item[0].Item[7].Item[0].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_USUARIO_VER_PERMIC.AsString);
    cktConfigSGP.Items[0].Item[0].Item[7].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_USUARIO_INSERT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[8].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_VENDEDOR.AsString);
    cktConfigSGP.Items[0].Item[0].Item[8].Item[0].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_VENDEDOR_EDT.AsString);
    cktConfigSGP.Items[0].Item[0].Item[8].Item[1].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_VENDEDOR_EXCL.AsString);
    cktConfigSGP.Items[0].Item[0].Item[8].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGPCAD_VENDEDOR_INSERT.AsString);
 // ---------------------------------------------------------------------------------------------------------------------------------------------

    cktConfigSGP.Items[0].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADMINISTRACAO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_NFE.AsString);
    cktConfigSGP.Items[0].Item[1].Item[0].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_NFE_EXCL.AsString);
    cktConfigSGP.Items[0].Item[1].Item[0].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_NFE_EDIT.AsString);
    cktConfigSGP.Items[0].Item[1].Item[0].Item[2].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_NFE_EMITIR.AsString);
    cktConfigSGP.Items[0].Item[1].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_MANIFESTO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[2].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_PEDIDO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[2].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_PEDIDO_FATURAMENTO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[2].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_PEDIDO_ORCAMENTO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[3].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_ESTOQUE.AsString);
    cktConfigSGP.Items[0].Item[1].Item[3].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_ESTOQUE_IMP_ETIQUETA.AsString);
    cktConfigSGP.Items[0].Item[1].Item[3].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_ESTOQUE_INVENTARIO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[4].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_MOVINTERNA.AsString);
    cktConfigSGP.Items[0].Item[1].Item[5].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_VENDAS.AsString);
    cktConfigSGP.Items[0].Item[1].Item[5].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_VENDAS_ENTREGA.AsString);
    cktConfigSGP.Items[0].Item[1].Item[5].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_VENDAS_RELATORIO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[6].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_MOVCAIXA.AsString);
    cktConfigSGP.Items[0].Item[1].Item[7].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_COMPRAS.AsString);
    cktConfigSGP.Items[0].Item[1].Item[7].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_COMPRAS_EXCL.AsString);
    cktConfigSGP.Items[0].Item[1].Item[7].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_COMPRAS_REL.AsString);
    cktConfigSGP.Items[0].Item[1].Item[8].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_OS.AsString);
    cktConfigSGP.Items[0].Item[1].Item[9].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPADM_COMISSAO.AsString);
    cktConfigSGP.Items[0].Item[1].Item[10].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPLIBERAR_CLIENTE_BLOQ.AsString);

    cktConfigSGP.Items[0].Item[2].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFINANCEIRO.AsString);
    cktConfigSGP.Items[0].Item[2].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFIN_RECEBER.AsString);
    cktConfigSGP.Items[0].Item[2].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPFIN_PAGAR.AsString);
    cktConfigSGP.Items[0].Item[3].Item[0].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPEXIBIR_VENDAS_DIA.AsString);
    cktConfigSGP.Items[0].Item[3].Item[1].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPEXIBIR_VENDAS_DIA.AsString);
    cktConfigSGP.Items[0].Item[4].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPCONFIGURACOES.AsString);
    cktConfigSGP.Items[0].Item[5].StateIndex :=Retorna1ou2(fdsUsuarioPermicSGPESTOQUE_ZERADO_VENDER.AsString);
  end;
end;

procedure TfrmCadUsuarios.EditaInsere;
var
  i: SmallInt;
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
  edtNome.SetFocus;
end;

procedure TfrmCadUsuarios.fdsUsuariosAfterScroll(DataSet: TDataSet);
begin
  // if pgcControl.ActivePageIndex = 1 then
  CarregarPermicoesSGP;
end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadUsuarios := nil;
end;

procedure TfrmCadUsuarios.FormCreate(Sender: TObject);
begin
  fdsUsuarios.Open;
  JvVigenereCipher1.Key := 'xoxota';
end;

procedure TfrmCadUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadUsuarios.GravaCancela;
var
  i: SmallInt;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).Pages[0].TabVisible := True;
      TRzPageControl(Components[i]).ActivePageIndex := 0;
    end;
    if (Components[i] is TRzBitBtn) then
    begin
      if Components[i].Tag = 1 then
        TRzBitBtn(Components[i]).Enabled := True
      else
        TRzBitBtn(Components[i]).Enabled := False;
    end;
  end;

  cktConfigSGP.Enabled := False;
  cktConfigPDV.Enabled := False;
  fdsUsuarios.Close;
  fdsUsuarios.Open;
  fdsUsuarios.Last;
end;

procedure TfrmCadUsuarios.GravarPermicoesPDV;
begin
  with fdsUsuarioPermicPDV do
  begin
    Close;
    ParamByName('IDFILIAL').AsInteger := fdsUsuariosIDFILIAL.AsInteger;;
    ParamByName('IDUSUARIO').AsInteger := fdsUsuariosID.AsInteger;
    Prepare;
    Open;
  end;

  if fdsUsuarioPermicPDV.RecordCount = 0 then
  begin
    fdsUsuarioPermicPDV.Append;
    fdsUsuarioPermicPDVIDUSUARIO.AsInteger := fdsUsuariosID.AsInteger;
    fdsUsuarioPermicPDVIDFILIAL.AsInteger := fdsUsuariosIDFILIAL.AsInteger;
  end
  else
    fdsUsuarioPermicPDV.Edit;

  cktConfigPDV.Items[0].Expand(True);
  fdsUsuarioPermicPDVRECEBIMENTO.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[0].StateIndex);
  fdsUsuarioPermicPDVDESC_MAX_ITEM.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[1].StateIndex);
  fdsUsuarioPermicPDVDESC_MAX_TOT_VENDA.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[2].StateIndex);
  fdsUsuarioPermicPDVVER_MOVIMENTO.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[3].StateIndex);
  fdsUsuarioPermicPDVSANGRIA.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[4].StateIndex);
  fdsUsuarioPermicPDVSUPRIMENTO.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[5].StateIndex);
  fdsUsuarioPermicPDVFECHAMENTO.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[6].StateIndex);
  fdsUsuarioPermicPDVDEVOLUCAO.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[7].StateIndex);
  fdsUsuarioPermicPDVALTERAR_PREC_UNIT.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[8].StateIndex);
  fdsUsuarioPermicPDVESTOQUE_ZERADO_VENDER.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[9].StateIndex);
  fdsUsuarioPermicPDVLIBERAR_CLIENTE_BLOQ.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[10].StateIndex);
  fdsUsuarioPermicPDVABRIR_GAVETA.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[11].StateIndex);
  fdsUsuarioPermicPDVLIMITE_CREDITO.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[12].StateIndex);
  fdsUsuarioPermicPDVNAO_USAR_JUROS_RECEBER.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[13].StateIndex);
  fdsUsuarioPermicPDVDESC_ACRE_RECEBER.AsString :=
    RetornaSouN(cktConfigPDV.Items[0].Item[14].StateIndex);
  fdsUsuarioPermicPDV.Post;

  DM.Conexao.CommitRetaining;
end;

procedure TfrmCadUsuarios.GravarPermicoesSGP;
begin
  with fdsUsuarioPermicSGP do
  begin
    Close;
    ParamByName('IDFILIAL').AsInteger := fdsUsuariosIDFILIAL.AsInteger;;
    ParamByName('IDUSUARIO').AsInteger := fdsUsuariosID.AsInteger;
    Prepare;
    Open;
  end;

  if fdsUsuarioPermicSGP.RecordCount = 0 then
  begin
    fdsUsuarioPermicSGP.Append;
    fdsUsuarioPermicSGPIDUSUARIO.AsInteger := fdsUsuariosID.AsInteger;
    fdsUsuarioPermicSGPIDFILIAL.AsInteger := fdsUsuariosIDFILIAL.AsInteger;
  end
  else
    fdsUsuarioPermicSGP.Edit;

//  fdsUsuarioPermicSGPCADASTRO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[0].StateIndex);
//  fdsUsuarioPermicSGPADMINISTRACAO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[1].StateIndex);
//  fdsUsuarioPermicSGPFINANCEIRO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[2].StateIndex);
//  fdsUsuarioPermicSGPFIN_RECEBER.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[2].Item[0].StateIndex);
//  fdsUsuarioPermicSGPFIN_PAGAR.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[2].Item[1].StateIndex);
//  fdsUsuarioPermicSGPFIN_FLUXOCAIXA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[2].Item[2].StateIndex);
//  fdsUsuarioPermicSGPADM_PEDIDO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[3].StateIndex);
//  fdsUsuarioPermicSGPADM_PREVENDA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[4].StateIndex);
//  fdsUsuarioPermicSGPADM_ROMANEIO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[5].StateIndex);
//  fdsUsuarioPermicSGPADM_ESTOQUE.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[6].StateIndex);
//  fdsUsuarioPermicSGPADM_MOVINTERNA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[7].StateIndex);
//  fdsUsuarioPermicSGPADM_VENDAS.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[8].StateIndex);
//  fdsUsuarioPermicSGPADM_MOVCAIXA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[9].StateIndex);
//  fdsUsuarioPermicSGPADM_COMPRAS.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[10].StateIndex);
//  fdsUsuarioPermicSGPADM_OS.AsString := RetornaSouN(cktConfigSGP.Items[0].Item[11].StateIndex);
//  fdsUsuarioPermicSGPADM_COMISSAO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[12].StateIndex);
//  fdsUsuarioPermicSGPCAD_PRODUTOS_INSERT.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[13].Item[0].StateIndex);
//  fdsUsuarioPermicSGPCAD_PRODUTOS_EDIT.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[13].Item[1].StateIndex);
//  fdsUsuarioPermicSGPCAD_PRODUTOS.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[13].Item[2].StateIndex);
//  fdsUsuarioPermicSGPCAD_GRUPO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[14].StateIndex);
//  fdsUsuarioPermicSGPCAD_USUARIO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[15].StateIndex);
//  fdsUsuarioPermicSGPADM_BALANCO.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[16].StateIndex);
//  fdsUsuarioPermicSGPEXIBIR_VENDAS_DIA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[17].Item[0].StateIndex);
//  fdsUsuarioPermicSGPEXIBIR_PEDIDOS_DIA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[17].Item[1].StateIndex);
//  fdsUsuarioPermicSGPEXIBIR_PEDIDOS_DIA.AsString :=RetornaSouN(cktConfigSGP.Items[0].Item[17].Item[1].StateIndex);

  fdsUsuarioPermicSGPCADASTRO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_PRODUTOS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_PRODUTOS_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_PROD_EDIT_DESC_MAX.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_PROD_EDIT_PRECOS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_PRODUTOS_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_PRODUTOS_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[2].StateIndex);
  fdsUsuarioPermicSGPCAD_PROD_MARGEM_LUCRO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[0].Item[3].StateIndex);

  fdsUsuarioPermicSGPEXPORTAR_PROD_BALANCA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_GRUPO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[2].StateIndex);
  fdsUsuarioPermicSGPCAD_GRUPO_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[2].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_GRUPO_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[2].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_GRUPO_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[0].Item[2].Item[2].StateIndex);

  fdsUsuarioPermicSGPCAD_CLIENTES.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_CLIENTE_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_CREDITO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].Item[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_LIMITE.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_CLIENTE_EDIT_STATUS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].Item[0].Item[2].StateIndex);
  fdsUsuarioPermicSGPCAD_CLIENTE_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_CLIENTE_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[1].Item[2].StateIndex);
 // cktConfigSGP.Items[0].Item[0].Item[2].StateIndex:=Retorna1ou2(fdsUsuarioPermicSGP.AsString);     ESPEC�FICO PARA ENTREGA
  fdsUsuarioPermicSGPCAD_ENTREGA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[2].StateIndex);
  fdsUsuarioPermicSGPCAD_ENTREGA_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[2].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_ENTREGA_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[2].Item[1].StateIndex);

  fdsUsuarioPermicSGPCAD_FORNRCEDOR.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[3].StateIndex);
  fdsUsuarioPermicSGPCAD_FORNEC_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[3].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_FORNRC_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[3].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_FORNEC_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[3].Item[0].StateIndex);

  fdsUsuarioPermicSGPCAD_FUNCIONARIO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[4].StateIndex);
  fdsUsuarioPermicSGPPLANO_CONTAS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[5].StateIndex);
  fdsUsuarioPermicSGPCAD_TAB_PRECO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[6].StateIndex);

  fdsUsuarioPermicSGPCAD_USUARIO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[7].StateIndex);
  fdsUsuarioPermicSGPCAD_USUARIO_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[7].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_USUARIO_EDIT_PERMIC.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[7].Item[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_USUARIO_VER_PERMIC.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[7].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_USUARIO_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[7].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_VENDEDOR.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[8].StateIndex);
  fdsUsuarioPermicSGPCAD_VENDEDOR_EDT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[8].Item[0].StateIndex);
  fdsUsuarioPermicSGPCAD_VENDEDOR_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[8].Item[1].StateIndex);
  fdsUsuarioPermicSGPCAD_VENDEDOR_INSERT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[0].Item[8].Item[2].StateIndex);
// ---------------------------------------------------------------------------------------------------------------------------------------------

  fdsUsuarioPermicSGPADMINISTRACAO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPADM_NFE.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_NFE_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[0].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_NFE_EDIT.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[0].Item[1].StateIndex);
  fdsUsuarioPermicSGPADM_NFE_EMITIR.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[0].Item[2].StateIndex);
  fdsUsuarioPermicSGPADM_MANIFESTO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[1].StateIndex);
  fdsUsuarioPermicSGPADM_PEDIDO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[2].StateIndex);
  fdsUsuarioPermicSGPADM_PEDIDO_FATURAMENTO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[2].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_PEDIDO_ORCAMENTO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[2].Item[1].StateIndex);
  fdsUsuarioPermicSGPADM_ESTOQUE.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[3].StateIndex);
  fdsUsuarioPermicSGPADM_ESTOQUE_IMP_ETIQUETA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[3].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_ESTOQUE_INVENTARIO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[3].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_MOVINTERNA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[4].StateIndex);
  fdsUsuarioPermicSGPADM_VENDAS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[5].StateIndex);
  fdsUsuarioPermicSGPADM_VENDAS_ENTREGA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[5].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_VENDAS_RELATORIO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[5].Item[1].StateIndex);
  fdsUsuarioPermicSGPADM_MOVCAIXA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[6].StateIndex);
  fdsUsuarioPermicSGPADM_COMPRAS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[7].StateIndex);
  fdsUsuarioPermicSGPADM_COMPRAS_EXCL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[7].Item[0].StateIndex);
  fdsUsuarioPermicSGPADM_COMPRAS_REL.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[7].Item[1].StateIndex);
  fdsUsuarioPermicSGPADM_OS.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[8].StateIndex);
  fdsUsuarioPermicSGPADM_COMISSAO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[9].StateIndex);
  fdsUsuarioPermicSGPLIBERAR_CLIENTE_BLOQ.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[1].Item[10].StateIndex);

  fdsUsuarioPermicSGPFINANCEIRO.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[2].StateIndex);
  fdsUsuarioPermicSGPFIN_RECEBER.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[2].Item[0].StateIndex);
  fdsUsuarioPermicSGPFIN_PAGAR.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[2].Item[1].StateIndex);
  fdsUsuarioPermicSGPEXIBIR_VENDAS_DIA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[3].Item[0].StateIndex);
  fdsUsuarioPermicSGPEXIBIR_PEDIDOS_DIA.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[3].Item[1].StateIndex);
  fdsUsuarioPermicSGPCONFIGURACOES.AsString:=RetornaSouN(cktConfigSGP.Items[0].Item[4].StateIndex);

  fdsUsuarioPermicSGPESTOQUE_ZERADO_VENDER.AsString :=RetornaSouN(cktConfigPDV.Items[0].Item[5].StateIndex);
  fdsUsuarioPermicSGP.Post;

  DM.Conexao.CommitRetaining;

  // ShowMessage(cktConfig.Items[0].Item[0].Text + ' = ' + RetornaSouN(cktConfig.Items[0].Item[0].StateIndex));
end;

procedure TfrmCadUsuarios.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsUsuarios.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
      JvDBGrid1.Canvas.Brush.Color :=clHighlight;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

function TfrmCadUsuarios.Retorna1ou2(valor: string): SmallInt;
begin
  if valor = 'N' then
    Result := 1
  else
    Result := 2;
end;

function TfrmCadUsuarios.RetornaSouN(valor: integer): string;
begin
  if valor = 1 then
    Result := 'N'
  else
    Result := 'S';
end;

end.