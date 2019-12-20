unit untCadVeicClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzCmboBx, RzDBCmbo,
  Vcl.Mask, RzEdit, RzDBEdit, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  RzTabs, RzBckgnd, RzButton, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, Data.DB, FIBDataSet, pFIBDataSet,
  dxGDIPlusClasses;

type
  TfrmCadVeicCliente = class(TForm)
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
    RzPanel2: TRzPanel;
    btnIncluir: TRzBitBtn;
    btnGravar: TRzBitBtn;
    btnAlterar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    RzBackground1: TRzBackground;
    pgcControl: TRzPageControl;
    tbsTabela: TRzTabSheet;
    JvDBGrid1: TJvDBGrid;
    tbsForm: TRzTabSheet;
    lblCodigo: TRzLabel;
    edtID: TRzDBEdit;
    edtNome: TRzDBEdit;
    lblNome: TRzLabel;
    btnPesqCliente: TRzBitBtn;
    RzLabel11: TRzLabel;
    edtPlaca: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzLabel13: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzDBEdit4: TRzDBEdit;
    RzLabel14: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    fdsVeiculos: TpFIBDataSet;
    fdsVeiculosID: TFIBBCDField;
    fdsVeiculosIDCLIENTE: TFIBBCDField;
    fdsVeiculosPLACA: TFIBStringField;
    fdsVeiculosMARCA: TFIBStringField;
    fdsVeiculosMODEO: TFIBStringField;
    fdsVeiculosCOR: TFIBStringField;
    fdsVeiculosANO: TFIBStringField;
    fdsVeiculosKM: TFIBIntegerField;
    dsVeiculos: TDataSource;
    fdsVeiculosCLIENTE: TFIBStringField;
    edtDt_Inc: TRzDBEdit;
    lblDtInc: TRzLabel;
    fdsVeiculosDT_INC: TFIBDateField;
    RzLabel1: TRzLabel;
    edtPesqPlaca: TRzEdit;
    btnPesqPlaca: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnPesqClienteClick(Sender: TObject);
    procedure btnPesqPlacaClick(Sender: TObject);
    procedure edtPesqPlacaKeyPress(Sender: TObject; var Key: Char);
    procedure fdsVeiculosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeicCliente: TfrmCadVeicCliente;

implementation

{$R *.dfm}

uses untData, uUtils, untPesqCliente;

procedure TfrmCadVeicCliente.btnAlterarClick(Sender: TObject);
begin
  fdsVeiculos.Edit;
  EditaInsere;
end;

procedure TfrmCadVeicCliente.btnCancelarClick(Sender: TObject);
begin
  fdsVeiculos.Cancel;
  DM.Conexao.RollbackRetaining;
  GravaCancela;
end;

procedure TfrmCadVeicCliente.btnFirstClick(Sender: TObject);
begin
  fdsVeiculos.Prior;
end;

procedure TfrmCadVeicCliente.btnGravarClick(Sender: TObject);
var
  utils : TUtils;
  i : Smallint;
  campoVazio : Boolean;
begin
  campoVazio := False;
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i].Tag = 15) then
    begin
        if utils.VerificaCampoObrigatorio(TRzDBEdit(Components[i])) then
          campoVazio := True;
    end;
  end;

  if campoVazio then
    Application.MessageBox('Existem campos obrigat�rios sem preencher.','Ante��o',MB_OK+MB_ICONERROR)
  else
  begin
    fdsVeiculos.Post;
    DM.Conexao.CommitRetaining;
    GravaCancela;
  end;
end;

procedure TfrmCadVeicCliente.btnIncluirClick(Sender: TObject);
begin
  fdsVeiculos.Append;
  EditaInsere;
end;

procedure TfrmCadVeicCliente.btnLastClick(Sender: TObject);
begin
  fdsVeiculos.Last;
end;

procedure TfrmCadVeicCliente.btnNextClick(Sender: TObject);
begin
  fdsVeiculos.Next;
end;

procedure TfrmCadVeicCliente.btnPesqClienteClick(Sender: TObject);
begin
  try
    frmPesqCliente := TfrmPesqCliente.Create(nil);
    frmPesqCliente.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin
      fdsVeiculosIDCLIENTE.AsInteger := frmPesqCliente.fdsClientesID.AsInteger;
      fdsVeiculosCLIENTE.AsString := frmPesqCliente.fdsClientesNOME.AsString;
      edtPlaca.SetFocus;
    end;
    frmPesqCliente.Free;
  end;
end;

procedure TfrmCadVeicCliente.btnPesqPlacaClick(Sender: TObject);
begin
  if not(Trim(edtPesqPlaca.Text) =  EmptyStr) then
  begin
    with fdsVeiculos do
    begin
      Close;
      Conditions.Clear;
      Conditions.AddCondition('PLACA', 'PLACA = ' + QuotedStr(Trim(edtPesqPlaca.Text)), True);
      Conditions.Apply;
      Prepare;
      Open;
      pgcControl.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfrmCadVeicCliente.btnPriorClick(Sender: TObject);
begin
  fdsVeiculos.First;
end;

procedure TfrmCadVeicCliente.btnTodosClick(Sender: TObject);
begin
  with fdsVeiculos do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    Prepare;
    Open;
  end;
end;

procedure TfrmCadVeicCliente.EditaInsere;
var
  i : Smallint;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).ActivePageIndex:= 1;
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
  btnPesqCliente.SetFocus;
end;

procedure TfrmCadVeicCliente.edtPesqPlacaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnPesqPlaca.Click;
  end;
end;

procedure TfrmCadVeicCliente.fdsVeiculosAfterOpen(DataSet: TDataSet);
begin
  lblTotal.Caption := IntToStr(fdsVeiculos.RecordCount);
end;

procedure TfrmCadVeicCliente.FormCreate(Sender: TObject);
begin
  fdsVeiculos.Open;
  lblTotal.Caption := IntToStr(fdsVeiculos.RecordCount);
end;

procedure TfrmCadVeicCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmCadVeicCliente.GravaCancela;
var
  i : Smallint;
  utils : TUtils;
  editando : Boolean;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).Pages[0].TabVisible := True;
      TRzPageControl(Components[i]).ActivePageIndex:= 0;
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
            utils.ResetColorCampo(TRzDBEdit(Components[i]), true)
          else
            utils.ResetColorCampo(TRzDBEdit(Components[i]), false);
        end;
      end;
    end;
  end;

  fdsVeiculos.Close;
  fdsVeiculos.OrderClause := 'NOME';
  fdsVeiculos.Open;
  fdsVeiculos.Last;
  lblTotal.Caption := intToStr(fdsVeiculos.RecordCount);
end;

end.