unit untDescAcresc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, ExtCtrls, RzPanel;

type
  TfrmDescAcresc = class(TForm)
    RzPanel1: TRzPanel;
    RzLabel4: TRzLabel;
    btnAcrescimo: TRzBitBtn;
    btnDesconto: TRzBitBtn;
    RzLabel1: TRzLabel;
    procedure btnDescontoClick(Sender: TObject);
    procedure btnAcrescimoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    var
      descAcresc : Char;
  end;

var
  frmDescAcresc: TfrmDescAcresc;

implementation

{$R *.dfm}

procedure TfrmDescAcresc.btnAcrescimoClick(Sender: TObject);
begin
  descAcresc := 'A';
  ModalResult := mrOk;
end;

procedure TfrmDescAcresc.btnDescontoClick(Sender: TObject);
begin
  descAcresc := 'D';
  ModalResult := mrOk;
end;

procedure TfrmDescAcresc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #68 then
    btnDesconto.Click
  else
    if Key = #65 then
      btnAcrescimo.Click
    else
      if Key = #27 then
      begin
        Case Application.MessageBox('Deseja relamente cancelar o Acrescimo ou Desconto no item?', 'Aten��o', MB_YESNO+MB_ICONWARNING) of
          idYes: begin
                    ModalResult := mrCancel;
                 end;
        End;
      end;
      
end;

end.