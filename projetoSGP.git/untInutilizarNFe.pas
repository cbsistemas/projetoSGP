unit untInutilizarNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBckgnd, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzLabel, Vcl.ExtCtrls, RzPanel, RzRadGrp, RzButton;

type
  TfrmInutilizarNFe = class(TForm)
    RzPanel1: TRzPanel;
    lblNome: TRzLabel;
    edtNumInical: TRzEdit;
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    btnSelecionar: TRzBitBtn;
    edtNumFinal: TRzEdit;
    RzLabel1: TRzLabel;
    rbxModelo: TRzRadioGroup;
    RzLabel2: TRzLabel;
    mmoJustificativa: TRzMemo;
    edtSerie: TRzEdit;
    RzLabel3: TRzLabel;
    procedure edtNumInicalChange(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInutilizarNFe: TfrmInutilizarNFe;

implementation

{$R *.dfm}

uses untNfe;

procedure TfrmInutilizarNFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmInutilizarNFe.btnSelecionarClick(Sender: TObject);
begin
  if rbxModelo.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione o modelo de Nota Fiscal', 'Atenção',
      MB_OK + MB_ICONERROR);
    Abort;
  end;

  ModalResult := mrOk;
end;

procedure TfrmInutilizarNFe.edtNumInicalChange(Sender: TObject);
begin

  edtNumFinal.Text := frmNfe.fdsNFeCODIGO_NFE.AsString;

end;

procedure TfrmInutilizarNFe.FormCreate(Sender: TObject);
begin
  edtNumInical.Text := frmNfe.fdsNFeCODIGO_NFE.AsString;
end;

end.
