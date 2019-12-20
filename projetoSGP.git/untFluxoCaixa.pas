unit untFluxoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzSplit, RzButton, RzBckgnd,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExExtCtrls,
  JvImage, RzPanel, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Data.DB,
  Datasnap.DBClient, pFIBClientDataSet, FIBDataSet, pFIBDataSet, Vcl.Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvExStdCtrls, JvCheckBox, RzCmboBx, RzRadChk, JvButton, JvCtrls, Vcl.ImgList,
  PngImageList, DateUtils, FIBQuery, pFIBQuery, Math;

type
  TfrmFluxoCaixa = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    RzBackground1: TRzBackground;
    RzPanel2: TRzPanel;
    btnGravar: TRzBitBtn;
    cdsContasDescricao: TpFIBClientDataSet;
    fdsContasDescricao: TpFIBDataSet;
    fdsContasDescricaoID: TFIBBCDField;
    fdsContasDescricaoDT_INC: TFIBDateField;
    fdsContasDescricaoDESCRICAO: TFIBStringField;
    fdsContasDescricaoTIPO: TFIBStringField;
    dsContas: TDataSource;
    PngImageList1: TPngImageList;
    chkFilial: TJvCheckBox;
    pnlFilial: TRzGroupBox;
    cbxFilial: TRzComboBox;
    pnlPeriodo: TRzGroupBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    dtpInicio: TJvDatePickerEdit;
    dtpFim: TJvDatePickerEdit;
    rbtDiario: TRzRadioButton;
    rbtMensal: TRzRadioButton;
    btnPesquisar: TJvImgBtn;
    gdrDescricao: TJvDBGrid;
    gdrPeriodo: TJvDBGrid;
    cdsPeriodo: TpFIBClientDataSet;
    qrySql: TpFIBQuery;
    dsPeriodo: TDataSource;
    cdsContasDescricaoCOLUNAS: TStringField;
    cdsContasDescricaoID: TIntegerField;
    cdsTotais: TpFIBClientDataSet;
    lblTituloTotal: TRzLabel;
    lblRecberVenc: TRzLabel;
    RzLabel1: TRzLabel;
    lblPagarVenc: TRzLabel;
    procedure PreparaContas;
    procedure PreparaPeriodo;
    procedure CalculaNotasVencidas;
    function SomaTotais(campoSomar, tabela, camposCondicao, valorCondicao,
      campoData: string; ValorData: TDate): String;
    function SomaTotaisNotaNT(campoSomar, tabela, prefixo, campoData: string;
      ValorData: TDate): String;
    function SomaTotaisNota(campoSomar, tabela, prefixo, campoData: string;
      ValorData: TDate): Double;
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure gdrPeriodoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrDescricaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrPeriodoCellClick(Column: TColumn);
    procedure gdrDescricaoCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    tempDia: TDate;
    cellClick: Boolean;
  end;

var
  frmFluxoCaixa: TfrmFluxoCaixa;

implementation

{$R *.dfm}

uses untData, uUtils;

procedure TfrmFluxoCaixa.btnGravarClick(Sender: TObject);
begin
  frmFluxoCaixa.Close;
end;

procedure TfrmFluxoCaixa.btnPesquisarClick(Sender: TObject);
var
  i: Integer;
  utils: TUtils;
  tempValor1, tempValor2: Double;
