unit untCadVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, RzDBCmbo, ExtCtrls, ComCtrls, RzDTP, RzDBDTP, RzEdit,
  StdCtrls, RzCmboBx, Mask, RzDBEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  RzTabs, RzButton, RzLabel, dxGDIPlusClasses, JvExExtCtrls, JvImage, RzPanel,
  RzBckgnd, DB, FIBDataSet, pFIBDataSet, Vcl.Imaging.pngimage;

type
  TfrmCadVendedores = class(TForm)
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnDelete: TRzBitBtn;
    btnCancelar: TRzBitBtn;
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
    RzBackground1: TRzBackground;
    fdsVendedor: TpFIBDataSet;
    fdsVendedorID: TFIBBCDField;
    fdsVendedorNOME: TFIBStringField;
    dsVendedor: TDataSource;
    fdsVendedorDT_INC: TFIBDateField;
    fdsVendedorDT_ALT: TFIBDateField;
    fdsVendedorSTATUS: TFIBStringField;
    fdsVendedorDT_NASC: TFIBDateField;
    fdsVendedorTELEFONE: TFIBStringField;
    fdsVendedorENDERECO: TFIBStringField;
    fdsVendedorBAIRRO: TFIBStringField;
    fdsVendedorIDCIDADE: TFIBBCDField;
    fdsVendedorCEP: TFIBStringField;
    fdsVendedorRG: TFIBStringField;
    fdsVendedorCPF: TFIBStringField;
    fdsVendedorSEXO: TFIBStringField;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    JvDBGrid1: TJvDBGrid;
    tbsForm: TRzTabSheet;
    lblCodigo: TRzLabel;
    lblDtAlt: TRzLabel;
    lblDtInc: TRzLabel;
    lblNome: TRzLabel;
    lblDtNasc: TRzLabel;
    lblRG: TRzLabel;
    lblCPF: TRzLabel;
    lblStatus: TRzLabel;
    edtID: TRzDBEdit;
    edtDt_Inc: TRzDBEdit;
    edtDt_Alt: TRzDBEdit;
    edtNome: TRzDBEdit;
    edtRG: TRzDBEdit;
    edtCPF: TRzDBEdit;
    cbxStatus: TRzDBComboBox;
    RzDBDateTimePicker1: TRzDBDateTimePicker;
    edtEmail: TRzDBEdit;
    lblEmail: TRzLabel;
    edtCelular: TRzDBEdit;
    lblCelular: TRzLabel;
    edtTelefone: TRzDBEdit;
    lblTelefone: TRzLabel;
    edtCidade: TRzEdit;
    lblCidade: TRzLabel;
    edtUF: TRzEdit;
    lblUF: TRzLabel;
    btnPesqCidade: TRzBitBtn;
    edtCEP: TRzDBEdit;
    lblCEP: TRzLabel;
    cbxSexo: TRzDBComboBox;
    lblSexo: TRzLabel;
    edtBairro: TRzDBEdit;
    lblBairro: TRzLabel;
    edtEndereco: TRzDBEdit;
    lblEndereco: TRzLabel;
    fdsVendedorEMAIL: TFIBStringField;
    fdsVendedorCELULAR: TFIBStringField;
    fdsVendedorCIDADE: TFIBStringField;
    fdsVendedorUF: TFIBStringField;
    fdsVendedorENVIADO_WEB: TFIBStringField;
    fdsVendedorIDFILIAL: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditaInsere;
    procedure GravaCancela;
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
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure fdsVendedorAfterScroll(DataSet: TDataSet);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVendedores: TfrmCadVendedores;

implementation

uses untData, uUtils, untPesqCidade;

{$R *.dfm}

procedure TfrmCadVendedores.btnAlterarClick(Sender: TObject);
begin
  fdsVendedor.Edit;
  fdsVendedorDT_ALT.AsDateTime := Now;
  fdsVendedorENVIADO_WEB.AsString := 'N';
  EditaInsere;
end;

