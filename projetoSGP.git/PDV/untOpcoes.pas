unit untOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, Vcl.StdCtrls, Vcl.Buttons, PngBitBtn, RzButton,
  FIBQuery, pFIBQuery;

type
  TfrmOpcoes = class(TForm)
    RzPanel1: TRzPanel;
    btnMovimentacao: TPngBitBtn;
    btnFechamento: TPngBitBtn;
    btnSuprimento: TPngBitBtn;
    btnSangria: TPngBitBtn;
    btnSair: TRzBitBtn;
    btnRestaurarVenda: TPngBitBtn;
    btnVendas: TPngBitBtn;
    procedure btnSangriaClick(Sender: TObject);
    procedure btnSuprimentoClick(Sender: TObject);
    procedure btnFechamentoClick(Sender: TObject);
    procedure btnMovimentacaoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRestaurarVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDevtrocaClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
  private
    { Private declarations }
  public
    codigo : Integer // Usado em casos onde o form pricipal precisa estar em contato direto com a tela chamada
  end;

var
  frmOpcoes: TfrmOpcoes;

implementation

{$R *.dfm}

uses untSangria, untSuprimento, untFechamentoCaixa, uTotalizadores, untData,
  untMovimentacaoCaixa, untLogin, untRestaurarVenda, untMensagens,
  uVerificaPermicao;
 var
  uVerificaPermicao:TVerificaPermicao;

procedure TfrmOpcoes.btnSuprimentoClick(Sender: TObject);
var
  temPermicao : Boolean;
  idUsuarioTemp : Integer;
begin
  temPermicao := False;

  if (DM.fdsUsuarioPermicSUPRIMENTO.AsString = 'S') then
  begin
    temPermicao := True;
  end
  else
  begin
   // Application.MessageBox('Desculpe, Usu�rio sem permiss�o para realizar suprimentos.', 'Sem permiss�o.', MB_OK+MB_ICONERROR);
    TFrmMensagens.Mensagem('Desculpe, Usu�rio sem permiss�o para realizar suprimentos.', 'Sem permiss�o.', 'I',[mbOK]);
    try
         frmLogin := TfrmLogin.Create(nil);
         frmLogin.ShowModal;
        finally
         if frmLogin.ModalResult = mrOk then
         begin
            idUsuarioTemp := frmLogin.fdsUserID.AsInteger;

            with dm.fdsUsuarioPermic do
            begin
              Close;
              ParamByName('IDUSUARIO').AsInteger := idUsuarioTemp;
              ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
              Open;
            end;

            if DM.fdsUsuarioPermicSANGRIA.AsString = 'S' then
              temPermicao := True
            else
              temPermicao := False;

            with dm.fdsUsuarioPermic do
            begin
              Close;
              ParamByName('IDUSUARIO').AsInteger := DM.idUsuario;
              ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
              Open;
            end;
         end
         else
         begin
           temPermicao := False;
         end;
        end;
        frmLogin.Free;
  end;

  if temPermicao then
  begin
    Try
        frmSuprimento := TfrmSuprimento.Create(nil);
        frmSuprimento.ShowModal;
     Finally
        if frmSuprimento.ModalResult = mrOk then
        begin
          Application.ProcessMessages;
          Application.MessageBox('Realiza��o de Suprimento feita com Sucesso.', 'Sucesso', MB_OK+MB_ICONEXCLAMATION);
          Application.ProcessMessages;
        end
        else
          Application.MessageBox('Realiza��o de Suprimento cancelada.', 'Cancelado', MB_OK+MB_ICONEXCLAMATION);

        frmSuprimento.FreeOnRelease;
        ModalResult := mrOk;
     End;
  end
  else
    TFrmMensagens.Mensagem('Desculpe, Usu�rio sem permiss�o para realizar suprimentos.', 'Sem permiss�o.', 'I',[mbOK]);
    //Application.MessageBox('Desculpe,Usu�rio sem permiss�o para realizar suprimento', 'Sem permiss�o.', MB_OK+MB_ICONERROR);
end;

procedure TfrmOpcoes.btnVendasClick(Sender: TObject);
begin
  codigo := 3;
  ModalResult := mrOk;
end;

procedure TfrmOpcoes.FormCreate(Sender: TObject);
begin
  codigo := 0;
end;

procedure TfrmOpcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    btnSair.Click;
  end;
end;

procedure TfrmOpcoes.btnDevtrocaClick(Sender: TObject);
begin
  codigo := 2;
  ModalResult := mrOk;
end;

procedure TfrmOpcoes.btnFechamentoClick(Sender: TObject);
var
  temPermicao : Boolean;
  idUsuarioTemp : Integer;
begin

  temPermicao := False;

    if DM.fdsUsuarioPermicVER_MOVIMENTO.AsString = 'N' then
      temPermicao := False
    else
      temPermicao := True;

     if temPermicao then
     begin
        Try
          frmMovimentacaoCaixa := TfrmMovimentacaoCaixa.Create(nil);
          frmMovimentacaoCaixa.ShowModal;
        Finally
          frmMovimentacaoCaixa.Free;
          ModalResult := mrOk;
        End;
     end
     else
     begin
       if uVerificaPermicao.Verifica('FECHAMENTO')=true then
       begin
        Try
         frmFechamentoCaixa := TfrmFechamentoCaixa.Create(nil);
         frmFechamentoCaixa.ShowModal;
        Finally
         if frmFechamentoCaixa.ModalResult = mrOk then
         begin
            Application.MessageBox('Caixa Fechado com sucesso!', 'Caixa Fechado', MB_OK+MB_ICONINFORMATION);
            Application.Terminate;
         end;
         frmFechamentoCaixa.Free;
         ModalResult := mrOk;
        End;
       end
       else
         TFrmMensagens.Mensagem('Desculpe, Usu�rio sem permiss�o para fechar o caixa.', 'Sem permiss�o.', 'I',[mbOK]);
     end;
