unit untEntregaDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzDBEdit,
  RzButton, Vcl.ExtCtrls;

type
  TfrmEntregaDados = class(TForm)
    Panel1: TPanel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCodCidade: TRzDBEdit;
    edtCidade: TRzDBEdit;
    Label8: TLabel;
    Panel2: TPanel;
    RzBitBtn1: TRzBitBtn;
    btnPesqCidade: TRzBitBtn;
    edtUF: TRzDBEdit;
    Label9: TLabel;
    edtCep: TRzDBEdit;
    Label10: TLabel;
    RzDBEdit8: TRzDBEdit;
    Label11: TLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnPesqCidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmEntregaDados: TfrmEntregaDados;

implementation

{$R *.dfm}

uses untNfe, untPesqCidade;

procedure TfrmEntregaDados.RzBitBtn1Click(Sender: TObject);
begin
 ModalResult:= mrOK;
end;

procedure TfrmEntregaDados.btnPesqCidadeClick(Sender: TObject);
begin
try
   frmPesqCidade:= TfrmPesqCidade.Create(Nil);
   frmPesqCidade.ShowModal;
finally
  if frmPesqCidade.ModalResult= mrOk then
  begin
    edtCodCidade.Text:= frmPesqCidade.fdsCidadesCODIGO.AsString;
    edtCidade.Text:=frmPesqCidade.fdsCidadesNOME.AsString;
    edtUF.Text:= frmPesqCidade.fdsCidadesUF.AsString;
    edtCep.Text:= frmPesqCidade.fdsCidadesCEP.AsString
  end;
end;
end;



end.
