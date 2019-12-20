unit untSelTabPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, RzRadChk, Vcl.ExtCtrls,
  RzPanel, Data.DB, Datasnap.DBClient, pFIBClientDataSet;

type
  TfrmSelTabPreco = class(TForm)
    btnSair: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    chkTab4: TRzCheckBox;
    chkTab1: TRzCheckBox;
    chkTab2: TRzCheckBox;
    chkTab5: TRzCheckBox;
    chkTab6: TRzCheckBox;
    chkTab3: TRzCheckBox;
    cdsTabPreco: TpFIBClientDataSet;
    cdsTabPrecoTAB1: TStringField;
    cdsTabPrecoTAB2: TStringField;
    cdsTabPrecoTAB3: TStringField;
    cdsTabPrecoTAB4: TStringField;
    cdsTabPrecoTAB5: TStringField;
    cdsTabPrecoTAB6: TStringField;
    procedure chkTab1Click(Sender: TObject);
    procedure chkTab2Click(Sender: TObject);
    procedure chkTab3Click(Sender: TObject);
    procedure chkTab4Click(Sender: TObject);
    procedure chkTab5Click(Sender: TObject);
    procedure chkTab6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
  var
    tab1, tab2, tab3, tab4, tab5, tab6: string;
  end;

var
  frmSelTabPreco: TfrmSelTabPreco;

implementation

{$R *.dfm}

procedure TfrmSelTabPreco.btnSairClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelTabPreco.chkTab1Click(Sender: TObject);
begin
  cdsTabPreco.Edit;

  if chkTab1.Checked then
    cdsTabPrecoTAB1.AsString := tab1
  else
    cdsTabPrecoTAB1.AsString := 'N';

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.chkTab2Click(Sender: TObject);
begin
  cdsTabPreco.Edit;

  if chkTab2.Checked then
    cdsTabPrecoTAB2.AsString := tab2
  else
    cdsTabPrecoTAB2.AsString := 'N';

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.chkTab3Click(Sender: TObject);
begin
  cdsTabPreco.Edit;

  if chkTab3.Checked then
    cdsTabPrecoTAB3.AsString := tab3
  else
    cdsTabPrecoTAB3.AsString := 'N';

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.chkTab4Click(Sender: TObject);
begin
  cdsTabPreco.Edit;

  if chkTab4.Checked then
    cdsTabPrecoTAB4.AsString := tab4
  else
    cdsTabPrecoTAB4.AsString := 'N';

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.chkTab5Click(Sender: TObject);
begin
  cdsTabPreco.Edit;

  if chkTab5.Checked then
    cdsTabPrecoTAB5.AsString := tab5
  else
    cdsTabPrecoTAB5.AsString := 'N';

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.chkTab6Click(Sender: TObject);
begin
  cdsTabPreco.Edit;

  if chkTab6.Checked then
    cdsTabPrecoTAB6.AsString := tab6
  else
    cdsTabPrecoTAB6.AsString := 'N';

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.FormActivate(Sender: TObject);
begin
  cdsTabPreco.CreateDataSet;
  cdsTabPreco.Append;
  cdsTabPreco.Post;

  if not(tab1 = 'N') then
  begin
    chkTab1.Caption := tab1;
    chkTab1.Visible := True;
    chkTab1.Checked := True;
  end
  else
    chkTab1.Visible := False;

  cdsTabPreco.Edit;
  cdsTabPrecoTAB1.AsString := tab1;

  if not(tab2 = 'N') then
  begin
    chkTab2.Caption := tab2;
    chkTab2.Visible := True;
    chkTab2.Checked := True;
  end
  else
    chkTab2.Visible := False;

  cdsTabPreco.Edit;
  cdsTabPrecoTAB2.AsString := tab2;

  if not(tab3 = 'N') then
  begin
    chkTab3.Caption := tab3;
    chkTab3.Visible := True;
    chkTab3.Checked := True;
  end
  else
    chkTab3.Visible := False;

  cdsTabPreco.Edit;
  cdsTabPrecoTAB3.AsString := tab3;

  if not(tab4 = 'N') then
  begin
    chkTab4.Caption := tab4;
    chkTab4.Visible := True;
    chkTab4.Checked := True;
  end
  else
    chkTab4.Visible := False;

  cdsTabPreco.Edit;
  cdsTabPrecoTAB4.AsString := tab4;

  if not(tab5 = 'N') then
  begin
    chkTab5.Caption := tab5;
    chkTab5.Visible := True;
    chkTab5.Checked := True;
  end
  else
    chkTab5.Visible := False;

  cdsTabPreco.Edit;
  cdsTabPrecoTAB5.AsString := tab5;

  if not(tab6 = 'N') then
  begin
    chkTab6.Caption := tab6;
    chkTab6.Visible := True;
    chkTab6.Checked := True;
  end
  else
    chkTab6.Visible := False;

  cdsTabPreco.Edit;
  cdsTabPrecoTAB6.AsString := tab6;

  cdsTabPreco.Post;
end;

procedure TfrmSelTabPreco.RzBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.