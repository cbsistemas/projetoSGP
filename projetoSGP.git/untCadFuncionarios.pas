unit untCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.Menus,
  System.Actions, Vcl.ActnList, FIBQuery, pFIBQuery, Data.DB, FIBDataSet,
  pFIBDataSet, Vcl.ExtCtrls, Vcl.ComCtrls, RzDTP, RzDBDTP, Vcl.DBCtrls,
  RzDBCmbo, Vcl.StdCtrls, RzCmboBx, Vcl.Mask, RzEdit, RzDBEdit, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzButton, dxGDIPlusClasses,
  JvExExtCtrls, JvImage, RzPanel, RzLabel, RzBckgnd;

type
  TfrmCadFuncionarios = class(TForm)
    RzBackground1: TRzBackground;
    RzLabel27: TRzLabel;
    RzLabel29: TRzLabel;
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
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    gdrFuncionarios: TJvDBGrid;
    tbsForm: TRzTabSheet;
    lblCodigo: TRzLabel;
    lblDtAlt: TRzLabel;
    lblDtInc: TRzLabel;
    lblEndereco: TRzLabel;
    lblCEP: TRzLabel;
    lblBairro: TRzLabel;
    lblNome: TRzLabel;
    lblTelefone: TRzLabel;
    lblCelular: TRzLabel;
    lblSexo: TRzLabel;
    lblStatus: TRzLabel;
    lblUF: TRzLabel;
    lblCidade: TRzLabel;
    lblDtNasc: TRzLabel;
    edtID: TRzDBEdit;
    edtCEP: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtDt_Alt: TRzDBEdit;
    edtEndereco: TRzDBEdit;
    edtBairro: TRzDBEdit;
    edtNome: TRzDBEdit;
    edtTelefone: TRzDBEdit;
    edtCelular: TRzDBEdit;
    cbxSexo: TRzDBComboBox;
    cbxStatus: TRzDBComboBox;
    btnPesqCidade: TRzBitBtn;
    edtCidade: TRzDBEdit;
    edtUF: TRzDBEdit;
    RzDBDateTimePicker1: TRzDBDateTimePicker;
    pnlFisica: TPanel;
    lblRG: TRzLabel;
    lblCPF: TRzLabel;
    edtRG: TRzDBEdit;
    edtCPF: TRzDBEdit;
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    fdsFuncionarios: TpFIBDataSet;
    dsFuncionarios: TDataSource;
    fdsFuncionariosID: TFIBBCDField;
    fdsFuncionariosDT_INC: TFIBDateField;
    fdsFuncionariosDT_ALT: TFIBDateField;
    fdsFuncionariosSTATUS: TFIBStringField;
    fdsFuncionariosNOME: TFIBStringField;
    fdsFuncionariosDT_NASC: TFIBDateField;
    fdsFuncionariosTELEFONE: TFIBStringField;
    fdsFuncionariosENDERECO: TFIBStringField;
    fdsFuncionariosBAIRRO: TFIBStringField;
    fdsFuncionariosIDCIDADE: TFIBBCDField;
    fdsFuncionariosCEP: TFIBStringField;
    fdsFuncionariosRG: TFIBStringField;
    fdsFuncionariosCPF: TFIBStringField;
    fdsFuncionariosSEXO: TFIBStringField;
    fdsFuncionariosCELULAR: TFIBStringField;
    fdsFuncionariosENVIADO_WEB: TFIBStringField;
    fdsFuncionariosCIDADE: TFIBStringField;
    fdsFuncionariosUF: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure PesquisaFuncionario(condicao: string);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesqCidadeClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure gdrFuncionariosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrFuncionariosKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;

implementation

{$R *.dfm}

uses untData, uUtils, untPesqCidade, untPesqFuncionario;

procedure TfrmCadFuncionarios.btnAlterarClick(Sender: TObject);
begin
  fdsFuncionarios.Edit;
  fdsFuncionariosDT_ALT.AsDateTime := Now;
  fdsFuncionariosENVIADO_WEB.AsString := 'N';
  EditaInsere;
end;

procedure TfrmCadFuncionarios.btnCancelarClick(Sender: TObject);
begin
  fdsFuncionarios.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadFuncionarios.btnDeleteClick(Sender: TObject);
