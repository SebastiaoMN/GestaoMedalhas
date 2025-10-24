package com.gmweb.app.repository;

import com.gmweb.app.web.dto.ComarcaSemIndicacaoResponse;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RelatorioRepository {

    private final NamedParameterJdbcTemplate jdbcTemplate;

    public RelatorioRepository(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<ComarcaSemIndicacaoResponse> listarComarcasSemIndicacao(Integer ano) {
        String sql = """
                SELECT DISTINCT ic.comr_codigo AS codigo,
                       m.nome AS comarca,
                       :ano AS ano
                FROM instalacao_comarca ic
                JOIN municipio m ON m.codigo = ic.comr_codigo AND m.uf_sigla = 'MG'
                WHERE ic.comr_codigo <> 24
                  AND ic.data_instalacao = (
                    SELECT MAX(ic1.data_instalacao)
                    FROM instalacao_comarca ic1
                    WHERE ic1.comr_codigo = ic.comr_codigo
                  )
                  AND NOT EXISTS (
                    SELECT 1
                    FROM agraciados a
                    WHERE a.comr_codigo = ic.comr_codigo
                      AND a.tipo_medalha = 1
                      AND a.ano = :ano
                      AND a.data_exclusao IS NULL
                      AND ic.data_instalacao <= TO_DATE('0101' || TO_CHAR(a.ano), 'ddmmyyyy')
                  )
                ORDER BY m.nome
                """;
        MapSqlParameterSource params = new MapSqlParameterSource("ano", ano);
        return jdbcTemplate.query(sql, params, (rs, rowNum) ->
                new ComarcaSemIndicacaoResponse(
                        rs.getLong("codigo"),
                        rs.getString("comarca"),
                        rs.getInt("ano")
                ));
    }
}
