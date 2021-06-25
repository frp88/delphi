object AlterarSenha: TAlterarSenha
  Left = 225
  Top = 195
  Width = 243
  Height = 208
  BorderIcons = [biSystemMenu]
  Caption = 'Alterar Senha'
  Color = 15921906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 231
    Height = 132
    Color = 15921906
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 108
      Height = 16
      Caption = 'Digite seu CPF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 42
      Width = 97
      Height = 16
      Caption = 'Senha Antiga:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 74
      Width = 90
      Height = 16
      Caption = 'Nova Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 4
      Top = 106
      Width = 99
      Height = 16
      Caption = 'Repita Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCPF: TMaskEdit
      Left = 118
      Top = 6
      Width = 105
      Height = 21
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 0
      Text = '   .   .   -  '
      OnKeyPress = EdtCPFKeyPress
    end
    object EdtAntiga: TEdit
      Left = 118
      Top = 40
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = EdtAntigaKeyPress
    end
    object EdtNova: TEdit
      Left = 118
      Top = 72
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 2
      OnKeyPress = EdtNovaKeyPress
    end
    object EdtRepete: TEdit
      Left = 118
      Top = 104
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 3
      OnKeyPress = EdtRepeteKeyPress
    end
  end
  object BtnConfirmar: TButton
    Left = 9
    Top = 142
    Width = 100
    Height = 25
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnConfirmarClick
  end
  object BtnCancelar: TButton
    Left = 124
    Top = 142
    Width = 100
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnCancelarClick
  end
end
