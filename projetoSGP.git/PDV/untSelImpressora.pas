unit untSelImpressora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBckgnd, Vcl.StdCtrls, RzLabel, Printers,
  RzCmboBx, RzButton;

type
  TfrmSelImpressora = class(TForm)
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    cbxImpressoras: TRzComboBox;
    RzLabel1: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelImpressora: TfrmSelImpressora;

implementation

{$R *.dfm}

procedure TfrmSelImpressora.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelImpressora.btnSelecionarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelImpressora.FormCreate(Sender: TObject);
Var
   I : Integer;
begin
  for I := 0 to Printer.Printers.Count - 1 do
  begin
    cbxImpressoras.Add(Printer.Printers[I]);
  end;
end;

end.
