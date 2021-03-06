unit untCadVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzDBCmbo, Mask, RzEdit, RzDBEdit, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, RzTabs, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzButton, RzPanel, RzBckgnd, DB, FIBDataSet,
  pFIBDataSet, Vcl.Imaging.pngimage;

type
  TfrmCadVeiculos = class(TForm)
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
    fdsVeiculo: TpFIBDataSet;
    dsVeiculo: TDataSource;
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
    RzDBEdit1: TRzDBEdit;
    RzLabel1: TRzLabel;
    fdsVeiculoID: TFIBBCDField;
    fdsVeiculoDT_INC: TFIBDateField;
    fdsVeiculoDT_ALT: TFIBDateField;
    fdsVeiculoSTATUS: TFIBStringField;
    fdsVeiculoNOME: TFIBStringField;
    fdsVeiculoMODELO: TFIBStringField;
    fdsVeiculoPLACA: TFIBStringField;
    fdsVeiculoCARGA_MAX: TFIBBCDField;
    fdsVeiculoENVIADO_WEB: TFIBStringField;
    fdsVeiculoTARA: TFIBIntegerField;
    fdsVeiculoRENAVAM: TFIBBCDField;
    fdsVeiculoIDTRANSPORTADORA: TFIBBCDField;
    fdsVeiculoUF: TFIBStringField;
    fdsVeiculoCAPACIDADE_KG: TFIBIntegerField;
    fdsVeiculoCAPACIDADE_M3: TFIBIntegerField;
    fdsVeiculoTIPO_CARROCERIA: TFIBStringField;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzDBComboBox1: TRzDBComboBox;
    RzLabel4: TRzLabel;
    RzDBEdit4: TRzDBEdit;
    RzLabel5: TRzLabel;
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
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeiculos: TfrmCadVeiculos;

implementation

uses untData, uUtils;

{$R *.dfm}

procedure TfrmCadVeiculos.btnAlterarClick(Sender: TObject);
begin
  fdsVeiculo.Edit;
  fdsVeiculoDT_ALT.AsDateTime := Now;
  EditaInsere;
end;

procedure TfrmCadVeiculos.btnCancelarClick(Sender: TObject);
begin
  fdsVeiculo.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadVeiculos.btnDeleteClick(Sender: TObject);
begin
  if fdsVeiculo.RecordCount > 0 then
  begin
    Case MessageBox(Application.Handle,
      Pchar('Deseja realmente excluir o registro atual?'), 'Aten��o',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes:
        begin
          fdsVeiculo.Delete;
          DM.Conexao.CommitRetaining;
          lblTotal.Caption := intToStr(fdsVeiculo.RecordCount);
        end;
    end;
  end;
end;

procedure TfrmCadVeiculos.btnFirstClick(Sender: TObject);
begin
  fdsVeiculo.Prior;
end;

procedure TfrmCadVeiculos.btnGravarClick(Sender: TObject);
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
    fdsVeiculo.Post;
    DM.Conexao.CommitRetaining;
    GravaCancela;
  end;
end;

procedure TfrmCadVeiculos.btnIncluirClick(Sender: TObject);
begin
  fdsVeiculo.Append;
  fdsVeiculoDT_INC.AsDateTime := Now;
  fdsVeiculoSTATUS.AsString := 'A';
  fdsVeiculoENVIADO_WEB.AsString := 'N';
 // fdsVeiculoIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  EditaInsere;
end;

procedure TfrmCadVeiculos.btnLastClick(Sender: TObject);
begin
  fdsVeiculo.Last;
end;

procedure TfrmCadVeiculos.btnNextClick(Sender: TObject);
begin
  fdsVeiculo.Next;
end;

procedure TfrmCadVeiculos.btnPriorClick(Sender: TObject);
begin
  fdsVeiculo.First;
end;

procedure TfrmCadVeiculos.btnTodosClick(Sender: TObject);
begin
  fdsVeiculo.Close;
  fdsVeiculo.Open;
  fdsVeiculo.Last;
  fdsVeiculo.First;
end;

procedure TfrmCadVeiculos.EditaInsere;
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

procedure TfrmCadVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadVeiculos := nil;
end;

procedure TfrmCadVeiculos.FormCreate(Sender: TObject);
begin
  tbsTabela.Show;
  fdsVeiculo.Open;
  fdsVeiculo.Last;
  fdsVeiculo.First;
  lblTotal.Caption := intToStr(fdsVeiculo.RecordCount);
end;

procedure TfrmCadVeiculos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadVeiculos.GravaCancela;
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

  fdsVeiculo.Close;
  fdsVeiculo.OrderClause := 'NOME';
  fdsVeiculo.Open;
  fdsVeiculo.Last;
  lblTotal.Caption := intToStr(fdsVeiculo.RecordCount);
end;

procedure TfrmCadVeiculos.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsVeiculo.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    if gdSelected in State then
      JvDBGrid1.Canvas.Brush.Color :=clHighlight;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadVeiculos.JvDBGrid1TitleClick(Column: TColumn);
begin
  fdsVeiculo.Close;
  fdsVeiculo.OrderClause := Column.FieldName;
  fdsVeiculo.Open;
end;

end.
