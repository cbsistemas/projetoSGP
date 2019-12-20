unit untItensXMLCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  pFIBClientDataSet, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, RzButton,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExExtCtrls,
  ClipBrd,
  JvImage, RzPanel, RzBckgnd, Vcl.DBCtrls, RzRadChk, RzDBChk;

type
  TfrmItensXMLCompra = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    btnPrior: TRzBitBtn;
    btnFirst: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    RzLabel41: TRzLabel;
    lblEncontrados: TRzLabel;
    RzLabel40: TRzLabel;
    lblNovos: TRzLabel;
    gdrCadItens: TJvDBGrid;
    btnCancelar: TRzBitBtn;
    btnGravar: TRzBitBtn;
    dsCadastroItens: TDataSource;
    imgLink2: TImage;
    imgLink1: TImage;
    imgCancelLink1: TImage;
    imgCancelLink2: TImage;
    imgChequed1: TImage;
    imgChequed2: TImage;
    RzGroupBox1: TRzGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBCheckBox1: TRzDBCheckBox;
    procedure btnGravarClick(Sender: TObject);
    procedure gdrCadItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdrCadItensMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure gdrCadItensCellClick(Column: TColumn);
    procedure gdrCadItensDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gdrCadItensColExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  THackGrid = class(TCustomDBGrid);
  // criar uma nova classe pra acessar as propriedades privadas

var
  frmItensXMLCompra: TfrmItensXMLCompra;

implementation

{$R *.dfm}

uses untCompras, untData, untPesqProdutoItens;

procedure TfrmItensXMLCompra.btnCancelarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle,
    Pchar('Deseja realmente abandonar o lan�amento de Compra atual?'),
    'Aten��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        ModalResult := mrCancel;
      end;
  end;
end;

procedure TfrmItensXMLCompra.btnGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmItensXMLCompra.FormCreate(Sender: TObject);
begin
  DBCheckBox1.DataSource := dsCadastroItens;
  DBCheckBox1.DataField := 'CADASTRAR';
  DBCheckBox1.Visible := False;
  DBCheckBox1.Color := gdrCadItens.Color;
  DBCheckBox1.Caption := '';
  //explicado mais adiante no artigo
  DBCheckBox1.ValueChecked := 'Yes';
  DBCheckBox1.ValueUnChecked := 'Not';
end;

procedure TfrmItensXMLCompra.gdrCadItensCellClick(Column: TColumn);
var
  i: SmallInt;
  nome: string;