begin
  PreparaPeriodo;

  i := 1;

  cdsPeriodo.Open;
  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  cdsPeriodo.Post;
  Inc(i);

  cdsTotais.Open;
  tempDia := dtpInicio.Date;
  cdsTotais.Append;
  while tempDia <= dtpFim.Date do
  begin
    cdsTotais.FieldByName(DateToStr(tempDia)).AsString := '0';
    tempDia := tempDia + 1;
  end;
  cdsTotais.Post;

  cdsPeriodo.Append; // Calculo venda a vista
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      SomaTotais('VLR_ENTRADA', 'VENDA', 'STATUS', 'FC', 'DT_INC', tempDia);
    cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo Cart�o Cliente
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      SomaTotaisNotaNT('VALOR', 'CNT_RECEBER_ITEM', 'CT', 'DT_VENC', tempDia);
    cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo Nota Cliente
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    if tempDia <= Now then
    begin
      cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
        SomaTotaisNotaNT('VALOR_PAGO', 'CNT_RECEBER_ITEM', 'NT',
        'DT_PAG', tempDia);
      cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;
    end
    else
    begin
      cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
        SomaTotaisNotaNT('VALOR - VALOR_PAGO - DESCONTO', 'CNT_RECEBER_ITEM',
        'NT', 'DT_VENC', tempDia);
      cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;
    end;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo Cheque Cliente
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    if tempDia <= Now then
    begin
      cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
        SomaTotaisNotaNT('VALOR_PAGO', 'CNT_RECEBER_ITEM', 'CH',
        'DT_PAG', tempDia);
      cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;
    end
    else
    begin
      cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
        SomaTotaisNotaNT('VALOR - VALOR_PAGO', 'CNT_RECEBER_ITEM', 'CH',
        'DT_VENC', tempDia);
      cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;
    end;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo Outras Entradas ainda n�o existe no sistema
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      SomaTotaisNotaNT('VALOR', 'CNT_RECEBER_ITEM', 'TT', 'DT_VENC', tempDia);
    cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;


    // cdsTotais.Edit;
    // cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat := RoundTo(cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat + cdsPeriodo.FieldByName(DateToStr(tempDia)).AsFloat, -2);
    // cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append;
  // Linha referente ao calculo dos totais de cada entrada do dia
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      utils.AdicionaMascaraDinheiro(cdsTotais.FieldByName(DateToStr(tempDia))
      .AsString);
    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  cdsPeriodo.Post; // Linha em branco para separar entradas de sa�das
  Inc(i);

  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  cdsPeriodo.Post; // Linha referente ao titulo de saidas
  Inc(i);

  tempDia := dtpInicio.Date;
  cdsTotais.Append;
  while tempDia <= dtpFim.Date do
  begin
    cdsTotais.FieldByName(DateToStr(tempDia)).AsString := '0';
    tempDia := tempDia + 1;
  end;
  cdsTotais.Post;

  cdsPeriodo.Append; // Calculo fornecedores a vista
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      SomaTotaisNotaNT('DINHEIRO', 'CNT_PAGAR', 'CP', 'DT_INC', tempDia);
    cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo Nota Fornecedor
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    if tempDia <= Now then
    begin
      cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
        SomaTotaisNotaNT('VALOR_PAGO', 'CNT_PAGAR_ITEM', 'NT',
        'DT_PAG', tempDia);
      cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;
    end
    else
    begin
      cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
        SomaTotaisNotaNT('VALOR - VALOR_PAGO - DESCONTO', 'CNT_PAGAR_ITEM',
        'NT', 'DT_VENC', tempDia);
      cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;
    end;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo de Comiss�o de Vendedores, fazer ainda
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      SomaTotaisNotaNT('VALOR', 'CNT_PAGAR_ITEM', 'TT', 'DT_VENC', tempDia);
    cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append; // Calculo de Outras saidas
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      SomaTotaisNotaNT('VALOR', 'CNT_PAGAR_ITEM', 'GG', 'DT_PAG', tempDia);
    cdsPeriodo.FieldByName(DateToStr(tempDia)).Alignment := taRightJustify;

    tempValor1 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsTotais.FieldByName(DateToStr(tempDia)).AsString));
    tempValor2 := StrToFloat(utils.RetiraMascaraDinheiro
      (cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString));

    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    tempDia := tempDia + 1;

  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append;
  // Linha referente ao calculo dos totais de cada sa�da do dia
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      utils.AdicionaMascaraDinheiro(cdsTotais.FieldByName(DateToStr(tempDia))
      .AsString);
    tempDia := tempDia + 1;
  end;
  cdsPeriodo.Post;
  Inc(i);

  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  cdsPeriodo.Post; // Linha em branco para separar calculo final
  Inc(i);

  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  cdsPeriodo.Post; // Linha em branco para separar calculo final
  Inc(i);

  cdsPeriodo.Append; // Linha referente ao calculo de Entradas - Sa�das (A - B)
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  while tempDia <= dtpFim.Date do
  begin
    cdsTotais.First;
    tempValor1 := cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat;
    cdsTotais.Next;
    tempValor2 := cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat;

    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      utils.AdicionaMascaraDinheiro
      (FloatToStr(RoundTo(tempValor1 - tempValor2, -2)));

    cdsTotais.Last;
    if cdsTotais.RecordCount < 3 then
      cdsTotais.Append
    else
      cdsTotais.Edit;

    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 - tempValor2, -2);
    cdsTotais.Post;
    tempDia := tempDia + 1;
  end;
  tempDia := dtpInicio.Date;
  cdsTotais.Last;
  cdsPeriodo.Post;
  Inc(i);

  tempValor1 := cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat;
  // Linha referente aos Saldos do dia anterior
  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i;
  tempDia := dtpInicio.Date;
  cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
    utils.AdicionaMascaraDinheiro('0');
  cdsPeriodo.Post;
  cdsPeriodo.Append;
  cdsPeriodo.FieldByName('ID').AsInteger := i + 1;
  cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
    utils.AdicionaMascaraDinheiro(FloatToStr(RoundTo(tempValor1, -2)));
  cdsPeriodo.Post;

  cdsTotais.Append;
  cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat := RoundTo(0, -2);
  cdsTotais.Post;
  cdsTotais.Append;
  cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat := RoundTo(tempValor1, -2);
  cdsTotais.Post;
  tempDia := tempDia + 1;
  cdsTotais.Last;
  cdsPeriodo.Last;

  while tempDia <= dtpFim.Date do
  begin
    cdsTotais.Prior;
    cdsTotais.Prior;
    tempValor1 := cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat;
    cdsTotais.Last;
    tempValor2 := cdsTotais.FieldByName(DateToStr(tempDia - 1)).AsFloat;

    cdsPeriodo.Prior;
    cdsPeriodo.Edit;
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      utils.AdicionaMascaraDinheiro(FloatToStr(RoundTo(tempValor2, -2)));
    cdsPeriodo.Post;

    cdsPeriodo.Last;
    cdsPeriodo.Edit;
    cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString :=
      utils.AdicionaMascaraDinheiro
      (FloatToStr(RoundTo(tempValor1 + tempValor2, -2)));
    cdsPeriodo.Post;

    cdsTotais.Prior;
    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor2, -2);
    cdsTotais.Post;

    cdsTotais.Last;
    cdsTotais.Edit;
    cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat :=
      RoundTo(tempValor1 + tempValor2, -2);
    cdsTotais.Post;

    cdsTotais.Last;
    cdsPeriodo.Last;
    tempDia := tempDia + 1;
  end;
  Inc(i);

  // cdsTotais.Last;//Linha referente ao calculo do Saldo do dia anterior + o atual
  // cdsPeriodo.Append;
  // cdsPeriodo.FieldByName('ID').AsInteger := i;
  // tempDia := dtpInicio.Date;
  //
  // cdsTotais.Prior;
  // tempValor1 := cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat;
  //
  // cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString := utils.AdicionaMascaraDinheiro(FloatToStr(RoundTo(tempValor1,-2)));
  //
  // cdsTotais.Append;
  // cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat := RoundTo(tempValor1, -2);
  // cdsTotais.Post;
  // tempDia := tempDia + 1;
  // cdsTotais.Last;
  //
  // while tempDia <= dtpFim.Date do
  // begin
  // cdsTotais.Prior;
  // cdsTotais.Prior;
  // tempValor1 := cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat;
  // cdsTotais.Last;
  // tempValor2 := cdsTotais.FieldByName(DateToStr(tempDia - 1)).AsFloat;
  //
  // cdsPeriodo.FieldByName(DateToStr(tempDia)).AsString := utils.AdicionaMascaraDinheiro(FloatToStr(RoundTo(tempValor1 + tempValor2,-2)));
  //
  // cdsTotais.Edit;
  // cdsTotais.FieldByName(DateToStr(tempDia)).AsFloat := RoundTo(tempValor1 + tempValor2, -2);
  //
  // cdsTotais.Post;
  // cdsTotais.Last;
  // tempDia := tempDia + 1;
  // end;
  // tempDia := dtpInicio.Date;
  // cdsTotais.Last;
  // cdsPeriodo.Post;
  // Inc(i);

