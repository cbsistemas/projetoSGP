unit untPesqServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Mask, RzEdit, RzButton, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, RzBckgnd, Vcl.Imaging.pngimage;

type
  TfrmPesqServicos = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    btnTodos: TRzBitBtn;
    btnPesquisar: TRzBitBtn;
    edtNome: TRzEdit;
    JvDBGrid1: TJvDBGrid;
    RzPanel2: TRzPanel;
    btnSelecionar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    dsServicos: TDataSource;
    fdsServicos: TpFIBDataSet;
    fdsServicosID: TFIBBCDField;
    fdsServicosSTATUS: TFIBStringField;
    fdsServicosDT_INC: TFIBDateField;
    fdsServicosNOME: TFIBStringField;
    fdsServicosDESCRICAO: TFIBStringField;
    fdsServicosPRECO: TFIBBCDField;
    procedure btnTodosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Pesquisar;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqServicos: TfrmPesqServicos;

implementation

uses untData;

{$R *.dfm}

procedure TfrmPesqServicos.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqServicos.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesqServicos.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqServicos.btnTodosClick(Sender: TObject);
var
  sql : string;
begin
  fdsServicos.Close;
  fdsServicos.SelectSQL.Clear;
  sql := 'SELECT * FROM SERVICOS';
  fdsServicos.SelectSQL.Add(sql);
  fdsServicos.OrderClause := 'NOME';
  fdsServicos.Prepare;
  fdsServicos.Open;
  fdsServicos.Last;
  fdsServicos.First;
end;

procedure TfrmPesqServicos.edtNomeChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesqServicos.FormActivate(Sender: TObject);
begin
  edtNome.SetFocus;
  fdsServicos.Open;
  fdsServicos.First;
end;

procedure TfrmPesqServicos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPesqServicos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnSelecionar.Click;
  end;
end;

procedure TfrmPesqServicos.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsServicos.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
  end;
end;

procedure TfrmPesqServicos.Pesquisar;
var
  sql : string;
begin
  fdsServicos.Close;
  fdsServicos.SelectSQL.Clear;
  sql := 'SELECT * FROM FUNCIONARIO F WHERE UPPER(F.NOME) LIKE '+ QuotedStr(edtNome.Text + '%');
  fdsServicos.SelectSQL.Add(sql);
  fdsServicos.OrderClause := 'NOME';
  fdsServicos.Prepare;
  fdsServicos.Open;
end;

end.
