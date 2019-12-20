unit untDataThread;

interface

uses
  System.SysUtils, System.Classes, FIBDatabase, pFIBDatabase, Data.DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,DateUtils;

type
  TDMThread = class(TDataModule)
    Conexao2: TpFIBDatabase;
    trans: TpFIBTransaction;
    fdsCntReceberItem: TpFIBDataSet;
    qrySQL: TpFIBQuery;
    fdsCntReceberItemID: TFIBBCDField;
    fdsCntReceberItemPOSICAO: TFIBStringField;
    fdsCntReceberItemPREFIXO: TFIBStringField;
    fdsCntReceberItemREFERENCIA: TFIBStringField;
    fdsCntReceberItemIDRECEBER: TFIBBCDField;
    fdsCntReceberItemDT_VENC: TFIBDateField;
    fdsCntReceberItemDT_PAG: TFIBDateField;
    fdsCntReceberItemACRESCIMO: TFIBBCDField;
    fdsCntReceberItemDESCONTO: TFIBBCDField;
    fdsCntReceberItemVALOR: TFIBBCDField;
    fdsCntReceberItemVALOR_PAGO: TFIBBCDField;
    fdsCntReceberItemHISTORICO: TFIBStringField;
    fdsCntReceberItemPARCELA: TFIBStringField;
    fdsCntReceberItemENVIADO_WEB: TFIBStringField;
    fdsCntReceberItemIDFILIAL: TFIBBCDField;
    fdsCntReceberItemBAIXA_AGRUPADA: TFIBStringField;
    fdsCntReceberItemPAGAMENTO_MOEDA: TFIBStringField;
    fdsCntReceberItemREC_DESC_ACRE: TFIBBCDField;
    fdsCntReceberItemREC_DINHEIRO: TFIBBCDField;
    fdsCntReceberItemID_REC_ITEM: TFIBBCDField;
    fdsCntReceberItemVALOR_JUROS_PAGO: TFIBBCDField;
    fdsMov: TpFIBDataSet;
    fdsMovID: TFIBBCDField;
    fdsMovIDRECEBER_ITEM: TFIBBCDField;
    fdsMovIDRECEBER_CHEQUE: TFIBBCDField;
    fdsMovIDUSUARIO: TFIBBCDField;
    fdsMovIDCLIENTE: TFIBBCDField;
    fdsMovIDFILIAL: TFIBBCDField;
    fdsMovDT_MOV: TFIBDateField;
    fdsMovHR_MOV: TFIBTimeField;
    fdsMovSTATUS: TFIBStringField;
    fdsMovREFERENCIA: TFIBStringField;
    fdsMovPREFIXO: TFIBStringField;
    fdsMovBAIXA_AUTOMATICA: TFIBStringField;
    fdsCntReceberItemIDCLIENTE: TFIBBCDField;
    qryRetornaCheque: TpFIBQuery;
    procedure BaixaDoc(Prefixo: string;DiasBaixa:Integer= 0; IDUsuario:Integer=1);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure GeraMovimento(Status,Referencia,Prefixo:String;IDCliente:Integer;
    IDReceberItem:Integer;IDReceberCheq, IDFilial, idUsuario:Integer);
    function RetornaCheque(IDReceberItem:Integer):Integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMThread: TDMThread;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDMThread }

procedure TDMThread.BaixaDoc(Prefixo: string;DiasBaixa:Integer=0;IDUsuario:integer=1);
var
  tempParAtual, tempParcTotal, idFormaPag,idCheque: Integer;
