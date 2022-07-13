object FPrinc: TFPrinc
  Left = 480
  Top = 140
  ActiveControl = BCalcular
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Calculadora de Biorritmo v1.0                                   ' +
    '     Autor: Ing. Francisco S'#225'ez.                                ' +
    '  Dic 2.010'
  ClientHeight = 530
  ClientWidth = 751
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 102
    Height = 13
    Caption = 'Fecha de nacimiento:'
  end
  object LOFecha: TLabel
    Left = 128
    Top = 13
    Width = 56
    Height = 13
    Caption = 'Otra fecha:'
    Enabled = False
  end
  object LFecha: TLabel
    Left = 349
    Top = 150
    Width = 85
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object JvBevel1: TJvBevel
    Left = 8
    Top = 164
    Width = 734
    Height = 354
    Shape = bsFrame
    Inner = bvRaised
  end
  object LFIni: TLabel
    Left = 9
    Top = 152
    Width = 60
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LFFin: TLabel
    Left = 681
    Top = 152
    Width = 60
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PB1: TPaintBox
    Left = 12
    Top = 168
    Width = 725
    Height = 344
    Color = clWhite
    ParentColor = False
    OnPaint = PB1Paint
  end
  object DTPFNac: TDateTimePicker
    Left = 16
    Top = 32
    Width = 102
    Height = 24
    Date = 40537.621440601860000000
    Format = 'dd/MM/yyyy'
    Time = 40537.621440601860000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object CBHoy: TCheckBox
    Left = 16
    Top = 71
    Width = 106
    Height = 17
    Caption = 'Hoy'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CBHoyClick
  end
  object DTPOFecha: TDateTimePicker
    Left = 128
    Top = 32
    Width = 102
    Height = 24
    Date = 40537.621440601860000000
    Format = 'dd/MM/yyyy'
    Time = 40537.621440601860000000
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BCalcular: TButton
    Left = 128
    Top = 73
    Width = 102
    Height = 38
    Caption = 'Calcular!'
    TabOrder = 3
    OnClick = BCalcularClick
  end
  object GroupBox1: TGroupBox
    Left = 248
    Top = 13
    Width = 266
    Height = 120
    Caption = ' Datos generales '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object LCantDias: TLabel
      Left = 16
      Top = 32
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LEdad: TLabel
      Left = 16
      Top = 48
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 520
    Top = 13
    Width = 217
    Height = 120
    Caption = ' Leyenda de ciclos '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Label2: TLabel
      Left = 21
      Top = 30
      Width = 34
      Height = 13
      Caption = 'F'#237'sico:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 21
      Top = 48
      Width = 60
      Height = 13
      Caption = 'Emocional:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 21
      Top = 66
      Width = 65
      Height = 13
      Caption = 'Intelectual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 21
      Top = 84
      Width = 63
      Height = 13
      Caption = 'Intuicional:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCFis: TLabel
      Left = 101
      Top = 30
      Width = 29
      Height = 13
      Caption = '+0%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCEmo: TLabel
      Left = 101
      Top = 48
      Width = 29
      Height = 13
      Caption = '+0%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCInt: TLabel
      Left = 101
      Top = 66
      Width = 29
      Height = 13
      Caption = '+0%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCInc: TLabel
      Left = 101
      Top = 84
      Width = 29
      Height = 13
      Caption = '+0%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 94
    Width = 97
    Height = 17
    Caption = 'Animaci'#243'n'
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 152
    Top = 120
  end
  object JvEnterAsTab1: TJvEnterAsTab
    AllowDefault = False
    Left = 88
    Top = 120
  end
end