end;

procedure TfrmOpcoes.btnMovimentacaoClick(Sender: TObject);
var
  temPermicao : Boolean;
  idUsuarioTemp : Integer;
begin
  temPermicao := False;

    if DM.fdsUsuarioPermicVER_MOVIMENTO.AsString = 'N' then
     begin
      //  Application.MessageBox('Desculpe, voc� n�o tem permi��o para entrar em Movimenta��o', ' n�o Permitido.', MB_OK+MB_ICONERROR);
        TFrmMensagens.Mensagem('Desculpe, voc� n�o tem permiss�o para entrar em Movimenta��o.', 'Sem permiss�o para ver Movimenta��o.', 'I',[mbOK]);
        try
         frmLogin := TfrmLogin.Create(nil);
         frmLogin.ShowModal;
        finally
         if frmLogin.ModalResult = mrOk then
         begin
            idUsuarioTemp := frmLogin.fdsUserID.AsInteger;

            with dm.fdsUsuarioPermic do
            begin
              Close;
              ParamByName('IDUSUARIO').AsInteger := idUsuarioTemp;
              ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
              Open;
            end;

            if DM.fdsUsuarioPermicVER_MOVIMENTO.AsString = 'S' then
              temPermicao := True
            else
              temPermicao := False;

            with dm.fdsUsuarioPermic do
            begin
              Close;
              ParamByName('IDUSUARIO').AsInteger := DM.idUsuario;
              ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
              Open;
            end;

         end
         else
         begin
           temPermicao := False;
         end;

         frmLogin.Free;
        end;

     end
     else
     begin
       temPermicao := True;
     end;

     if temPermicao then
     begin
        Try
          frmMovimentacaoCaixa := TfrmMovimentacaoCaixa.Create(nil);
          frmMovimentacaoCaixa.ShowModal;
        Finally
          frmMovimentacaoCaixa.Free;
          ModalResult := mrOk;
        End;
     end
     else
     begin
        //Application.MessageBox('Desculpe, voc� n�o tem permi��o para entrar em Movimenta��o', 'Ver Movimenta��o n�o Permitido.', MB_OK+MB_ICONERROR);
        TFrmMensagens.Mensagem('Desculpe, voc� n�o tem permiss�o para entrar em Movimenta��o.', 'Sem permiss�o para ver Movimenta��o.', 'I',[mbOK]);
        Abort;
     end;
end;

procedure TfrmOpcoes.btnRestaurarVendaClick(Sender: TObject);
begin
  codigo := 1;
  ModalResult := mrOk;
end;

procedure TfrmOpcoes.btnSairClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmOpcoes.btnSangriaClick(Sender: TObject);
var
  temPermicao : Boolean;
  idUsuarioTemp : Integer;
  autorizadoPor : string;
begin
  temPermicao := False;

  if (DM.fdsUsuarioPermicSANGRIA.AsString = 'S') then
  begin
    temPermicao := True;
    autorizadoPor := DM.fdsUsuarioPermicNOME.AsString;
  end
  else
  begin
    //Application.MessageBox('Desculpe, voc� n�o tem permiss�o para realizar sangria', 'Sem permi��o.', MB_OK+MB_ICONERROR);
    TFrmMensagens.Mensagem('Desculpe, voc� n�o tem permiss�o para realizar sangria.', 'Sem permiss�o.', 'I',[mbOK]);
    try
         frmLogin := TfrmLogin.Create(nil);
         frmLogin.ShowModal;
        finally
         if frmLogin.ModalResult = mrOk then
         begin
            idUsuarioTemp := frmLogin.fdsUserID.AsInteger;

            with dm.fdsUsuarioPermic do
            begin
              Close;
              ParamByName('IDUSUARIO').AsInteger := idUsuarioTemp;
              ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
              Open;
            end;

            if DM.fdsUsuarioPermicSANGRIA.AsString = 'S' then
            begin
              temPermicao := True;
              autorizadoPor := DM.fdsUsuarioPermicNOME.AsString;
            end
            else
              temPermicao := False;

            with dm.fdsUsuarioPermic do
            begin
              Close;
              ParamByName('IDUSUARIO').AsInteger := DM.idUsuario;
              ParamByName('IDFILIAL').AsInteger := DM.fdsConfigIDFILIAL.AsInteger;
              Open;
            end;
         end
         else
         begin
           temPermicao := False;
         end;
        end;
        frmLogin.Free;
  end;

  if temPermicao then
  begin
    Try
      frmSangria := TfrmSangria.Create(nil);
      frmSangria.autorizadoPor := autorizadoPor;
      frmSangria.ShowModal;
     Finally
        if frmSangria.ModalResult = mrOk then
        begin
          Application.ProcessMessages;
          Application.MessageBox('Realiza��o de Sangria feita com Sucesso.', 'Sucesso', MB_OK+MB_ICONEXCLAMATION);
          Application.ProcessMessages;
        end
        else
          Application.MessageBox('Realiza��o de Sangria cancelada.', 'Cancelado', MB_OK+MB_ICONEXCLAMATION);

        frmSangria.Free;
        ModalResult := mrOk;
     End;
  end
  else
    TFrmMensagens.Mensagem('Desculpe, voc� n�o tem permiss�o para realizar sangria.', 'Sem permiss�o.', 'I',[mbOK]);
    //Application.MessageBox('Desculpe, voc� n�o tem permiss�o para realizar sangria', 'Sem permi��o.', MB_OK+MB_ICONERROR);

end;

end.
