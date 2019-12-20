unit untInutilizarNFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, RzBckgnd, Vcl.StdCtrls,
  RzEdit, RzPanel, RzRadGrp, Vcl.Mask, RzLabel, Vcl.ExtCtrls;

type
  TfrmInutilizarNFCe = class(TForm)
    RzPanel1: TRzPanel;
    lblNome: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edtNumInical: TRzEdit;
    edtNumFinal: TRzEdit;
    rbxModelo: TRzRadioGroup;
    mmoJustificativa: TRzMemo;
    edtSerie: TRzEdit;
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNumInicalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInutilizarNFCe: TfrmInutilizarNFCe;

implementation

{$R *.dfm}

uses untVendas, untPrincipal;

procedure TfrmInutilizarNFCe.btnCancelarClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmInutilizarNFCe.btnSelecionarClick(Sender: TObject);
begin
ModalResult := mrOk;
end;

procedure TfrmInutilizarNFCe.edtNumInicalChange(Sender: TObject);
begin
 edtNumFinal.Text := frmPrincipal.fdsVendaCODIGO_NFCE.AsString;
end;

procedure TfrmInutilizarNFCe.FormCreate(Sender: TObject);
begin
 edtNumInical.Text := frmPrincipal.fdsVendaCODIGO_NFCE.AsString;
end;

end.