begin
  if fdsFuncionarios.RecordCount > 0 then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente excluir o registro atual?'), 'Aten��o',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin
          fdsFuncionarios.Delete;
          DM.Conexao.CommitRetaining;
          lblTotal.Caption := intToStr(fdsFuncionarios.RecordCount);
        end;
    end;
  end;
end;

procedure TfrmCadFuncionarios.btnFirstClick(Sender: TObject);
begin
  fdsFuncionarios.Prior;
end;

procedure TfrmCadFuncionarios.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
  i: Smallint;
  campoVazio: Boolean;
begin
  campoVazio := False;
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
    fdsFuncionarios.Post;
    DM.Conexao.CommitRetaining;
    GravaCancela;
  end;

end;

procedure TfrmCadFuncionarios.btnIncluirClick(Sender: TObject);
begin
  fdsFuncionarios.Append;
  fdsFuncionariosDT_INC.AsDateTime := Now;
  fdsFuncionariosSEXO.AsString := 'M';
  fdsFuncionariosSTATUS.AsString := 'A';
  fdsFuncionariosDT_NASC.AsDateTime := Now;
  edtCidade.Clear;
  edtUF.Clear;
  EditaInsere;
end;

procedure TfrmCadFuncionarios.btnLastClick(Sender: TObject);
begin
  fdsFuncionarios.Last;
end;

procedure TfrmCadFuncionarios.btnNextClick(Sender: TObject);
begin
  fdsFuncionarios.Next;
end;

procedure TfrmCadFuncionarios.btnPesqCidadeClick(Sender: TObject);
begin
  Try
    frmPesqCidade := TfrmPesqCidade.Create(nil);
    frmPesqCidade.ShowModal;
  Finally
    if frmPesqCidade.ModalResult = mrOk then
    begin
      fdsFuncionariosIDCIDADE.AsInteger := frmPesqCidade.fdsCidadesID.AsInteger;
      edtCidade.Text := frmPesqCidade.fdsCidadesNOME.AsString;
      edtUF.Text := frmPesqCidade.fdsCidadesUF.AsString;
    end;
    frmPesqCidade.Free;
  End;
  edtCEP.SetFocus;
end;

procedure TfrmCadFuncionarios.btnPriorClick(Sender: TObject);
begin
  fdsFuncionarios.First;
end;

procedure TfrmCadFuncionarios.btnTodosClick(Sender: TObject);
begin
  with fdsFuncionarios do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCadFuncionarios.EditaInsere;
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

procedure TfrmCadFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadFuncionarios := nil;
end;

procedure TfrmCadFuncionarios.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  fdsFuncionarios.OrderClause := 'NOME';
  fdsFuncionarios.Open;
  lblTotal.Caption := intToStr(fdsFuncionarios.RecordCount);
end;

procedure TfrmCadFuncionarios.gdrFuncionariosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsFuncionarios.RecNo) then
  begin
    gdrFuncionarios.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
      gdrFuncionarios.Canvas.Brush.Color :=clHighlight;
    gdrFuncionarios.Canvas.FillRect(Rect);
    gdrFuncionarios.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadFuncionarios.gdrFuncionariosKeyPress(Sender: TObject;
  var Key: Char);
var
  coluna: string;
begin
  if (Key = 'p') then
  begin
    coluna := gdrFuncionarios.SelectedField.FieldName;
    if coluna = 'NOME' then
    Begin
      Try
        frmPesqFuncionario := TfrmPesqFuncionario.Create(nil);
        frmPesqFuncionario.ShowModal;
      Finally
        if frmPesqFuncionario.ModalResult = mrOk then
        begin
          PesquisaFuncionario
            ('F.ID = ' + frmPesqFuncionario.fdsFuncionariosID.AsString);
        end;
        frmPesqFuncionario.Free;
      End;
    end;
  end;
end;

procedure TfrmCadFuncionarios.GravaCancela;
var
  i: Smallint;
  utils: TUtils;
  editando: Boolean;
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

  fdsFuncionarios.Close;
  fdsFuncionarios.OrderClause := 'NOME';
  fdsFuncionarios.Open;
  lblTotal.Caption := intToStr(fdsFuncionarios.RecordCount);
end;

procedure TfrmCadFuncionarios.PesquisaFuncionario(condicao: string);
var
  tempIdCliente: string;
begin
  with fdsFuncionarios do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('PESQ', condicao, True);
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

end.