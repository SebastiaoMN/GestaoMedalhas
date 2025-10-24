object Frm_cons_agraciadosM2: TFrm_cons_agraciadosM2
  Left = 269
  Top = 191
  Width = 904
  Height = 565
  Caption = 'Consulta de Agraciados - Medalha Colar do M'#233'rito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 888
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = clGray
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 7
      Width = 722
      Height = 367
      TabOrder = 0
    end
  end
  object DBGridPesquisa: TDBGrid
    Left = 0
    Top = 57
    Width = 888
    Height = 470
    Align = alClient
    DataSource = DSConsAgraciados
    FixedColor = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGO_PROFISSAO'
        Title.Caption = 'CARGO/PROFISS'#195'O'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDENTIFICADOR_ENVIADO'
        Title.Caption = 'MEDALHA ENVIADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDENTIFICADOR_INTERNET'
        Title.Caption = 'DISP. INTERNET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bbtn_saida: TSpeedButton
      Left = 844
      Top = 20
      Width = 33
      Height = 31
      Flat = True
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D8050000C30E0000C30E00000000000000000000FFFFFFF2F2F2
        F2F2F2D3D3D3E8E8E8F5F5F5DBDBDBDDDDDDECECECEEEEEED3D3D3EBEBEBF7F7
        F723230F4F4F00B2B2A8E9E9E9D6D6D6EBEBEBFAFAFAFFFFFFFFFFFF0000FFFF
        FFF0F0F0D8D8D8EDEDEDEAEAEADFDFDFDCDCDCF4F4F4E6E6E6D7D7D7F2F2F2E7
        E7E7DDDDDD4C4C0CFFFF006868119B9B9BF4F4F4E7E7E7DBDBDBE6E6E6FFFFFF
        0000D3D3D3E4E4E4EFEFEFE4E4E4D8D8D8EDEDEDF3F3F3D3D3D3E7E7E7F1F1F1
        DFDFDFDBDBDBECECEC4D4D0DFFFF008D8D00515105878781DFDFDFEDEDEDECEC
        ECD3D3D30000E6E6E6EDEDEDE1E1E1DBDBDBF5F5F5E3E3E3DCDCDCEAEAEAEAEA
        EAE0E0E0DBDBDBF6F6F6E3E3E34D4D0DFFFF008F8F007F7F0056560DA1A1A1E2
        E2E2DBDBDBF3F3F300004B4B4B5050504E4E4E4848484F4F4F5050504A4A4A4C
        4C4C444444F0F0F0F3F3F3D3D3D3E7E7E74E4E0EFFFF008F8F007F7F007D7D00
        4C4C0D3232324848484E4E4E0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF4A4A4ADFDFDFDFDFDFE9E9E9EBEBEB4D4D0DFFFF008F8F007F7F
        007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFB0B0B0BFBFBF4040403F3F3F3737373737373F3F3F434303FFFF008F
        8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBF3D3D3D8F8F8F3E3E3E7F7F7F7F7F7F7F7F7F7F7F7F474707
        FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF3C3C304D4D141515137F7F7F7F7F7F7F7F7F7F7F
        7F474707FFFF008D8D007777007D7D00474700636363BFBFBFBFBFBF0000BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4646309A9A004545046161617F7F7F7F
        7F7F7F7F7F474707FFFF005F5F08171717676700474700636363BFBFBFBFBFBF
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF474727EDED0092920045450E
        6363637F7F7F7F7F7F474707FFFF004747276B6B6B676700474700636363BFBF
        BFBFBFBF0000AEAEAE57574531310A272700272700272700424200FFFF00F9F9
        009898004242006363637F7F7F474707FFFF007E7E002727006E6E0047470063
        6363BFBFBFBFBFBF00008989898C8C13CFCF01CFCF00CFCF00CFCF00D5D500FF
        FF00FFFF00EDED0098980045450E616161474707FFFF008F8F007F7F007F7F00
        474700636363BFBFBFBFBFBF0000898989A1A113FEFE2CFFFFAFFFFFAFFFFFAF
        FFFFAFFFFFAFFFFFDBFFFF6DE3E3004B4B095B5B5B474707FFFF008F8F007F7F
        007F7F00474700636363BFBFBFBFBFBF0000A7A7A76F6F4879790C7A7A0A7A7A
        0A7A7A0A8A8A09FFFF3EFFFF70E4E4005F5F005858587F7F7F474707FFFF008F
        8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFB1B1B1A9A9A9A9
        A9A9A9A9A9A9A9A94C4C2CFFFF0DE6E6075959085858537F7F7F7F7F7F474707
        FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF505030E3E3005F5F035757577F7F7F7F7F7F7F7F
        7F474707FFFF008F8F007F7F007F7F00474700636363BFBFBFBFBFBF0000BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4242356E6E2521211B7F7F7F7F7F7F7F
        7F7F7F7F7F5E5E52999906D5D5008787007F7F00474700636363BFBFBFBFBFBF
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7070708888884444447F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F565656999906DBDB00898900474700636363BFBF
        BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF4444
        447F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E5E529B9B03D7D7004C4C0076
        7676BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBF4141415656565656565656565656565656565656565656562E2E2E888807
        65650C888888BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBF9696968989898989898989898989898989898989898989898989
        89898989898989B1B1B1BFBFBFBFBFBF0000}
      OnClick = bbtn_saidaClick
    end
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Agraciado'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object EdNome: TEdit
      Left = 8
      Top = 30
      Width = 417
      Height = 21
      TabOrder = 1
      OnChange = EdNomeChange
    end
    object DbAno: TDBLookupComboBox
      Left = 562
      Top = 30
      Width = 65
      Height = 21
      Cursor = crHandPoint
      DataField = 'ANO'
      DropDownAlign = daCenter
      Enabled = False
      KeyField = 'ANO'
      ListField = 'ANO'
      ListSource = DMSCM.DSAnoAgraciadosM2
      TabOrder = 0
      OnClick = DbAnoClick
    end
    object ckPesquisaAno: TCheckBox
      Left = 448
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Pesquisa pelo ano'
      TabOrder = 2
      OnClick = ckPesquisaAnoClick
    end
  end
  object DSConsAgraciados: TDataSource
    DataSet = QConsAgraciadosM2
    Left = 664
    Top = 16
  end
  object QConsAgraciadosM2: TQuery
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT a.codigo, a.nome, a.ano,   '
      'cp.descricao cargo_profissao, '
      'Decode(Nvl(SEXO,0),'#39'M'#39','#39'Masculino'#39','#39'F'#39','#39'Feminino'#39') Sexo,'
      
        'Decode(Nvl(identificador_enviado,0),1,'#39'Sim'#39',0,'#39'N'#227'o'#39') Identificad' +
        'or_enviado,'
      
        'Decode(Nvl(identificador_internet,0),1,'#39'Sim'#39',0,'#39'N'#227'o'#39') Identifica' +
        'dor_internet'
      'FROM agraciados a'
      'left join cargo_profissao cp ON a.capr_codigo = cp.codigo'
      'WHERE tipo_medalha = 2'
      'AND a.data_exclusao IS NULL'
      'AND (UPPER(a.nome) LIKE UPPER(:p_nome || '#39'%'#39')'
      'OR :p_nome IS NULL)'
      'AND (a.ano = :p_ano OR :p_ano = 0)'
      'order by a.nome')
    Left = 702
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'p_nome'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'p_nome'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'p_ano'
        ParamType = ptInput
      end>
    object QConsAgraciadosM2NOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object QConsAgraciadosM2ANO: TFloatField
      FieldName = 'ANO'
    end
    object QConsAgraciadosM2CARGO_PROFISSAO: TStringField
      FieldName = 'CARGO_PROFISSAO'
    end
    object QConsAgraciadosM2IDENTIFICADOR_ENVIADO: TStringField
      FieldName = 'IDENTIFICADOR_ENVIADO'
      Size = 3
    end
    object QConsAgraciadosM2IDENTIFICADOR_INTERNET: TStringField
      FieldName = 'IDENTIFICADOR_INTERNET'
      Size = 3
    end
    object QConsAgraciadosM2CODIGO: TFloatField
      FieldName = 'CODIGO'
      Origin = 'SCM.AGRACIADOS.CODIGO'
    end
    object QConsAgraciadosM2SEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
  end
end
