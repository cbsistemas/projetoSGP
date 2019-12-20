unit untNFeInformacoesAdicionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, RzEdit, RzLabel,
  dxGDIPlusClasses, Vcl.ExtCtrls, JvExExtCtrls, JvImage, RzPanel, RzBckgnd;

type
  TfrmNFeInformacoesAdicionais = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloTotal: TRzLabel;
    lblTotal: TRzLabel;
    lblRetorno: TRzLabel;
    mmoInformacaoAdicional: TRzMemo;
    btnCancelar: TRzBitBtn;
    btnConfirmar: TRzBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNFeInformacoesAdicionais: TfrmNFeInformacoesAdicionais;

implementation

{$R *.dfm}

procedure TfrmNFeInformacoesAdicionais.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmNFeInformacoesAdicionais.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
