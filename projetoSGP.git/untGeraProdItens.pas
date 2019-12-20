unit untGeraProdItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzBckgnd, RzButton, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExExtCtrls, JvImage, RzPanel,
  dxGDIPlusClasses, Data.DB, Datasnap.DBClient, pFIBClientDataSet, FIBQuery,
  pFIBQuery, FIBDataSet, pFIBDataSet;

type
  TfrmGeraProdItens = class(TForm)
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    grdItens: TJvDBGrid;
    RzPanel2: TRzPanel;
    btnGravar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    RzBackground1: TRzBackground;
    dsItens: TDataSource;
    qryComand: TpFIBQuery;
    fdsCor_Grupo: TpFIBDataSet;
    fdsCor_GrupoID: TFIBBCDField;
    fdsCor_GrupoNOME: TFIBStringField;
    fdsCor_GrupoREFERENCIA: TFIBStringField;
    fdsTamanho_Grupo: TpFIBDataSet;
    fdsTamanho_GrupoID: TFIBBCDField;
    fdsTamanho_GrupoNOME: TFIBStringField;
    fdsTamanho_GrupoREFERENCIA: TFIBStringField;
    cdsItens: TpFIBClientDataSet;
    cdsItensNOME: TStringField;
    cdsItensREFERENCIA: TStringField;
    cdsItensIDTAMANHO: TIntegerField;
    cdsItensIDCOR: TIntegerField;
    cdsItensCOR: TStringField;
    cdsItensTAMANHO: TStringField;
    cdsItensSEL: TStringField;
    cdsItensSELECT: TStringField;
    procedure GeraGrupos;
    procedure VerificaCadastrados;
    procedure btnCancelarClick(Sender: TObject);
    procedure grdItensCellClick(Column: TColumn);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdItensTitleClick(Column: TColumn);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    idGrupo: Integer;
    produtoNome, produtoRef: string;
  end;

var
  frmGeraProdItens: TfrmGeraProdItens;
  marcar: string;

implementation

{$R *.dfm}

uses untData, untCaProdutos;

{ TfrmGeraProdItens }

procedure TfrmGeraProdItens.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeraProdItens.btnGravarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle,
    Pchar('Deseja realmente cadastrar os itens selecionados?'), 'Atenção',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        cdsItens.First;
        ModalResult := mrOk;
      end;
  end;
end;

procedure TfrmGeraProdItens.FormActivate(Sender: TObject);
begin
  GeraGrupos;
  VerificaCadastrados;
  cdsItens.First;
end;

procedure TfrmGeraProdItens.FormCreate(Sender: TObject);
begin
  cdsItens.CreateDataSet;
  cdsItens.Open;
  marcar := 'S';
end;

procedure TfrmGeraProdItens.GeraGrupos;
var
  t: Smallint;
  c: Smallint;
  totTamanho: Smallint;
  totCor: Smallint;
  nome: string;
begin

  with fdsTamanho_Grupo do
  begin
    Close;
    ParamByName('IDGRUPO').AsInteger := idGrupo;
    Prepare;
    Open;
    Last;
    First;
    totTamanho := RecordCount;
  end;

  if totTamanho > 0 then
  begin
    with fdsCor_Grupo do
    begin
      Close;
      ParamByName('IDGRUPO').AsInteger := idGrupo;
      Prepare;
      Open;
      Last;
      First;
      totCor := RecordCount;
    end;

    if totCor > 0 then
    begin

      // RetornaItens;

      cdsItens.Last;

      fdsTamanho_Grupo.First;
      while not(fdsTamanho_Grupo.Eof) do
      begin
        fdsCor_Grupo.First;
        while not(fdsCor_Grupo.Eof) do
        begin
          // if ClientDataSet1.Locate('DATA',StrToDate(Edit1.Text),[]) then
          // if not(cdsItens.Locate('IDPRODUTO; IDTAMANHO; IDCOR', VarArrayOf([fdsProdutoID.AsString, fdsTamanho_GrupoID.AsString, fdsCor_GrupoID.AsString]), [])) then
          // if not(MyLocateItem(fdsTamanho_GrupoID.AsString, fdsCor_GrupoID.AsString)) then
          begin
            cdsItens.Append;

            nome := produtoNome;

            if not(fdsTamanho_GrupoID.AsInteger = 0) then
              nome := nome + ' ' + fdsTamanho_GrupoNOME.AsString;

            if not(fdsCor_GrupoID.AsInteger = 0) then
              nome := nome + ' ' + fdsCor_GrupoNOME.AsString;

            cdsItensNOME.AsString := nome;
            cdsItensREFERENCIA.AsString := produtoRef +
              fdsTamanho_GrupoREFERENCIA.AsString +
              fdsCor_GrupoREFERENCIA.AsString;
            cdsItensIDTAMANHO.AsInteger := fdsTamanho_GrupoID.AsInteger;
            cdsItensIDCOR.AsInteger := fdsCor_GrupoID.AsInteger;
            cdsItensCOR.AsString := fdsCor_GrupoNOME.AsString;
            cdsItensTAMANHO.AsString := fdsTamanho_GrupoNOME.AsString;
            cdsItens.Post;
          end;
          fdsCor_Grupo.Next;

          Application.ProcessMessages;

        end;
        fdsTamanho_Grupo.Next;
      end;
    end;
  end;

end;

procedure TfrmGeraProdItens.grdItensCellClick(Column: TColumn);
begin
  if grdItens.SelectedField.FieldName = 'SEL' then
  begin
    cdsItens.Edit;

    if cdsItensSELECT.AsString = 'S' then
    begin
      cdsItensSELECT.AsString := 'N';
    end
    else
    begin
      cdsItensSELECT.AsString := 'S';
    end;

    cdsItens.Post;

  end;
end;

procedure TfrmGeraProdItens.grdItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if not odd(cdsItens.RecNo) then
  begin
    grdItens.Canvas.Brush.Color := DM.gridOddColor;
    grdItens.Canvas.FillRect(Rect);
    grdItens.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    grdItens.Canvas.FillRect(Rect);
    Check := 0;

    if cdsItensSELECT.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -1, -1);
    DrawFrameControl(grdItens.Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmGeraProdItens.grdItensTitleClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  begin
    cdsItens.First;
    while not(cdsItens.Eof) do
    begin
      cdsItens.Edit;
      cdsItensSELECT.AsString := marcar;
      cdsItens.Post;
      cdsItens.Next;
    end;

    if marcar = 'S' then
      marcar := 'N'
    else
      marcar := 'S';

  end;
end;

procedure TfrmGeraProdItens.VerificaCadastrados;
begin
  cdsItens.First;

  while not(cdsItens.Eof) do
  begin
    if (frmCadProdutos.MyLocateItem(cdsItensIDTAMANHO.AsString,
      cdsItensIDCOR.AsString)) then
    begin
      cdsItens.Edit;
      cdsItensSELECT.AsString := 'S';
      cdsItens.Post;
    end;
    cdsItens.Next;
  end;
end;

end.
