program PDV;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untData in 'untData.pas' {DM: TDataModule},
  untPesqProdutoItens in 'untPesqProdutoItens.pas' {frmPesqProdutoItens},
  untVendaFinalizacao in 'untVendaFinalizacao.pas' {frmVendaFinalizacao},
  untVendaInfoGeral in 'untVendaInfoGeral.pas' {frmVendaInfoGeral},
  untPesqCliente in 'untPesqCliente.pas' {frmPesqCliente},
  untPesqVendedor in 'untPesqVendedor.pas' {frmPesqVendedor},
  untLancDadosBasicCheque in 'untLancDadosBasicCheque.pas' {frmLancDadosBasicCheque},
  untPesqBanco in 'untPesqBanco.pas' {frmPesqBanco},
  untTabelaPrecos in 'untTabelaPrecos.pas' {frmTabelaPrecos},
  untCancelarItem in 'untCancelarItem.pas' {frmCancelarItem},
  untAberturaCaixa in 'untAberturaCaixa.pas' {frmAberturaCaixa},
  untLogin in 'untLogin.pas' {frmLogin},
  untOpcoes in 'untOpcoes.pas' {frmOpcoes},
  untMovimentacaoCaixa in 'untMovimentacaoCaixa.pas' {frmMovimentacaoCaixa},
  untSangria in 'untSangria.pas' {frmSangria},
  untItensEntregar in 'untItensEntregar.pas' {frmItensEntregar},
  untTroco in 'untTroco.pas' {frmTroco},
  untDescAcresc in 'untDescAcresc.pas' {frmDescAcresc},
  untCadClientes in 'untCadClientes.pas' {frmCadClientes},
  untPesqCidade in '..\untPesqCidade.pas' {frmPesqCidade},
  untSuprimento in 'untSuprimento.pas' {frmSuprimento},
  untCntReceber in 'untCntReceber.pas' {frmCntReceber},
  untBaixaDocumento in 'untBaixaDocumento.pas' {frmBaixaDocumento},
  uRegistro in '..\uRegistro.pas',
  untOutrosPagamentos in 'untOutrosPagamentos.pas' {frmOutrosPagamentos},
  untOrdemServico in 'untOrdemServico.pas' {frmOrdemServico},
  untCadVeicClientes in 'untCadVeicClientes.pas' {frmCadVeicCliente},
  untPesqTecnicos in 'untPesqTecnicos.pas' {frmPesqTecnicos},
  untPesqServicos in 'untPesqServicos.pas' {frmPesqServicos},
  untOrdemServicoSimples in 'untOrdemServicoSimples.pas' {frmOrdemServicoSimples},
  untDevTroca in 'untDevTroca.pas' {frmDevTroca},
  untFechamentoCaixa in 'untFechamentoCaixa.pas' {frmFechamentoCaixa},
  untTroca in 'untTroca.pas' {frmTroca},
  uUtils in 'uUtils.pas',
  untSelPreVenda in 'untSelPreVenda.pas' {frmSelPreVenda},
  untTotalizadores in 'untTotalizadores.pas' {frmTotalizadores},
  uContador in 'uContador.pas',
  untConfig in 'untConfig.pas' {frmConfig},
  untRestaurarVenda in 'untRestaurarVenda.pas' {frmRestaurarVenda},
  untNumeroPreVenda in 'untNumeroPreVenda.pas' {frmNumeroPreVenda},
  untParamDevTroca in 'untParamDevTroca.pas' {frmParamDevTroca},
  uVerificaPermicao in 'uVerificaPermicao.pas',
  untSelTabPreco in 'untSelTabPreco.pas' {frmSelTabPreco},
  untStautsNfCe in 'untStautsNfCe.pas' {frmStatusNFCe},
  untVendas in 'untVendas.pas' {frmVendas},
  untSelDtPrimeiroVencimento in 'untSelDtPrimeiroVencimento.pas' {frmSelDtPrimeiroVencimento},
  untSelImpressora in 'untSelImpressora.pas' {frmSelImpressora},
  untTipoCartaoCredito in 'untTipoCartaoCredito.pas' {frmTipoCartaoCredito},
  untLancCreditoCliente in 'untLancCreditoCliente.pas' {frmLancCreditoCliente},
  UntVendaInfo in 'UntVendaInfo.pas' {frmVendaInfo},
  untInutilizarNFCe in 'untInutilizarNFCe.pas' {frmInutilizarNFCe},
  untMensagens in 'untMensagens.pas' {frmMensagens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmTipoCartaoCredito, frmTipoCartaoCredito);
  Application.CreateForm(TfrmLancCreditoCliente, frmLancCreditoCliente);
  Application.Run;
end.