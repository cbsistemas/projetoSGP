unit untConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DateUtils,
  Dialogs, FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet, RzDBEdit, StdCtrls,
  Mask, RzEdit, Grids, DBGrids, JvExDBGrids, JvDBGrid, RzTabs, RzButton,
  RzLabel, dxGDIPlusClasses, ExtCtrls, JvExExtCtrls, JvImage, RzPanel, RzBckgnd,
  RzCmboBx, RzDBCmbo, DBCtrls, ComCtrls, RzDTP, RzDBDTP, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, RzRadChk, RzDBChk, Vcl.Imaging.pngimage,
  RzRadGrp, RzDBRGrp, Vcl.Imaging.jpeg, RzDBGrid, pFIBStoredProc,
  Datasnap.Provider, pFIBClientDataSet, Datasnap.DBClient,IniFiles;

type
  TfrmConfig = class(TForm)
    RzBackground1: TRzBackground;
    RzPanel1: TRzPanel;
    JvImage1: TJvImage;
    lblTituloCliente: TRzLabel;
    pgcEmpresa: TRzPageControl;
    tbsEmpresa: TRzTabSheet;
    lblNome: TRzLabel;
    RzLabel2: TRzLabel;
    lblRG: TRzLabel;
    lblCPF: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel22: TRzLabel;
    edtNome: TRzDBEdit;
    edtRazao: TRzDBEdit;
    edtCNPJ: TRzDBEdit;
    edtIE: TRzDBEdit;
    lcbFilial: TRzDBLookupComboBox;
    edtEndereco: TRzDBEdit;
    edtNumero: TRzDBEdit;
    edtBairro: TRzDBEdit;
    edtCidade: TRzDBEdit;
    btnPesqCidade: TRzBitBtn;
    edtCep: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    btnPesqLogo: TRzBitBtn;
    edtTelefone: TRzDBEdit;
    TabSheet1: TRzTabSheet;
    RzGroupBox3: TRzGroupBox;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    btnCertNumSerie: TRzBitBtn;
    RzDBEdit4: TRzDBEdit;
    edtSenhaCert: TRzDBEdit;
    RzDBRadioGroup1: TRzDBRadioGroup;
    RzGroupBox1: TRzGroupBox;
    RzLabel4: TRzLabel;
    edtUltimaNFe: TEdit;
    btnCancelar: TRzBitBtn;
    btnGravar: TRzBitBtn;
    fdsFilial: TpFIBDataSet;
    fdsFilialID: TFIBBCDField;
    fdsFilialNOME: TFIBStringField;
    dsFilial: TDataSource;
    OpenDialog1: TOpenDialog;
    PrintDialog1: TPrintDialog;
    qrySQL: TpFIBQuery;
    pgcGeral: TRzTabSheet;
    RzGroupBox4: TRzGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    cbxStatus: TRzDBComboBox;
    RzLabel1: TRzLabel;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    RzDBRadioGroup3: TRzDBRadioGroup;
    RzDBRadioGroup4: TRzDBRadioGroup;
    RzDBRadioGroup5: TRzDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtDiasCarenciaJuros: TDBEdit;
    edtValorMultaAtraso: TDBEdit;
    edtPorcentagemDiaAtraso: TDBEdit;
    edtDiasBloquearCliente: TDBEdit;
    RzDBRadioGroup2: TRzDBRadioGroup;
    DBCheckBox4: TDBCheckBox;
    edtTarifaBoleto: TDBEdit;
    Label5: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    Label6: TLabel;
    edtCFOP: TDBEdit;
    Label7: TLabel;
    edtMargemLucro: TDBEdit;
    Label8: TLabel;
    edtCEST: TDBEdit;
    Label9: TLabel;
    edtCSOSN: TDBEdit;
    edtParam: TRzDBEdit;
    edtChave: TRzDBEdit;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    DBEdit1: TDBEdit;
    RzLabel8: TRzLabel;
    pgcNFCe: TRzTabSheet;
    RzDBRadioGroup6: TRzDBRadioGroup;
    RzLabel10: TRzLabel;
    RzDBComboBox1: TRzDBComboBox;
    RzLabel13: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel23: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    TabSheet2: TRzTabSheet;
    RzDBRadioGroup7: TRzDBRadioGroup;
    RzDBRadioGroup8: TRzDBRadioGroup;
    RzDBRadioGroup9: TRzDBRadioGroup;
    RzDBComboBox2: TRzDBComboBox;
    Label10: TLabel;
    chkTemBalancaEtiqueta: TRzDBCheckBox;
    RzGroupBox2: TRzGroupBox;
    edtPrefixoEAN: TRzDBEdit;
    cbxTipoCNPJouCPF: TRzDBComboBox;
    Label11: TLabel;
    Label12: TLabel;
    cbxProdutorRural: TRzDBComboBox;
    DBCheckBox9: TDBCheckBox;
    Label13: TLabel;
    edtDiasPrimeiraParcela: TDBEdit;
    RzDBRadioGroup10: TRzDBRadioGroup;
    RzGroupBox5: TRzGroupBox;
    DBGrid1: TDBGrid;
    btnEditGen: TRzBitBtn;
    fdsGeneration: TpFIBDataSet;
    fdsGenerationGEN: TFIBStringField;
    fdsGenerationNUM_SERIE: TFIBIntegerField;
    fdsGenerationULTIMA_NFCE: TFIBBCDField;
    dsGeneration: TDataSource;
    gdrCaixa: TDBGrid;
    edtInserirCaixa: TRzBitBtn;
    edtEditarCaixa: TRzBitBtn;
    edtExcluirCaixa: TRzBitBtn;
    btnGenGravar: TRzBitBtn;
    fspGen: TpFIBStoredProc;
    btnGenCancelar: TRzBitBtn;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    RzBitBtn1: TRzBitBtn;
    fspNotaDuplicada: TpFIBStoredProc;
    RzBitBtn2: TRzBitBtn;
    fdsMovCntReceber: TpFIBDataSet;
    qryAtualizaMov: TpFIBQuery;
    cdsMovCntReceber: TClientDataSet;
    fdsMovCntReceberID: TFIBBCDField;
    fdsMovCntReceberIDFILIAL: TFIBBCDField;
    fdsMovCntReceberIDCAIXA: TFIBIntegerField;
    fdsMovCntReceberIDCLIENTE: TFIBBCDField;
    fdsMovCntReceberIDCAIXA_MOV: TFIBIntegerField;
    dspMovCntReceber: TpFIBDataSetProvider;
    cdsMovCntReceberID: TBCDField;
    cdsMovCntReceberIDFILIAL: TBCDField;
    cdsMovCntReceberIDCAIXA: TIntegerField;
    cdsMovCntReceberIDCLIENTE: TBCDField;
    cdsMovCntReceberIDCAIXA_MOV: TIntegerField;
    DBCheckBox13: TDBCheckBox;
    RzLabel3: TRzLabel;
    dtVenci: TRzDBDateTimeEdit;
    CheckBox1: TCheckBox;
    RzDBRadioGroup11: TRzDBRadioGroup;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox2: TRzDBCheckBox;
    cbxNfe: TRzCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditaInsere;
    procedure GravaCancela;
    procedure edtProfKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesqCidadeClick(Sender: TObject);
    procedure btnCertNumSerieClick(Sender: TObject);
    procedure edtDiasCarenciaJurosClick(Sender: TObject);
    procedure edtValorMultaAtrasoClick(Sender: TObject);
    procedure edtPorcentagemDiaAtrasoClick(Sender: TObject);
    procedure edtDiasBloquearClienteClick(Sender: TObject);
    procedure RzDBRadioGroup5Changing(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure edtTarifaBoletoClick(Sender: TObject);
    procedure edtMargemLucroClick(Sender: TObject);
    procedure edtCSOSNClick(Sender: TObject);
    procedure edtCFOPClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure edtInserirCaixaClick(Sender: TObject);
    procedure edtEditarCaixaClick(Sender: TObject);
    procedure edtExcluirCaixaClick(Sender: TObject);
    procedure btnEditGenClick(Sender: TObject);
    procedure btnGenGravarClick(Sender: TObject);
    procedure btnGenCancelarClick(Sender: TObject);
    procedure edtCESTClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    ultimaNFCe, ultimaNFe: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses untPrincipal, untData, uUtils, untPesqCidade, untPesqCliente, untCadCaixa,
  untPesqNFeNFCe;

{$R *.dfm}

procedure TfrmConfig.btnAlterarClick(Sender: TObject);
begin
  dm.fdsConfig.Edit;
  btnCancelar.Enabled := True;
  btnGravar.Enabled := True;
end;

procedure TfrmConfig.btnCancelarClick(Sender: TObject);
begin
  Case MessageBox(Application.Handle, Pchar('Deseja Realmente Sair?'),
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        if dm.fdsConfig.State in [dsInsert, dsEdit] then
        begin
          dm.fdsConfig.Cancel;
          dm.Conexao.RollbackRetaining;
        end;
        modalResult := mrCancel;
      end;

    idNo:
      begin
        Abort;
      end;
  end;
end;

procedure TfrmConfig.btnCertNumSerieClick(Sender: TObject);
begin
  Try
    dm.fdsConfigNFeCERT_NUM_SERIE.AsString :=frmPrincipal.ACBrNFe1.SSL.SelecionarCertificado;
    dm.fdsConfigNFeDT_VALID.AsDateTime:=frmPrincipal.ACBrNFe1.SSL.DadosCertificado.DataVenc;
   if  (DaysBetween(now,frmPrincipal.ACBrNFe1.SSL.CertDataVenc)>30) then
   begin
      frmprincipal.StatusBar1.Panels.Items[0].Text:=''
   end;
  Except
    on E: Exception do
    begin
      Application.MessageBox('Nenhum certificado selecionado.', 'Atenção',
        MB_OK + MB_ICONQUESTION);
    end;
  End;
end;

procedure TfrmConfig.btnEditGenClick(Sender: TObject);
begin
 Application.MessageBox
 ('Antes de alterar qualquer generation, certifique-se de que nenhum caixa possui notas com codigo e série em Status de Erro.Caso possua, tome as medidas cabíveis para a correção da(s) mesma(s).', 'Atenção',
        MB_OK + MB_ICONEXCLAMATION);
 fdsGeneration.Edit;
 fdsGenerationNUM_SERIE.FocusControl;
 btnEditGen.Enabled:=false;
 btnGenGravar.Enabled:=True;
 btnGenCancelar.Enabled:=True;
end;

procedure TfrmConfig.btnGenCancelarClick(Sender: TObject);
begin
 fdsGeneration.Cancel;
 Dm.Conexao.RollbackRetaining;
 btnEditGen.Enabled:=True;
 btnGenGravar.Enabled:=false;
 btnGenCancelar.Enabled:=false;
end;

procedure TfrmConfig.btnGenGravarClick(Sender: TObject);
begin
 fdsGeneration.Post;
 with fspGen do
 begin
   close;
   ParamByName('GEN').AsString:= fdsGenerationGEN.AsString;
   ParamByName('MOVIMENTO').AsString:='A';
   ParamByName('ULTIMA_NFCE').AsString:= fdsGenerationULTIMA_NFCE.AsString;
   ParamByName('SERIE').AsInteger:= fdsGenerationNUM_SERIE.AsInteger;
   prepare;
   ExecProc;
 end;
 dm.Conexao.CommitRetaining;
 DM.fdsCaixa.Close;
 DM.fdsCaixa.Open;
 btnEditGen.Enabled:=True;
 btnGenGravar.Enabled:=false;
 btnGenCancelar.Enabled:=false;
end;

procedure TfrmConfig.btnGravarClick(Sender: TObject);
var
  utils: TUtils;
  i: Smallint;
  campoVazio: Boolean;
  NFE:Char;
  ArqIni: TIniFile;
begin
  case MessageBox(Application.Handle,
    Pchar('Deseja realmente salvar as alterações?'), 'Atenção',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:
      begin
        campoVazio := False;
        for i := 0 to ComponentCount - 1 do
        begin
          if (Components[i].Tag = 15) then
          begin
            if utils.VerificaCampoObrigatorio(TRzDBEdit(Components[i])) then
              campoVazio := True;
          end;
        end;
        if campoVazio then
        begin
          Application.MessageBox
            ('Existem campos obrigatórios a serem preenchidos.', 'Anteção',
            MB_OK + MB_ICONERROR);
          Abort;
        end
        else
        begin
          if edtUltimaNFe.Text <> EmptyStr then
          begin
            if (ultimaNFe = 0)or (edtUltimaNFe.Text<>IntTostr(ultimaNFe)) then
            begin
              with qrySQL do
              begin
                close;
                SQL.Clear;
                SQL.Add('ALTER SEQUENCE GEN_CODIGO_NFE_PEDIDO RESTART WITH ' +
                  edtUltimaNFe.Text);
                prepare;
                ExecQuery;
              end;
            end;
          end;

          {if ultimaNFCe = 0 then
          begin
            with qrySQL do
            begin
              close;
              SQL.Clear;
              SQL.Add('ALTER SEQUENCE GEN_CODIGO_NFCE_VENDA RESTART WITH ' +
                edtUltimaNFCe.Text);
              prepare;
              ExecQuery;
            end;
          end; }
          ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\PATH.INI');
          try
            if cbxNfe.Checked then
              ArqIni.WriteString('CAMINHOS', 'NFE','S')
            else
              ArqIni.WriteString('CAMINHOS', 'NFE','N');
          finally
            ArqIni.Free;
          end;

          dm.fdsConfig.Post;
          dm.fdsConfigNFe.Post;
          dm.Conexao.CommitRetaining;
          modalResult := mrOk;
          btnGravar.Enabled := False;
        end;
      end;
  end;
end;

procedure TfrmConfig.btnPesqCidadeClick(Sender: TObject);
begin
  Try
    frmPesqCidade := TfrmPesqCidade.Create(nil);
    frmPesqCidade.ShowModal;
  Finally
    if frmPesqCidade.modalResult = mrOk then
    begin
      dm.fdsConfigIDCIDADE.AsInteger := frmPesqCidade.fdsCidadesID.AsInteger;
      edtCidade.Text := frmPesqCidade.fdsCidadesNOME.AsString + ' - ' +
        frmPesqCidade.fdsCidadesUF.AsString;
    end;
    frmPesqCidade.Free;
  End;
  edtCep.SetFocus;
end;

procedure TfrmConfig.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked then
 begin
   edtSenhaCert.PasswordChar:=#0;
 end
 else
  edtSenhaCert.PasswordChar:='*';
end;

procedure TfrmConfig.DBEdit1Exit(Sender: TObject);
begin
//if cbxTipoCNPJouCPF.ItemIndex=1 then

end;

procedure TfrmConfig.edtDiasCarenciaJurosClick(Sender: TObject);
begin
  edtDiasCarenciaJuros.SelectAll;
end;

procedure TfrmConfig.edtCESTClick(Sender: TObject);
begin
 edtCEST.SelectAll;
end;

procedure TfrmConfig.edtCFOPClick(Sender: TObject);
begin
  edtCFOP.SelectAll;
end;

procedure TfrmConfig.edtCSOSNClick(Sender: TObject);
begin
  edtCSOSN.SelectAll;
end;

procedure TfrmConfig.edtValorMultaAtrasoClick(Sender: TObject);
begin
  edtValorMultaAtraso.SelectAll;
end;

procedure TfrmConfig.edtPorcentagemDiaAtrasoClick(Sender: TObject);
begin
  edtPorcentagemDiaAtraso.SelectAll;
end;

procedure TfrmConfig.edtDiasBloquearClienteClick(Sender: TObject);
begin
  edtDiasBloquearCliente.SelectAll;
end;

procedure TfrmConfig.edtMargemLucroClick(Sender: TObject);
begin
  edtMargemLucro.SelectAll;
end;

procedure TfrmConfig.EditaInsere;
var
  i: Smallint;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).ActivePageIndex := 1;
      TRzPageControl(Components[i]).Pages[0].TabVisible := False;
    end;

    if (Components[i] is TRzBitBtn) then
    begin
      if Components[i].Tag = 1 then
        TRzBitBtn(Components[i]).Enabled := False
      else
        TRzBitBtn(Components[i]).Enabled := True;
    end;
  end;
  // edtNome.SetFocus;
end;

procedure TfrmConfig.edtEditarCaixaClick(Sender: TObject);
begin
  if DM.fdsCaixa.RecordCount>0 then
  begin
    try
       frmCadCaixa:=TfrmCadCaixa.Create(nil);
       DM.fdsCaixa.Edit;
       frmCadCaixa.ShowModal;
     finally
       frmCadCaixa.Destroy;
     end;
  end;
end;

procedure TfrmConfig.edtExcluirCaixaClick(Sender: TObject);
begin
 case MessageBox(Application.Handle,
    Pchar('Deseja realmente salvar as alterações?'), 'Atenção',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) of
    idYes:begin
           DM.fdsCaixa.Delete;
           Dm.Conexao.CommitRetaining;
          end;
 end;
end;

procedure TfrmConfig.edtProfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnGravar.SetFocus;
  end;
end;

procedure TfrmConfig.edtTarifaBoletoClick(Sender: TObject);
begin
  edtTarifaBoleto.SelectAll;
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmConfig := nil;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
var
  NFE:String[1];
  ArqIni: TIniFile;
begin
  fdsGeneration.Open;
  fdsFilial.Open;
  fdsFilial.Last;
  fdsFilial.First;
  dm.fdsConfig.Edit;
  dm.fdsConfigNFe.Edit;
  dm.fdsCaixa.ParamByName('IDFILIAL').AsInteger:=dm.fdsConfigIDFILIAL.AsInteger;
  dm.fdsCaixa.Open;
  dm.fdsCaixa.First;
  if dm.fdsConfigQTN_SOLICITAR.AsString= EmptyStr  then
  begin
   dm.fdsConfigQTN_SOLICITAR.AsString:='N';
  end;
//  with qrySQL do
//  begin
//    close;
//    SQL.Add('SELECT GEN_ID(GEN_CODIGO_NFE_PEDIDO,0) AS NFE, GEN_ID(gen_codigo_nfce_venda,0) AS NFCe FROM RDB$DATABASE');
//    prepare;
//    ExecQuery;
//
//    edtUltimaNFe.Text := FieldByName('NFE').AsString;
//    edtUltimaNFCe.Text := FieldByName('NFCe').AsString;
//
//    ultimaNFe := StrToInt(edtUltimaNFe.Text);
//    ultimaNFCe := StrToInt(edtUltimaNFCe.Text);
//  end;
  if dm.fdsConfigNFeDT_VALID.IsNull then
  dm.fdsConfigNFeDT_VALID.AsDateTime := frmPrincipal.ACBrNFe1.SSL.CertDataVenc;

  //Retorna o codigo da última NFe emitida
  with qrySQL do
  begin
    close;
    SQL.Add('SELECT GEN_ID(GEN_CODIGO_NFE_PEDIDO,0) AS NFE FROM RDB$DATABASE');
    prepare;
    ExecQuery;

    edtUltimaNFe.Text := FieldByName('NFE').AsString;
    ultimaNFe := StrToInt(edtUltimaNFe.Text);
  end;

  //Verifica se emite NFE ou não através do arquivo INI
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\PATH.INI');
  try
    NFE := ArqIni.ReadString('CAMINHOS', 'NFE','');
  finally
    ArqIni.Free;
  end;
  if NFE = 'N' then
  begin
   cbxNfe.Checked := false;
  end
  else
  begin
    cbxNfe.Checked := True;
  end;
end;

procedure TfrmConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfrmConfig.GravaCancela;
var
  i: Smallint;
  utils: TUtils;
  editando: Boolean;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TRzPageControl) then
    begin
      TRzPageControl(Components[i]).Pages[0].TabVisible := True;
      TRzPageControl(Components[i]).ActivePageIndex := 0;
    end
    else
    begin
      if (Components[i] is TRzBitBtn) then
      begin
        if Components[i].Tag = 1 then
          TRzBitBtn(Components[i]).Enabled := True
        else
          TRzBitBtn(Components[i]).Enabled := False;
      end
      else
      begin
        if Components[i].Tag = 15 then
        begin
          if (Components[i] is TRzEdit) then
            utils.ResetColorCampo(TRzDBEdit(Components[i]), True)
          else
            utils.ResetColorCampo(TRzDBEdit(Components[i]), False);
        end;
      end;
    end;
  end;

end;


procedure TfrmConfig.edtInserirCaixaClick(Sender: TObject);
begin
 try
   frmCadCaixa:=TfrmCadCaixa.Create(nil);
   DM.fdsCaixa.Close;
   Dm.fdsCaixa.Open;
   DM.fdsCaixa.Append;
   frmCadCaixa.rgbGen.Value:='GEN1';
   frmCadCaixa.rgbGenChange(self);
   frmCadCaixa.ShowModal;
 finally
   frmCadCaixa.Free;
 end;
end;

procedure TfrmConfig.RzBitBtn1Click(Sender: TObject);
var
 arq:TextFile;
begin
 Application.MessageBox('Antes de efetuar essa operação faça um Beckup da base de dados do Cliente.','Atenção!',MB_OK+MB_ICONINFORMATION);
 try
  frmPesqNFeNFCe := TfrmPesqNFeNFCe.Create(nil);
  frmPesqNFeNFCe.ShowModal;
 finally
  if frmPesqNFeNFCe.ModalResult=mrOK then
  begin
    AssignFile(arq,ExtractFilePath(Application.ExeName) + 'Atualizacao\HISTORICO_DUP.txt');
    {$I-}
    Reset(arq);
    {$I+}
    if (IOResult <> 0)
    then Rewrite(arq) { arquivo não existe e será criado }
    else
    begin
     CloseFile(arq);
     Append(arq); { o arquivo existe e será aberto para saídas adicionais }
    end;

   with fspNotaDuplicada do
   begin
   close;
   if frmPesqNFeNFCe.rgbTipo.ItemIndex = 0 then
   begin
    Writeln(arq,'Beckup-',DatetimeToStr(now),'(NFCe: ',frmPesqNFeNFCe.fdsNFCeID.AsInteger,'|CODIGO: ',frmPesqNFeNFCe.fdsNFCeCODIGO_NFCE.AsString, '|CHAVE: ', frmPesqNFeNFCe.fdsNFCeCHAVE_CONSULTA.AsString, '|EMISSÃO: ',frmPesqNFeNFCe.fdsNFCeDATA_EMISSAO.AsString, '|)');
    ParamByName('IDNOTA').AsInteger:= frmPesqNFeNFCe.fdsNFCeID.AsInteger;
    ParamByName('TIPO').AsString:= 'CF';
   end;
   if frmPesqNFeNFCe.rgbTipo.ItemIndex = 1 then
   begin
    Writeln(arq,'Beckup-',DatetimeToStr(now),'(NFe: ',frmPesqNFeNFCe.fdsNFeID.AsInteger,'|CODIGO: ',frmPesqNFeNFCe.fdsNFeCODIGO_NFE.AsString, '|CHAVE: ', frmPesqNFeNFCe.fdsNFeCHAVE_CONSULTA.AsString, '|EMISSÃO: ',frmPesqNFeNFCe.fdsNFeDT_EMISSAO.AsString, '|)');
    ParamByName('IDNOTA').AsInteger:= frmPesqNFeNFCe.fdsNFeID.AsInteger;
    ParamByName('TIPO').AsString:= 'NF';
   end;
   ParamByName('CHAVE_NOTA').AsString:=frmPesqNFeNFCe.edtchave.Text;
   ParamByName('PROTOCOLO').AsString:= frmPesqNFeNFCe.edtProtocolo.Text;
   ParamByName('DT_EMISSAO').AsDate:= frmPesqNFeNFCe.edtData.date;
   prepare;
   ExecProc;
   end;
   CloseFile(arq);
   dm.Conexao.CommitRetaining;
   Application.MessageBox('Nota duplicada atualizada com sucesso! Agora basta baixar o arquivo .xml para sua devida Pasta.','Sucesso!',MB_OK+MB_ICONEXCLAMATION);
  end;
  frmPesqNFeNFCe.Free;
 end;
end;

procedure TfrmConfig.RzBitBtn2Click(Sender: TObject);
begin
 try
  With fdsMovCntReceber do
  begin
    close;
    prepare;
    open;
    cdsMovCntReceber.Open;
    first;
    cdsMovCntReceber.First;
  end;
  while not(cdsMovCntReceber.Eof) do
  begin
    with cdsMovCntReceber do
    begin

      with qryAtualizaMov do
      begin
        close;
        ParamByName('IDMOV').AsInteger:= cdsMovCntReceberID.AsInteger;
        prepare;
        ExecQuery;
      end;
      if qryAtualizaMov.RecordCount > 0 then
      begin
        Edit;
        cdsMovCntReceberIDCLIENTE.AsInteger:= qryAtualizaMov.FieldByName('MAX').AsInteger;
        post;
      end;
    end;
    cdsMovCntReceber.Next;
  end;
  cdsMovCntReceber.ApplyUpdates(0);
  dm.Conexao.CommitRetaining;
 finally
   ShowMessage('Cliente na movimentação do recebimento Atualizados com sucesso!');
 end;

end;

procedure TfrmConfig.RzDBRadioGroup5Changing(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if NewIndex = 1 then
  begin
    edtDiasCarenciaJuros.Enabled := True;
    edtDiasCarenciaJuros.Color := clMoneyGreen;
    edtValorMultaAtraso.Enabled := True;
    edtValorMultaAtraso.Color := clMoneyGreen;
    edtPorcentagemDiaAtraso.Enabled := True;
    edtPorcentagemDiaAtraso.Color := clMoneyGreen;
    edtDiasBloquearCliente.Enabled := True;
    edtDiasBloquearCliente.Color := clMoneyGreen;
  end
  else
  begin
    if dm.fdsConfig.State in [dsInsert, dsEdit] then
    begin
      edtDiasCarenciaJuros.Enabled := False;
      edtValorMultaAtraso.Enabled := False;
      edtPorcentagemDiaAtraso.Enabled := False;
      edtDiasBloquearCliente.Enabled := False;

      dm.fdsConfigCARENCIA_JUROS.AsInteger := 0;
      dm.fdsConfigVALOR_MULTA_ATRASO.AsFloat := 0;
      dm.fdsConfigJUROS_DIA_PORCENTAGEM.AsFloat := 0;
      dm.fdsConfigDIAS_ATRASO_BLOQUEIO.AsInteger := 0;
    end;
  end;
end;

end.
