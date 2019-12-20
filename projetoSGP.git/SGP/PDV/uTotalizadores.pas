unit uTotalizadores;

interface
  uses
      sysUtils, StrUtils, Math, FIBQuery, pFIBQuery;

  Type
    TTotalizadores = class
    procedure CalculaTotais;

  private

  protected

  public


    var
      DNAbertura, DNVenda, CTVenda, CHVenda : Double;
      NTVenda, FNVenda, TKVenda, VDVenda : Double;
      SangriaDN, SuprimentoDN, SangriaCH,TotalEN : Double;
      TotalFechamento, TotalSaida : Double;
      dtAbertura : TDate;
    end;

implementation

{ TTotalizadores }

uses untData;

procedure TTotalizadores.CalculaTotais;
var
  qryComando : TpFIBQuery;
  tempDNAbertura, tempDNVenda, tempCTVenda, tempCHVenda : Double;
  tempNTVenda, tempFNVenda, tempTKVenda, tempVDVenda : Double;
  tempSangriaDN, tempSuprimentoDN, TempSangriaCH,tempTotalEN : Double;
  tempTotalFechamento, tempTotalSaida : Double;
  tempDtAbertura : TDate;

begin
  try
    qryComando := TpFIBQuery.Create(nil);
    qryComando.Close;
    qryComando.Database := DM.conexao;
    qryComando.Transaction := Dm.trans;

    With qryComando do
    begin
      //Retorna Valor e Data de Abertura
      Close;
      SQL.Clear;
      SQL.Add('SELECT VLR_ENTRADA, DT_INC FROM MOVIMENTO_CAIXA WHERE CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND TIPO = ' + QuotedStr('AB'));
      SQL.Add(' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      tempDNAbertura := RoundTo(FieldByName('VLR_ENTRADA').AsFloat, -2);
      tempDtAbertura := FieldByName('DT_INC').AsDateTime;
      //Fim

      //Retorna Venda(Entrada) em Dinheiro
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_ENTRADA  - TROCO) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempDNVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempDNVenda := 0.00;

      //Retorna Valor Venda em Cart�o
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_CARTAO) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempCTVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempCTVenda := 0.00;

      //Retorna Valor Venda em Cheque
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_CHEQUE) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempCHVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempCHVenda := 0.00;

      //Retorna Valor Venda em Nota Promiss�ria
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_NOTA) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempNTVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempNTVenda := 0.00;

      //Retorna Valor Venda em Financeira
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_FINANCEIRA) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempFNVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempFNVenda := 0.00;

      //Retorna Valor Venda em Ticket
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_TICKET) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempTKVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempTKVenda := 0.00;

      //Retorna Valor Venda em Vale Desconto
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_VALEDESCONTO) AS TOT FROM MOVIMENTO_CAIXA WHERE (TIPO = ' + QuotedStr('VE') + ' OR TIPO = ' + QuotedStr('RC') + ' OR TIPO = ' + QuotedStr('OS'));
      SQL.Add(') AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString + ' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempVDVenda := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempVDVenda := 0.00;

      //Retorna Valor Suprimento em Dinheiro
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_VENDA) AS TOT FROM MOVIMENTO_CAIXA WHERE MOEDA = ' + QuotedStr('DN') + ' AND TIPO = ' + QuotedStr('SU') + ' AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString);
      SQL.Add(' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempSuprimentoDN := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempSuprimentoDN := 0.00;

      tempTotalEN := tempDNVenda + tempCTVenda + tempCHVenda + tempNTVenda + tempSuprimentoDN + tempFNVenda + tempTKVenda + tempVDvenda;

      //Retorna Valor Sangria em Dinheiro
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_VENDA) AS TOT FROM MOVIMENTO_CAIXA WHERE MOEDA = ' + QuotedStr('DN') + ' AND TIPO = ' + QuotedStr('SA') + ' AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString);
      SQL.Add(' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempSangriaDN := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        tempSangriaDN := 0.00;

      //Retorna Valor Sangria em Cheque
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLR_VENDA) AS TOT FROM MOVIMENTO_CAIXA WHERE MOEDA = ' + QuotedStr('CH') + ' AND TIPO = ' + QuotedStr('SA') + ' AND CONTROLE = ' + DM.fdsCaixaCONTROLE.AsString);
      SQL.Add(' AND IDCAIXA = ' + IntToStr(DM.numCaixa) + ' AND IDFILIAL = ' + IntToStr(DM.fdsConfigIDFILIAL.AsInteger));
      Prepare;
      ExecQuery;
      if not(Trim(FieldByName('TOT').AsString) = EmptyStr) then
        tempSangriaCH := RoundTo(FieldByName('TOT').AsFloat, -2)
      else
        TempSangriaCH := 0.00;


    end;
  finally
    FreeAndNil(qryComando);
  end;

  tempTotalSaida := tempSangriaDN + TempSangriaCH;

  tempTotalFechamento := RoundTo(tempDNAbertura + tempDNVenda + tempSuprimentoDN - tempSangriaDN, -2);

  DNAbertura := tempDNAbertura;
  DNVenda := tempDNVenda;
  CTVenda := tempCTVenda;
  CHVenda := tempCHVenda;
  NTVenda := tempNTVenda;
  FNVenda := tempFNVenda;
  TKVenda := tempTKVenda;
  VDVenda := tempVDVenda;
  SangriaDN := tempSangriaDN;
  SuprimentoDN := tempSuprimentoDN;
  SangriaCH := TempSangriaCH;
  TotalEN := tempTotalEN;
  TotalFechamento := tempTotalFechamento;
  TotalSaida := tempTotalFechamento;

end;

end.