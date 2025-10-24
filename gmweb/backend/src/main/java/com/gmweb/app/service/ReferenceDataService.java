package com.gmweb.app.service;

import com.gmweb.app.web.dto.SexoOption;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReferenceDataService {

    private final NamedParameterJdbcTemplate jdbcTemplate;

    public ReferenceDataService(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<SexoOption> listarSexos() {
        String sql = """
                select rv_low_value as codigo,
                       substr(rv_meaning,1,10) as descricao
                from cg_ref_codes
                where rv_domain = 'SEXO'
                order by rv_meaning
                """;
        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new SexoOption(rs.getString("codigo"), rs.getString("descricao")));
    }
}
