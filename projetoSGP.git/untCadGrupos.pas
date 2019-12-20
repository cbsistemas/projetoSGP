unit untCadGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzDBCmbo, Mask, RzEdit, RzDBEdit, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, RzTabs, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzButton, RzPanel, RzBckgnd, DB, FIBDataSet,
  pFIBDataSet, Vcl.Imaging.pngimage, FIBQuery, pFIBQuery, RzRadChk;

type
  TfrmCadGrupos = class(TForm)
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    JvDBGrid1: TJvDBGrid;
    tbsForm: TRzTabSheet;
    lblCodigo: TRzLabel;
    lblDtAlt: TRzLabel;
    lblDtInc: TRzLabel;
    lblNome: TRzLabel;
    lblRG: TRzLabel;
    lblStatus: TRzLabel;
    edtID: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtDt_Alt: TRzDBEdit;
    edtNome: TRzDBEdit;
    edtReferencia: TRzDBEdit;
    cbxStatus: TRzDBComboBox;
    dsGrupo: TDataSource;
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblTituloTotal: TRzLabel;
    lblTotal: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    qryCommand: TpFIBQuery;
    pnlComissao: TRzGroupBox;
    RzDBEdit1: TRzDBEdit;
    RzLabel1: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzLabel3: TRzLabel;
    RzDBEdit4: TRzDBEdit;
    RzLabel4: TRzLabel;
    fdsGrupo: TpFIBDataSet;
    fdsGrupoID: TFIBBCDField;
    fdsGrupoDT_INC: TFIBDateField;
    fdsGrupoDT_ALT: TFIBDateField;
    fdsGrupoSTATUS: TFIBStringField;
    fdsGrupoNOME: TFIBStringField;
    fdsGrupoREFERENCIA: TFIBStringField;
    fdsGrupoENVIADO_WEB: TFIBStringField;
    fdsGrupoCOMISSAO_DN: TFIBBCDField;
    fdsGrupoCOMISSAO_CH: TFIBBCDField;
    fdsGrupoCOMISSAO_CT: TFIBBCDField;
    fdsGrupoMARGEM_LUCRO: TFIBBCDField;
    RzDBEdit2: TRzDBEdit;
    RzLabel2: TRzLabel;
    chkComissao: TRzCheckBox;
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure GerarRelacionamentos;
    procedure AtualizaValoresItens;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkComissaoClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupos: TfrmCadGrupos;
  ordem: string[4]; // controla a ordena��o: Asc / Desc
implementation

uses untData, uUtils, untGrupoRelacion, uVerificaPermicao,
  untMsgUsuarioNaoPermitido;

{$R *.dfm}

procedure TfrmCadGrupos.AtualizaValoresItens;
var
  parametros: string;
  idGrupo: string;
begin
  idGrupo := fdsGrupoID.AsString;
  if chkComissao.Checked then
  begin
    parametros := fdsGrupoID.AsString + ', ' +
      StringReplace(fdsGrupoCOMISSAO_DN.AsString, ',', '.',
      [rfReplaceAll]) + ', ';
    parametros := parametros + StringReplace(fdsGrupoCOMISSAO_CH.AsString, ',',
      '.', [rfReplaceAll]) + ', ' + StringReplace(fdsGrupoCOMISSAO_CT.AsString,
      ',', '.', [rfReplaceAll]);

    with qryCommand do
    begin
      SQL.Clear;
      SQL.Add('EXECUTE PROCEDURE GRUPO_COMISSAO_ITEM(' + parametros + ')');
      Prepare;
      ExecProc;
    end;

    DM.Conexao.CommitRetaining;
  end;

  parametros := StringReplace(fdsGrupoMARGEM_LUCRO.AsString, ',', '.',
    [rfReplaceAll]);

  with qryCommand do
  begin
    SQL.Clear;
    SQL.Add('execute procedure GRUPO_ATUALIZA_PREC_PRODUTOS(' + idGrupo + ', ' +
      parametros + ')');
    Prepare;
    ExecProc;
  end;
  //
  //
  // with qryCommand do
  // begin
  // SQL.Clear;
  // SQL.Add('UPDATE PRODUTO_ITEM SET PREC_TAB1 = (PREC_CUSTO + (PREC_CUSTO * ' + parametros + ' / 100)), ');
  // SQL.Add('PREC_VENDA = (PREC_CUSTO + (PREC_CUSTO * ' + parametros + ' / 100)) ');
  // SQL.Add('WHERE IDPRODUTO IN (SELECT ID FROM produto WHERE IDGRUPO = ' + fdsGrupoID.AsString + ') AND PREC_CUSTO > 0');
  // Prepare;
  // ExecQuery;
  // end;
  DM.Conexao.CommitRetaining;
end;

procedure TfrmCadGrupos.btnAlterarClick(Sender: TObject);
var
 uVerificaPermicao: TVerificaPermicao;
begin
  if uVerificaPermicao.Verifica('CAD_GRUPO_EDIT') = True then
  begin
    fdsGrupo.Edit;
    fdsGrupoDT_ALT.AsDateTime := Now;
    fdsGrupoENVIADO_WEB.AsString := 'N';
    EditaInsere;
  end
  else
  TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para editar grupos.','Sem Permiss�o','I',[mbOk]);
end;

procedure TfrmCadGrupos.btnCancelarClick(Sender: TObject);
begin
  fdsGrupo.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadGrupos.btnDeleteClick(Sender: TObject);
