unit untCadCores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage, RzBckgnd, DB,
  FIBDataSet, pFIBDataSet, StdCtrls, RzCmboBx, RzDBCmbo, Mask, RzEdit, RzDBEdit,
  RzLabel, Grids, DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzButton, RzPanel,
  DBCtrls, RzDBGrid, Vcl.Imaging.pngimage, Vcl.ImgList, PngImageList;

type
  TfrmCadCores = class(TForm)
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
    fdsCor: TpFIBDataSet;
    dsCor: TDataSource;
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    imgPrincipal: TJvImage;
    lblTitulo: TRzLabel;
    lblTituloTotal: TRzLabel;
    lblTotal: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    fdsCorID: TFIBBCDField;
    fdsCorDT_INC: TFIBDateField;
    fdsCorDT_ALT: TFIBDateField;
    fdsCorSTATUS: TFIBStringField;
    fdsCorNOME: TFIBStringField;
    fdsCorREFERENCIA: TFIBStringField;
    fdsCor_Grupo: TpFIBDataSet;
    dsCor_Grupo: TDataSource;
    RzGroupBox1: TRzGroupBox;
    grdGrupos: TRzDBGrid;
    btnGrupoIncluir: TRzBitBtn;
    btnGrupoAltStatus: TRzBitBtn;
    btnGrupoExcluir: TRzBitBtn;
    fdsCor_GrupoIDCOR: TFIBBCDField;
    fdsCor_GrupoIDGRUPO: TFIBBCDField;
    fdsCor_GrupoDT_INC: TFIBDateField;
    fdsCor_GrupoDT_ALT: TFIBDateField;
    fdsCor_GrupoSTATUS: TFIBStringField;
    fdsCor_GrupoST: TFIBStringField;
    fdsCor_GrupoGRUPO: TFIBStringField;
    fdsCorENVIADO_WEB: TFIBStringField;
    PngImageList: TPngImageList;
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnGrupoIncluirClick(Sender: TObject);
    procedure fdsCorAfterScroll(DataSet: TDataSet);
    procedure btnGrupoAltStatusClick(Sender: TObject);
    procedure btnGrupoExcluirClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure GerarRelacionamentos;
  private
    { Private declarations }
  public
    autopecas: string[1];
  end;

var
  frmCadCores: TfrmCadCores;
  ordem: string[4]; // controla a ordena��o: Asc / Desc

implementation

uses uUtils, untData, untPesqGrupo, untPrincipal, untSelectGrupos;

{$R *.dfm}

procedure TfrmCadCores.btnAlterarClick(Sender: TObject);
begin
  fdsCor.Edit;
  fdsCorDT_ALT.AsDateTime := Now;
  fdsCorENVIADO_WEB.AsString := 'N';
  EditaInsere;
end;

procedure TfrmCadCores.btnCancelarClick(Sender: TObject);
begin
  fdsCor.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadCores.btnDeleteClick(Sender: TObject);
begin
  if fdsCor.RecordCount > 0 then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente excluir o registro atual?'), 'Aten��o',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin
          fdsCor.Delete;
          DM.Conexao.CommitRetaining;
          lblTotal.Caption := intToStr(fdsCor.RecordCount);
        end;
    end;
  end;
end;

procedure TfrmCadCores.btnFirstClick(Sender: TObject);
begin
  fdsCor.Prior;
end;

procedure TfrmCadCores.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
  i: Smallint;
  campoVazio: Boolean;
  incluindo: Boolean;
begin
  campoVazio := False;
  incluindo := False;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i].Tag = 15) then
    begin
      if utils.VerificaCampoObrigatorio(TRzDBEdit(Components[i])) then
        campoVazio := True;
    end;
  end;

  if campoVazio then
    Application.MessageBox('Existem campos obrigat�rios sem preencher.',
      'Ante��o', MB_OK + MB_ICONERROR)
  else
  begin
    if fdsCor.State in [dsInsert] then
      incluindo := True;

    fdsCor.Post;
    DM.Conexao.CommitRetaining;
    GravaCancela;

    if incluindo then
    begin
      GerarRelacionamentos;
    end;
  end;
end;

procedure TfrmCadCores.btnGrupoAltStatusClick(Sender: TObject);
begin
  With fdsCor_Grupo do
  begin
    Edit;
    if fdsCor_GrupoSTATUS.AsString = 'A' then
      fdsCor_GrupoSTATUS.AsString := 'I'
    else
      fdsCor_GrupoSTATUS.AsString := 'A';
    Post;
    DM.Conexao.CommitRetaining;
    Close;
    Open;
    Last;
    First;
  end;
end;

