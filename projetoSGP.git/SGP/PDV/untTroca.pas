unit untTroca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBckgnd, RzButton, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls, JvExExtCtrls,
  JvImage, RzPanel, Math;

type
  TfrmTroca = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    lblCliente: TRzLabel;
    RzBackground1: TRzBackground;
    RzGroupBox2: TRzGroupBox;
    edtItemNovoNome: TRzEdit;
    btnIncItem: TRzBitBtn;
    RzLabel1: TRzLabel;
    edtItemTroca: TRzEdit;
    lblCidade: TRzLabel;
    RzLabel2: TRzLabel;
    edtPrecUnitario: TRzEdit;
    RzLabel3: TRzLabel;
    edtDesconto: TRzEdit;
    btnGravar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    edtQtn: TRzEdit;
    RzLabel4: TRzLabel;
    edtTotal: TRzEdit;
    RzLabel5: TRzLabel;
    procedure btnIncItemClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edtQtnExit(Sender: TObject);
    procedure edtPrecUnitarioExit(Sender: TObject);
    procedure edtPrecUnitarioEnter(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
      idItem : Integer;
      Qtn, vlrUnitario, vlrTotal, vlrDesconto : Double;
  end;

var
  frmTroca: TfrmTroca;


implementation

{$R *.dfm}
uses untPesqProdutoItens, uUtils, untData;

procedure TfrmTroca.edtDescontoExit(Sender: TObject);
var
  utils : TUtils;
begin
  vlrDesconto := utils.ValidaInteiroFloat(edtPrecUnitario.Text, 'F');
  edtPrecUnitario.Text := FloatToStr(vlrDesconto);

  vlrTotal := RoundTo(Qtn * (vlrUnitario - vlrDesconto), -2);

  edtTotal.Text := utils.AdicionaMascaraDinheiro(FloatToStr(vlrTotal));

  btnGravar.SetFocus;

end;

procedure TfrmTroca.edtPrecUnitarioEnter(Sender: TObject);
var
  utils : TUtils;
begin
  edtPrecUnitario.Text := utils.RetiraMascaraDinheiro(edtPrecUnitario.Text);
  edtPrecUnitario.SelectAll;
end;

procedure TfrmTroca.edtPrecUnitarioExit(Sender: TObject);
var
  utils : TUtils;
begin
  vlrUnitario := RoundTo(utils.ValidaInteiroFloat(edtPrecUnitario.Text, 'F'), -2);

  if vlrUnitario = 0 then
  begin
    edtPrecUnitario.Text := '0';
    edtPrecUnitario.SetFocus;
  end
  else
    edtPrecUnitario.Text := utils.AdicionaMascaraDinheiro(FloatToStr(vlrUnitario));

end;

procedure TfrmTroca.edtQtnExit(Sender: TObject);
var
  utils : TUtils;
begin
  Qtn := RoundTo(utils.ValidaInteiroFloat(edtQtn.Text, 'F'), -2);

  if edtQtn.Text = '0' then
  begin
    edtQtn.Text := '0';
    edtQtn.SetFocus;
  end
  else
    edtQtn.Text := FloatToStr(Qtn);

end;

procedure TfrmTroca.FormActivate(Sender: TObject);
begin
  btnIncItem.SetFocus;
  idItem := 0;
end;

procedure TfrmTroca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmTroca.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTroca.btnGravarClick(Sender: TObject);
begin
  if idItem <> 0 then
    ModalResult := mrOk
  else
    Application.MessageBox('Escolha um produto para confirma a troca.', 'Aten��o', MB_OK+MB_ICONEXCLAMATION);
end;

procedure TfrmTroca.btnIncItemClick(Sender: TObject);
var
  utils : TUtils;
begin
  Try
      frmPesqProdutoItens := TfrmPesqProdutoItens.Create(nil);
      frmPesqProdutoItens.ShowModal;
    Finally
      if frmPesqProdutoItens.ModalResult = mrOk then
      begin
        edtItemNovoNome.Text := frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
        idItem :=  frmPesqProdutoItens.fdsProdutoItensID.AsInteger;
        if DM.fdsConfigUTILIZAR_TABELA_PRECO.AsString = 'S' then
        begin
          vlrUnitario := RoundTo(frmPesqProdutoItens.precUnitario, -2);

         // vlrDescMax := frmPesqProdutoItens.vlrDescMax;
        end
        else
        begin
          vlrUnitario := (RoundTo(frmPesqProdutoItens.fdsProdutoItensPREC_VENDA.AsCurrency, -2));
         // vlrDescMax := 100;
        end;
        edtPrecUnitario.Text := utils.AdicionaMascaraDinheiro(FloatToStr(vlrUnitario));
        edtQtn.SetFocus;
      end;
      frmPesqProdutoItens.Free;
    End;
end;

end.