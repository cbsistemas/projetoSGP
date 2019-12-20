unit untPesqNFeNFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  RzPanel, RzRadGrp, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, FIBDataSet,
  pFIBDataSet, RzButton, JvExDBGrids, JvDBGrid, Vcl.Mask, RzEdit;

type
  TfrmPesqNFeNFCe = class(TForm)
    Animate1: TAnimate;
    Label3: TLabel;
    rgbTipo: TRzRadioGroup;
    fdsNFe: TpFIBDataSet;
    fdsNFCe: TpFIBDataSet;
    Panel1: TPanel;
    dsNotas: TDataSource;
    edtchave: TEdit;
    edtProtocolo: TEdit;
    edtData: TRzDateTimeEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    gdrNotas: TJvDBGrid;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    fdsNFeID: TFIBBCDField;
    fdsNFeDT_INC: TFIBDateField;
    fdsNFeDT_EMISSAO: TFIBDateField;
    fdsNFeCODIGO_NFE: TFIBIntegerField;
    fdsNFeSERIE: TFIBIntegerField;
    fdsNFeVLR_TOTAL: TFIBBCDField;
    fdsNFeIDCLIENTE: TFIBBCDField;
    fdsNFeCHAVE_CONSULTA: TFIBStringField;
    fdsNFeNUMERO_PROTOCOLO: TFIBStringField;
    fdsNFeIDFILIAL: TFIBBCDField;
    fdsNFeSTATUS: TFIBStringField;
    fdsNFeDT_SAIDA: TFIBDateField;
    fdsNFCeID: TFIBBCDField;
    fdsNFCeIDCAIXA: TFIBBCDField;
    fdsNFCeDT_INC: TFIBDateField;
    fdsNFCeDATA_EMISSAO: TFIBDateField;
    fdsNFCeIDCLIENTE: TFIBBCDField;
    fdsNFCeVLR_TOTAL: TFIBBCDField;
    fdsNFCeCODIGO_NFCE: TFIBIntegerField;
    fdsNFCeSERIE: TFIBIntegerField;
    fdsNFCeCHAVE_CONSULTA: TFIBStringField;
    fdsNFCeNUMERO_PROTOCOLO: TFIBStringField;
    fdsNFCeIDVENDEDOR: TFIBBCDField;
    fdsNFCeVLR_VENDA: TFIBBCDField;
    fdsNFCeTIPO: TFIBStringField;
    procedure rgbTipoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
   procedure PesqNota;
   procedure Pesquisar(tipo:String);
    { Private declarations }
  public
  var

    { Public declarations }
  end;

var
  frmPesqNFeNFCe: TfrmPesqNFeNFCe;

implementation

{$R *.dfm}

uses untData;

procedure TfrmPesqNFeNFCe.FormActivate(Sender: TObject);
begin
  pesquisar('NFe');
end;

procedure TfrmPesqNFeNFCe.PesqNota;
begin
 if rgbTipo.ItemIndex = 0 then
    pesquisar('NFCe');
 if rgbTipo.ItemIndex = 1 then
    pesquisar('NFe');
end;

procedure TfrmPesqNFeNFCe.Pesquisar(tipo: String);
var
i:integer;
F:TFIBDataSet;
begin
  if tipo ='NFCe' then
  begin
    with fdsNFCe do
    begin
      close;
      conditions.Clear;
      Conditions.AddCondition('TIPO','TIPO ='+QuotedStr('ER'),true);
      Conditions.Apply;
      OrderClause:='ID';
      prepare;
      open;
    end;
    dsNotas.dataSet := fdsNFCe;
    F:=fdsNFCe;
  end;
  if tipo ='NFe' then
  begin
    with fdsNFe do
    begin
      close;
      conditions.Clear;
      Conditions.AddCondition('TIPO','STATUS ='+QuotedStr('ER'),true);
      Conditions.Apply;
      OrderClause:='ID';
      prepare;
      open;
    end;
    dsNotas.dataSet := fdsNFe;
    F:=fdsNFe;
  end;

  gdrNotas.DataSource         := nil;
  gdrNotas.DataSource := dsNotas;
  gdrNotas.Columns.Clear;
  for i:= 0 to F.Fields.Count - 1 do
  begin
    gdrNotas.Columns.Add;
    gdrNotas.Columns[i].FieldName := F.Fields[i].FieldName;
    gdrNotas.Columns[i].Title.Caption := F.Fields[i].FieldName;
  end;
end;

procedure TfrmPesqNFeNFCe.rgbTipoChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
 if NewIndex=0 then
 begin
   pesquisar('NFCe');
 end;
 if NewIndex = 1 then
 begin
   pesquisar('NFe');
 end;

end;

procedure TfrmPesqNFeNFCe.RzBitBtn1Click(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TfrmPesqNFeNFCe.RzBitBtn2Click(Sender: TObject);
var
 mensagem:String;
begin
  if rgbTipo.ItemIndex=0 then
   mensagem:='Deseja realmente aualizar a NFCe '+fdsNFCeCODIGO_NFCE.AsString+'?'
  else
   mensagem:='Deseja realmente aualizar a NFe '+fdsNFCeCODIGO_NFCE.AsString+'?';

   case MessageBox(Application.Handle,Pchar(mensagem), 'Atenção',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:begin
            ModalResult:=mrOK
          end;
    IDNO:begin
          Abort;
         end;
 end;

end;

end.
