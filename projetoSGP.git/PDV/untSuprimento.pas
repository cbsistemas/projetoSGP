unit untSuprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzRadGrp, StdCtrls, Mask, RzEdit, RzBckgnd, RzLabel,
  dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage, RzButton,
  Vcl.Imaging.pngimage, Data.DB, FIBDataSet, pFIBDataSet, Vcl.ComCtrls,
  FIBDatabase, pFIBDatabase;

type
  TfrmSuprimento = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    RzLabel4: TRzLabel;
    RzBackground1: TRzBackground;
    btnOK: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzLabel1: TRzLabel;
    edtValor: TRzEdit;
    RzLabel2: TRzLabel;
    mmoMotivo: TRzMemo;
    fdsMovCaixa: TpFIBDataSet;
    fdsMovCaixaID: TFIBBCDField;
    fdsMovCaixaIDCAIXA: TFIBBCDField;
    fdsMovCaixaIDFILIAL: TFIBBCDField;
    fdsMovCaixaDT_INC: TFIBDateField;
    fdsMovCaixaHR_INC: TFIBTimeField;
    fdsMovCaixaIDUSUARIO: TFIBBCDField;
    fdsMovCaixaCONTROLE: TFIBBCDField;
    fdsMovCaixaTIPO: TFIBStringField;
    fdsMovCaixaMOEDA: TFIBStringField;
    fdsMovCaixaVLR_ENTRADA: TFIBBCDField;
    fdsMovCaixaVLR_VENDA: TFIBBCDField;
    fdsMovCaixaVLR_TOTAL: TFIBBCDField;
    fdsMovCaixaVLR_DESCONTO: TFIBBCDField;
    fdsMovCaixaTROCO: TFIBBCDField;
    fdsMovCaixaENVIADO_WEB: TFIBStringField;
    fdsMovCaixaIDMOVIMENTO: TFIBBCDField;
    fdsMovCaixaHISTORICO: TFIBStringField;
    fdsMovCaixaOPERADOR: TFIBStringField;
    fdsMovCaixaVLR_CHEQUE: TFIBBCDField;
    fdsMovCaixaVLR_CARTAO: TFIBBCDField;
    fdsMovCaixaVLR_NOTA: TFIBBCDField;
    fdsMovCaixaVLR_FINANCEIRA: TFIBBCDField;
    fdsMovCaixaVLR_VALEDESCONTO: TFIBBCDField;
    fdsMovCaixaVLR_TICKET: TFIBBCDField;
    transSuprimento: TpFIBTransaction;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure GravaSuprimento;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    var
      valor : Double;
      tipo : string;
  end;

var
  frmSuprimento: TfrmSuprimento;

implementation

uses uUtils, untData, untPrincipal;

{$R *.dfm}

procedure TfrmSuprimento.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSuprimento.btnOKClick(Sender: TObject);
var
  utils : TUtils;
begin

  valor := StrToFloat(utils.RetiraMascaraDinheiro(edtValor.Text));
  if valor <= 0 then
  begin
    Application.MessageBox('Informe um valor maior que zero para o suprimento ou clique em cancelar.', 'Aten��o', MB_OK+MB_ICONWARNING);
    edtValor.SetFocus;
  end
  else
  begin
    GravaSuprimento;
    ModalResult := mrOk;
  end;
end;

procedure TfrmSuprimento.edtValorEnter(Sender: TObject);
var
  utils : TUtils;
begin
  edtValor.Text := utils.RetiraMascaraDinheiro(edtValor.Text);
end;

procedure TfrmSuprimento.edtValorExit(Sender: TObject);
var
  utils : TUtils;
begin
  edtValor.Text := utils.AdicionaMascaraDinheiro(edtValor.Text);
end;

procedure TfrmSuprimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
  begin
    btnCancelar.Click;
  end
end;

procedure TfrmSuprimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmSuprimento.GravaSuprimento;
begin
  fdsMovCaixa.Open;
  fdsMovCaixa.Append;
  fdsMovCaixaCONTROLE.AsInteger := DM.fdsCaixaCONTROLE.AsInteger;
  fdsMovCaixaIDCAIXA.AsInteger := DM.numCaixa;
  fdsMovCaixaIDFILIAL.AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
  fdsMovCaixaIDUSUARIO.AsInteger := DM.idUsuario;
  fdsMovCaixaTIPO.AsString := 'SU';
  fdsMovCaixaMOEDA.AsString := 'DN';
  fdsMovCaixaVLR_TOTAL.AsFloat := frmSuprimento.valor;
  fdsMovCaixaVLR_VENDA.AsFloat := frmSuprimento.valor;
  fdsMovCaixaVLR_ENTRADA.AsFloat := fdsMovCaixaVLR_TOTAL.AsFloat;
  fdsMovCaixaHISTORICO.AsString := frmSuprimento.mmoMotivo.Text;
  fdsMovCaixa.Post;
  transSuprimento.CommitRetaining;
end;

end.