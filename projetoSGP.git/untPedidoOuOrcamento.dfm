object frmPedidoOuOrcamento: TfrmPedidoOuOrcamento
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Aten'#231#227'o'
  ClientHeight = 84
  ClientWidth = 344
  Color = 2497553
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 8
    Top = 8
    Width = 328
    Height = 45
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 38
      Top = 14
      Width = 255
      Height = 16
      Align = alCustom
      Alignment = taCenter
      Caption = 'Deseja Incluir um Pedido ou um Or'#231'amento?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      BorderColor = clHighlightText
    end
  end
  object btnPedido: TJvBitBtn
    Left = 88
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Pedido'
    TabOrder = 1
    OnClick = btnPedidoClick
  end
  object btnorcamento: TJvBitBtn
    Left = 169
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Or'#231'amento'
    TabOrder = 2
    OnClick = btnorcamentoClick
  end
end