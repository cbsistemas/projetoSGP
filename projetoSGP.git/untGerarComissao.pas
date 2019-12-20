unit untGerarComissao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzButton,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, RzLabel, RzCmboBx;

type
  TfrmGerarComissao = class(TForm)
    RzPanel1: TRzPanel;
    cbxVendedor: TRzComboBox;
    RzLabel17: TRzLabel;
    RzLabel11: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    RzLabel12: TRzLabel;
    dtpFim: TJvDatePickerEdit;
    RzLabel1: TRzLabel;
    btnConfirmar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarComissao: TfrmGerarComissao;

implementation

{$R *.dfm}

procedure TfrmGerarComissao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGerarComissao.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