begin
  if (Column.Index = 4)and (frmCompras.cdsCadadastroItensENCONTROU.AsString = 'N')then
  begin
    if frmCompras.cdsCadadastroItensID.AsInteger = 0 then
    begin
      Try
        nome := frmCompras.cdsCadadastroItensNOME.AsString;
        i := Pos(' ', nome);
        nome := nome.Substring(0, i - 1);

        frmPesqProdutoItens := TfrmPesqProdutoItens.Create(nil);
        frmPesqProdutoItens.edtNome.Text := nome;
        frmPesqProdutoItens.Pesquisar;
        frmPesqProdutoItens.ShowModal;
      Finally
        if frmPesqProdutoItens.ModalResult = mrOk then
        begin
          with frmCompras.cdsCadadastroItens do
          begin
            Edit;
            frmCompras.cdsCadadastroItensID.AsInteger := frmPesqProdutoItens.fdsProdutoItensID.AsInteger;
            frmCompras.cdsCadadastroItensNOME_CADASTRADO.AsString := frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
            frmCompras.cdsCadadastroItensMARGEM_LUCRO.AsFloat :=frmPesqProdutoItens.fdsProdutoItensMARGEM_LUCRO.AsFloat;
            frmCompras.cdsCadadastroItensEAN.AsString :=frmPesqProdutoItens.fdsProdutoItensCOD_FABRICA.AsString;
            cfop:= frmPesqProdutoItens.fdsProdutoItensCFOP.AsString;
            csosn:=frmPesqProdutoItens.fdsProdutoItensCSOSN.AsString;
            cest:=frmPesqProdutoItens.fdsProdutoItensCEST.AsString;
            cst_pis:=frmPesqProdutoItens.fdsProdutoItensCST_PIS.AsString;
            cst_cofins:=frmPesqProdutoItens.fdsProdutoItensCST_COFINS.AsString;
            aliq_icms:=frmPesqProdutoItens.fdsProdutoItensALIQ_ICMS.AsFloat;
            fcp:=frmPesqProdutoItens.fdsProdutoItensFCP.AsFloat;
            informacao:='Pre�o:R$'+frmPesqProdutoItens.fdsProdutoItensPREC_VENDA.AsString+' Pre�o de Custo:R$'+frmPesqProdutoItens.fdsProdutoItensPREC_CUSTO.AsString+' Custo M�dio:R$'+frmPesqProdutoItens.fdsProdutoItensPREC_CUSTO_MEDIO.AsString;
            Post;
          end;
        end;
        frmPesqProdutoItens.Free
      End;
    end
    else
    begin
      with frmCompras.cdsCadadastroItens do
      begin
        Edit;
        frmCompras.cdsCadadastroItensID.AsInteger := 0;
        frmCompras.cdsCadadastroItensNOME_CADASTRADO.AsString := frmCompras.cdsCadadastroItensNOME.AsString;
        Post;
      end;
    end;

  end;


  if (Column.Index = 4)and (frmCompras.cdsCadadastroItensENCONTROU.AsString = 'S')then
  begin
    if frmCompras.cdsCadadastroItensID.AsInteger = frmCompras.cdsCadadastroItensID_TEMP.AsInteger then
    begin
      Try
        nome := frmCompras.cdsCadadastroItensNOME.AsString;
        i := Pos(' ', nome);
        nome := nome.Substring(0, i - 1);

        frmPesqProdutoItens := TfrmPesqProdutoItens.Create(nil);
        frmPesqProdutoItens.edtNome.Text := nome;
        frmPesqProdutoItens.Pesquisar;
        frmPesqProdutoItens.ShowModal;
      Finally
        if frmPesqProdutoItens.ModalResult = mrOk then
        begin
          with frmCompras.cdsCadadastroItens do
          begin
            Edit;
            frmCompras.cdsCadadastroItensID.AsInteger := frmPesqProdutoItens.fdsProdutoItensID.AsInteger;
            frmCompras.cdsCadadastroItensNOME_CADASTRADO.AsString := frmPesqProdutoItens.fdsProdutoItensNOME.AsString;
            frmCompras.cdsCadadastroItensMARGEM_LUCRO.AsFloat :=frmPesqProdutoItens.fdsProdutoItensMARGEM_LUCRO.AsFloat;
            frmCompras.cdsCadadastroItensEAN.AsString :=frmPesqProdutoItens.fdsProdutoItensCOD_FABRICA.AsString;
            precoVenda := frmPesqProdutoItens.fdsProdutoItensPREC_VENDA.AsFloat;
            Post;
          end;
        end;
        frmPesqProdutoItens.Free
      End;
    end
    else
    begin
      with frmCompras.cdsCadadastroItens do
      begin
        Edit;
        frmCompras.cdsCadadastroItensID.AsInteger := frmCompras.cdsCadadastroItensID_TEMP.AsInteger;
        frmCompras.cdsCadadastroItensNOME_CADASTRADO.AsString := frmCompras.cdsCadadastroItensNOME.AsString;
        frmCompras.cdsCadadastroItensMARGEM_LUCRO.AsFloat := frmCompras.cdsCadadastroItensMARGEM_LUCRO_TEMP.AsFloat;
        frmCompras.cdsCadadastroItensEAN.AsString :=frmCompras.cdsCadadastroItensEAN_TEMP.AsString;
        precoVenda := frmCompras.cdsCompraItemPREC_VENDA.AsFloat;
        Post;
      end;
    end;
  end;
end;

