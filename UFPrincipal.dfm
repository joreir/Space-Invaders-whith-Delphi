object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmPrincipal'
  ClientHeight = 425
  ClientWidth = 1328
  Color = clBackground
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClick = FormClick
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 29
  object Label1: TLabel
    Left = 1088
    Top = 5
    Width = 169
    Height = 29
    Caption = 'Enemigos : 10'
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 118
    Height = 36
    Caption = 'Score: 0 '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 72
    Top = 56
    Width = 1
    Height = 9
  end
  object Shape2: TShape
    Left = 472
    Top = 56
    Width = 1
    Height = 9
  end
  object Label3: TLabel
    Left = 585
    Top = 240
    Width = 28
    Height = 116
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 639
    Top = 359
    Width = 14
    Height = 58
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 16
    Top = 291
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\Reynaldo Roca\Documents\Programacion 1\Proyecto Final\P' +
      'royecto-final\Win32\Debug\Disparo.mp3'
    Visible = False
    TabOrder = 0
  end
  object MediaPlayer2: TMediaPlayer
    Left = 360
    Top = 291
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\Reynaldo Roca\Documents\Programacion 1\Proyecto Final\P' +
      'royecto-final\Win32\Debug\Explosion.mp3'
    Visible = False
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 512
    Top = 216
  end
end