end;

procedure TfrmFluxoCaixa.CalculaNotasVencidas;
var
  tempValor: Double;
  utils: TUtils;
begin
  tempValor := 0;
  tempValor := RoundTo(tempValor + SomaTotaisNota('VALOR - VALOR_PAGO',
    'CNT_RECEBER_ITEM', 'NT', 'DT_VENC', Now), -2);
  tempValor := RoundTo(tempValor + SomaTotaisNota('VALOR - VALOR_PAGO',
    'CNT_RECEBER_ITEM', 'CH', 'DT_VENC', Now), -2);

  lblRecberVenc.Caption := utils.AdicionaMascaraDinheiro(FloatToStr(tempValor));

  tempValor := 0;
  tempValor := RoundTo(tempValor + SomaTotaisNota('VALOR - VALOR_PAGO',
    'CNT_PAGAR_ITEM', 'NT', 'DT_VENC', Now), -2);
  tempValor := RoundTo(tempValor + SomaTotaisNota('VALOR - VALOR_PAGO',
    'CNT_PAGAR_ITEM', 'CH', 'DT_VENC', Now), -2);

  lblPagarVenc.Caption := utils.AdicionaMascaraDinheiro(FloatToStr(tempValor));;
end;

procedure TfrmFluxoCaixa.FormActivate(Sender: TObject);
begin
  CalculaNotasVencidas;
