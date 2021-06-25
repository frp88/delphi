object frmPortuguesIngles: TfrmPortuguesIngles
  Left = 246
  Top = 187
  Width = 420
  Height = 338
  BorderIcons = [biSystemMenu]
  Caption = 'Tradutor - Traduzir de Portugu'#234's para Ingl'#234's'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 317
    Height = 19
    Caption = 'Digite uma frase ou palavra em portugu'#234's'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 136
    Width = 150
    Height = 19
    Caption = 'Tradu'#231#227'o em Ingl'#234's'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 32
    Width = 377
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = Memo1KeyPress
  end
  object btnTraduzir: TButton
    Left = 16
    Top = 264
    Width = 177
    Height = 25
    Caption = 'Traduzir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnTraduzirClick
  end
  object btnSair: TButton
    Left = 216
    Top = 264
    Width = 177
    Height = 25
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnSairClick
  end
  object Memo2: TMemo
    Left = 16
    Top = 160
    Width = 377
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
