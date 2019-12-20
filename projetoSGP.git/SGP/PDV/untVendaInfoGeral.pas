unit untVendaInfoGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzBckgnd, StdCtrls, RzLabel, dxGDIPlusClasses, ExtCtrls,
  JvExExtCtrls, JvImage, RzPanel, Mask, RzEdit, RzRadGrp, RzCmboBx, RzDBCmbo,
  DB, FIBDataSet, pFIBDataSet, RzRadChk;

type
  TfrmVendaInfoGeral = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    RzLabel1: TRzLabel;
    RzBackground1: TRzBackground;
    btnCancelar: TRzBitBtn;
    btnGravar: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzLabel2: TRzLabel;
    edtCliente: TRzEdit;
    RzLabel3: TRzLabel;
    cbxFormaPagamento: TRzDBComboBox;
    edtVendedor: TRzEdit;
    RzLabel4: TRzLabel;
    fdsFormaPagamento: TpFIBDataSet;
    dsFormaPagamento: TDataSource;
    fdsFormaPagamentoID: TFIBBCDField;
    fdsFormaPagamentoDT_INC: TFIBDateField;
    fdsFormaPagamentoDT_ALT: TFIBDateField;
    fdsFormaPagamentoNOME: TFIBStringField;
    fdsFormaPagamentoPARCELA_MAXIMA: TFIBSmallIntField;
    fdsFormaPagamentoPERIODO: TFIBSmallIntField;
    fdsFormaPagamentoMOEDA: TFIBStringField;
    btnPesqCliente: TRzBitBtn;
    btnPesqVendedor: TRzBitBtn;
    chkVendaEntregar: TRzCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure RetornaCliente;
    procedure edtClienteExit(Sender: TObject);
    procedure btnPesqClienteClick(Sender: TObject);
    procedure RetornaVendedor;
    procedure btnPesqVendedorClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    idCliente, idVendedor : integer;
    nomeCliente : String;
    vendaEntregar : Boolean;
  end;

var
  frmVendaInfoGeral: TfrmVendaInfoGeral;

implementation

uses untData, untPesqCliente, untPesqVendedor;

{$R *.dfm}

procedure TfrmVendaInfoGeral.btnCancelarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle, Pchar('Deseja realmente cancelar a finalização da Venda?'), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
      idYes: begin
                ModalResult := mrCancel;
             end;
    end;
end;

procedure TfrmVendaInfoGeral.btnGravarClick(Sender: TObject);
begin
  vendaEntregar := chkVendaEntregar.Checked;
  ModalResult := mrOk;
end;

procedure TfrmVendaInfoGeral.btnPesqClienteClick(Sender: TObject);
begin
  RetornaCliente;
end;

procedure TfrmVendaInfoGeral.btnPesqVendedorClick(Sender: TObject);
begin
  RetornaVendedor;
end;

procedure TfrmVendaInfoGeral.edtClienteExit(Sender: TObject);
begin
  if Trim(edtCliente.Text) = EmptyStr then
    RetornaCliente;
end;

procedure TfrmVendaInfoGeral.FormActivate(Sender: TObject);
begin
  fdsFormaPagamento.Last;
  fdsFormaPagamento.First;
  edtCliente.SetFocus;
end;

procedure TfrmVendaInfoGeral.RetornaCliente;
begin
  try
    frmPesqCliente := TfrmPesqCliente.Create(nil);
    frmPesqCliente.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin
      edtCliente.Text := frmPesqCliente.fdsClientesNOME.AsString;
      idCliente := frmPesqCliente.fdsClientesID.AsInteger;
      fdsFormaPagamento.Locate('ID', frmPesqCliente.fdsClientesIDFORMA_PAGAMENTO.AsString, []);
    end;
    frmPesqCliente.Free;
  end;
end;

procedure TfrmVendaInfoGeral.RetornaVendedor;
begin
  try
    frmPesqVendedor := TfrmPesqVendedor.Create(nil);
    frmPesqVendedor.ShowModal;
  Finally
    if frmPesqCliente.ModalResult = mrOk then
    begin
      edtVendedor.Text := frmPesqVendedor.fdsVendedoresNOME.AsString;
      idVendedor := frmPesqVendedor.fdsVendedoresID.AsInteger;
    end;
    frmPesqCliente.Free;
  end;
end;

end.