end;

procedure TfrmFluxoCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmFluxoCaixa := nil;
end;

procedure TfrmFluxoCaixa.FormCreate(Sender: TObject);
begin
  cdsContasDescricao.CreateDataSet;
  cdsContasDescricao.Open;
  dtpInicio.Date := StartOfTheMonth(Date);
  dtpFim.Date := EndOfTheMonth(Date);
  PreparaContas;
end;

procedure TfrmFluxoCaixa.gdrPeriodoCellClick(Column: TColumn);
begin
  cdsContasDescricao.Locate('ID', cdsPeriodo.FieldByName('ID').AsString, []);
end;

procedure TfrmFluxoCaixa.gdrPeriodoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  nomeCampo, valorCampo: string;
  utils: TUtils;
begin
  if not odd(cdsPeriodo.RecNo) then
  begin
    gdrPeriodo.Canvas.Brush.Color := DM.gridOddColor;
  end;

  nomeCampo := Column.Field.FieldName;

  if (cdsPeriodo.RecNo = 17) then
  begin
    valorCampo := utils.RetiraMascaraDinheiro(cdsPeriodo.FieldByName(nomeCampo)
      .AsString);

    if (StrToFloat(valorCampo) < 0) then
      gdrPeriodo.Canvas.Font.Color := clRed
    else
      gdrPeriodo.Canvas.Font.Color := clBlue;
  end;

  if (cdsPeriodo.RecNo = 18) then
  begin
    valorCampo := utils.RetiraMascaraDinheiro(cdsPeriodo.FieldByName(nomeCampo)
      .AsString);

    if (StrToFloat(valorCampo) < 0) then
      gdrPeriodo.Canvas.Font.Color := clRed
    else
      gdrPeriodo.Canvas.Font.Color := clBlue;
  end;

  if (cdsPeriodo.RecNo = 19) then
  begin
    valorCampo := utils.RetiraMascaraDinheiro(cdsPeriodo.FieldByName(nomeCampo)
      .AsString);

    if (StrToFloat(valorCampo) < 0) then
      gdrPeriodo.Canvas.Font.Color := clRed
    else
      gdrPeriodo.Canvas.Font.Color := clBlue;

    gdrPeriodo.Canvas.Font.Style := [fsBold]
  end;

  gdrPeriodo.Canvas.FillRect(Rect);
  gdrPeriodo.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmFluxoCaixa.gdrDescricaoCellClick(Column: TColumn);
begin
  if cdsPeriodo.Active then
    cdsPeriodo.Locate('ID', cdsContasDescricao.FieldByName('ID').AsString, []);
end;

procedure TfrmFluxoCaixa.gdrDescricaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(cdsContasDescricao.RecNo) then
  begin
    gdrDescricao.Canvas.Brush.Color := DM.gridOddColor;
    gdrDescricao.Canvas.FillRect(Rect);
    gdrDescricao.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmFluxoCaixa.PreparaContas;
var
  tipo: string; // para saber quando muda o tipo de Entrada para Sa�da
  i: Integer;
begin
  i := 1;
  fdsContasDescricao.OrderClause := 'ID';
  fdsContasDescricao.Open;
  fdsContasDescricao.First;

  with cdsContasDescricao do
  begin
    EmptyDataSet;

    Append;
    cdsContasDescricaoID.AsInteger := i;
    cdsContasDescricaoCOLUNAS.AsString := 'ENTRADAS';
    tipo := fdsContasDescricaoTIPO.AsString;
    Post;
    Inc(i);

    while not(fdsContasDescricao.Eof) do
    begin
      Append;

      if tipo = fdsContasDescricaoTIPO.AsString then
      begin
        cdsContasDescricaoID.AsInteger := i;
        cdsContasDescricaoCOLUNAS.AsString :=
          fdsContasDescricaoDESCRICAO.AsString;
        tipo := fdsContasDescricaoTIPO.AsString;
        Post;
        Inc(i);
        fdsContasDescricao.Next;
      end
      else
      begin
        Append;
        cdsContasDescricaoID.AsInteger := i;
        cdsContasDescricaoCOLUNAS.AsString := 'TOTAL DE ENTRADAS (A)';
        Post;
        Inc(i);

        Append;
        cdsContasDescricaoID.AsInteger := i;
        Post;
        Inc(i);

        Append;
        cdsContasDescricaoID.AsInteger := i;
        cdsContasDescricaoCOLUNAS.AsString := 'SA�DAS';
        tipo := 'S';
        Post;
        Inc(i);
      end;
    end;

    Append;
    cdsContasDescricaoID.AsInteger := i;
    cdsContasDescricaoCOLUNAS.AsString := 'TOTAL DE SA�DAS (B)';
    tipo := fdsContasDescricaoTIPO.AsString;
    Post;
    Inc(i);

    Append;
    cdsContasDescricaoID.AsInteger := i;
    Post;
    Inc(i);

    Append;
    cdsContasDescricaoID.AsInteger := i;
    Post;
    Inc(i);

    Append;
    cdsContasDescricaoID.AsInteger := i;
    cdsContasDescricaoCOLUNAS.AsString := 'Saldo do dia (A - B)';
    Post;
    Inc(i);

    Append;
    cdsContasDescricaoID.AsInteger := i;
    cdsContasDescricaoCOLUNAS.AsString := 'Saldo do dia anterior';
    Post;
    Inc(i);

    Append;
    cdsContasDescricaoID.AsInteger := i;
    cdsContasDescricaoCOLUNAS.AsString := 'Saldo Atual';
    Post;
  end;
