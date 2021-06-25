object BaterPonto: TBaterPonto
  Left = 201
  Top = 145
  Width = 181
  Height = 164
  BorderIcons = [biSystemMenu]
  Caption = 'Bater Ponto'
  Color = 15921906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 16
    Caption = 'CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 49
    Height = 16
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtSenha: TEdit
    Left = 64
    Top = 48
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = EdtSenhaKeyPress
  end
  object EdtCPF: TMaskEdit
    Left = 64
    Top = 8
    Width = 105
    Height = 21
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 0
    Text = '   .   .   -  '
    OnKeyPress = EdtCPFKeyPress
  end
  object Panel1: TPanel
    Left = 1
    Top = 78
    Width = 172
    Height = 51
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 15921906
    TabOrder = 2
    object BtnOk: TBitBtn
      Left = 6
      Top = 10
      Width = 74
      Height = 25
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancelar: TBitBtn
      Left = 86
      Top = 10
      Width = 74
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
end
