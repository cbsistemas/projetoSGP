unit untTipoCartaoCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, RzBckgnd, dxGDIPlusClasses,
  Vcl.ExtCtrls, JvExExtCtrls, JvImage, Vcl.StdCtrls, RzLabel;

type
  TfrmTipoCartaoCredito = class(TForm)
    RzLabel1: TRzLabel;
    imgCartaoDebito: TJvImage;
    imgCartaoCredito: TJvImage;
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    procedure imgCartaoDebitoClick(Sender: TObject);
    procedure imgCartaoCreditoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoCartaoCredito: TfrmTipoCartaoCredito;

implementation

{$R *.dfm}

uses untVendaFinalizacao;

procedure TfrmTipoCartaoCredito.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTipoCartaoCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    imgCartaoDebitoClick(frmTipoCartaoCredito);

  if Key = VK_F5 then
    imgCartaoCreditoClick(frmTipoCartaoCredito);
end;

procedure TfrmTipoCartaoCredito.imgCartaoCreditoClick(Sender: TObject);
begin
  frmVendaFinalizacao.tipoCartao := 'CT';
  ModalResult := mrOk;
end;

procedure TfrmTipoCartaoCredito.imgCartaoDebitoClick(Sender: TObject);
begin
  frmVendaFinalizacao.tipoCartao := 'CD';
  ModalResult := mrOk;
end;

end.