end;

procedure TfrmFluxoCaixa.PreparaPeriodo;
var
  tempDia: TDate;
  NewCampo: TStringField;
  i: Integer;
begin
  tempDia := dtpInicio.Date;
  cdsPeriodo.Close;
  cdsPeriodo.FieldDefs.Clear;
  gdrPeriodo.Columns.Clear;
  cdsTotais.Close;
  cdsTotais.FieldDefs.Clear;

  i := 0;
  cdsPeriodo.FieldDefs.Add('ID', ftInteger, 0);

  if rbtDiario.Checked then
  begin
    while tempDia <= dtpFim.Date do
    begin
      cdsPeriodo.FieldDefs.Add(DateToStr(tempDia), ftString, 50);
      cdsTotais.FieldDefs.Add(DateToStr(tempDia), ftString, 50);

      gdrPeriodo.Columns.Add;
      gdrPeriodo.Columns[i].Alignment := taRightJustify;
      gdrPeriodo.Columns[i].FieldName := DateToStr(tempDia);
      gdrPeriodo.Columns[i].Title.Caption := DateToStr(tempDia);
      gdrPeriodo.Columns[i].Width := 80;

      tempDia := tempDia + 1;
      Inc(i);
    end;
  end;

  // NewCampo.FreeOnRelease;

  if rbtMensal.Checked then
  begin
    // IncMonth();
  end;

  cdsPeriodo.CreateDataSet;
  cdsTotais.CreateDataSet;

end;

function TfrmFluxoCaixa.SomaTotais(campoSomar, tabela, camposCondicao,
  valorCondicao, campoData: string; ValorData: TDate): String;
var
  utils: TUtils;
begin
  with qrySql do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(' + campoSomar + ') TOTAL FROM ' + tabela);
    SQL.Add(' WHERE ' + camposCondicao + ' = ' + QuotedStr(valorCondicao));
    SQL.Add(' AND ' + campoData + ' = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',
      ValorData)));
    Prepare;
    ExecQuery;
  end;

  Result := utils.AdicionaMascaraDinheiro(qrySql.FieldByName('TOTAL').AsString);
end;

function TfrmFluxoCaixa.SomaTotaisNota(campoSomar, tabela, prefixo,
  campoData: string; ValorData: TDate): Double;
begin
  with qrySql do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(' + campoSomar + ') TOTAL FROM ' + tabela);
    SQL.Add(' WHERE PREFIXO = ' + QuotedStr(prefixo));
    SQL.Add(' AND POSICAO = ' + QuotedStr('AB'));
    SQL.Add(' AND ' + campoData + ' <= ' +
      QuotedStr(FormatDateTime('MM/DD/YYYY', ValorData)));
    Prepare;
    ExecQuery;
  end;

  Result := qrySql.FieldByName('TOTAL').AsFloat;

end;

function TfrmFluxoCaixa.SomaTotaisNotaNT(campoSomar, tabela, prefixo,
  campoData: string; ValorData: TDate): String;
var
  utils: TUtils;
begin
  with qrySql do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(' + campoSomar + ') TOTAL FROM ' + tabela);
    SQL.Add(' WHERE PREFIXO = ' + QuotedStr(prefixo));
    SQL.Add(' AND ' + campoData + ' = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',
      ValorData)));
    Prepare;
    ExecQuery;
  end;

  Result := utils.AdicionaMascaraDinheiro(qrySql.FieldByName('TOTAL').AsString);

end;

end.