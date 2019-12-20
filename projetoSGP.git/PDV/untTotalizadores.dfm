object frmTotalizadores: TfrmTotalizadores
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmTotalizadores'
  ClientHeight = 86
  ClientWidth = 505
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
  object pnlProgresso: TRzGroupBox
    Left = 0
    Top = 0
    Width = 505
    Height = 84
    Caption = ' Aguarde, Calculando Totais ... '
    Color = 8421440
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    VisualStyle = vsClassic
    object pgbProgresso: TRzProgressBar
      Left = 26
      Top = 33
      Width = 450
      BorderWidth = 0
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 50
      ShowPercent = False
      TotalParts = 0
    end
  end
  object qryComando: TpFIBQuery
    Transaction = DM.trans
    Database = DM.conexao
    Left = 344
    Top = 24
  end
  object Tt: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TtTimer
    Left = 448
    Top = 8
  end
end
