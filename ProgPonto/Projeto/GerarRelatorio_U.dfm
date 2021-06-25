object GerarRelatorio: TGerarRelatorio
  Left = 230
  Top = 114
  Width = 543
  Height = 455
  BorderIcons = [biSystemMenu]
  Caption = 'Gerar Relat'#243'rio'
  Color = 15921906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 394
    Width = 86
    Height = 16
    Caption = 'Funcion'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 1
    Top = -1
    Width = 533
    Height = 385
    Color = 15921906
    TabOrder = 0
    object Bevel2: TBevel
      Left = -6
      Top = 112
      Width = 529
      Height = 265
    end
    object Bevel3: TBevel
      Left = 4
      Top = 312
      Width = 513
      Height = 50
    end
    object Bevel6: TBevel
      Left = 1
      Top = 64
      Width = 529
      Height = 49
    end
    object Bevel1: TBevel
      Left = 1
      Top = 8
      Width = 529
      Height = 49
    end
    object Label5: TLabel
      Left = 8
      Top = 82
      Width = 83
      Height = 16
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 230
      Top = 82
      Width = 76
      Height = 16
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 26
      Width = 267
      Height = 16
      Caption = 'Escolha o CPF para Gerar o Relat'#243'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 153
      Top = 330
      Width = 84
      Height = 16
      Caption = 'Horas Trab:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 339
      Top = 330
      Width = 94
      Height = 16
      Caption = 'Horas Extras:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 330
      Width = 74
      Height = 16
      Caption = 'Dias Trab:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateTimePickerInicio: TDateTimePicker
      Left = 96
      Top = 80
      Width = 113
      Height = 21
      Date = 39539.550821574100000000
      Time = 39539.550821574100000000
      TabOrder = 1
    end
    object DateTimePickerFim: TDateTimePicker
      Left = 312
      Top = 80
      Width = 113
      Height = 21
      Date = 39539.550821574100000000
      Time = 39539.550821574100000000
      TabOrder = 2
      OnChange = DateTimePickerFimChange
    end
    object BtnGerar: TBitBtn
      Left = 438
      Top = 78
      Width = 84
      Height = 25
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BtnGerarClick
    end
    object Tabela: TStringGrid
      Left = 2
      Top = 112
      Width = 519
      Height = 193
      ColCount = 3
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      TabOrder = 4
      ColWidths = (
        103
        107
        102)
    end
    object EdtDias: TEdit
      Left = 92
      Top = 329
      Width = 41
      Height = 21
      TabOrder = 5
    end
    object EdtHorasTrab: TEdit
      Left = 246
      Top = 329
      Width = 67
      Height = 21
      TabOrder = 6
    end
    object EdtHorasExtras: TEdit
      Left = 440
      Top = 329
      Width = 65
      Height = 21
      TabOrder = 7
    end
    object ComboBoxCPF: TComboBox
      Left = 288
      Top = 24
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnClick = ComboBoxCPFClick
    end
  end
  object BtnSair: TBitBtn
    Left = 440
    Top = 390
    Width = 84
    Height = 25
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnSairClick
  end
  object EdtFuncionario: TEdit
    Left = 100
    Top = 392
    Width = 301
    Height = 21
    TabOrder = 1
  end
end
