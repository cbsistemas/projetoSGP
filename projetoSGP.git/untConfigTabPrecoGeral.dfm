object frmConfigTabPrecGeral: TfrmConfigTabPrecGeral
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o Geral de Tabela de Pre'#231'o'
  ClientHeight = 200
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 200
    Align = alClient
    BorderOuter = fsFlatRounded
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblPrec1: TRzLabel
      Left = 9
      Top = 55
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel1: TRzLabel
      Left = 9
      Top = 22
      Width = 65
      Height = 13
      Caption = 'Descri'#231#227'o 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel2: TRzLabel
      Left = 98
      Top = 22
      Width = 65
      Height = 13
      Caption = 'Descri'#231#227'o 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel3: TRzLabel
      Left = 189
      Top = 22
      Width = 65
      Height = 13
      Caption = 'Descri'#231#227'o 3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel4: TRzLabel
      Left = 280
      Top = 22
      Width = 65
      Height = 13
      Caption = 'Descri'#231#227'o 4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel7: TRzLabel
      Left = 98
      Top = 73
      Width = 76
      Height = 13
      Caption = 'Desc. Max. %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel8: TRzLabel
      Left = 189
      Top = 73
      Width = 76
      Height = 13
      Caption = 'Desc. Max. %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel9: TRzLabel
      Left = 280
      Top = 73
      Width = 76
      Height = 13
      Caption = 'Desc. Max. %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object RzLabel15: TRzLabel
      Left = 7
      Top = 73
      Width = 76
      Height = 13
      Caption = 'Desc. Max. %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 0
      BlinkIntervalOn = 0
    end
    object edtDescricao1: TRzDBEdit
      Left = 7
      Top = 41
      Width = 85
      Height = 21
      TabStop = False
      DataSource = dsTabPreco
      DataField = 'DESCRICAO1'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtDescricao2: TRzDBEdit
      Left = 98
      Top = 41
      Width = 85
      Height = 21
      TabStop = False
      DataSource = dsTabPreco
      DataField = 'DESCRICAO2'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtDescricao3: TRzDBEdit
      Left = 189
      Top = 41
      Width = 85
      Height = 21
      TabStop = False
      DataSource = dsTabPreco
      DataField = 'DESCRICAO3'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtDescricao4: TRzDBEdit
      Left = 280
      Top = 41
      Width = 85
      Height = 21
      TabStop = False
      DataSource = dsTabPreco
      DataField = 'DESCRICAO4'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object gbxGeraItens: TRzGroupBox
      Left = 9
      Top = 105
      Width = 347
      Height = 40
      Caption = ' Aguarde, atualizando pre'#231'o de todos os produto. '
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Visible = False
      VisualStyle = vsClassic
      object pgbProgresso: TRzProgressBar
        Left = 38
        Top = 17
        Width = 289
        BorderWidth = 0
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 0
        TotalParts = 0
      end
    end
    object RzDBEdit1: TRzDBEdit
      Left = 98
      Top = 92
      Width = 85
      Height = 21
      DataSource = dsTabPreco
      DataField = 'DESC_MAX_PORCENT2'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object RzDBEdit2: TRzDBEdit
      Left = 189
      Top = 92
      Width = 85
      Height = 21
      DataSource = dsTabPreco
      DataField = 'DESC_MAX_PORCENT3'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object RzDBEdit3: TRzDBEdit
      Left = 280
      Top = 92
      Width = 85
      Height = 21
      DataSource = dsTabPreco
      DataField = 'DESC_MAX_PORCENT4'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object RzDBEdit6: TRzDBEdit
      Left = 7
      Top = 92
      Width = 85
      Height = 21
      DataSource = dsTabPreco
      DataField = 'DESC_MAX_PORCENT1'
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object RzPanel2: TRzPanel
      Left = 2
      Top = 151
      Width = 377
      Height = 47
      Align = alBottom
      Color = 2497553
      TabOrder = 9
      DesignSize = (
        377
        47)
      object btnCancelar: TRzBitBtn
        Left = 213
        Top = 5
        Height = 36
        FrameColor = 7617536
        Anchors = [akRight, akBottom]
        Caption = '&Cancelar'
        Color = 15791348
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HotTrack = True
        ParentFont = False
        TabOrder = 0
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
        Left = 294
        Top = 5
        Height = 36
        FrameColor = 7617536
        Anchors = [akRight, akBottom]
        Caption = '&Gravar'
        Color = 15791348
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HotTrack = True
        ParentFont = False
        TabOrder = 1
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
    end
  end
  object fdsTabelaPreco: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TABELA_PRECO'
      'SET '
      '    DESCRICAO1 = :DESCRICAO1,'
      '    DESCRICAO2 = :DESCRICAO2,'
      '    DESCRICAO3 = :DESCRICAO3,'
      '    DESCRICAO4 = :DESCRICAO4,'
      '    DESCRICAO5 = :DESCRICAO5,'
      '    DESCRICAO6 = :DESCRICAO6,'
      '    PDV_DES1 = :PDV_DES1,'
      '    PDV_DES2 = :PDV_DES2,'
      '    PDV_DES3 = :PDV_DES3,'
      '    PDV_DES4 = :PDV_DES4,'
      '    PDV_DES5 = :PDV_DES5,'
      '    PDV_DES6 = :PDV_DES6,'
      '    PORCENTAGEM_AJUSTE2 = :PORCENTAGEM_AJUSTE2,'
      '    PORCENTAGEM_AJUSTE3 = :PORCENTAGEM_AJUSTE3,'
      '    PORCENTAGEM_AJUSTE4 = :PORCENTAGEM_AJUSTE4,'
      '    PORCENTAGEM_AJUSTE5 = :PORCENTAGEM_AJUSTE5,'
      '    PORCENTAGEM_AJUSTE6 = :PORCENTAGEM_AJUSTE6,'
      '    DESC_MAX_PORCENT1 = :DESC_MAX_PORCENT1,'
      '    DESC_MAX_PORCENT2 = :DESC_MAX_PORCENT2,'
      '    DESC_MAX_PORCENT3 = :DESC_MAX_PORCENT3,'
      '    DESC_MAX_PORCENT4 = :DESC_MAX_PORCENT4,'
      '    DESC_MAX_PORCENT5 = :DESC_MAX_PORCENT5,'
      '    DESC_MAX_PORCENT6 = :DESC_MAX_PORCENT6'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TABELA_PRECO'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TABELA_PRECO('
      '    ID,'
      '    DESCRICAO1,'
      '    DESCRICAO2,'
      '    DESCRICAO3,'
      '    DESCRICAO4,'
      '    DESCRICAO5,'
      '    DESCRICAO6,'
      '    PDV_DES1,'
      '    PDV_DES2,'
      '    PDV_DES3,'
      '    PDV_DES4,'
      '    PDV_DES5,'
      '    PDV_DES6,'
      '    PORCENTAGEM_AJUSTE2,'
      '    PORCENTAGEM_AJUSTE3,'
      '    PORCENTAGEM_AJUSTE4,'
      '    PORCENTAGEM_AJUSTE5,'
      '    PORCENTAGEM_AJUSTE6,'
      '    DESC_MAX_PORCENT1,'
      '    DESC_MAX_PORCENT2,'
      '    DESC_MAX_PORCENT3,'
      '    DESC_MAX_PORCENT4,'
      '    DESC_MAX_PORCENT5,'
      '    DESC_MAX_PORCENT6'
      ')'
      'VALUES('
      '    :ID,'
      '    :DESCRICAO1,'
      '    :DESCRICAO2,'
      '    :DESCRICAO3,'
      '    :DESCRICAO4,'
      '    :DESCRICAO5,'
      '    :DESCRICAO6,'
      '    :PDV_DES1,'
      '    :PDV_DES2,'
      '    :PDV_DES3,'
      '    :PDV_DES4,'
      '    :PDV_DES5,'
      '    :PDV_DES6,'
      '    :PORCENTAGEM_AJUSTE2,'
      '    :PORCENTAGEM_AJUSTE3,'
      '    :PORCENTAGEM_AJUSTE4,'
      '    :PORCENTAGEM_AJUSTE5,'
      '    :PORCENTAGEM_AJUSTE6,'
      '    :DESC_MAX_PORCENT1,'
      '    :DESC_MAX_PORCENT2,'
      '    :DESC_MAX_PORCENT3,'
      '    :DESC_MAX_PORCENT4,'
      '    :DESC_MAX_PORCENT5,'
      '    :DESC_MAX_PORCENT6'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    TABELA_PRECO '
      ''
      ' WHERE '
      '        TABELA_PRECO.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    TABELA_PRECO ')
    AutoUpdateOptions.GeneratorName = 'GEN_ID_TAB_PRECO'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = DM.transPricipal
    Database = DM.Conexao
    DefaultFormats.DateTimeDisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    DefaultFormats.DisplayFormatDate = 'dd/mm/yyyy'
    DefaultFormats.DisplayFormatTime = 'hh:mm:ss'
    Left = 24
    Top = 56
    oFetchAll = True
    object fdsTabelaPrecoID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsTabelaPrecoDESCRICAO1: TFIBStringField
      FieldName = 'DESCRICAO1'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoDESCRICAO2: TFIBStringField
      FieldName = 'DESCRICAO2'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoDESCRICAO3: TFIBStringField
      FieldName = 'DESCRICAO3'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoDESCRICAO4: TFIBStringField
      FieldName = 'DESCRICAO4'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoDESCRICAO5: TFIBStringField
      FieldName = 'DESCRICAO5'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoDESCRICAO6: TFIBStringField
      FieldName = 'DESCRICAO6'
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPDV_DES1: TFIBStringField
      FieldName = 'PDV_DES1'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPDV_DES2: TFIBStringField
      FieldName = 'PDV_DES2'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPDV_DES3: TFIBStringField
      FieldName = 'PDV_DES3'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPDV_DES4: TFIBStringField
      FieldName = 'PDV_DES4'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPDV_DES5: TFIBStringField
      FieldName = 'PDV_DES5'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPDV_DES6: TFIBStringField
      FieldName = 'PDV_DES6'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsTabelaPrecoPORCENTAGEM_AJUSTE2: TFIBBCDField
      FieldName = 'PORCENTAGEM_AJUSTE2'
      DisplayFormat = '#0'
      Size = 8
    end
    object fdsTabelaPrecoPORCENTAGEM_AJUSTE3: TFIBBCDField
      FieldName = 'PORCENTAGEM_AJUSTE3'
      DisplayFormat = '#0'
      Size = 8
    end
    object fdsTabelaPrecoPORCENTAGEM_AJUSTE4: TFIBBCDField
      FieldName = 'PORCENTAGEM_AJUSTE4'
      DisplayFormat = '#0'
      Size = 8
    end
    object fdsTabelaPrecoPORCENTAGEM_AJUSTE5: TFIBBCDField
      FieldName = 'PORCENTAGEM_AJUSTE5'
      DisplayFormat = '#0'
      Size = 8
    end
    object fdsTabelaPrecoPORCENTAGEM_AJUSTE6: TFIBBCDField
      FieldName = 'PORCENTAGEM_AJUSTE6'
      DisplayFormat = '#0'
      Size = 8
    end
    object fdsTabelaPrecoDESC_MAX_PORCENT1: TFIBBCDField
      FieldName = 'DESC_MAX_PORCENT1'
      Size = 8
    end
    object fdsTabelaPrecoDESC_MAX_PORCENT2: TFIBBCDField
      FieldName = 'DESC_MAX_PORCENT2'
      Size = 8
    end
    object fdsTabelaPrecoDESC_MAX_PORCENT3: TFIBBCDField
      FieldName = 'DESC_MAX_PORCENT3'
      Size = 8
    end
    object fdsTabelaPrecoDESC_MAX_PORCENT4: TFIBBCDField
      FieldName = 'DESC_MAX_PORCENT4'
      Size = 8
    end
    object fdsTabelaPrecoDESC_MAX_PORCENT5: TFIBBCDField
      FieldName = 'DESC_MAX_PORCENT5'
      Size = 8
    end
    object fdsTabelaPrecoDESC_MAX_PORCENT6: TFIBBCDField
      FieldName = 'DESC_MAX_PORCENT6'
      Size = 8
    end
  end
  object dsTabPreco: TDataSource
    DataSet = fdsTabelaPreco
    Left = 16
    Top = 104
  end
  object fdsProdutoItem: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PRODUTO_ITEM_ESTOQUE'
      'SET '
      '    PREC_VENDA = :PREC_VENDA,'
      '    ENVIADO_WEB = :ENVIADO_WEB,'
      '    PREC_TAB1 = :PREC_TAB1,'
      '    PREC_TAB2 = :PREC_TAB2,'
      '    PREC_TAB3 = :PREC_TAB3,'
      '    PREC_TAB4 = :PREC_TAB4,'
      '    PREC_TAB5 = :PREC_TAB5,'
      '    PREC_TAB6 = :PREC_TAB6'
      'WHERE'
      '    IDITEM = :OLD_IDITEM'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PRODUTO_ITEM_ESTOQUE'
      'WHERE'
      '        IDITEM = :OLD_IDITEM'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PRODUTO_ITEM_ESTOQUE('
      '    IDITEM,'
      '    IDFILIAL,'
      '    PREC_VENDA,'
      '    ENVIADO_WEB,'
      '    PREC_TAB1,'
      '    PREC_TAB2,'
      '    PREC_TAB3,'
      '    PREC_TAB4,'
      '    PREC_TAB5,'
      '    PREC_TAB6'
      ')'
      'VALUES('
      '    :IDITEM,'
      '    :IDFILIAL,'
      '    :PREC_VENDA,'
      '    :ENVIADO_WEB,'
      '    :PREC_TAB1,'
      '    :PREC_TAB2,'
      '    :PREC_TAB3,'
      '    :PREC_TAB4,'
      '    :PREC_TAB5,'
      '    :PREC_TAB6'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    IDITEM,'
      '    IDFILIAL,'
      '    PREC_VENDA,'
      '    ENVIADO_WEB,'
      '    PREC_TAB1,'
      '    PREC_TAB2,'
      '    PREC_TAB3,'
      '    PREC_TAB4,'
      '    PREC_TAB5,'
      '    PREC_TAB6'
      'FROM'
      '    PRODUTO_ITEM_ESTOQUE'
      ''
      ' WHERE '
      '        PRODUTO_ITEM_ESTOQUE.IDITEM = :OLD_IDITEM'
      '    and PRODUTO_ITEM_ESTOQUE.IDFILIAL = :OLD_IDFILIAL'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    IDITEM,'
      '    IDFILIAL,'
      '    PREC_VENDA,'
      '    ENVIADO_WEB,'
      '    PREC_TAB1,'
      '    PREC_TAB2,'
      '    PREC_TAB3,'
      '    PREC_TAB4,'
      '    PREC_TAB5,'
      '    PREC_TAB6'
      'FROM'
      '    PRODUTO_ITEM_ESTOQUE')
    Transaction = DM.transPricipal
    Database = DM.Conexao
    DefaultFormats.DateTimeDisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    DefaultFormats.DisplayFormatDate = 'dd/mm/yyyy'
    DefaultFormats.DisplayFormatTime = 'hh:mm:ss'
    Left = 72
    Top = 104
    oFetchAll = True
    object fdsProdutoItemIDITEM: TFIBBCDField
      FieldName = 'IDITEM'
      Size = 0
    end
    object fdsProdutoItemIDFILIAL: TFIBBCDField
      FieldName = 'IDFILIAL'
      Size = 0
    end
    object fdsProdutoItemPREC_VENDA: TFIBBCDField
      FieldName = 'PREC_VENDA'
      Size = 8
    end
    object fdsProdutoItemENVIADO_WEB: TFIBStringField
      FieldName = 'ENVIADO_WEB'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsProdutoItemPREC_TAB1: TFIBBCDField
      FieldName = 'PREC_TAB1'
      Size = 8
    end
    object fdsProdutoItemPREC_TAB2: TFIBBCDField
      FieldName = 'PREC_TAB2'
      Size = 8
    end
    object fdsProdutoItemPREC_TAB3: TFIBBCDField
      FieldName = 'PREC_TAB3'
      Size = 8
    end
    object fdsProdutoItemPREC_TAB4: TFIBBCDField
      FieldName = 'PREC_TAB4'
      Size = 8
    end
    object fdsProdutoItemPREC_TAB5: TFIBBCDField
      FieldName = 'PREC_TAB5'
      Size = 8
    end
    object fdsProdutoItemPREC_TAB6: TFIBBCDField
      FieldName = 'PREC_TAB6'
      Size = 8
    end
  end
end
