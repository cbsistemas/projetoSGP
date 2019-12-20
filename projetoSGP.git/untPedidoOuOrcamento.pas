unit untPedidoOuOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JvExButtons,
  JvBitBtn, RzLabel, Vcl.ExtCtrls, RzPanel;

type
  TfrmPedidoOuOrcamento = class(TForm)
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    btnPedido: TJvBitBtn;
    btnorcamento: TJvBitBtn;
    procedure btnPedidoClick(Sender: TObject);
    procedure btnorcamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoOuOrcamento: TfrmPedidoOuOrcamento;

implementation

{$R *.dfm}

uses untPedidos;

procedure TfrmPedidoOuOrcamento.btnorcamentoClick(Sender: TObject);
begin
 pedido_Ocamento := 'OR';
 ModalResult:= mrOk;
end;

procedure TfrmPedidoOuOrcamento.btnPedidoClick(Sender: TObject);
begin
 pedido_Ocamento := 'PD';
 ModalResult:= mrOk;
end;

end.
