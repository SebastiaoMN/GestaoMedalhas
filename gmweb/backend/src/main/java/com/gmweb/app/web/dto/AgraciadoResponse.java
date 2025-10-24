package com.gmweb.app.web.dto;

import com.gmweb.app.domain.MedalType;

public record AgraciadoResponse(
        Long codigo,
        String nome,
        Integer ano,
        String cpf,
        String sexo,
        MedalType tipoMedalha,
        Long cargoProfissaoId,
        String cargoProfissaoDescricao,
        Long comarcaId,
        String comarcaNome,
        boolean enviado,
        boolean disponivelInternet,
        boolean inMemorian,
        boolean homonimo
) {
}