var
uVerificaPermicao: TVerificaPermicao;
begin
   if (uVerificaPermicao.Verifica('CAD_GRUPO_EXCL') = True) then
  begin
    if fdsGrupo.RecordCount > 0 then
    begin
      Case MessageBox(Application.Handle,
        Pchar('Deseja realmente excluir o registro atual?'), 'Aten��o',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
        idYes:
          begin
            fdsGrupo.Delete;
            DM.Conexao.CommitRetaining;
            lblTotal.Caption := intToStr(fdsGrupo.RecordCount);
          end;
      end;
    end;
  end
  else
  TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para Excluir grupos','Sem Permiss�o','I',[mbOk]);
end;

procedure TfrmCadGrupos.btnFirstClick(Sender: TObject);
begin
  fdsGrupo.Prior;
end;

procedure TfrmCadGrupos.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
  i: Smallint;
  incluindo, atualizarComissao, campoVazio: Boolean;

begin
  campoVazio := False;
  incluindo := False;
  atualizarComissao := False;

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i].Tag = 15) then
    begin
      if utils.VerificaCampoObrigatorio(TRzDBEdit(Components[i])) then
        campoVazio := True;
    end;
  end;

  if campoVazio then
  begin
    Application.MessageBox('Existem campos obrigat�rios sem preencher.',
      'Ante��o', MB_OK + MB_ICONERROR);
    Abort;
  end
  else
  begin
    if fdsGrupo.State in [dsInsert] then
      incluindo := True;

    fdsGrupo.Post;
    DM.Conexao.CommitRetaining;
  end;

  if incluindo then
  begin
    GerarRelacionamentos;
  end;

  Case MessageBox(Application.Handle,
    Pchar('Deseja atualizar os valores dos produtos deste grupo? Atualize somente caso voc� tenha alterado comiss�o para vendedores ou a margem de luco para o grupo'),
    'Atualizar comiss�o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        AtualizaValoresItens();
      end;
  end;

  GravaCancela;

end;

procedure TfrmCadGrupos.btnIncluirClick(Sender: TObject);
var
uVerificaPermicao: TVerificaPermicao;
begin
  if (uVerificaPermicao.Verifica('CAD_GRUPO_INSERT') = True) then
  begin
    fdsGrupo.Append;
    fdsGrupoDT_INC.AsDateTime := Now;
    fdsGrupoSTATUS.AsString := 'A';
    fdsGrupoMARGEM_LUCRO.AsFloat := DM.fdsConfigMARGEN_LUCRO_PADRAO.AsFloat;
    EditaInsere;
  end
  else
  TfrmMenssagens.Mensagem('Desculpe, usu�rio sem permiss�o para Inserir Grupos.','Sem Permiss�o','I',[mbOk]);
end;

procedure TfrmCadGrupos.btnLastClick(Sender: TObject);
begin
  fdsGrupo.Last;
end;

procedure TfrmCadGrupos.btnNextClick(Sender: TObject);
begin
  fdsGrupo.Next;
end;

procedure TfrmCadGrupos.btnPriorClick(Sender: TObject);
begin
  fdsGrupo.First;
end;

procedure TfrmCadGrupos.btnTodosClick(Sender: TObject);
begin
  fdsGrupo.Close;
  fdsGrupo.Open;
  fdsGrupo.Last;
  fdsGrupo.First;
end;

procedure TfrmCadGrupos.chkComissaoClick(Sender: TObject);
begin
  if chkComissao.Checked then
    pnlComissao.Enabled := True
  else
    pnlComissao.Enabled := False;
end;

procedure TfrmCadGrupos.EditaInsere;
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
  edtNome.SetFocus;
end;

procedure TfrmCadGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadGrupos := nil;
end;

procedure TfrmCadGrupos.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  fdsGrupo.Open;
  fdsGrupo.Last;
  fdsGrupo.First;
  lblTotal.Caption := intToStr(fdsGrupo.RecordCount);
end;

procedure TfrmCadGrupos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadGrupos.GerarRelacionamentos;
begin
  Try
    frmGrupoRelacion := TfrmGrupoRelacion.Create(nil);
    frmGrupoRelacion.idGrupo := fdsGrupoID.AsInteger;
    frmGrupoRelacion.ShowModal;
  Finally
    if frmGrupoRelacion.ModalResult = mrOk then
    begin
      Application.MessageBox
        ('Relacionamentos deste Grupo com Cores e Tamanhos realizado com sucesso.',
        'Relacionamentos finalizado.', MB_OK + MB_ICONEXCLAMATION);
    end;
    frmGrupoRelacion.Free;
  End;
end;

procedure TfrmCadGrupos.GravaCancela;
var
  i: Smallint;
  utils: TUtils;
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

  fdsGrupo.Close;
  fdsGrupo.OrderClause := 'ID ';
  fdsGrupo.Open;
  fdsGrupo.Last;
  lblTotal.Caption := intToStr(fdsGrupo.RecordCount);
end;

procedure TfrmCadGrupos.JvDBGrid1DblClick(Sender: TObject);
begin
  if fdsGrupo.RecordCount > 0 then
    tbsForm.Show;

end;

procedure TfrmCadGrupos.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsGrupo.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadGrupos.JvDBGrid1TitleClick(Column: TColumn);
begin
  fdsGrupo.Close;
  fdsGrupo.OrderClause := Column.FieldName + ' ' + ordem;
  fdsGrupo.Open;

  if ordem = 'ASC' then
    ordem := 'DESC'
  else
    ordem := 'ASC';
end;

end.