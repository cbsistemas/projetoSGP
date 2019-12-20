unit untPesqMotoristaMDFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FIBDataSet, pFIBDataSet,
  RzBckgnd, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzButton, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel;

type
  TfrmPesqMotoristaMDFe = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    btnTodos: TRzBitBtn;
    btnPesquisar: TRzBitBtn;
    edtNome: TRzEdit;
    JvDBGrid1: TJvDBGrid;
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    fdsMotoristaMDFe: TpFIBDataSet;
    fdsMotoristaMDFeID: TFIBBCDField;
    fdsMotoristaMDFeNOME: TFIBStringField;
    fdsMotoristaMDFeCPF: TFIBStringField;
    dsMotoristaMDFe: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqMotoristaMDFe: TfrmPesqMotoristaMDFe;

implementation

{$R *.dfm}

uses untData;

procedure TfrmPesqMotoristaMDFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesqMotoristaMDFe.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesqMotoristaMDFe.FormShow(Sender: TObject);
begin
 fdsMotoristaMDFe.Open;
end;

end.
