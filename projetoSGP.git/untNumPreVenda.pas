unit untNumPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzLabel, Vcl.ExtCtrls, RzPanel;

type
  TfrmNumPreVenda = class(TForm)
    RzPanel1: TRzPanel;
    lblTituloCliente: TRzLabel;
    btnConfirmar: TRzBitBtn;
    edtNumPreVenda: TRzEdit;
    procedure edtNumPreVendaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNumPreVenda: TfrmNumPreVenda;

implementation

{$R *.dfm}

uses uUtils;

procedure TfrmNumPreVenda.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNumPreVenda.edtNumPreVendaExit(Sender: TObject);
var
  utils: TUtils;
  num: Double;
begin
  num := utils.ValidaInteiroFloat(edtNumPreVenda.Text, 'I');

  if num = 0 then
  begin
    Application.MessageBox('Informe um n�mero v�lido.', 'Aten��o',
      MB_OK + MB_ICONWARNING);
    edtNumPreVenda.SetFocus;
    Abort;
  end;
end;

procedure TfrmNumPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btnConfirmar.Click;
end;

end.