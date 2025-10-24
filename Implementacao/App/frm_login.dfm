object frmlogin: Tfrmlogin
  Left = 267
  Top = 219
  Width = 341
  Height = 186
  Caption = 'Login - Sistema de Controle de Medalhas'
  Color = clGray
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
  object Panel1: TPanel
    Left = 55
    Top = 6
    Width = 225
    Height = 107
    Color = clWhite
    TabOrder = 4
    object Label1: TLabel
      Left = 33
      Top = 21
      Width = 44
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 54
      Width = 37
      Height = 13
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Edituser: TEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = EdituserChange
  end
  object Editpass: TEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnChange = EdituserChange
  end
  object bbtn_ok: TBitBtn
    Left = 72
    Top = 118
    Width = 75
    Height = 25
    Enabled = False
    TabOrder = 2
    OnClick = bbtn_okClick
    Kind = bkOK
  end
  object bbtn_cancela: TBitBtn
    Left = 168
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    OnClick = bbtn_cancelaClick
    Kind = bkCancel
  end
end
