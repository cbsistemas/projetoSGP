unit untSelDtPrimeiroVencimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzLabel, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker;

type
  TfrmSelDtPrimeiroVencimento = class(TForm)
    dtpPrimeiroVencimento: TJvDateTimePicker;
    label1: TRzLabel;
    RzLabel1: TRzLabel;
    edtDiasParcelas: TRzEdit;
    btnConfirma: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelDtPrimeiroVencimento: TfrmSelDtPrimeiroVencimento;

implementation

{$R *.dfm}

uses untData, untPrincipal;

procedure TfrmSelDtPrimeiroVencimento.btnConfirmaClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelDtPrimeiroVencimento.FormCreate(Sender: TObject);
begin
  edtDiasParcelas.Text := '30';
  dtpPrimeiroVencimento.Date := Now + StrToInt(frmPrincipal.diasPrimeiroVenc);
end;

procedure TfrmSelDtPrimeiroVencimento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

end.
