object DM: TDM
  OldCreateOrder = False
  Height = 193
  Width = 285
  object conexao: TpFIBDatabase
    Connected = True
    DBName = 'D:\Delphi\Sistemas\SGP\Banco\SGP.FDB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA'
      'lc_ctype=WIN1252')
    DefaultTransaction = trans
    DefaultUpdateTransaction = trans
    SQLDialect = 3
    Timeout = 0
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object trans: TpFIBTransaction
    Active = True
    DefaultDatabase = conexao
    Left = 16
    Top = 80
  end
  object dsConfig: TDataSource
    DataSet = fdsConfig
    Left = 168
    Top = 80
  end
  object frxReport1: TfrxReport
    Version = '5.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43540.420669467600000000
    ReportOptions.LastChange = 43542.486635000000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 16
    Top = 136
    Datasets = <
      item
        DataSet = frxConfig
        DataSetName = 'frxConfig'
      end
      item
        DataSet = frmPrincipal.frxMovCaixaAbertura
        DataSetName = 'frxMovCaixaAbertura'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'operador'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 80.000000000000000000
      PaperHeight = 90.000000000000000000
      PaperSize = 256
      EndlessHeight = True
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 302.362400000000000000
        object Memo14: TfrxMemoView
          Top = 23.677180000000000000
          Width = 302.362204720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxConfig."TELEFONE"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 1.440842350000000000
          Top = 87.811070000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'COMPROVANTE DE ABERTURA DE CAIXA')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 46.913420000000000000
          Width = 298.582674720000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxConfig."BAIRRO"], [frxConfig."CIDADE"] - [frxConfig."UF"]')
          ParentFont = False
        end
        object frxConfigNOME1: TfrxMemoView
          Top = 3.779530000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NOME'
          DataSet = frxConfig
          DataSetName = 'frxConfig'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxConfig."NOME"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 143.944960000000000000
        Top = 185.196970000000000000
        Width = 302.362400000000000000
        DataSet = frmPrincipal.frxMovCaixaAbertura
        DataSetName = 'frxMovCaixaAbertura'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 39.779530000000000000
          Top = 35.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Caixa:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 39.779530000000000000
          Top = 66.015770000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Operador:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 41.779530000000000000
          Top = 120.031540000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor da Abertura:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 39.779530000000000000
          Top = 7.559060000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object frxMovCaixaAberturaDT_INC: TfrxMemoView
          Left = 82.267780000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DT_INC'
          DataSet = frmPrincipal.frxMovCaixaAbertura
          DataSetName = 'frxMovCaixaAbertura'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxMovCaixaAbertura."DT_INC"]')
          ParentFont = False
        end
        object frxMovCaixaAberturaVLR_TOTAL: TfrxMemoView
          Left = 161.740260000000000000
          Top = 121.267780000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'VLR_TOTAL'
          DataSet = frmPrincipal.frxMovCaixaAbertura
          DataSetName = 'frxMovCaixaAbertura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxMovCaixaAbertura."VLR_TOTAL"]')
          ParentFont = False
        end
        object frxMovCaixaAberturaCONTROLE: TfrxMemoView
          Left = 104.488250000000000000
          Top = 92.708720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CONTROLE'
          DataSet = frmPrincipal.frxMovCaixaAbertura
          DataSetName = 'frxMovCaixaAbertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxMovCaixaAbertura."CONTROLE"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 38.897650000000000000
          Top = 92.708720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Controle:')
          ParentFont = False
        end
        object frxMovCaixaAberturaIDCAIXA: TfrxMemoView
          Left = 86.488250000000000000
          Top = 35.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'IDCAIXA'
          DataSet = frmPrincipal.frxMovCaixaAbertura
          DataSetName = 'frxMovCaixaAbertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxMovCaixaAbertura."IDCAIXA"]')
          ParentFont = False
        end
        object frxMovCaixaAberturaOPERADOR: TfrxMemoView
          Left = 109.488250000000000000
          Top = 67.252010000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OPERADOR'
          DataSet = frmPrincipal.frxMovCaixaAbertura
          DataSetName = 'frxMovCaixaAbertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxMovCaixaAbertura."OPERADOR"]')
          ParentFont = False
        end
        object frxMovCaixaAberturaHR_INC: TfrxMemoView
          Left = 164.417440000000000000
          Top = 9.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'HR_INC'
          DataSet = frmPrincipal.frxMovCaixaAbertura
          DataSetName = 'frxMovCaixaAbertura'
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxMovCaixaAbertura."HR_INC"]')
          ParentFont = False
        end
      end
      object frxConfigNOME: TfrxMemoView
        Left = -47.244133550000000000
        Top = -18.897650000000000000
        Width = 287.244280000000000000
        Height = 18.897650000000000000
        DataField = 'NOME'
        DataSet = frxConfig
        DataSetName = 'frxConfig'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxConfig."NOME"]')
        ParentFont = False
      end
    end
  end
  object frxConfig: TfrxDBDataset
    UserName = 'frxConfig'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'IDFILIAL=IDFILIAL'
      'RAZAO=RAZAO'
      'CNPJ=CNPJ'
      'IE=IE'
      'ENDERECO=ENDERECO'
      'BAIRRO=BAIRRO'
      'IDCIDADE=IDCIDADE'
      'CEP=CEP'
      'TELEFONE=TELEFONE'
      'EMAIL=EMAIL'
      'SITE=SITE'
      'LOGO_IMG_CAMINHO=LOGO_IMG_CAMINHO'
      'NOME=NOME'
      'IDCLIENTEPADRAO=IDCLIENTEPADRAO'
      'IDVENDEDORPADRAO=IDVENDEDORPADRAO'
      'FABRICA=FABRICA'
      'IDFORM_PAG_PAD=IDFORM_PAG_PAD'
      'IDPORTADOR_PADRAO=IDPORTADOR_PADRAO'
      'UTILIZAR_TABELA_PRECO=UTILIZAR_TABELA_PRECO'
      'CLIENTE_EXIBIR_PJ=CLIENTE_EXIBIR_PJ'
      'HORA_BKP=HORA_BKP'
      'BAIXA_AUTO_CARTAO=BAIXA_AUTO_CARTAO'
      'PARAM=PARAM'
      'CHAVE=CHAVE'
      'HOJE=HOJE'
      'CIDADE=CIDADE'
      'UF=UF'
      'CARENCIA_JUROS=CARENCIA_JUROS'
      'VALOR_MULTA_ATRASO=VALOR_MULTA_ATRASO'
      'JUROS_DIA=JUROS_DIA'
      'PDV_DESC_MAX_VENDA=PDV_DESC_MAX_VENDA'
      'DIAS_ATRASO_BLOQUEIO=DIAS_ATRASO_BLOQUEIO'
      'NUMERO=NUMERO'
      'CODIGO_MUNICIPIO=CODIGO_MUNICIPIO'
      'TELEFONE2=TELEFONE2')
    DataSet = fdsConfig
    BCDToCurrency = False
    Left = 88
    Top = 16
  end
  object fdsConfig: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CONFIG'
      'SET '
      '    IDFILIAL = :IDFILIAL,'
      '    NOME = :NOME,'
      '    RAZAO = :RAZAO,'
      '    CNPJ = :CNPJ,'
      '    IE = :IE,'
      '    ENDERECO = :ENDERECO,'
      '    ENDERECO_FANTASIA = :ENDERECO_FANTASIA,'
      '    NUMERO = :NUMERO,'
      '    BAIRRO = :BAIRRO,'
      '    BAIRRO_FANTASIA = :BAIRRO_FANTASIA,'
      '    IDCIDADE = :IDCIDADE,'
      '    CEP = :CEP,'
      '    TELEFONE = :TELEFONE,'
      '    TELEFONE2 = :TELEFONE2,'
      '    EMAIL = :EMAIL,'
      '    SITE = :SITE,'
      '    LOGO_IMG_CAMINHO = :LOGO_IMG_CAMINHO,'
      '    IDCLIENTEPADRAO = :IDCLIENTEPADRAO,'
      '    IDVENDEDORPADRAO = :IDVENDEDORPADRAO,'
      '    FABRICA = :FABRICA,'
      '    IDFORM_PAG_PAD = :IDFORM_PAG_PAD,'
      '    IDPORTADOR_PADRAO = :IDPORTADOR_PADRAO,'
      '    UTILIZAR_TABELA_PRECO = :UTILIZAR_TABELA_PRECO,'
      '    CLIENTE_EXIBIR_PJ = :CLIENTE_EXIBIR_PJ,'
      '    HORA_BKP = :HORA_BKP,'
      '    BAIXA_AUTO_CARTAO = :BAIXA_AUTO_CARTAO,'
      '    PARAM = :PARAM,'
      '    CHAVE = :CHAVE,'
      '    HOJE = :HOJE,'
      '    CARENCIA_JUROS = :CARENCIA_JUROS,'
      '    VALOR_MULTA_ATRASO = :VALOR_MULTA_ATRASO,'
      '    JUROS_DIA_PORCENTAGEM = :JUROS_DIA_PORCENTAGEM,'
      '    PDV_DESC_MAX_VENDA = :PDV_DESC_MAX_VENDA,'
      '    DIAS_ATRASO_BLOQUEIO = :DIAS_ATRASO_BLOQUEIO,'
      '    CONTROLAR_FALTAS = :CONTROLAR_FALTAS,'
      '    IDTRANPS_PADRAO = :IDTRANPS_PADRAO,'
      '    IDVEICULO_PADRAO = :IDVEICULO_PADRAO,'
      '    ESTOQUE_GERENCIAL = :ESTOQUE_GERENCIAL,'
      '    CFOP_PADRAO = :CFOP_PADRAO,'
      '    CEST_PADRAO = :CEST_PADRAO,'
      '    CSOSN_PADRAO = :CSOSN_PADRAO,'
      '    MARGEN_LUCRO_PADRAO = :MARGEN_LUCRO_PADRAO,'
      '    CARTAO_CREDITO_AVISTA = :CARTAO_CREDITO_AVISTA,'
      '    TARIFA_BOLETO = :TARIFA_BOLETO,'
      '    PDV_UTILIZAR_GAVETA = :PDV_UTILIZAR_GAVETA,'
      '    FILIAL_PREC_VENDA_IGUAL = :FILIAL_PREC_VENDA_IGUAL,'
      '    FISCAL = :FISCAL,'
      '    MODELO_IMPRESSORA = :MODELO_IMPRESSORA,'
      '    AUTO_PECAS = :AUTO_PECAS,'
      '    BAIXA_DOCS_AUTO = :BAIXA_DOCS_AUTO,'
      '    MODO_TAB_PRECO = :MODO_TAB_PRECO,'
      '    TIPO_IMPRESSAO_PEDIDO = :TIPO_IMPRESSAO_PEDIDO,'
      '    PEDIDO_SIMPLES = :PEDIDO_SIMPLES,'
      '    BLOQUEAR_CLIENT_ATRASO = :BLOQUEAR_CLIENT_ATRASO,'
      '    TP_CERTIFICADO_NFE = :TP_CERTIFICADO_NFE,'
      '    MODELO_ETIQ_PROD = :MODELO_ETIQ_PROD,'
      '    MODELO_BALANCA_GERAL = :MODELO_BALANCA_GERAL,'
      '    TAMANHO_CAMPOS_BAL = :TAMANHO_CAMPOS_BAL,'
      '    TIPO_COD_PROD_ETIQUETABAL = :TIPO_COD_PROD_ETIQUETABAL,'
      '    DADOS_COD_ETIQUETA_BAL = :DADOS_COD_ETIQUETA_BAL,'
      '    UTILIZAR_BAL_ETIQUETA = :UTILIZAR_BAL_ETIQUETA,'
      '    PREFIXO_EAN = :PREFIXO_EAN,'
      '    CNPJ_OU_CPF = :CNPJ_OU_CPF,'
      '    PRODUTOR_RURAL = :PRODUTOR_RURAL,'
      '    CUPOM_CREDIARIO_SIMPLIFIC = :CUPOM_CREDIARIO_SIMPLIFIC,'
      '    DIAS_PRIMEIRA_PARCELA = :DIAS_PRIMEIRA_PARCELA,'
      '    QTN_SOLICITAR = :QTN_SOLICITAR,'
      '    TAB_PADRAO_PDV = :TAB_PADRAO_PDV,'
      '    TAB_PADRAO_PRE_VENDA = :TAB_PADRAO_PRE_VENDA,'
      '    BLOQUEAR_F9 = :BLOQUEAR_F9,'
      '    ESTOQUE_CONSUMO = :ESTOQUE_CONSUMO,'
      '    MODELO_IMP_ETIQ = :MODELO_IMP_ETIQ,'
      '    DPI_IMP_ETIQ = :DPI_IMP_ETIQ,'
      '    PORTA_IMP_ETIQ = :PORTA_IMP_ETIQ,'
      '    TIPO_CONECT_IMP_ETQ = :TIPO_CONECT_IMP_ETQ,'
      '    SALVAR_PROD_PESQ = :SALVAR_PROD_PESQ,'
      '    PADRAO_LAYOUT = :PADRAO_LAYOUT,'
      '    BAIXA_AUTO_CARTAO_CD = :BAIXA_AUTO_CARTAO_CD,'
      '    DIAS_BAIXA_CT = :DIAS_BAIXA_CT,'
      '    DIAS_BAIXA_CD = :DIAS_BAIXA_CD,'
      '    DIAS_BAIXA_DOC = :DIAS_BAIXA_DOC,'
      '    N_VENDA_ESTOQUE_ZERO = :N_VENDA_ESTOQUE_ZERO,'
      '    N_VISUALIZAR_ESTOQ_ZERO = :N_VISUALIZAR_ESTOQ_ZERO'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CONFIG'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CONFIG('
      '    ID,'
      '    IDFILIAL,'
      '    NOME,'
      '    RAZAO,'
      '    CNPJ,'
      '    IE,'
      '    ENDERECO,'
      '    ENDERECO_FANTASIA,'
      '    NUMERO,'
      '    BAIRRO,'
      '    BAIRRO_FANTASIA,'
      '    IDCIDADE,'
      '    CEP,'
      '    TELEFONE,'
      '    TELEFONE2,'
      '    EMAIL,'
      '    SITE,'
      '    LOGO_IMG_CAMINHO,'
      '    IDCLIENTEPADRAO,'
      '    IDVENDEDORPADRAO,'
      '    FABRICA,'
      '    IDFORM_PAG_PAD,'
      '    IDPORTADOR_PADRAO,'
      '    UTILIZAR_TABELA_PRECO,'
      '    CLIENTE_EXIBIR_PJ,'
      '    HORA_BKP,'
      '    BAIXA_AUTO_CARTAO,'
      '    PARAM,'
      '    CHAVE,'
      '    HOJE,'
      '    CARENCIA_JUROS,'
      '    VALOR_MULTA_ATRASO,'
      '    JUROS_DIA_PORCENTAGEM,'
      '    PDV_DESC_MAX_VENDA,'
      '    DIAS_ATRASO_BLOQUEIO,'
      '    CONTROLAR_FALTAS,'
      '    IDTRANPS_PADRAO,'
      '    IDVEICULO_PADRAO,'
      '    ESTOQUE_GERENCIAL,'
      '    CFOP_PADRAO,'
      '    CEST_PADRAO,'
      '    CSOSN_PADRAO,'
      '    MARGEN_LUCRO_PADRAO,'
      '    CARTAO_CREDITO_AVISTA,'
      '    TARIFA_BOLETO,'
      '    PDV_UTILIZAR_GAVETA,'
      '    FILIAL_PREC_VENDA_IGUAL,'
      '    FISCAL,'
      '    MODELO_IMPRESSORA,'
      '    AUTO_PECAS,'
      '    BAIXA_DOCS_AUTO,'
      '    MODO_TAB_PRECO,'
      '    TIPO_IMPRESSAO_PEDIDO,'
      '    PEDIDO_SIMPLES,'
      '    BLOQUEAR_CLIENT_ATRASO,'
      '    TP_CERTIFICADO_NFE,'
      '    MODELO_ETIQ_PROD,'
      '    MODELO_BALANCA_GERAL,'
      '    TAMANHO_CAMPOS_BAL,'
      '    TIPO_COD_PROD_ETIQUETABAL,'
      '    DADOS_COD_ETIQUETA_BAL,'
      '    UTILIZAR_BAL_ETIQUETA,'
      '    PREFIXO_EAN,'
      '    CNPJ_OU_CPF,'
      '    PRODUTOR_RURAL,'
      '    CUPOM_CREDIARIO_SIMPLIFIC,'
      '    DIAS_PRIMEIRA_PARCELA,'
      '    QTN_SOLICITAR,'
      '    TAB_PADRAO_PDV,'
      '    TAB_PADRAO_PRE_VENDA,'
      '    BLOQUEAR_F9,'
      '    ESTOQUE_CONSUMO,'
      '    MODELO_IMP_ETIQ,'
      '    DPI_IMP_ETIQ,'
      '    PORTA_IMP_ETIQ,'
      '    TIPO_CONECT_IMP_ETQ,'
      '    SALVAR_PROD_PESQ,'
      '    PADRAO_LAYOUT,'
      '    BAIXA_AUTO_CARTAO_CD,'
      '    DIAS_BAIXA_CT,'
      '    DIAS_BAIXA_CD,'
      '    DIAS_BAIXA_DOC,'
      '    N_VENDA_ESTOQUE_ZERO,'
      '    N_VISUALIZAR_ESTOQ_ZERO'
      ')'
      'VALUES('
      '    :ID,'
      '    :IDFILIAL,'
      '    :NOME,'
      '    :RAZAO,'
      '    :CNPJ,'
      '    :IE,'
      '    :ENDERECO,'
      '    :ENDERECO_FANTASIA,'
      '    :NUMERO,'
      '    :BAIRRO,'
      '    :BAIRRO_FANTASIA,'
      '    :IDCIDADE,'
      '    :CEP,'
      '    :TELEFONE,'
      '    :TELEFONE2,'
      '    :EMAIL,'
      '    :SITE,'
      '    :LOGO_IMG_CAMINHO,'
      '    :IDCLIENTEPADRAO,'
      '    :IDVENDEDORPADRAO,'
      '    :FABRICA,'
      '    :IDFORM_PAG_PAD,'
      '    :IDPORTADOR_PADRAO,'
      '    :UTILIZAR_TABELA_PRECO,'
      '    :CLIENTE_EXIBIR_PJ,'
      '    :HORA_BKP,'
      '    :BAIXA_AUTO_CARTAO,'
      '    :PARAM,'
      '    :CHAVE,'
      '    :HOJE,'
      '    :CARENCIA_JUROS,'
      '    :VALOR_MULTA_ATRASO,'
      '    :JUROS_DIA_PORCENTAGEM,'
      '    :PDV_DESC_MAX_VENDA,'
      '    :DIAS_ATRASO_BLOQUEIO,'
      '    :CONTROLAR_FALTAS,'
      '    :IDTRANPS_PADRAO,'
      '    :IDVEICULO_PADRAO,'
      '    :ESTOQUE_GERENCIAL,'
      '    :CFOP_PADRAO,'
      '    :CEST_PADRAO,'
      '    :CSOSN_PADRAO,'
      '    :MARGEN_LUCRO_PADRAO,'
      '    :CARTAO_CREDITO_AVISTA,'
      '    :TARIFA_BOLETO,'
      '    :PDV_UTILIZAR_GAVETA,'
      '    :FILIAL_PREC_VENDA_IGUAL,'
      '    :FISCAL,'
      '    :MODELO_IMPRESSORA,'
      '    :AUTO_PECAS,'
      '    :BAIXA_DOCS_AUTO,'
      '    :MODO_TAB_PRECO,'
      '    :TIPO_IMPRESSAO_PEDIDO,'
      '    :PEDIDO_SIMPLES,'
      '    :BLOQUEAR_CLIENT_ATRASO,'
      '    :TP_CERTIFICADO_NFE,'
      '    :MODELO_ETIQ_PROD,'
      '    :MODELO_BALANCA_GERAL,'
      '    :TAMANHO_CAMPOS_BAL,'
      '    :TIPO_COD_PROD_ETIQUETABAL,'
      '    :DADOS_COD_ETIQUETA_BAL,'
      '    :UTILIZAR_BAL_ETIQUETA,'
      '    :PREFIXO_EAN,'
      '    :CNPJ_OU_CPF,'
      '    :PRODUTOR_RURAL,'
      '    :CUPOM_CREDIARIO_SIMPLIFIC,'
      '    :DIAS_PRIMEIRA_PARCELA,'
      '    :QTN_SOLICITAR,'
      '    :TAB_PADRAO_PDV,'
      '    :TAB_PADRAO_PRE_VENDA,'
      '    :BLOQUEAR_F9,'
      '    :ESTOQUE_CONSUMO,'
      '    :MODELO_IMP_ETIQ,'
      '    :DPI_IMP_ETIQ,'
      '    :PORTA_IMP_ETIQ,'
      '    :TIPO_CONECT_IMP_ETQ,'
      '    :SALVAR_PROD_PESQ,'
      '    :PADRAO_LAYOUT,'
      '    :BAIXA_AUTO_CARTAO_CD,'
      '    :DIAS_BAIXA_CT,'
      '    :DIAS_BAIXA_CD,'
      '    :DIAS_BAIXA_DOC,'
      '    :N_VENDA_ESTOQUE_ZERO,'
      '    :N_VISUALIZAR_ESTOQ_ZERO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    C.*,'
      '    CI.NOME CIDADE,'
      '    CI.UF UF,'
      '    CI.CODIGO AS CODIGO_MUNICIPIO'
      'FROM'
      '    CONFIG C, CIDADE_IBGE CI'
      'WHERE( '
      '   CI.ID = C.IDCIDADE'
      '     ) and (     C.ID = :OLD_ID'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'SELECT'
      '    C.*,'
      '    CI.NOME CIDADE,'
      '    CI.UF UF,'
      '    CI.CODIGO AS CODIGO_MUNICIPIO'
      'FROM'
      '    CONFIG C, CIDADE_IBGE CI'
      'WHERE'
      '   CI.ID = C.IDCIDADE ')
    Transaction = trans
    Database = conexao
    Left = 168
    Top = 16
    object fdsConfigID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsConfigIDFILIAL: TFIBBCDField
      FieldName = 'IDFILIAL'
      Size = 0
    end
    object fdsConfigRAZAO: TFIBStringField
      FieldName = 'RAZAO'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCNPJ: TFIBStringField
      FieldName = 'CNPJ'
      Size = 14
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigIE: TFIBStringField
      FieldName = 'IE'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigENDERECO: TFIBStringField
      FieldName = 'ENDERECO'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigBAIRRO: TFIBStringField
      FieldName = 'BAIRRO'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigIDCIDADE: TFIBBCDField
      FieldName = 'IDCIDADE'
      Size = 0
    end
    object fdsConfigCEP: TFIBStringField
      FieldName = 'CEP'
      Size = 16
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTELEFONE: TFIBStringField
      FieldName = 'TELEFONE'
      Size = 14
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigSITE: TFIBStringField
      FieldName = 'SITE'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigLOGO_IMG_CAMINHO: TFIBStringField
      FieldName = 'LOGO_IMG_CAMINHO'
      Size = 200
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNOME: TFIBStringField
      FieldName = 'NOME'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigIDCLIENTEPADRAO: TFIBBCDField
      FieldName = 'IDCLIENTEPADRAO'
      Size = 0
    end
    object fdsConfigIDVENDEDORPADRAO: TFIBBCDField
      FieldName = 'IDVENDEDORPADRAO'
      Size = 0
    end
    object fdsConfigFABRICA: TFIBStringField
      FieldName = 'FABRICA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigIDFORM_PAG_PAD: TFIBBCDField
      FieldName = 'IDFORM_PAG_PAD'
      Size = 0
    end
    object fdsConfigIDPORTADOR_PADRAO: TFIBBCDField
      FieldName = 'IDPORTADOR_PADRAO'
      Size = 0
    end
    object fdsConfigUTILIZAR_TABELA_PRECO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'UTILIZAR_TABELA_PRECO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCLIENTE_EXIBIR_PJ: TFIBStringField
      FieldName = 'CLIENTE_EXIBIR_PJ'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigHORA_BKP: TFIBTimeField
      FieldName = 'HORA_BKP'
      DisplayFormat = 'hh:mm AMPM'
    end
    object fdsConfigBAIXA_AUTO_CARTAO: TFIBStringField
      DefaultExpression = #39'S'#39
      FieldName = 'BAIXA_AUTO_CARTAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigPARAM: TFIBStringField
      FieldName = 'PARAM'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCHAVE: TFIBStringField
      FieldName = 'CHAVE'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigHOJE: TFIBStringField
      FieldName = 'HOJE'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCIDADE: TFIBStringField
      FieldName = 'CIDADE'
      Size = 250
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigUF: TFIBStringField
      FieldName = 'UF'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCARENCIA_JUROS: TFIBIntegerField
      FieldName = 'CARENCIA_JUROS'
    end
    object fdsConfigVALOR_MULTA_ATRASO: TFIBBCDField
      DefaultExpression = '0,00'
      FieldName = 'VALOR_MULTA_ATRASO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 8
    end
    object fdsConfigPDV_DESC_MAX_VENDA: TFIBBCDField
      DefaultExpression = '0,00'
      FieldName = 'PDV_DESC_MAX_VENDA'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 8
    end
    object fdsConfigDIAS_ATRASO_BLOQUEIO: TFIBIntegerField
      FieldName = 'DIAS_ATRASO_BLOQUEIO'
    end
    object fdsConfigNUMERO: TFIBSmallIntField
      FieldName = 'NUMERO'
    end
    object fdsConfigCODIGO_MUNICIPIO: TFIBBCDField
      FieldName = 'CODIGO_MUNICIPIO'
      Size = 0
    end
    object fdsConfigTELEFONE2: TFIBStringField
      FieldName = 'TELEFONE2'
      Size = 14
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigJUROS_DIA_PORCENTAGEM: TFIBBCDField
      DefaultExpression = '0,00'
      FieldName = 'JUROS_DIA_PORCENTAGEM'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 8
    end
    object fdsConfigCONTROLAR_FALTAS: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CONTROLAR_FALTAS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigIDTRANPS_PADRAO: TFIBBCDField
      FieldName = 'IDTRANPS_PADRAO'
      Size = 0
    end
    object fdsConfigIDVEICULO_PADRAO: TFIBBCDField
      FieldName = 'IDVEICULO_PADRAO'
      Size = 0
    end
    object fdsConfigENDERECO_FANTASIA: TFIBStringField
      FieldName = 'ENDERECO_FANTASIA'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigBAIRRO_FANTASIA: TFIBStringField
      FieldName = 'BAIRRO_FANTASIA'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigESTOQUE_GERENCIAL: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'ESTOQUE_GERENCIAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCEST_PADRAO: TFIBStringField
      FieldName = 'CEST_PADRAO'
      Size = 12
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCSOSN_PADRAO: TFIBStringField
      FieldName = 'CSOSN_PADRAO'
      Size = 12
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCFOP_PADRAO: TFIBStringField
      FieldName = 'CFOP_PADRAO'
      Size = 4
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigMARGEN_LUCRO_PADRAO: TFIBBCDField
      DefaultExpression = '0,00'
      FieldName = 'MARGEN_LUCRO_PADRAO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 8
    end
    object fdsConfigCARTAO_CREDITO_AVISTA: TFIBStringField
      FieldName = 'CARTAO_CREDITO_AVISTA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTARIFA_BOLETO: TFIBBCDField
      DefaultExpression = '0,00'
      FieldName = 'TARIFA_BOLETO'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 8
    end
    object fdsConfigPDV_UTILIZAR_GAVETA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'PDV_UTILIZAR_GAVETA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigFILIAL_PREC_VENDA_IGUAL: TFIBStringField
      DefaultExpression = #39'S'#39
      FieldName = 'FILIAL_PREC_VENDA_IGUAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigFISCAL: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'FISCAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigMODELO_IMPRESSORA: TFIBStringField
      FieldName = 'MODELO_IMPRESSORA'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigAUTO_PECAS: TFIBStringField
      FieldName = 'AUTO_PECAS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigBAIXA_DOCS_AUTO: TFIBStringField
      FieldName = 'BAIXA_DOCS_AUTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigMODO_TAB_PRECO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'MODO_TAB_PRECO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTIPO_IMPRESSAO_PEDIDO: TFIBIntegerField
      FieldName = 'TIPO_IMPRESSAO_PEDIDO'
    end
    object fdsConfigPEDIDO_SIMPLES: TFIBStringField
      FieldName = 'PEDIDO_SIMPLES'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigMODELO_ETIQ_PROD: TFIBStringField
      FieldName = 'MODELO_ETIQ_PROD'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTP_CERTIFICADO_NFE: TFIBStringField
      FieldName = 'TP_CERTIFICADO_NFE'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigBLOQUEAR_CLIENT_ATRASO: TFIBStringField
      FieldName = 'BLOQUEAR_CLIENT_ATRASO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigMODELO_BALANCA_GERAL: TFIBStringField
      FieldName = 'MODELO_BALANCA_GERAL'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTAMANHO_CAMPOS_BAL: TFIBStringField
      DefaultExpression = #39'C6P5'#39
      FieldName = 'TAMANHO_CAMPOS_BAL'
      Size = 4
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTIPO_COD_PROD_ETIQUETABAL: TFIBStringField
      DefaultExpression = #39'CI'#39
      FieldName = 'TIPO_COD_PROD_ETIQUETABAL'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigDADOS_COD_ETIQUETA_BAL: TFIBStringField
      DefaultExpression = #39'CP'#39
      FieldName = 'DADOS_COD_ETIQUETA_BAL'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigUTILIZAR_BAL_ETIQUETA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'UTILIZAR_BAL_ETIQUETA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigPREFIXO_EAN: TFIBIntegerField
      DefaultExpression = '2'
      FieldName = 'PREFIXO_EAN'
    end
    object fdsConfigCNPJ_OU_CPF: TFIBStringField
      DefaultExpression = #39'CNPJ'#39
      FieldName = 'CNPJ_OU_CPF'
      Size = 4
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigPRODUTOR_RURAL: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'PRODUTOR_RURAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigCUPOM_CREDIARIO_SIMPLIFIC: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CUPOM_CREDIARIO_SIMPLIFIC'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigDIAS_PRIMEIRA_PARCELA: TFIBIntegerField
      FieldName = 'DIAS_PRIMEIRA_PARCELA'
    end
    object fdsConfigQTN_SOLICITAR: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'QTN_SOLICITAR'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigTAB_PADRAO_PDV: TFIBIntegerField
      DefaultExpression = '1'
      FieldName = 'TAB_PADRAO_PDV'
    end
    object fdsConfigTAB_PADRAO_PRE_VENDA: TFIBIntegerField
      DefaultExpression = '1'
      FieldName = 'TAB_PADRAO_PRE_VENDA'
    end
    object fdsConfigBLOQUEAR_F9: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'BLOQUEAR_F9'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigN_VENDA_ESTOQUE_ZERO: TFIBStringField
      FieldName = 'N_VENDA_ESTOQUE_ZERO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigN_VISUALIZAR_ESTOQ_ZERO: TFIBStringField
      FieldName = 'N_VISUALIZAR_ESTOQ_ZERO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object fdsUsuarioPermic: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE USUARIO_PERMICOES_PDV'
      'SET '
      '    DT_INC = :DT_INC,'
      '    DT_ALT = :DT_ALT,'
      '    RECEBIMENTO = :RECEBIMENTO,'
      '    DESC_MAX_ITEM = :DESC_MAX_ITEM,'
      '    DESC_MAX_TOT_VENDA = :DESC_MAX_TOT_VENDA,'
      '    VER_MOVIMENTO = :VER_MOVIMENTO,'
      '    SANGRIA = :SANGRIA,'
      '    SUPRIMENTO = :SUPRIMENTO,'
      '    FECHAMENTO = :FECHAMENTO,'
      '    ALTERAR_PREC_UNIT = :ALTERAR_PREC_UNIT,'
      '    DEVOLUCAO = :DEVOLUCAO,'
      '    ESTOQUE_ZERADO_VENDER = :ESTOQUE_ZERADO_VENDER,'
      '    LIBERAR_CLIENTE_BLOQ = :LIBERAR_CLIENTE_BLOQ,'
      '    ABRIR_GAVETA = :ABRIR_GAVETA,'
      '    LIMITE_CREDITO = :LIMITE_CREDITO,'
      '    DESC_ACRE_RECEBER = :DESC_ACRE_RECEBER,'
      '    NAO_USAR_JUROS_RECEBER = :NAO_USAR_JUROS_RECEBER'
      'WHERE'
      '    IDUSUARIO = :OLD_IDUSUARIO'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    USUARIO_PERMICOES_PDV'
      'WHERE'
      '        IDUSUARIO = :OLD_IDUSUARIO'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIO_PERMICOES_PDV('
      '    IDUSUARIO,'
      '    IDFILIAL,'
      '    DT_INC,'
      '    DT_ALT,'
      '    RECEBIMENTO,'
      '    DESC_MAX_ITEM,'
      '    DESC_MAX_TOT_VENDA,'
      '    VER_MOVIMENTO,'
      '    SANGRIA,'
      '    SUPRIMENTO,'
      '    FECHAMENTO,'
      '    ALTERAR_PREC_UNIT,'
      '    DEVOLUCAO,'
      '    ESTOQUE_ZERADO_VENDER,'
      '    LIBERAR_CLIENTE_BLOQ,'
      '    ABRIR_GAVETA,'
      '    LIMITE_CREDITO,'
      '    DESC_ACRE_RECEBER,'
      '    NAO_USAR_JUROS_RECEBER'
      ')'
      'VALUES('
      '    :IDUSUARIO,'
      '    :IDFILIAL,'
      '    :DT_INC,'
      '    :DT_ALT,'
      '    :RECEBIMENTO,'
      '    :DESC_MAX_ITEM,'
      '    :DESC_MAX_TOT_VENDA,'
      '    :VER_MOVIMENTO,'
      '    :SANGRIA,'
      '    :SUPRIMENTO,'
      '    :FECHAMENTO,'
      '    :ALTERAR_PREC_UNIT,'
      '    :DEVOLUCAO,'
      '    :ESTOQUE_ZERADO_VENDER,'
      '    :LIBERAR_CLIENTE_BLOQ,'
      '    :ABRIR_GAVETA,'
      '    :LIMITE_CREDITO,'
      '    :DESC_ACRE_RECEBER,'
      '    :NAO_USAR_JUROS_RECEBER'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    UP.*,'
      '    U.NOME'
      'FROM'
      '    USUARIO_PERMICOES_PDV UP, USUARIO U'
      'WHERE( '
      '    UP.IDUSUARIO = :IDUSUARIO'
      'AND'
      '    UP.IDFILIAL = :IDFILIAL'
      'AND'
      '    U.ID = :IDUSUARIO'
      'AND'
      '    UP.IDFILIAL = :IDFILIAL'
      '     ) and (     UP.IDUSUARIO = :OLD_IDUSUARIO'
      '    and UP.IDFILIAL = :OLD_IDFILIAL'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    UP.*,'
      '    U.NOME'
      'FROM'
      '    USUARIO_PERMICOES_PDV UP, USUARIO U'
      'WHERE'
      '    UP.IDUSUARIO = :IDUSUARIO'
      'AND'
      '    UP.IDFILIAL = :IDFILIAL'
      'AND'
      '    U.ID = :IDUSUARIO'
      'AND'
      '    UP.IDFILIAL = :IDFILIAL')
    Transaction = trans
    Database = conexao
    Left = 88
    Top = 80
    object fdsUsuarioPermicIDUSUARIO: TFIBBCDField
      FieldName = 'IDUSUARIO'
      Size = 0
    end
    object fdsUsuarioPermicIDFILIAL: TFIBBCDField
      FieldName = 'IDFILIAL'
      Size = 0
    end
    object fdsUsuarioPermicDT_INC: TFIBDateField
      DefaultExpression = 'CURRENT_DATE'
      FieldName = 'DT_INC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fdsUsuarioPermicDT_ALT: TFIBDateField
      FieldName = 'DT_ALT'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fdsUsuarioPermicRECEBIMENTO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'RECEBIMENTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicDESC_MAX_ITEM: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'DESC_MAX_ITEM'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicDESC_MAX_TOT_VENDA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'DESC_MAX_TOT_VENDA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicVER_MOVIMENTO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'VER_MOVIMENTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicSANGRIA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'SANGRIA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicSUPRIMENTO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'SUPRIMENTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicFECHAMENTO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'FECHAMENTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicALTERAR_PREC_UNIT: TFIBStringField
      FieldName = 'ALTERAR_PREC_UNIT'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicDEVOLUCAO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'DEVOLUCAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicESTOQUE_ZERADO_VENDER: TFIBStringField
      FieldName = 'ESTOQUE_ZERADO_VENDER'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicLIBERAR_CLIENTE_BLOQ: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'LIBERAR_CLIENTE_BLOQ'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicNOME: TFIBStringField
      FieldName = 'NOME'
      Size = 250
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicABRIR_GAVETA: TFIBStringField
      FieldName = 'ABRIR_GAVETA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicLIMITE_CREDITO: TFIBStringField
      FieldName = 'LIMITE_CREDITO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicDESC_ACRE_RECEBER: TFIBStringField
      FieldName = 'DESC_ACRE_RECEBER'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsUsuarioPermicNAO_USAR_JUROS_RECEBER: TFIBStringField
      FieldName = 'NAO_USAR_JUROS_RECEBER'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object fdsConfigNFe: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CONFIG_NFE'
      'SET '
      '    IDFILIAL = :IDFILIAL,'
      '    CERT_SENHA = :CERT_SENHA,'
      '    CERT_NUM_SERIE = :CERT_NUM_SERIE,'
      '    WS_UF = :WS_UF,'
      '    WS_AMBIENTE_NF_E = :WS_AMBIENTE_NF_E,'
      '    WS_AMBIENTE_NF_CE = :WS_AMBIENTE_NF_CE,'
      '    IDCSC = :IDCSC,'
      '    CSC = :CSC,'
      '    GERA_CREDITO_ICMS = :GERA_CREDITO_ICMS,'
      '    SERIE_NFE = :SERIE_NFE,'
      '    SERIE_NFCE = :SERIE_NFCE'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CONFIG_NFE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CONFIG_NFE('
      '    ID,'
      '    IDFILIAL,'
      '    CERT_SENHA,'
      '    CERT_NUM_SERIE,'
      '    WS_UF,'
      '    WS_AMBIENTE_NF_E,'
      '    WS_AMBIENTE_NF_CE,'
      '    IDCSC,'
      '    CSC,'
      '    GERA_CREDITO_ICMS,'
      '    SERIE_NFE,'
      '    SERIE_NFCE'
      ')'
      'VALUES('
      '    :ID,'
      '    :IDFILIAL,'
      '    :CERT_SENHA,'
      '    :CERT_NUM_SERIE,'
      '    :WS_UF,'
      '    :WS_AMBIENTE_NF_E,'
      '    :WS_AMBIENTE_NF_CE,'
      '    :IDCSC,'
      '    :CSC,'
      '    :GERA_CREDITO_ICMS,'
      '    :SERIE_NFE,'
      '    :SERIE_NFCE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    CONFIG_NFE '
      ''
      ' WHERE '
      '        CONFIG_NFE.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    CONFIG_NFE ')
    Transaction = trans
    Database = conexao
    Left = 232
    Top = 16
    object fdsConfigNFeID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsConfigNFeIDFILIAL: TFIBBCDField
      FieldName = 'IDFILIAL'
      Size = 0
    end
    object fdsConfigNFeCERT_SENHA: TFIBStringField
      FieldName = 'CERT_SENHA'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeCERT_NUM_SERIE: TFIBStringField
      FieldName = 'CERT_NUM_SERIE'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeWS_UF: TFIBStringField
      FieldName = 'WS_UF'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeWS_AMBIENTE_NF_E: TFIBStringField
      DefaultExpression = #39'2'#39
      FieldName = 'WS_AMBIENTE_NF_E'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeWS_AMBIENTE_NF_CE: TFIBStringField
      DefaultExpression = #39'2'#39
      FieldName = 'WS_AMBIENTE_NF_CE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeIDCSC: TFIBStringField
      FieldName = 'IDCSC'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeCSC: TFIBStringField
      FieldName = 'CSC'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeGERA_CREDITO_ICMS: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'GERA_CREDITO_ICMS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsConfigNFeSERIE_NFE: TFIBIntegerField
      FieldName = 'SERIE_NFE'
    end
    object fdsConfigNFeSERIE_NFCE: TFIBIntegerField
      FieldName = 'SERIE_NFCE'
    end
  end
  object dsConfigNFe: TDataSource
    DataSet = fdsConfigNFe
    Left = 232
    Top = 80
  end
  object fdsCaixa: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CAIXA'
      'SET '
      '    DT_INC = :DT_INC,'
      '    NUM_CAIXA = :NUM_CAIXA,'
      '    CONTROLE = :CONTROLE,'
      '    ENVIADO_WEB = :ENVIADO_WEB,'
      '    PDV_UTILIZA_GAVETA = :PDV_UTILIZA_GAVETA,'
      '    IMP_CUPOM = :IMP_CUPOM,'
      '    MODELO_IMPRESSORA = :MODELO_IMPRESSORA,'
      '    MODELO_BALANCA = :MODELO_BALANCA,'
      '    PORTA_BALANCA = :PORTA_BALANCA,'
      '    CERT_SENHA = :CERT_SENHA,'
      '    CERT_NUM_SERIE = :CERT_NUM_SERIE,'
      '    ULTIMA_NFCE = :ULTIMA_NFCE,'
      '    SERIE_NFCE = :SERIE_NFCE,'
      '    IDCSC = :IDCSC,'
      '    CSC = :CSC,'
      '    BAUD_RATE = :BAUD_RATE,'
      '    TIME_OUT = :TIME_OUT,'
      '    PARITY_BAL = :PARITY_BAL,'
      '    STOP_BITS_BAL = :STOP_BITS_BAL,'
      '    HANDSHAKING_BAL = :HANDSHAKING_BAL,'
      '    DATA_BITS_BAL = :DATA_BITS_BAL,'
      '    TAB_PRECO = :TAB_PRECO,'
      '    GENERATION = :GENERATION,'
      '    IMP_PDF = :IMP_PDF,'
      '    PADRAO_LAYOUT = :PADRAO_LAYOUT,'
      '    NF_F9 = :NF_F9,'
      '    TIPO_RECEBIMENTO = :TIPO_RECEBIMENTO'
      'WHERE'
      '    ID = :OLD_ID'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CAIXA'
      'WHERE'
      '        ID = :OLD_ID'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CAIXA('
      '    ID,'
      '    DT_INC,'
      '    NUM_CAIXA,'
      '    CONTROLE,'
      '    ENVIADO_WEB,'
      '    IDFILIAL,'
      '    PDV_UTILIZA_GAVETA,'
      '    IMP_CUPOM,'
      '    MODELO_IMPRESSORA,'
      '    MODELO_BALANCA,'
      '    PORTA_BALANCA,'
      '    CERT_SENHA,'
      '    CERT_NUM_SERIE,'
      '    ULTIMA_NFCE,'
      '    SERIE_NFCE,'
      '    IDCSC,'
      '    CSC,'
      '    BAUD_RATE,'
      '    TIME_OUT,'
      '    PARITY_BAL,'
      '    STOP_BITS_BAL,'
      '    HANDSHAKING_BAL,'
      '    DATA_BITS_BAL,'
      '    TAB_PRECO,'
      '    GENERATION,'
      '    IMP_PDF,'
      '    PADRAO_LAYOUT,'
      '    NF_F9,'
      '    TIPO_RECEBIMENTO'
      ')'
      'VALUES('
      '    :ID,'
      '    :DT_INC,'
      '    :NUM_CAIXA,'
      '    :CONTROLE,'
      '    :ENVIADO_WEB,'
      '    :IDFILIAL,'
      '    :PDV_UTILIZA_GAVETA,'
      '    :IMP_CUPOM,'
      '    :MODELO_IMPRESSORA,'
      '    :MODELO_BALANCA,'
      '    :PORTA_BALANCA,'
      '    :CERT_SENHA,'
      '    :CERT_NUM_SERIE,'
      '    :ULTIMA_NFCE,'
      '    :SERIE_NFCE,'
      '    :IDCSC,'
      '    :CSC,'
      '    :BAUD_RATE,'
      '    :TIME_OUT,'
      '    :PARITY_BAL,'
      '    :STOP_BITS_BAL,'
      '    :HANDSHAKING_BAL,'
      '    :DATA_BITS_BAL,'
      '    :TAB_PRECO,'
      '    :GENERATION,'
      '    :IMP_PDF,'
      '    :PADRAO_LAYOUT,'
      '    :NF_F9,'
      '    :TIPO_RECEBIMENTO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    CAIXA '
      'WHERE( '
      '    NUM_CAIXA = :NUM_CAIXA'
      'AND'
      '    IDFILIAL = :IDFILIAL'
      '     ) and (     CAIXA.ID = :OLD_ID'
      '    and CAIXA.IDFILIAL = :OLD_IDFILIAL'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    CAIXA '
      'WHERE'
      '    NUM_CAIXA = :NUM_CAIXA'
      'AND'
      '    IDFILIAL = :IDFILIAL')
    AfterEdit = fdsCaixaAfterEdit
    AfterInsert = fdsCaixaAfterEdit
    Transaction = trans
    Database = conexao
    Left = 224
    Top = 136
    object fdsCaixaID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsCaixaDT_INC: TFIBDateField
      DefaultExpression = 'CURRENT_DATE'
      FieldName = 'DT_INC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object fdsCaixaNUM_CAIXA: TFIBIntegerField
      FieldName = 'NUM_CAIXA'
    end
    object fdsCaixaCONTROLE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'CONTROLE'
      Size = 0
    end
    object fdsCaixaENVIADO_WEB: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'ENVIADO_WEB'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaIDFILIAL: TFIBBCDField
      FieldName = 'IDFILIAL'
      Size = 0
    end
    object fdsCaixaIMP_CUPOM: TFIBStringField
      FieldName = 'IMP_CUPOM'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaMODELO_IMPRESSORA: TFIBStringField
      FieldName = 'MODELO_IMPRESSORA'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaMODELO_BALANCA: TFIBStringField
      FieldName = 'MODELO_BALANCA'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaPORTA_BALANCA: TFIBStringField
      FieldName = 'PORTA_BALANCA'
      Size = 5
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaCERT_SENHA: TFIBStringField
      FieldName = 'CERT_SENHA'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaCERT_NUM_SERIE: TFIBStringField
      FieldName = 'CERT_NUM_SERIE'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaIDCSC: TFIBStringField
      FieldName = 'IDCSC'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaCSC: TFIBStringField
      FieldName = 'CSC'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaPDV_UTILIZA_GAVETA: TFIBStringField
      FieldName = 'PDV_UTILIZA_GAVETA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaBAUD_RATE: TFIBIntegerField
      FieldName = 'BAUD_RATE'
    end
    object fdsCaixaTIME_OUT: TFIBIntegerField
      DefaultExpression = '2000'
      FieldName = 'TIME_OUT'
    end
    object fdsCaixaPARITY_BAL: TFIBStringField
      FieldName = 'PARITY_BAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaSTOP_BITS_BAL: TFIBStringField
      FieldName = 'STOP_BITS_BAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaHANDSHAKING_BAL: TFIBStringField
      FieldName = 'HANDSHAKING_BAL'
      Size = 13
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaDATA_BITS_BAL: TFIBIntegerField
      FieldName = 'DATA_BITS_BAL'
    end
    object fdsCaixaTAB_PRECO: TFIBIntegerField
      FieldName = 'TAB_PRECO'
    end
    object fdsCaixaULTIMA_NFCE: TFIBBCDField
      FieldName = 'ULTIMA_NFCE'
      Size = 0
    end
    object fdsCaixaSERIE_NFCE: TFIBIntegerField
      FieldName = 'SERIE_NFCE'
    end
    object fdsCaixaGENERATION: TFIBStringField
      FieldName = 'GENERATION'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaIMP_PDF: TFIBStringField
      FieldName = 'IMP_PDF'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaPADRAO_LAYOUT: TFIBStringField
      FieldName = 'PADRAO_LAYOUT'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaNF_F9: TFIBStringField
      FieldName = 'NF_F9'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsCaixaTIPO_RECEBIMENTO: TFIBStringField
      FieldName = 'TIPO_RECEBIMENTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object dsCaixa: TDataSource
    DataSet = fdsCaixa
    Left = 168
    Top = 136
  end
  object fdsGen: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE GENERATION'
      'SET '
      '    NUM_SERIE = :NUM_SERIE,'
      '    ULTIMA_NFCE = :ULTIMA_NFCE'
      'WHERE'
      '    GEN = :OLD_GEN'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    GENERATION'
      'WHERE'
      '        GEN = :OLD_GEN'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO GENERATION('
      '    GEN,'
      '    NUM_SERIE,'
      '    ULTIMA_NFCE'
      ')'
      'VALUES('
      '    :GEN,'
      '    :NUM_SERIE,'
      '    :ULTIMA_NFCE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    GEN,'
      '    NUM_SERIE,'
      '    ULTIMA_NFCE'
      'FROM'
      '    GENERATION '
      ''
      ' WHERE '
      '        GENERATION.GEN = :OLD_GEN'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    GEN,'
      '    NUM_SERIE,'
      '    ULTIMA_NFCE'
      'FROM'
      '    GENERATION'
      'WHERE'
      '    GEN=:GEN ')
    Transaction = trans
    Database = conexao
    Left = 88
    Top = 136
    object fdsGenGEN: TFIBStringField
      FieldName = 'GEN'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsGenNUM_SERIE: TFIBIntegerField
      FieldName = 'NUM_SERIE'
    end
    object fdsGenULTIMA_NFCE: TFIBBCDField
      FieldName = 'ULTIMA_NFCE'
      Size = 0
    end
  end
end