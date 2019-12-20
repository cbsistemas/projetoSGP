unit untPesqIBPT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FIBDataSet, pFIBDataSet,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExExtCtrls, JvImage,
  RzPanel, dxGDIPlusClasses;

type
  TfrmPesqIBPT = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    btnTodos: TRzBitBtn;
    btnPesquisar: TRzBitBtn;
    edtDescricao: TRzEdit;
    JvDBGrid1: TJvDBGrid;
    RzPanel2: TRzPanel;
    btnSelecionar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    dsIBPT: TDataSource;
    fdsIBPT: TpFIBDataSet;
    fdsIBPTID: TFIBBCDField;
    fdsIBPTDT_ALT: TFIBDateField;
    fdsIBPTUF: TFIBStringField;
    fdsIBPTNCM: TFIBStringField;
    fdsIBPTDESCRICAO: TFIBStringField;
    fdsIBPTNACIONAL_FEDERAL: TFIBBCDField;
    fdsIBPTNACIONAL_IMPORTADOS: TFIBBCDField;
    fdsIBPTESTADUAL: TFIBBCDField;
    fdsIBPTMUNICIPAL: TFIBBCDField;
    procedure edtDescricaoChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure pesquisa;
  public
    { Public declarations }
  end;

var
  frmPesqIBPT: TfrmPesqIBPT;

implementation

{$R *.dfm}

uses untData;

{ TfrmPesqIBPT }

procedure TfrmPesqIBPT.btnCancelarClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TfrmPesqIBPT.btnPesquisarClick(Sender: TObject);
begin
 pesquisa;
end;

procedure TfrmPesqIBPT.btnSelecionarClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmPesqIBPT.btnTodosClick(Sender: TObject);
begin
  with fdsIBPT do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    prepare;
    Open;
    First;
  end;
end;

procedure TfrmPesqIBPT.edtDescricaoChange(Sender: TObject);
begin
  pesquisa;
end;

procedure TfrmPesqIBPT.FormCreate(Sender: TObject);
begin
  with fdsIBPT do
  begin
    Close;
    Conditions.Clear;
    Conditions.Apply;
    prepare;
    Open;
    First;
  end;
end;

procedure TfrmPesqIBPT.pesquisa;
begin
  with fdsIBPT do
  begin
    Close;
    Conditions.Clear;
    Conditions.AddCondition('PESQUISA', ('(upper(DESCRICAO) LIKE ' + QuotedStr('%' + edtDescricao.Text + '%')+')') + 'OR' +('(upper(NCM) LIKE' + QuotedStr( '%' +edtDescricao.Text+ '%' )+')'), True);
    Conditions.Apply;
    Prepare;
    Open;
  end;

end;

end.
