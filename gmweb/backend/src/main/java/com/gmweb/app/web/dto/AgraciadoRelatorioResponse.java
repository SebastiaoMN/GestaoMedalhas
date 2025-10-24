package com.gmweb.app.web.dto;

public record AgraciadoRelatorioResponse(
        Long codigo,
        String nome,
        Integer ano,
        String comarca,
        String cargoProfissao,
        String enviado,
        String disponivelInternet,
        String inMemorian,
        String homonimo
) {
}
