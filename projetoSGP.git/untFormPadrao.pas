unit untCadCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, StdCtrls, RzCmboBx, RzDBCmbo, Mask, RzEdit, RzDBEdit,
  RzLabel, Grids, DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzButton, RzPanel,
  RzBckgnd;

type
  TfrmCadCartas = class(TForm)
    RzBackground1: TRzBackground;
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
    fdsMotorista: TpFIBDataSet;
    dsMotorista: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCartas: TfrmCadCartas;

implementation

{$R *.dfm}

end.
