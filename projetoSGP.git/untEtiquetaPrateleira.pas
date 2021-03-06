unit untEtiquetaPrateleira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, RzButton, Vcl.ExtCtrls, RzPanel, RzBckgnd, Data.DB,
  Datasnap.DBClient, pFIBClientDataSet, frxClass, frxDBSet, ACBrDevice,ACBrETQ,
  ACBrBase,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, JvExExtCtrls, JvImage, Vcl.Mask,
  Math,
  RzEdit;

type
  TfrmEtiquetaPrateleira = class(TForm)
    gdrProdutoItem: TJvDBGrid;
    RzBackground1: TRzBackground;
    RzPanel2: TRzPanel;
    btnImprimir: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    fdsPordItens: TpFIBClientDataSet;
    dsProdItens: TDataSource;
    fdsPordItensIMPRIMIR: TStringField;
    fdsPordItensSEL: TStringField;
    frxItens: TfrxDBDataset;
    fdsPordItensCOD_FABRICA: TStringField;
    fdsPordItensPREC_VENDA: TFloatField;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloImprecao: TRzLabel;
    lblTotalItens: TRzLabel;
    lblTituloTotal: TRzLabel;
    edtName: TRzEdit;
    btnPesqEAN: TRzBitBtn;
    RzLabel10: TRzLabel;
    fdsPordItensSaldo: TFloatField;
    btnEliminarZerados: TRzBitBtn;
    fdsPordItensNome: TStringField;
    fdsPordItensPREC_VENDA2: TCurrencyField;
    fdsPordItensPARCELA1: TFloatField;
    fdsPordItensPARCELA2: TFloatField;
    fdsItens: TpFIBClientDataSet;
    fdsItensIMPRIMIR: TStringField;
    fdsItensSEL: TStringField;
    fdsItensCOD_FABRICA: TStringField;
    fdsItensPREC_VENDA: TFloatField;
    fdsItensSaldo: TFloatField;
    fdsItensNome: TStringField;
    fdsItensPREC_VENDA2: TCurrencyField;
    fdsItensPARCELA1: TFloatField;
    fdsItensPARCELA2: TFloatField;
    cbxQtnPadao: TCheckBox;
    edtQtnPadrao: TEdit;
    procedure gdrProdutoItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrProdutoItemCellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure gdrProdutoItemTitleClick(Column: TColumn);
    procedure btnPesqEANClick(Sender: TObject);
    procedure btnEliminarZeradosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DublicaDados(pularEtiquetas: Integer);
    procedure fdsItensAfterPost(DataSet: TDataSet);
    procedure fdsItensCalcFields(DataSet: TDataSet);
    procedure cbxQtnPadaoClick(Sender: TObject);
    procedure cbxQtnPadaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    totImprimir: Integer;
    tipo: string;
  end;

var
  frmEtiquetaPrateleira: TfrmEtiquetaPrateleira;
  selTodos: Boolean;
  ordem: string[4]; // controla a ordena��o: Asc / Desc

implementation

{$R *.dfm}

uses untData, untPularEtiquetas, untPrincipal;

procedure TfrmEtiquetaPrateleira.btnEliminarZeradosClick(Sender: TObject);
begin
  fdsItens.First;
  while not(fdsItens.Eof) do
  begin
    if (fdsItensPREC_VENDA.AsCurrency = 0) or (fdsItensSaldo.AsCurrency = 0)
    then
    begin
      fdsItens.Edit;
      fdsItensIMPRIMIR.AsString := 'N';
      fdsItens.Post;
    end;
    fdsItens.Next;
  end;
end;

procedure TfrmEtiquetaPrateleira.btnImprimirClick(Sender: TObject);
var
  pularEitquetas: Integer;
