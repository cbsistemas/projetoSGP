object frmPesqNFeNFCe: TfrmPesqNFeNFCe
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Pesquisa NFe ou NFCe'
  ClientHeight = 372
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 158
    Width = 79
    Height = 13
    Caption = 'Selecione a nota'
  end
  object Label1: TLabel
    Left = 8
    Top = 63
    Width = 31
    Height = 13
    Caption = 'Chave'
  end
  object Label2: TLabel
    Left = 8
    Top = 109
    Width = 45
    Height = 13
    Caption = 'Protocolo'
  end
  object Label4: TLabel
    Left = 336
    Top = 109
    Width = 79
    Height = 13
    Caption = 'Data de Emiss'#227'o'
  end
  object Animate1: TAnimate
    Left = 213
    Top = -4
    Width = 100
    Height = 80
  end
  object rgbTipo: TRzRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 49
    Caption = 'Tipo'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'NFCe'
      'NFe')
    TabOrder = 1
    OnChanging = rgbTipoChanging
  end
  object Panel1: TPanel
    Left = 0
    Top = 331
    Width = 512
    Height = 41
    Align = alBottom
    Color = 2497553
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 236
    ExplicitWidth = 382
    object RzBitBtn1: TRzBitBtn
      Left = 348
      Top = 8
      ModalResult = 2
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = RzBitBtn1Click
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
    object RzBitBtn2: TRzBitBtn
      Left = 429
      Top = 8
      Caption = 'OK'
      TabOrder = 1
      OnClick = RzBitBtn2Click
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
  object edtchave: TEdit
    Left = 8
    Top = 82
    Width = 449
    Height = 21
    TabOrder = 3
    Text = 'NFe'
  end
  object edtProtocolo: TEdit
    Left = 8
    Top = 128
    Width = 322
    Height = 21
    TabOrder = 4
  end
  object edtData: TRzDateTimeEdit
    Left = 336
    Top = 128
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 5
  end
  object gdrNotas: TJvDBGrid
    Left = 8
    Top = 177
    Width = 496
    Height = 152
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
  end
  object fdsNFe: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE NFE'
      'SET '
      '    DT_INC = :DT_INC,'
      '    DT_EMISSAO = :DT_EMISSAO,'
      '    CODIGO_NFE = :CODIGO_NFE,'
      '    SERIE = :SERIE,'
      '    VLR_TOTAL = :VLR_TOTAL,'
      '    IDCLIENTE = :IDCLIENTE,'
      '    CHAVE_CONSULTA = :CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO = :NUMERO_PROTOCOLO,'
      '    STATUS = :STATUS,'
      '    DT_SAIDA = :DT_SAIDA'
      'WHERE'
      '    ID = :OLD_ID'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NFE'
      'WHERE'
      '        ID = :OLD_ID'
      '    and IDFILIAL = :OLD_IDFILIAL'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO NFE('
      '    ID,'
      '    DT_INC,'
      '    DT_EMISSAO,'
      '    CODIGO_NFE,'
      '    SERIE,'
      '    VLR_TOTAL,'
      '    IDCLIENTE,'
      '    CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO,'
      '    IDFILIAL,'
      '    STATUS,'
      '    DT_SAIDA'
      ')'
      'VALUES('
      '    :ID,'
      '    :DT_INC,'
      '    :DT_EMISSAO,'
      '    :CODIGO_NFE,'
      '    :SERIE,'
      '    :VLR_TOTAL,'
      '    :IDCLIENTE,'
      '    :CHAVE_CONSULTA,'
      '    :NUMERO_PROTOCOLO,'
      '    :IDFILIAL,'
      '    :STATUS,'
      '    :DT_SAIDA'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID,'
      '    DT_INC,'
      '    DT_EMISSAO,'
      '    CODIGO_NFE,'
      '    SERIE,'
      '    VLR_TOTAL,'
      '    IDCLIENTE,'
      '    CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO,'
      '    IDFILIAL,'
      '    STATUS,'
      '    DT_SAIDA'
      '    '
      'FROM'
      '    NFE '
      ''
      ' WHERE '
      '        NFE.ID = :OLD_ID'
      '    and NFE.IDFILIAL = :OLD_IDFILIAL'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID,'
      '    DT_INC,'
      '    DT_EMISSAO,'
      '    CODIGO_NFE,'
      '    SERIE,'
      '    VLR_TOTAL,'
      '    IDCLIENTE,'
      '    CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO,'
      '    IDFILIAL,'
      '    STATUS,'
      '    DT_SAIDA'
      '    '
      'FROM'
      '    NFE ')
    Transaction = DM.transPricipal
    Database = DM.Conexao
    Left = 216
    Top = 8
    object fdsNFeID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsNFeDT_INC: TFIBDateField
      FieldName = 'DT_INC'
    end
    object fdsNFeDT_EMISSAO: TFIBDateField
      FieldName = 'DT_EMISSAO'
    end
    object fdsNFeCODIGO_NFE: TFIBIntegerField
      FieldName = 'CODIGO_NFE'
    end
    object fdsNFeSERIE: TFIBIntegerField
      FieldName = 'SERIE'
    end
    object fdsNFeVLR_TOTAL: TFIBBCDField
      FieldName = 'VLR_TOTAL'
    end
    object fdsNFeIDCLIENTE: TFIBBCDField
      FieldName = 'IDCLIENTE'
      Size = 0
    end
    object fdsNFeCHAVE_CONSULTA: TFIBStringField
      FieldName = 'CHAVE_CONSULTA'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsNFeNUMERO_PROTOCOLO: TFIBStringField
      FieldName = 'NUMERO_PROTOCOLO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsNFeIDFILIAL: TFIBBCDField
      FieldName = 'IDFILIAL'
      Size = 0
    end
    object fdsNFeSTATUS: TFIBStringField
      FieldName = 'STATUS'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsNFeDT_SAIDA: TFIBDateField
      FieldName = 'DT_SAIDA'
    end
  end
  object fdsNFCe: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE VENDA'
      'SET '
      '    IDCAIXA = :IDCAIXA,'
      '    DT_INC = :DT_INC,'
      '    DATA_EMISSAO = :DATA_EMISSAO,'
      '    IDCLIENTE = :IDCLIENTE,'
      '    VLR_TOTAL = :VLR_TOTAL,'
      '    CODIGO_NFCE = :CODIGO_NFCE,'
      '    SERIE = :SERIE,'
      '    CHAVE_CONSULTA = :CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO = :NUMERO_PROTOCOLO,'
      '    IDVENDEDOR = :IDVENDEDOR,'
      '    VLR_VENDA = :VLR_VENDA,'
      '    TIPO = :TIPO'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    VENDA'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO VENDA('
      '    ID,'
      '    IDCAIXA,'
      '    DT_INC,'
      '    DATA_EMISSAO,'
      '    IDCLIENTE,'
      '    VLR_TOTAL,'
      '    CODIGO_NFCE,'
      '    SERIE,'
      '    CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO,'
      '    IDVENDEDOR,'
      '    VLR_VENDA,'
      '    TIPO'
      ')'
      'VALUES('
      '    :ID,'
      '    :IDCAIXA,'
      '    :DT_INC,'
      '    :DATA_EMISSAO,'
      '    :IDCLIENTE,'
      '    :VLR_TOTAL,'
      '    :CODIGO_NFCE,'
      '    :SERIE,'
      '    :CHAVE_CONSULTA,'
      '    :NUMERO_PROTOCOLO,'
      '    :IDVENDEDOR,'
      '    :VLR_VENDA,'
      '    :TIPO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ID,'
      '    IDCAIXA,'
      '    DT_INC,'
      '    DATA_EMISSAO,'
      '    IDCLIENTE,'
      '    VLR_TOTAL,'
      '    CODIGO_NFCE,'
      '    SERIE,'
      '    CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO,'
      '    IDVENDEDOR,'
      '    VLR_VENDA,'
      '    TIPO'
      'FROM'
      '    VENDA '
      ''
      ' WHERE '
      '        VENDA.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ID,'
      '    IDCAIXA,'
      '    DT_INC,'
      '    DATA_EMISSAO,'
      '    IDCLIENTE,'
      '    VLR_TOTAL,'
      '    CODIGO_NFCE,'
      '    SERIE,'
      '    CHAVE_CONSULTA,'
      '    NUMERO_PROTOCOLO,'
      '    IDVENDEDOR,'
      '    VLR_VENDA,'
      '    TIPO'
      'FROM'
      '    VENDA ')
    Transaction = DM.transPricipal
    Database = DM.Conexao
    Left = 288
    Top = 8
    object fdsNFCeID: TFIBBCDField
      FieldName = 'ID'
      Size = 0
    end
    object fdsNFCeIDCAIXA: TFIBBCDField
      FieldName = 'IDCAIXA'
      Size = 0
    end
    object fdsNFCeDT_INC: TFIBDateField
      FieldName = 'DT_INC'
    end
    object fdsNFCeDATA_EMISSAO: TFIBDateField
      FieldName = 'DATA_EMISSAO'
    end
    object fdsNFCeIDCLIENTE: TFIBBCDField
      FieldName = 'IDCLIENTE'
      Size = 0
    end
    object fdsNFCeVLR_TOTAL: TFIBBCDField
      FieldName = 'VLR_TOTAL'
    end
    object fdsNFCeCODIGO_NFCE: TFIBIntegerField
      FieldName = 'CODIGO_NFCE'
    end
    object fdsNFCeSERIE: TFIBIntegerField
      FieldName = 'SERIE'
    end
    object fdsNFCeCHAVE_CONSULTA: TFIBStringField
      FieldName = 'CHAVE_CONSULTA'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsNFCeNUMERO_PROTOCOLO: TFIBStringField
      FieldName = 'NUMERO_PROTOCOLO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object fdsNFCeIDVENDEDOR: TFIBBCDField
      FieldName = 'IDVENDEDOR'
      Size = 0
    end
    object fdsNFCeVLR_VENDA: TFIBBCDField
      FieldName = 'VLR_VENDA'
    end
    object fdsNFCeTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
  end
  object dsNotas: TDataSource
    Left = 368
    Top = 8
  end
end
