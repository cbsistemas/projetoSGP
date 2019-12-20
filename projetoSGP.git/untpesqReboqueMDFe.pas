unit untpesqReboqueMDFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FIBDataSet, pFIBDataSet,
  RzBckgnd, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  RzPanel, RzButton, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, JvExExtCtrls, JvImage;

type
  TfrmPesqReboqueMDFe = class(TForm)
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblNome: TRzLabel;
    edtNome: TRzEdit;
    btnPesquisar: TRzBitBtn;
    RzPanel1: TRzPanel;
    JvImage2: TJvImage;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btnTodos: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    RzEdit1: TRzEdit;
    JvDBGrid1: TJvDBGrid;
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    fdsReboque: TpFIBDataSet;
    dsReboque: TDataSource;
    fdsReboqueID: TFIBBCDField;
    fdsReboqueDT_INC: TFIBDateField;
    fdsReboqueDT_ALT: TFIBDateField;
    fdsReboqueSTATUS: TFIBStringField;
    fdsReboquePLACA: TFIBStringField;
    fdsReboqueEMITENTE_MDFE: TFIBStringField;
    fdsReboqueRAZAO: TFIBStringField;
    RzEdit2: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqReboqueMDFe: TfrmPesqReboqueMDFe;

implementation

{$R *.dfm}

uses untData;

procedure TfrmPesqReboqueMDFe.FormShow(Sender: TObject);
begin
  fdsReboque.Close;
  fdsReboque.Open;
end;

end.
