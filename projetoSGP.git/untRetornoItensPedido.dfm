object frmRetornoItensPedido: TfrmRetornoItensPedido
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Retorno de Itens Pedido'
  ClientHeight = 533
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    733
    533)
  PixelsPerInch = 96
  TextHeight = 13
  object RzBackground1: TRzBackground
    Left = 0
    Top = 482
    Width = 732
    Height = 52
    Active = True
    Align = alCustom
    Anchors = [akLeft, akRight, akBottom]
    FrameStyle = fsFlatBold
    GradientColorStart = 4271645
    GradientColorStop = -1
    GradientDirection = gdDiagonalDown
    ImageStyle = isCenter
    ShowGradient = True
    ShowImage = False
    ShowTexture = False
    ExplicitTop = 434
    ExplicitWidth = 722
  end
  object RzGroupBox2: TRzGroupBox
    Left = 0
    Top = 168
    Width = 731
    Height = 314
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Selecione os Itens que n'#227'o foram entregues :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object gdrItens: TRzDBGrid
      Left = 1
      Top = 14
      Width = 729
      Height = 299
      Align = alClient
      DataSource = dsItensPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = gdrItensDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Caption = 'Produto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTN'
          Title.Caption = 'Qtn'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Caption = 'Total'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTN_RETORNO'
          Title.Caption = 'Q.Retorno'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO_RETORNO'
          Title.Caption = 'Motivo Retorno'
          Width = 200
          Visible = True
        end>
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = -2
    Width = 738
    Height = 85
    Anchors = [akLeft, akTop, akRight]
    Color = clWhite
    TabOrder = 1
    object JvImage1: TJvImage
      Left = 9
      Top = 16
      Width = 64
      Height = 64
      Stretch = True
    end
    object lblTituloCliente: TRzLabel
      Left = 79
      Top = 29
      Width = 292
      Height = 18
      Caption = 'Retorno de Itens de pedido entregue'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 568
      Top = 11
      Width = 42
      Height = 18
      Caption = 'Valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object edtValor: TRzEdit
      Tag = 15
      Left = 568
      Top = 35
      Width = 159
      Height = 33
      TabStop = False
      Text = ''
      Alignment = taRightJustify
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      FocusColor = clInfoBk
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clMoneyGreen
      TabOrder = 0
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 84
    Width = 731
    Height = 78
    BorderInner = fsFlatRounded
    BorderOuter = fsFlatRounded
    Caption = ' Cabe'#231'alho do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lblCidade: TRzLabel
      Left = 246
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCodigo: TRzLabel
      Left = 7
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Prefixo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblDtInc: TRzLabel
      Left = 139
      Top = 24
      Width = 54
      Height = 13
      Caption = 'Dt Inclus'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object RzLabel1: TRzLabel
      Left = 63
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblVendedor: TRzLabel
      Left = 481
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtCliente: TRzEdit
      Tag = 15
      Left = 246
      Top = 43
      Width = 229
      Height = 21
      TabStop = False
      Text = ''
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtVendedor: TRzEdit
      Tag = 15
      Left = 481
      Top = 43
      Width = 246
      Height = 21
      TabStop = False
      Text = ''
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtPrefixo: TRzEdit
      Tag = 15
      Left = 7
      Top = 43
      Width = 50
      Height = 21
      TabStop = False
      Text = ''
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtID: TRzEdit
      Tag = 15
      Left = 63
      Top = 43
      Width = 70
      Height = 21
      TabStop = False
      Text = ''
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtDt_INC: TRzEdit
      Tag = 15
      Left = 139
      Top = 43
      Width = 101
      Height = 21
      TabStop = False
      Text = ''
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object btnCancelar: TRzBitBtn
    Left = 560
    Top = 500
    FrameColor = 7617536
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    Color = 15791348
    HotTrack = True
    TabOrder = 3
    OnClick = btnCancelarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000630B0000630B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8B46C6C6CE8
      E8E8E8E8B46C6C6CE8E8E8E2DFDFDFE8E8E8E8E8E2DFDFDFE8E8E8B49090906C
      E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8E8B4909090
      6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8E8E8B49090
      906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8E8E8B490
      909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8E8E8B4
      9090906CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8B490
      909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8B49090
      906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8B4909090
      6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8B49090906C
      E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8B4B4B4B4E8
      E8E8E8E8B4B4B4B4E8E8E8E2E2E2E2E8E8E8E8E8E2E2E2E2E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnGravar: TRzBitBtn
    Left = 641
    Top = 500
    FrameColor = 7617536
    Anchors = [akRight, akBottom]
    Caption = '&Gravar'
    Color = 15791348
    HotTrack = True
    TabOrder = 4
    OnClick = btnGravarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000630B0000630B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
      0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
      120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
      12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
      1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
      181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
      E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
      E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
      E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
      E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
      E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
      E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object cdsItensPedido: TpFIBClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftLargeint
        Name = 'IDPEDIDO'
        ParamType = ptInputOutput
      end>
    ProviderName = 'pFIBDataSetProvider1'
    Left = 280
    Top = 8
    object cdsItensPedidoIDPEDIDO: TpFIBClientBCDField
      FieldName = 'IDPEDIDO'
      Precision = 32
      Size = 0
    end
    object cdsItensPedidoITEM: TSmallintField
      FieldName = 'ITEM'
    end
    object cdsItensPedidoIDPROD_ITEM: TpFIBClientBCDField
      FieldName = 'IDPROD_ITEM'
      Precision = 32
      Size = 0
    end
    object cdsItensPedidoDT_INC: TDateField
      FieldName = 'DT_INC'
    end
    object cdsItensPedidoDT_ALT: TDateField
      FieldName = 'DT_ALT'
    end
    object cdsItensPedidoQTN: TpFIBClientBCDField
      FieldName = 'QTN'
      Precision = 32
      Size = 3
    end
    object cdsItensPedidoVLR_UNITARIO: TpFIBClientBCDField
      FieldName = 'VLR_UNITARIO'
      Precision = 32
    end
    object cdsItensPedidoVLR_DESCONTO: TpFIBClientBCDField
      FieldName = 'VLR_DESCONTO'
      Precision = 32
    end
    object cdsItensPedidoVLR_TOTAL: TpFIBClientBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 32
    end
    object cdsItensPedidoPESO: TpFIBClientBCDField
      FieldName = 'PESO'
      Precision = 32
    end
    object cdsItensPedidoQTN_RETORNO: TpFIBClientBCDField
      FieldName = 'QTN_RETORNO'
      Precision = 32
      Size = 3
    end
    object cdsItensPedidoMOTIVO_RETORNO: TStringField
      FieldName = 'MOTIVO_RETORNO'
      Size = 200
    end
    object cdsItensPedidoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 250
    end
    object cdsItensPedidoIDFILIAL: TpFIBClientBCDField
      FieldName = 'IDFILIAL'
      Precision = 32
      Size = 0
    end
    object cdsItensPedidoENVIADO_WEB: TStringField
      FieldName = 'ENVIADO_WEB'
      Size = 1
    end
    object cdsItensPedidoENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      Size = 1
    end
  end
  object dsItensPedido: TDataSource
    DataSet = cdsItensPedido
    Left = 280
    Top = 48
  end
  object qryAtualizaItenPedido: TpFIBQuery
    Transaction = DM.transPricipal
    Database = DM.Conexao
    SQL.Strings = (
      'UPDATE PEDIDO_ITEM SET '
      '    QTN_RETORNO = :QTN_RETORNO,'
      '    MOTIVO_RETORNO = :MOTIVO_RETORNO'
      'WHERE '
      '    (IDPEDIDO = :IDPEDIDO) '
      'AND'
      '   (ITEM = :ITEM)'
      'AND'
      '   (IDFILIAL = :IDFILIAL)')
    Left = 328
    Top = 8
  end
  object pFIBDataSetProvider1: TpFIBDataSetProvider
    DataSet = frmRomaneio.fdsPedidoItens
    Left = 224
    Top = 32
  end
  object fdsVendedor: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    ID,'
      '    NOME'
      'FROM'
      '    VENDEDOR'
      'WHERE'
      '    ID = :ID')
    AfterOpen = fdsVendedorAfterOpen
    Transaction = DM.transPricipal
    Database = DM.Conexao
    DefaultFormats.DateTimeDisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    DefaultFormats.DisplayFormatDate = 'dd/mm/yyyy'
    DefaultFormats.DisplayFormatTime = 'hh:mm:ss'
    Left = 400
    Top = 16
    oFetchAll = True
    object fdsVendedorID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsVendedorNOME: TFIBStringField
      FieldName = 'NOME'
      Size = 250
      Transliterate = False
      EmptyStrToNull = True
    end
  end
end
