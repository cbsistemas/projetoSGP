unit UntVendaInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, Vcl.ExtCtrls,
  RzPanel;

type
  TfrmVendaInfo = class(TForm)
    RzPanel1: TRzPanel;
    Label1: TLabel;
    mmoInfoAdicional: TMemo;
    btnCancelar: TRzBitBtn;
    btnOK: TRzBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaInfo: TfrmVendaInfo;

implementation

{$R *.dfm}

procedure TfrmVendaInfo.btnCancelarClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TfrmVendaInfo.btnOKClick(Sender: TObject);
begin
ModalResult := mrOk;
end;

end.
