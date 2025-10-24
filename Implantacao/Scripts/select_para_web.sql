select substr(agraciados.nome,1,25) as nome
, substr(municipio.nome,1,30) as comarca
, agraciados.ano
from agraciados
, comarca
, municipio
where agraciados.comr_codigo = comarca.codigo
and comarca.codigo = municipio.comr_codigo
and municipio.uf_sigla = 'MG'
and municipio.codigo = municipio.comr_codigo
and agraciados.ano = nvl('&p_ano', agraciados.ano)
order by 1,2
/






--------------------------------------



SELECT
a.nome, 
a.ano, 
a.cpf, 
m.nome comarca, 
cp.descricao cargo_profissao, 
Decode(Nvl(identificador_enviado,0),1,'Sim',0,'Não') 
Identificador_enviado,
Decode(Nvl(identificador_internet,0),1,'Sim',0,'Não') 
Identificador_internet,
Decode(Nvl(identificador_in_memorian,0),1,'Sim',0,'Não') 
Identificador_in_memorian,
Decode(Nvl(identificador_homonimo,0),1,'Sim',0,'Não') 
Identificador_homonimo
FROM agraciados a
join municipio m 
ON a.comr_codigo = m.codigo
JOIN CARGO_PROFISSAO CP ON A.CAPR_CODIGO = CP.CODIGO
AND M.UF_SIGLA = 'MG'
AND A.DATA_EXCLUSAO IS NULL
AND A.TIPO_MEDALHA = 1
AND ANO = 2011