procedure TfrmCadCores.btnGrupoIncluirClick(Sender: TObject);
begin
  // Try
  // frmPesqGrupo := TfrmPesqGrupo.Create(nil);
  // frmPesqGrupo.ShowModal;
  // Finally
  // if frmPesqGrupo.ModalResult = mrOk then
  // begin
  // fdsCor_Grupo.Insert;
  // fdsCor_GrupoIDGRUPO.AsInteger := frmPesqGrupo.fdsGruposID.AsInteger;
  // fdsCor_GrupoIDCOR.AsInteger := fdsCorID.AsInteger;
  // fdsCor_GrupoDT_INC.AsDateTime := Now;
  // fdsCor_GrupoSTATUS.AsString := 'A';
  // fdsCor_Grupo.Post;
  // DM.Conexao.CommitRetaining;
  // end;
  // frmPesqGrupo.Free;
  // fdsCor_Grupo.Close;
  // fdsCor_Grupo.Open;
  // fdsCor_Grupo.Last;
  // fdsCor_Grupo.First;
  // End;
  GerarRelacionamentos;
end;

procedure TfrmCadCores.btnIncluirClick(Sender: TObject);
begin
  fdsCor_Grupo.Close;
  fdsCor.Append;
  fdsCorDT_INC.AsDateTime := Now;
  fdsCorSTATUS.AsString := 'A';
  EditaInsere;
end;

procedure TfrmCadCores.btnLastClick(Sender: TObject);
begin
  fdsCor.Last;
end;

procedure TfrmCadCores.btnNextClick(Sender: TObject);
begin
  fdsCor.Next;
end;

procedure TfrmCadCores.btnPriorClick(Sender: TObject);
begin
  fdsCor.First;
end;

procedure TfrmCadCores.btnTodosClick(Sender: TObject);
begin
  fdsCor.Close;
  fdsCor.Open;
  fdsCor.Last;
  fdsCor.First;
end;

procedure TfrmCadCores.EditaInsere;
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

procedure TfrmCadCores.fdsCorAfterScroll(DataSet: TDataSet);
begin
  with fdsCor_Grupo do
  begin
    Close;
    ParamByName('IDCOR').AsInteger := fdsCorID.AsInteger;
    OrderClause := 'Nome';
    Prepare;
    Open;
  end;
end;

procedure TfrmCadCores.FormActivate(Sender: TObject);
begin
  if frmPrincipal.autopecas = 'S' then
  begin
    frmCadCores.Caption := 'Cadastro de Ve�culos';
    lblTitulo.Caption := 'Ve�culos';
    lblTituloTotal.Caption := 'Total de ve�culos';
    imgPrincipal.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\content\Veiculo_AutoPecas_64x64.png');
  end;
end;

procedure TfrmCadCores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadCores := nil;
end;

procedure TfrmCadCores.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  fdsCor.OrderClause := 'ID';
  fdsCor.Open;
  fdsCor.Last;
  fdsCor.First;
  lblTotal.Caption := intToStr(fdsCor.RecordCount);
  fdsCor_Grupo.Open;
  fdsCor_Grupo.Last;
  fdsCor_Grupo.First;
end;

procedure TfrmCadCores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadCores.GerarRelacionamentos;
begin
  Try
    frmSelectGrupos := TfrmSelectGrupos.Create(nil);
    frmSelectGrupos.idTabela := fdsCorID.AsInteger;
    frmSelectGrupos.tabela := 'Cor';
    frmSelectGrupos.ShowModal;
  Finally
    if frmSelectGrupos.ModalResult = mrOk then
    begin
      Application.MessageBox
        ('Relacionamentos com Grupos realizado com sucesso.',
        'Relacionamentos finalizado.', MB_OK + MB_ICONEXCLAMATION);
      fdsCor_Grupo.Close;
      fdsCor_Grupo.Open;
    end;
    frmSelectGrupos.Free;
  End;
end;

procedure TfrmCadCores.GravaCancela;
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

  fdsCor.Close;
  fdsCor.Open;
  fdsCor.Last;
  lblTotal.Caption := intToStr(fdsCor.RecordCount);
end;

procedure TfrmCadCores.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsCor.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadCores.JvDBGrid1TitleClick(Column: TColumn);
begin
  fdsCor.Close;
  fdsCor.OrderClause := Column.FieldName + ' ' + ordem;
  fdsCor.Open;

  if ordem = 'ASC' then
    ordem := 'DESC'
  else
    ordem := 'ASC';
end;

procedure TfrmCadCores.btnGrupoExcluirClick(Sender: TObject);
begin
  if fdsCor_Grupo.RecordCount > 0 then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente retirar o Grupo atual desta Cor?'), 'Aten��o',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin
          fdsCor_Grupo.Delete;
          DM.Conexao.CommitRetaining;
        end;
    end;
  end;
end;

end.