procedure TfrmCadVendedores.btnCancelarClick(Sender: TObject);
begin
  fdsVendedor.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadVendedores.btnDeleteClick(Sender: TObject);
begin
  if fdsVendedor.RecordCount > 0 then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente excluir o registro atual?'), 'Atenção',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin
          fdsVendedor.Delete;
          DM.Conexao.CommitRetaining;
          lblTotal.Caption := intToStr(fdsVendedor.RecordCount);
        end;
    end;
  end;
end;

procedure TfrmCadVendedores.btnFirstClick(Sender: TObject);
begin
  fdsVendedor.Prior;
end;

procedure TfrmCadVendedores.btnGravarClick(Sender: TObject);
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
    Application.MessageBox('Existem campos obrigatórios sem preencher.',
      'Anteção', MB_OK + MB_ICONERROR)
  else
  begin
    fdsVendedor.Post;
    DM.Conexao.CommitRetaining;
    GravaCancela;
    fdsVendedor.Close;
    fdsVendedor.OrderClause := 'NOME';
    fdsVendedor.Open;
    fdsVendedor.Last;
  end;
end;

procedure TfrmCadVendedores.btnIncluirClick(Sender: TObject);
begin
  fdsVendedor.Append;
  fdsVendedorDT_INC.AsDateTime := Now;
  fdsVendedorSEXO.AsString := 'M';
  fdsVendedorSTATUS.AsString := 'A';
  fdsVendedorIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsVendedorENVIADO_WEB.AsString := 'N';
  fdsVendedorDT_NASC.AsDateTime := Now;
  EditaInsere;
end;

procedure TfrmCadVendedores.btnLastClick(Sender: TObject);
begin
  fdsVendedor.Last;
end;

procedure TfrmCadVendedores.btnNextClick(Sender: TObject);
begin
  fdsVendedor.Next;
end;

procedure TfrmCadVendedores.btnPesqCidadeClick(Sender: TObject);
begin
  Try
    frmPesqCidade := TfrmPesqCidade.Create(nil);
    frmPesqCidade.ShowModal;
  Finally
    if frmPesqCidade.ModalResult = mrOk then
    begin
      fdsVendedorIDCIDADE.AsInteger := frmPesqCidade.fdsCidadesID.AsInteger;
      edtCidade.Text := frmPesqCidade.fdsCidadesNOME.AsString;
      edtUF.Text := frmPesqCidade.fdsCidadesUF.AsString;
    end;
    frmPesqCidade.Free;
  End;
end;

procedure TfrmCadVendedores.btnPriorClick(Sender: TObject);
begin
  fdsVendedor.First;
end;

procedure TfrmCadVendedores.btnTodosClick(Sender: TObject);
begin
  fdsVendedor.Close;
  fdsVendedor.Open;
  fdsVendedor.Last;
  fdsVendedor.First;
end;

procedure TfrmCadVendedores.EditaInsere;
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

procedure TfrmCadVendedores.fdsVendedorAfterScroll(DataSet: TDataSet);
begin
  edtCidade.Text := fdsVendedorCIDADE.AsString;
  edtUF.Text := fdsVendedorUF.AsString;
end;

procedure TfrmCadVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadVendedores := nil;
end;

procedure TfrmCadVendedores.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  fdsVendedor.Open;
  fdsVendedor.Last;
  fdsVendedor.First;
  lblTotal.Caption := intToStr(fdsVendedor.RecordCount);
end;

procedure TfrmCadVendedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadVendedores.GravaCancela;
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

  fdsVendedor.Close;
  fdsVendedor.Open;
  fdsVendedor.Last;
  lblTotal.Caption := intToStr(fdsVendedor.RecordCount);
end;

procedure TfrmCadVendedores.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsVendedor.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadVendedores.JvDBGrid1TitleClick(Column: TColumn);
begin
  fdsVendedor.Close;
  fdsVendedor.OrderClause := Column.FieldName;
  fdsVendedor.Open;
end;

end.