begin
  fdsMov.Open;
  if Prefixo = 'CT' then
    idFormaPag := 2;

  if Prefixo = 'CD' then
    idFormaPag := 3;

  if Prefixo = 'CH' then
    idFormaPag := 4;

  with fdsCntReceberItem do
  begin
    Close;
    ParamByName('DT_VENC').AsDateTime := IncDay(Now,-DiasBaixa);
    ParamByName('PREFIXO').AsString := Prefixo;
    Prepare;
    Open;
    First;

    while not(EOF) do
    begin
      Edit;
      if Prefixo = 'CH' then
      begin
        fdsCntReceberItemPOSICAO.AsString := 'CP';
      end
      else
        fdsCntReceberItemPOSICAO.AsString := 'PG';
      fdsCntReceberItemDT_PAG.AsDateTime := fdsCntReceberItemDT_VENC.AsDateTime;
      fdsCntReceberItemVALOR_PAGO.AsFloat := fdsCntReceberItemVALOR.AsFloat;
      fdsCntReceberItemHISTORICO.AsString := 'BAIXA AUTOM�TICA';
      fdsCntReceberItemREC_DINHEIRO.AsFloat := fdsCntReceberItemVALOR.AsFloat;
      fdsCntReceberItemPAGAMENTO_MOEDA.AsString := Prefixo;
      Post;

      tempParAtual := StrToInt(Copy(fdsCntReceberItemPARCELA.AsString, 0, 3));
      tempParcTotal := StrToInt(Copy(fdsCntReceberItemPARCELA.AsString, 4, 3));

      if tempParAtual = tempParcTotal then
      begin
        with qrySQL do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE CNT_RECEBER SET POSICAO = :POSICAO, VALOR_PAGO = VALOR, IDFORMA_PAG = :IDFORMA_PAG, ');
          SQL.Add('HISTORICO = :HISTORICO WHERE ID = :IDRECEBER AND IDFILIAL = :IDFILIAL');
          ParamByName('POSICAO').AsString := 'PG';
          ParamByName('HISTORICO').AsString :=
            'Pago por meio de baixa autom�tica';
          ParamByName('IDRECEBER').AsInteger :=
            fdsCntReceberItemIDRECEBER.AsInteger;
          ParamByName('IDFORMA_PAG').AsInteger := idFormaPag;
          ParamByName('IDFILIAL').AsInteger :=
            fdsCntReceberItemIDFILIAL.AsInteger;
          Prepare;
          ExecQuery;
        end;
      end;

      if Prefixo = 'CH' then
      begin
        idCheque := RetornaCheque(fdsCntReceberItemID.AsInteger);
        GeraMovimento('CP',fdsCntReceberItemREFERENCIA.AsString,prefixo,
         fdsCntReceberItemIDCLIENTE.AsInteger,fdsCntReceberItemID.AsInteger,
          idCheque,fdsCntReceberItemIDFILIAL.AsInteger,IDUsuario);
      end
      else
      begin
        GeraMovimento('PG',fdsCntReceberItemREFERENCIA.AsString,prefixo,
          fdsCntReceberItemIDCLIENTE.AsInteger,fdsCntReceberItemID.AsInteger,
            0,fdsCntReceberItemIDFILIAL.AsInteger,IDUsuario);
      end;
      Next;
    end;

    Conexao2.CommitRetaining;
    Close;
  end;
end;

procedure TDMThread.DataModuleCreate(Sender: TObject);
begin
  Conexao2.Connected := False;
end;
procedure TDMThread.GeraMovimento(Status, Referencia, Prefixo: String;
  IDCliente, IDReceberItem, IDReceberCheq, IDFilial, idUsuario: Integer);
begin
  with fdsMov do
  begin
    append;
    fdsMovIDRECEBER_ITEM.AsInteger := IDReceberItem;
    fdsMovIDRECEBER_CHEQUE.AsInteger := IDReceberCheq;
    fdsMovIDUSUARIO.AsInteger := idUsuario;
    fdsMovIDCLIENTE.AsInteger := IDCliente;
    fdsMovIDFILIAL.AsInteger := IDFilial;
    fdsMovDT_MOV.AsDateTime := Date;
    fdsMovHR_MOV.AsDateTime := time;
    fdsMovSTATUS.AsString := Status;
    fdsMovREFERENCIA.AsString := Referencia;
    fdsMovPREFIXO.AsString := Prefixo;
    fdsMovBAIXA_AUTOMATICA.AsString := 'S';
    post;
    trans.CommitRetaining;
  end;
end;
function TDMThread.RetornaCheque(IDReceberItem: Integer): Integer;
begin
  with qryRetornaCheque do
  begin
   close;
   ParamByName('IDRECEBER_ITEM').AsInteger := IDReceberItem;
   prepare;
   Execquery;

   result := FieldByName('ID').AsInteger;
  end;

end;

end.