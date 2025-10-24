package com.gmweb.app.web.dto;

import com.gmweb.app.domain.MedalType;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record AtualizarDisponibilidadeInternetRequest(
        @NotNull MedalType tipo,
        @NotNull @Min(1900) Integer ano,
        @NotNull Boolean disponivel
) {
}
