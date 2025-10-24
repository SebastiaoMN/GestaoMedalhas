object DMSCM: TDMSCM
  OldCreateOrder = False
  Left = 349
  Top = 195
  Height = 478
  Width = 791
  object DSAgraciadosM1: TDataSource
    DataSet = QAgraciadosM1
    Left = 157
    Top = 24
  end
  object QAgraciadosM1: TQuery
    CachedUpdates = True
    AfterPost = QAgraciadosM1AfterPost
    AfterDelete = QAgraciadosM1AfterPost
    AutoRefresh = True
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT CODIGO, '
      '       NOME, '
      '       ANO, '
      '       CPF,'
      '       COMR_CODIGO, '
      '       CAPR_CODIGO,'
      '       IDENTIFICADOR_ENVIADO,'
      '       IDENTIFICADOR_INTERNET,'
      '       IDENTIFICADOR_IN_MEMORIAN,'
      '       IDENTIFICADOR_HOMONIMO,'
      '       SEXO'
      'FROM AGRACIADOS'
      'WHERE DATA_EXCLUSAO IS NULL'
      'AND TIPO_MEDALHA = 1'
      'ORDER BY  ANO,NOME'
      '')
    UpdateObject = UAgraciadosM1
    Left = 157
    Top = 88
    object QAgraciadosM1CODIGO: TFloatField
      FieldName = 'CODIGO'
      Origin = 'SCM.AGRACIADOS.CODIGO'
    end
    object QAgraciadosM1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'SCM.AGRACIADOS.NOME'
      Size = 80
    end
    object QAgraciadosM1ANO: TFloatField
      FieldName = 'ANO'
      Origin = 'SCM.AGRACIADOS.ANO'
    end
    object QAgraciadosM1COMR_CODIGO: TFloatField
      FieldName = 'COMR_CODIGO'
      Origin = 'SCM.AGRACIADOS.COMR_CODIGO'
    end
    object QAgraciadosM1CAPR_CODIGO: TFloatField
      FieldName = 'CAPR_CODIGO'
      Origin = 'SCM.AGRACIADOS.CAPR_CODIGO'
    end
    object QAgraciadosM1IDENTIFICADOR_ENVIADO: TFloatField
      FieldName = 'IDENTIFICADOR_ENVIADO'
      Origin = 'SCM.AGRACIADOS.IDENTIFICADOR_ENVIADO'
    end
    object QAgraciadosM1IDENTIFICADOR_INTERNET: TFloatField
      FieldName = 'IDENTIFICADOR_INTERNET'
      Origin = 'SCM.AGRACIADOS.IDENTIFICADOR_INTERNET'
    end
    object QAgraciadosM1IDENTIFICADOR_IN_MEMORIAN: TFloatField
      FieldName = 'IDENTIFICADOR_IN_MEMORIAN'
      Origin = 'SCM.AGRACIADOS.IDENTIFICADOR_IN_MEMORIAN'
    end
    object QAgraciadosM1IDENTIFICADOR_HOMONIMO: TFloatField
      FieldName = 'IDENTIFICADOR_HOMONIMO'
      Origin = 'SCM.AGRACIADOS.IDENTIFICADOR_HOMONIMO'
    end
    object QAgraciadosM1CPF: TFloatField
      FieldName = 'CPF'
      Origin = 'SCM.AGRACIADOS.CPF'
      DisplayFormat = '00000000000'
    end
    object QAgraciadosM1SEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SCM.AGRACIADOS.SEXO'
      Size = 1
    end
  end
  object UAgraciadosM1: TUpdateSQL
    ModifySQL.Strings = (
      'update DBATJ.AGRACIADOS'
      'set'
      'codigo = :codigo,'
      'nome = :nome, '
      'ano = :ano, '
      'cpf = :cpf,'
      'sexo = :sexo,'
      'comr_codigo = :comr_codigo, '
      'capr_codigo = :capr_codigo, '
      'identificador_enviado = :identificador_enviado, '
      'identificador_internet = :identificador_internet, '
      'tipo_medalha = 1, '
      'identificador_in_memorian = :identificador_in_memorian, '
      'identificador_homonimo = :identificador_homonimo, '
      'usur_username = null, '
      'data_exclusao = null'
      'where'
      '  codigo = :OLD_codigo')
    InsertSQL.Strings = (
      'insert into DBATJ.AGRACIADOS'
      
        '(codigo,nome, ano, cpf, sexo, comr_codigo, capr_codigo, identifi' +
        'cador_enviado, identificador_internet,'
      
        ' tipo_medalha, identificador_in_memorian, identificador_homonimo' +
        ', usur_username, data_exclusao)'
      'values'
      
        '(:codigo,:nome, :ano, :cpf, :sexo, :comr_codigo, :capr_codigo, :' +
        'identificador_enviado, '
      ':identificador_internet, 1, :identificador_in_memorian,'
      ':identificador_homonimo, null, null)')
    DeleteSQL.Strings = (
      'update DBATJ.AGRACIADOS'
      'set usur_username = user, '
      'data_exclusao = sysdate'
      'where'
      '  codigo = :OLD_codigo'
      ''
      '')
    Left = 157
    Top = 168
  end
  object DBSCM: TDatabase
    AliasName = 'medalha'
    DatabaseName = 'SCM'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=t0081349')
    SessionName = 'Default'
    Left = 344
    Top = 378
  end
  object QConsComarca: TQuery
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT CPF, ANO, COMR_CODIGO, NOME, IDENTIFICADOR_ENVIADO'
      'FROM DBATJ.AGRACIADOS Dbatj_agraciados'
      'where comr_codigo = :P_comarca and'
      'ano = :p_ano'
      ' '
      ' ')
    Left = 680
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_comarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'p_ano'
        ParamType = ptUnknown
      end>
  end
  object UpdateCargoComarca: TUpdateSQL
    ModifySQL.Strings = (
      'update cargo_profissao'
      'set'
      '  codigo = :codigo,'
      '  descricao = :descricao'
      'where'
      '  codigo = :old_codigo')
    InsertSQL.Strings = (
      'insert into cargo_profissao'
      '  (codigo, descricao)'
      'values'
      '  (:codigo, :descricao)')
    DeleteSQL.Strings = (
      'delete from cargo_profissao'
      'where'
      ' CODIGO = :OLD_CODIGO')
    Left = 40
    Top = 168
  end
  object DSComarca: TDataSource
    DataSet = QComarca
    Left = 351
    Top = 24
  end
  object QComarca: TQuery
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT M.CODIGO, M.NOME'
      'FROM MUNICIPIO M'
      'JOIN COMARCA C ON C.CODIGO = M.CODIGO'
      'AND M.UF_SIGLA = '#39'MG'#39
      'AND C.DATA_EXCLUSAO IS NULL'
      '--AND c.codigo <> 24'
      'ORDER BY NOME'
      ''
      ' '
      ' ')
    Left = 351
    Top = 88
    object QComarcaCODIGO: TFloatField
      FieldName = 'CODIGO'
      Origin = 'SCM.MUNICIPIO.CODIGO'
    end
    object QComarcaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'SCM.MUNICIPIO.NOME'
      Size = 60
    end
  end
  object DSCons_agraciados: TDataSource
    Left = 536
    Top = 277
  end
  object Q_AnoAgraciadosM1: TQuery
    CachedUpdates = True
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT distinct ANO'
      'FROM DBATJ.AGRACIADOS'
      'where tipo_medalha = 1'
      'and data_exclusao is null'
      'order by ano desc')
    Left = 583
    Top = 88
    object Q_AnoAgraciadosM1ANO: TFloatField
      FieldName = 'ANO'
      Origin = 'SCM.AGRACIADOS.ANO'
    end
  end
  object DSAnoAgraciadosM1: TDataSource
    DataSet = Q_AnoAgraciadosM1
    Left = 583
    Top = 24
  end
  object DS_usuario_autorizado: TDataSource
    DataSet = Q_sys
    Left = 80
    Top = 277
  end
  object Q_sys: TQuery
    AutoCalcFields = False
    DatabaseName = 'SCM'
    SQL.Strings = (
      'select trunc(sysdate) data, '
      'user,'
      'U.nome'
      'from v_cs_usur01 U,'
      'dual'
      'where user = U.username'
      ' '
      ' ')
    Left = 437
    Top = 277
    object Q_sysDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object Q_sysUSER: TStringField
      FieldName = 'USER'
      Size = 30
    end
    object Q_sysNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object spsenha: TStoredProc
    DatabaseName = 'SCM'
    StoredProcName = 'DBATJ.FN_CS_SENHA_APLICACAO'
    Left = 208
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_SENHA_AP'
        ParamType = ptInput
      end>
  end
  object Q_AnoAgraciadosM2: TQuery
    CachedUpdates = True
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT distinct ANO'
      'FROM DBATJ.AGRACIADOS'
      'where tipo_medalha = 2'
      'and data_exclusao is null'
      'order by ano desc')
    Left = 462
    Top = 88
    object Q_AnoAgraciadosM2Ano: TFloatField
      FieldName = 'ANO'
      Origin = 'SCM.AGRACIADOS.ANO'
    end
  end
  object DSAnoAgraciadosM2: TDataSource
    DataSet = Q_AnoAgraciadosM2
    Left = 462
    Top = 24
  end
  object DSCargoProfissao: TDataSource
    DataSet = QCargoProfissao
    Left = 40
    Top = 24
  end
  object QCargoProfissao: TQuery
    CachedUpdates = True
    AfterPost = QCargoProfissaoAfterPost
    AfterDelete = QCargoProfissaoAfterPost
    AutoRefresh = True
    DatabaseName = 'SCM'
    SQL.Strings = (
      'select codigo, descricao'
      'from cargo_profissao'
      'order by descricao')
    UpdateObject = UpdateCargoComarca
    Left = 40
    Top = 88
    object QCargoProfissaoCODIGO: TFloatField
      FieldName = 'CODIGO'
      Origin = 'SCM.CARGO_PROFISSAO.CODIGO'
    end
    object QCargoProfissaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TST2.CARGO_PROFISSAO.DESCRICAO'
      Size = 40
    end
  end
  object DSAgraciadosM2: TDataSource
    DataSet = QAgraciadosM2
    Left = 261
    Top = 24
  end
  object QAgraciadosM2: TQuery
    CachedUpdates = True
    AfterPost = QAgraciadosM2AfterPost
    AfterDelete = QAgraciadosM2AfterPost
    DatabaseName = 'SCM'
    SQL.Strings = (
      'SELECT CODIGO, '
      '       NOME, '
      '       ANO, '
      '       CAPR_CODIGO,'
      '       IDENTIFICADOR_ENVIADO,'
      '       IDENTIFICADOR_INTERNET,'
      '       SEXO'
      'FROM AGRACIADOS'
      'WHERE DATA_EXCLUSAO IS NULL'
      'AND TIPO_MEDALHA = 2'
      'ORDER BY  ANO,NOME'
      '')
    UpdateObject = UAgraciadosM2
    Left = 261
    Top = 88
    object QAgraciadosM2CODIGO: TFloatField
      FieldName = 'CODIGO'
      Origin = 'TST2.AGRACIADOS.CODIGO'
    end
    object QAgraciadosM2NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TST2.AGRACIADOS.NOME'
      Size = 80
    end
    object QAgraciadosM2ANO: TFloatField
      FieldName = 'ANO'
      Origin = 'TST2.AGRACIADOS.ANO'
    end
    object QAgraciadosM2CAPR_CODIGO: TFloatField
      FieldName = 'CAPR_CODIGO'
      Origin = 'TST2.AGRACIADOS.CAPR_CODIGO'
    end
    object QAgraciadosM2IDENTIFICADOR_ENVIADO: TFloatField
      FieldName = 'IDENTIFICADOR_ENVIADO'
      Origin = 'TST2.AGRACIADOS.IDENTIFICADOR_ENVIADO'
    end
    object QAgraciadosM2IDENTIFICADOR_INTERNET: TFloatField
      FieldName = 'IDENTIFICADOR_INTERNET'
      Origin = 'TST2.AGRACIADOS.IDENTIFICADOR_INTERNET'
    end
    object QAgraciadosM2SEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SCM.AGRACIADOS.SEXO'
      Size = 1
    end
  end
  object UAgraciadosM2: TUpdateSQL
    ModifySQL.Strings = (
      'update DBATJ.AGRACIADOS'
      'set'
      'codigo = :codigo,'
      'nome = :nome, '
      'ano = :ano, '
      'sexo = :sexo,'
      'cpf = null,'
      'comr_codigo = 24, '
      'capr_codigo = :capr_codigo, '
      'identificador_enviado = :identificador_enviado, '
      'identificador_internet = :identificador_internet, '
      'tipo_medalha = 2, '
      'identificador_in_memorian =  0, '
      'identificador_homonimo = 0, '
      'usur_username = null, '
      'data_exclusao = null'
      'where'
      '  codigo = :OLD_codigo')
    InsertSQL.Strings = (
      'insert into DBATJ.AGRACIADOS'
      
        '(codigo,nome, ano, cpf, sexo, comr_codigo, capr_codigo, identifi' +
        'cador_enviado, identificador_internet, tipo_medalha, identificad' +
        'or_in_memorian, identificador_homonimo, usur_username, data_excl' +
        'usao)'
      'values'
      
        '(:codigo,:nome, :ano, null, :sexo, 24, :capr_codigo, :identifica' +
        'dor_enviado, '
      ':identificador_internet, 2, 0, 0, null, null)')
    DeleteSQL.Strings = (
      'update DBATJ.AGRACIADOS'
      'set usur_username = user, '
      'data_exclusao = sysdate'
      'where'
      '  codigo = :OLD_codigo'
      ''
      '')
    Left = 261
    Top = 168
  end
  object DSTipoSexo: TDataSource
    DataSet = QTipoSexo
    Left = 680
    Top = 24
  end
  object QTipoSexo: TQuery
    DatabaseName = 'SCM'
    SQL.Strings = (
      'select rv_low_value TIPO,'
      '       substr(rv_meaning,1,10) DESCRICAO'
      'from cg_ref_codes'
      'where rv_domain = '#39'SEXO'#39
      'order by rv_meaning')
    Left = 680
    Top = 88
    object QTipoSexoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 240
    end
    object QTipoSexoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 1
    end
  end
end