begin

  fdsItens.First;
  pularEitquetas := 0;

  if tipo = '3Colunas' then
  begin
    Try
      frmPularEtiquetas := TfrmPularEtiquetas.Create(nil);
      frmPularEtiquetas.ShowModal;
    Finally
      if frmPularEtiquetas.ModalResult = mrOk then
      begin
        pularEitquetas := StrToInt(frmPularEtiquetas.edtPularEtiquetas.Text);
      end
      else
      begin
        Abort;
      end;
      frmPularEtiquetas.Free;
    End;
    DublicaDados(pularEitquetas);
    DM.frxReport1.Clear;
    DM.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '/Relatorios/frxEtiqProdutos6180.fr3');
    DM.frxReport1.PrepareReport(True);
    DM.frxReport1.ShowReport(True);
  end;

  if tipo = 'Joias' then
  begin
    Try
      frmPularEtiquetas := TfrmPularEtiquetas.Create(nil);
      frmPularEtiquetas.ShowModal;
    Finally
      if frmPularEtiquetas.ModalResult = mrOk then
      begin
        pularEitquetas := StrToInt(frmPularEtiquetas.edtPularEtiquetas.Text);
      end
      else
      begin
        Abort;
      end;
      frmPularEtiquetas.Free;
    End;
    DublicaDados(pularEitquetas);
    DM.frxReport1.Clear;
    DM.frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '/Relatorios/frxEtiqProdutos94x10.fr3');
    DM.frxReport1.PrepareReport(True);
    DM.frxReport1.ShowReport(True);
  end;

  if tipo = 'Prateleira' then
  begin
    fdsPordItens.EmptyDataSet;
    DublicaDados(pularEitquetas);


      //DPI := TACBrETQDPI(0);
      // TACBrETQDPI(cbDPI.ItemIndex); usa-se assim com um combo box na mesma ordem que est� no componente vitor
      //Modelo := TACBrETQModelo(1); // TACBrETQModelo(cbModelo.ItemIndex) ;
      //Porta := '\\localhost\argox';

     if frmPrincipal.ACBrETQ1.Ativo then
       frmPrincipal.ACBrETQ1.Desativar;
      frmPrincipal.ACBrETQ1.LimparMemoria := True;
      frmPrincipal.ACBrETQ1.Ativar;

      if frmPrincipal.ACBrETQ1.Modelo in [etqPpla, etqPplb] then
      begin
        if frmPrincipal.ACBrETQ1.Modelo in [etqPplb] then
        begin
          while not(fdsPordItens.Eof) do
          begin
           with frmPrincipal.ACBrETQ1 do
           begin
            if fdsPordItensIMPRIMIR.AsString = 'S' then
            begin
              ImprimirTexto(orNormal, 2, 2, 2,10,25, fdsPordItensNome.AsString,0,false);
              // ImprimirTexto(orNormal, 2, 2, 1, 158, 5, 'CHOC BRANCO');
              //ImprimirBarras(orNormal, barEAN13, '2', '2', 100, 35,Copy(fdsPordItensCOD_FABRICA.AsString,1,12), 90,becPadrao);
              ImprimirBarras(orNormal,'2C', 5, 2, 90, 40,fdsPordItensCOD_FABRICA.AsString, 90, becSIM);
              ImprimirTexto(orNormal, 4, 3, 2, 100, 400, 'R$');
              ImprimirTexto(orNormal, 4, 4, 2, 100, 550,FormatCurr('#,##0.00',StrToFloat(fdsPordItensPREC_VENDA.AsString)));

              if cbxQtnPadao.Checked=true then
              begin
               if (edtQtnPadrao.Text<>'0')and (edtQtnPadrao.Text<>EmptyStr) then
               begin
                Imprimir(StrToInt(edtQtnPadrao.Text), 600);
               end;
              end
              else
              begin
                if fdsPordItensSALDO.AsInteger >0 then
                begin
                Imprimir(fdsPordItensSaldo.AsInteger, 600);
                end
                else
                 Imprimir(1, 600)
              end;
            end;
            fdsPordItens.Next;
           end;
          end;
        end;

       if frmPrincipal.ACBrETQ1.Modelo in [etqPpla] then
       begin
          while not(fdsPordItens.Eof) do
          begin
           with frmPrincipal.ACBrETQ1 do
           begin
            if fdsPordItensIMPRIMIR.AsString = 'S' then
            begin
              ImprimirTexto(orNormal, 2, 2, 2, 190, 25, fdsPordItensNome.AsString);
              // ImprimirTexto(orNormal, 2, 2, 1, 158, 5, 'CHOC BRANCO');
              ImprimirBarras(orNormal, 'F', '2', '2', 32, 10,fdsPordItensCOD_FABRICA.AsString, 90, becSIM);
              ImprimirTexto(orNormal, 3, 3, 2, 15, 300, 'R$');
              ImprimirTexto(orNormal, 3, 4, 4, 15, 450,
                FormatCurr('#,##0.00',StrToFloat(fdsPordItensPREC_VENDA.AsString)));

              if cbxQtnPadao.Checked=true then
              begin
               if (edtQtnPadrao.Text<>'0')and (edtQtnPadrao.Text<>EmptyStr) then
               begin
                Imprimir(StrToInt(edtQtnPadrao.Text), 600);
               end;
              end
              else
              begin
                if fdsPordItensSALDO.AsInteger >0 then
                begin
                 Imprimir(fdsPordItensSaldo.AsInteger, 600);
                end
                else
                 Imprimir(1, 600)
              end;
            end;
            fdsPordItens.Next;
           end;
          end;
       end;
      end
      else  //if Modelo = etqZPLII then
      begin
        with frmPrincipal.ACBrETQ1 do
        begin
          while not(fdsPordItens.Eof) do
          begin
            ImprimirTexto(orNormal, '0', 60, 60, 3, 3,fdsPordItensNome.AsString, 0, True);
            //ImprimirTexto(orNormal, '0', 60, 60, 8, 3, 'CHOC BRANCO');
            ImprimirBarras(orNormal,'F', 2, 2, 13, 5,Copy(fdsPordItensCOD_FABRICA.AsString,1,12), 10, becSIM);
            ImprimirTexto(orNormal, '3', 100, 100, 18, 32, 'R$');
            ImprimirTexto(orNormal, '3', 4,4, 15, 100, FormatCurr('#,##0.00',StrToFloat(fdsPordItensPREC_VENDA.AsString)));

            if fdsPordItensSALDO.AsInteger >0 then
              begin
                Imprimir(fdsPordItensSaldo.AsInteger, 100);
              end
            else
               Imprimir(1, 100);
          end;
          fdsPordItens.Next;
        end;
      end;

     { while not(fdsPordItens.Eof) do
      begin
        if fdsPordItensIMPRIMIR.AsString = 'S' then
        begin
          ImprimirTexto(orNormal, 2, 2, 2, 190, 25, fdsPordItensNome.AsString);
          // ImprimirTexto(orNormal, 2, 2, 1, 158, 5, 'CHOC BRANCO');
          ImprimirBarras(orNormal, 'F', '2', '2', 32, 10,fdsPordItensCOD_FABRICA.AsString, 90, becSIM);
          ImprimirTexto(orNormal, 3, 3, 2, 15, 300, 'R$');
          ImprimirTexto(orNormal, 3, 4, 4, 15, 450,
            FormatCurr('#,##0.00',
            StrToFloat(fdsPordItensPREC_VENDA.AsString)));

            Imprimir(StrToInt(edtNumCopias.Text), 100)
//          else
//           Imprimir(1, 600)
        end;
        fdsPordItens.Next;
      end;}

     frmPrincipal.ACBrETQ1.Desativar;

  end;
