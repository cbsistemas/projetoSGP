unit untMenssagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ImgList, RzButton,
  Vcl.StdCtrls, RzPanel, dxGDIPlusClasses;
type
  TMyButtons = (mbSim, mbNao, mbOk);
type
  TfrmMenssagens = class(TForm)
    pnlBotoes: TRzPanel;
    btnSim: TRzBitBtn;
    btnNao: TRzBitBtn;
    btnOk: TRzBitBtn;
    pnlMensagem: TRzPanel;
    lblMensagem: TLabel;
    pnlIcones: TRzPanel;
    ImgDeletar: TImage;
    imgInformacao: TImage;
    imgSysExpirado: TImage;
    imgSairSistema: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
     class function Mensagem(Texto: String;Titulo:String; Tipo:Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  frmMenssagens: TfrmMenssagens;
const
    LEFTBUTTONS : array[0..2] of integer = (258, 178, 97);

implementation

{$R *.dfm}

{ TfrmMenssagens }

class function TfrmMenssagens.Mensagem(Texto, Titulo: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm :TfrmMenssagens;

begin
  frm := TfrmMenssagens.Create(nil);
  try
    frm.lblMensagem.Caption := Texto;
    frm.Caption := Titulo;

    for i:=0 to Length(Botoes)-1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm.BtnOK.Visible := True;
                frm.BtnOK.Left := LEFTBUTTONS[i];
              end;
        mbSim: begin
                 frm.btnSim.Visible := True;
                 frm.btnSim.Left := LEFTBUTTONS[i];
               end;

        mbNao: begin
                 frm.BtnNao.Visible := True;
                 frm.BtnNao.Left := LEFTBUTTONS[i];
               end;

        else begin
          frm.BtnOK.Visible := True;
          frm.BtnOK.Left := LEFTBUTTONS[i];
        end;
      end;
    end;

    case (Tipo) of
      'I': frm.imgInformacao.Visible := True;
      'D': frm.imgDeletar.Visible := True;
      'S': frm.imgSairSistema.Visible := True;
      'X': frm.imgSysExpirado.Visible:= True;
      //'C': frm.imgCuidado.Visible := True;
      //'E': frm.imgErro.Visible := True;
    else
        //frm.imgInformacao.Visible := True;
    end;

     frm.ShowModal;

    case (frm.ModalResult) of
      mrOk, mrYes : result := True;
      else
        result := False;
    end;

  finally
    if (frm<>nil) then
      FreeAndNil(frm);
  end;
end;

end.
