unit untSelGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBckgnd, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzButton, Data.DB, FIBDataSet, pFIBDataSet, RzCmboBx,
  RzDBCmbo, JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TfrmSelGrupo = class(TForm)
    RzPanel1: TRzPanel;
    lblTituloCliente: TRzLabel;
    RzBackground1: TRzBackground;
    fdsGrupo: TpFIBDataSet;
    fdsGrupoID: TFIBBCDField;
    fdsGrupoNOME: TFIBStringField;
    fdsGrupoREFERENCIA: TFIBStringField;
    dsGrupo: TDataSource;
    btnSelecionar: TRzBitBtn;
    fdsGrupoMARGEM_LUCRO: TFIBBCDField;
    cbxGrupo: TRzComboBox;
    procedure fdsGrupoAfterOpen(DataSet: TDataSet);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelGrupo: TfrmSelGrupo;

implementation

{$R *.dfm}

uses untData;

procedure TfrmSelGrupo.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TfrmSelGrupo.fdsGrupoAfterOpen(DataSet: TDataSet);
begin
  fdsGrupo.First;
  while not(fdsGrupo.EOF) do
  begin
    cbxGrupo.AddItemValue(fdsGrupoNOME.AsString, fdsGrupoID.AsString);
    fdsGrupo.Next;
  end;
  cbxGrupo.ItemIndex := 0;
end;

procedure TfrmSelGrupo.FormShow(Sender: TObject);
begin
  fdsGrupo.Open;
end;

end.
