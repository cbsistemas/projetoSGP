program PreVenda;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untData in 'untData.pas' {DM: TDataModule},
  untPesqProdutoItens in 'untPesqProdutoItens.pas' {frmPesqProdutoItens},
  uVerificaPermicao in 'uVerificaPermicao.pas',
  untLogin in 'untLogin.pas' {frmLogin},
  uUtils in 'uUtils.pas',
  untVendaFinalizacao in 'untVendaFinalizacao.pas' {frmVendaFinalizacao},
  untPesqCliente in 'untPesqCliente.pas' {frmPesqCliente},
  untCadClientes in 'untCadClientes.pas' {frmCadClientes},
  untPesqCidade in 'untPesqCidade.pas' {frmPesqCidade},
  untPesqVendedor in 'untPesqVendedor.pas' {frmPesqVendedor},
  untTabelaPrecos in 'untTabelaPrecos.pas' {frmTabelaPrecos},
  uRegistro in '..\uRegistro.pas',
  untCancelarItem in 'untCancelarItem.pas' {frmCancelarItem},
  untSelTabPreco in 'untSelTabPreco.pas' {frmSelTabPreco},
  untPesqPreVenda in 'untPesqPreVenda.pas' {frmPesqPreVenda},
  OKCANCL1 in 'c:\program files (x86)\embarcadero\rad studio\12.0\ObjRepos\EN\DelphiWin32\OKCANCL1.PAS' {OKBottomDlg},
  untMenssagens in 'untMenssagens.pas' {frmMenssagens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMenssagens, frmMenssagens);
  Application.Run;
end.