end;

procedure TfrmEtiquetaPrateleira.btnPesqEANClick(Sender: TObject);
begin
  // fdsPordItens.Locate('NOME', Trim(edtPesqNome.text), []);
end;

procedure TfrmEtiquetaPrateleira.cbxQtnPadaoClick(Sender: TObject);
begin
 if cbxQtnPadao.Checked=true then
 begin
  edtQtnPadrao.Enabled:=true;
 end
 else
 begin
  edtQtnPadrao.Enabled:=false;
 end;
end;

procedure TfrmEtiquetaPrateleira.cbxQtnPadaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  cbxQtnPadao.Hint:='Ao marcar esta op��o, n�o ser� considerada a'+#13+'quantidade de etiquetas de cada item.'+#13+'No entanto, ser� impresso a quantidade padr�o'+#13+'escolhida para cada item.'
end;

procedure TfrmEtiquetaPrateleira.DublicaDados(pularEtiquetas: Integer);
var
  i, maxItens, totUltimaPagina: Integer;
  paginas: Double;
begin
  fdsPordItens.EmptyDataSet;
  fdsItens.First;
  maxItens := 1;

  while not(fdsItens.Eof) do
  begin
    if fdsItensIMPRIMIR.AsString = 'S' then
    begin
      if tipo = '3Colunas' then
      begin
        if fdsItensSaldo.AsInteger > 1 then
          maxItens := fdsItensSaldo.AsInteger
        else
          maxItens := 1;
      end;

      for i := 1 to maxItens do
      begin
        fdsPordItens.Append;
        fdsPordItensIMPRIMIR.AsString := fdsItensIMPRIMIR.AsString;
        fdsPordItensSEL.AsString := fdsItensSEL.AsString;
        fdsPordItensCOD_FABRICA.AsString := fdsItensCOD_FABRICA.AsString;
        fdsPordItensPREC_VENDA.AsFloat := fdsItensPREC_VENDA.AsFloat;
        fdsPordItensSaldo.AsFloat := fdsItensSaldo.AsFloat;
        fdsPordItensNome.AsString := fdsItensNome.AsString;
        fdsPordItensPREC_VENDA2.AsFloat := fdsItensPREC_VENDA2.AsFloat;
        fdsPordItensPARCELA1.AsFloat := fdsItensPARCELA1.AsFloat;
        fdsPordItensPARCELA2.AsFloat := fdsItensPARCELA2.AsFloat;
        fdsPordItens.Post;
      end;
    end;
    fdsItens.Next;
  end;

  if pularEtiquetas > 0 then
  begin
    fdsPordItens.Last;

    if fdsPordItens.RecordCount > 30 then
    // N�o estou conseguindo pensar direito nessa fun��o, est�o fazendo obra aqui do lado, a primeira que deu certo deixei
    begin
      paginas := fdsPordItens.RecordCount / 30;
      // if paginas > Trunc(paginas) then
      // begin
      totUltimaPagina := fdsPordItens.RecordCount - (30 * Trunc(paginas));

      for i := 1 to totUltimaPagina - 1 do
      begin
        fdsPordItens.Prior;
      end;

      for i := 1 to pularEtiquetas do
      begin
        fdsPordItens.Insert;
        fdsPordItens.Post;
      end;

      // end;
    end
    else
    begin
      fdsPordItens.First;
      for i := 1 to pularEtiquetas do
      begin
        fdsPordItens.Insert;
        // fdsPordItensCOD_FABRICA.AsString := 'vitor';
        fdsPordItens.Post;
      end;
    end;
  end;

  fdsPordItens.First;
