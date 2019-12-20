unit untPesqGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Mask, RzEdit, RzLabel, dxGDIPlusClasses, ExtCtrls, JvExExtCtrls,
  JvImage, RzButton, RzPanel, RzBckgnd, Vcl.Imaging.pngimage;

type
  TfrmPesqGrupo = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel2: TRzPanel;
    btnSelecionar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnTodos: TRzBitBtn;
    btnPesquisar: TRzBitBtn;
    edtNome: TRzEdit;
    JvDBGrid1: TJvDBGrid;
    fdsGrupos: TpFIBDataSet;
    dsGrupos: TDataSource;
    fdsGruposID: TFIBBCDField;
    fdsGruposNOME: TFIBStringField;
    fdsGruposDT_INC: TFIBDateField;
    fdsGruposDT_ALT: TFIBDateField;
    fdsGruposSTATUS: TFIBStringField;
    fdsGruposREFERENCIA: TFIBStringField;
    fdsGruposENVIADO_WEB: TFIBStringField;
    procedure FormActivate(Sender: TObject);
    procedure Pesquisar;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqGrupo: TfrmPesqGrupo;

implementation

uses untData;

{$R *.dfm}

procedure TfrmPesqGrupo.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqGrupo.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqGrupo.btnTodosClick(Sender: TObject);
var
  sql: string;
begin
  fdsGrupos.Close;
  fdsGrupos.SelectSQL.Clear;
  sql := 'SELECT * FROM GRUPO WHERE STATUS <> ' + QuotedStr('I');
  fdsGrupos.SelectSQL.Add(sql);
  fdsGrupos.OrderClause := 'NOME';
  fdsGrupos.Prepare;
  fdsGrupos.Open;
end;

procedure TfrmPesqGrupo.edtNomeChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesqGrupo.FormActivate(Sender: TObject);
begin
  edtNome.SetFocus;
end;

procedure TfrmPesqGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    btnSelecionar.Click;
  end;
end;

procedure TfrmPesqGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (ActiveControl = JvDBGrid1) or (fdsGrupos.RecordCount = 1) then
  begin
    if Key = #13 then
    begin
      btnSelecionar.Click;
    end;
  end;
end;

procedure TfrmPesqGrupo.JvDBGrid1DblClick(Sender: TObject);
begin
  if fdsGrupos.RecordCount > 0 then
    btnSelecionar.Click;
end;

procedure TfrmPesqGrupo.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(fdsGrupos.RecNo) then
  begin
    JvDBGrid1.Canvas.Brush.Color := DM.gridOddColor;
    JvDBGrid1.Canvas.FillRect(Rect);
    JvDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmPesqGrupo.Pesquisar;
var
  sql: string;
begin
  fdsGrupos.Close;
  fdsGrupos.SelectSQL.Clear;
  sql := 'SELECT * FROM GRUPO WHERE UPPER(NOME) LIKE ' +
    QuotedStr(edtNome.Text + '%') + ' AND STATUS <> ' + QuotedStr('I');
  fdsGrupos.SelectSQL.Add(sql);
  fdsGrupos.OrderClause := 'NOME';
  fdsGrupos.Prepare;
  fdsGrupos.Open;
end;

end.