procedure TfrmItensXMLCompra.gdrCadItensColExit(Sender: TObject);
begin
if gdrCadItens.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure TfrmItensXMLCompra.gdrCadItensDblClick(Sender: TObject);
begin
  Clipboard.AsText := frmCompras.cdsCadadastroItensEAN.AsString;

  //if frmCompras.cdsCadadastroItensENCONTROU.AsString = 'N' then
    frmCompras.cdsCadadastroItens.Edit;
end;

procedure TfrmItensXMLCompra.gdrCadItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
   const IsChecked : array[Boolean] of Integer =(DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  Bitmap: TBitmap;
  DrawState: Integer;
  DrawRect: TRect;
begin
  if not odd(frmCompras.cdsCadadastroItens.RecNo) then
  begin
    gdrCadItens.Canvas.Brush.Color := DM.gridOddColor;
    gdrCadItens.Canvas.FillRect(Rect);
    gdrCadItens.DefaultDrawDataCell(Rect, Column.Field, State);

    if (Column.Index = 4) then
    begin
      if frmCompras.cdsCadadastroItensENCONTROU.AsString = 'N' then
      begin
        if frmCompras.cdsCadadastroItensID.AsInteger = 0 then
          Bitmap := imgCancelLink2.Picture.Bitmap
        else
          Bitmap := imgLink2.Picture.Bitmap;
      end
      else
        Bitmap := imgChequed2.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end
  else
  begin
    if (Column.Index = 4) then
    begin
      if frmCompras.cdsCadadastroItensENCONTROU.AsString = 'N' then
      begin
        if frmCompras.cdsCadadastroItensID.AsInteger = 0 then
          Bitmap := imgCancelLink1.Picture.Bitmap
        else
          Bitmap := imgLink1.Picture.Bitmap;
      end
      else
        Bitmap := imgChequed1.Picture.Bitmap;

      with TDBGrid(Sender) do
      begin
        Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        // ou: Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      end;
    end;
  end;

   if (gdFocused in State) then
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
      DBCheckBox1.Left := Rect.Left + gdrCadItens.Left + 2;
      DBCheckBox1.Top := Rect.Top + gdrCadItens.top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;
      DBCheckBox1.Visible := True;
     end
   end
   else
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
       DrawRect:=Rect;
       InflateRect(DrawRect,-1,-1);
       DrawState := ISChecked[Column.Field.AsBoolean];
       gdrCadItens.Canvas.FillRect(Rect);
       DrawFrameControl(gdrCadItens.Canvas.Handle, DrawRect,
         DFC_BUTTON, DrawState);
     end;
   end;

  // if frmCompras.cdsCadadastroItensSITUACAO_SISTEMA.AsString = 'N�O ENCONTRADO' then
  // gdrCadItens.Canvas.Font.Color:= clRed;
  //
  // if frmCompras.cdsCadadastroItensSITUACAO_SISTEMA.AsString = 'ENCONTRADO' then
  // gdrCadItens.Canvas.Font.Color:= clBlue;
  //
  // gdrCadItens.DefaultDrawDataCell(Rect, gdrCadItens.columns[datacol].field, State);

end;

procedure TfrmItensXMLCompra.gdrCadItensMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
  MouseScrPt: TPoint;
  OrigActiveRecord: Integer;
begin
  pt := gdrCadItens.MouseCoord(X, Y);

  if dgTitles in gdrCadItens.Options then
    Dec(pt.Y);
  // se o titulo � mostrado ent�o ajusta a row index(-1) para nao dar erro de argument out of range
  if dgIndicator in gdrCadItens.Options then
    Dec(pt.X);
  // se o indicador � mostrado ent�o ajusta a column index (-1) para nao dar erro de argument out of range

  if THackGrid(gdrCadItens).DataLink.Active and (pt.Y >= 0) and (pt.X = 4) then
  begin
    gdrCadItens.Cursor := crHandPoint;
  end
  else
  begin
    gdrCadItens.Cursor := crDefault;
  end;
end;

end.