end;

procedure TfrmEtiquetaPrateleira.FormActivate(Sender: TObject);
begin
  if tipo = '3Colunas' then
  begin
    frmEtiquetaPrateleira.Caption := 'Etiquetas 3 colunas';
    lblTituloImprecao.Caption := 'Impress�o de etiquetas folha 3 colunas';
  end;

  if tipo = 'Prateleira' then
  begin
    frmEtiquetaPrateleira.Caption := 'Etiquetas de prateleiras';
    lblTituloImprecao.Caption := 'Impress�o de Etiqueta para prateleiras';
    cbxQtnPadao.Visible:=true;
    cbxQtnPadao.Checked:=false;
    edtQtnPadrao.Visible:=true;
  end;
end;

procedure TfrmEtiquetaPrateleira.FormCreate(Sender: TObject);
begin
  fdsPordItens.CreateDataSet;
  fdsItens.CreateDataSet;
  selTodos := False;
  totImprimir := 0;
end;

procedure TfrmEtiquetaPrateleira.fdsItensAfterPost(DataSet: TDataSet);
begin
  if fdsItensIMPRIMIR.AsString = 'S' then
    Inc(totImprimir)
  else
    totImprimir := totImprimir - 1;

  lblTotalItens.Caption := IntToStr(totImprimir);
end;

procedure TfrmEtiquetaPrateleira.fdsItensCalcFields(DataSet: TDataSet);
begin
  if tipo = '3Colunas' then
  begin
    fdsItensPARCELA1.AsFloat := RoundTo(fdsItensPREC_VENDA2.AsFloat / 2, -2);
    fdsItensPARCELA2.AsFloat := fdsItensPARCELA1.AsFloat;

    if ((fdsItensPARCELA1.AsFloat * 2) < fdsItensPREC_VENDA2.AsFloat) then
    begin
      fdsItensPARCELA2.AsFloat := fdsItensPARCELA1.AsFloat +
        (fdsItensPREC_VENDA2.AsFloat - (fdsItensPARCELA1.AsFloat * 2));
    end;
  end;
end;

procedure TfrmEtiquetaPrateleira.gdrProdutoItemCellClick(Column: TColumn);
begin
  if gdrProdutoItem.SelectedField.FieldName = 'SEL' then
  begin
    fdsItens.Edit;

    if fdsItensIMPRIMIR.AsString = 'S' then
    begin
      fdsItensIMPRIMIR.AsString := 'N';
    end
    else
    begin
      fdsItensIMPRIMIR.AsString := 'S';
    end;

    fdsItens.Post;
  end;

  if gdrProdutoItem.SelectedField.FieldName = 'Saldo' then
  begin
    Try
      frmPularEtiquetas := TfrmPularEtiquetas.Create(nil);
      frmPularEtiquetas.Caption := fdsItensNome.AsString;
      frmPularEtiquetas.edtPularEtiquetas.Text :=
        FloatToStr(fdsItensSaldo.AsFloat);
      frmPularEtiquetas.lblTituloImprecao.Caption :=
        'Qtn. de etiquetas para esse produto';
      frmPularEtiquetas.ShowModal;
    Finally
      if frmPularEtiquetas.ModalResult = mrOk then
      begin
        fdsItens.Edit;
        fdsItensSaldo.AsFloat :=
          StrToFloat(frmPularEtiquetas.edtPularEtiquetas.Text);

        if fdsItensSaldo.AsFloat = 0 then
          fdsItensIMPRIMIR.AsString := 'N'
        else
          fdsItensIMPRIMIR.AsString := 'S';

        fdsItens.Post;
      end
      else
      begin
        Abort;
      end;
      frmPularEtiquetas.Free;
    End;
  end;
end;

procedure TfrmEtiquetaPrateleira.gdrProdutoItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if not odd(fdsPordItens.RecNo) then
  begin
    gdrProdutoItem.Canvas.Brush.Color := DM.gridOddColor;
    gdrProdutoItem.Canvas.FillRect(Rect);
    gdrProdutoItem.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    gdrProdutoItem.Canvas.FillRect(Rect);
    Check := 0;

    if fdsItensIMPRIMIR.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -1, -1);
    DrawFrameControl(gdrProdutoItem.Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmEtiquetaPrateleira.gdrProdutoItemTitleClick(Column: TColumn);
var
  sel: string;
begin

  // fdsPordItens.Close;
  // fdsPordItens.OrderClause := Column.FieldName + ' ' + ordem;
  // fdsPordItens.Open;
  //
  // if ordem = 'ASC' then
  // ordem := 'DESC'
  // else
  // ordem := 'ASC';
  //
  if Column.FieldName = 'SEL' then
  begin

    if selTodos then
      sel := 'S'
    else
      sel := 'N';

    fdsItens.First;
    while not(fdsItens.Eof) do
    begin
      fdsItens.Edit;
      fdsItensIMPRIMIR.AsString := sel;
      fdsItens.Post;
      fdsItens.Next;
    end;

    selTodos := not(selTodos);
  end;
end;

procedure TfrmEtiquetaPrateleira.RzBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;

end;

end.
