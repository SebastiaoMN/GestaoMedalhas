package com.gmweb.app.web.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CargoProfissaoRequest(
        @NotBlank(message = "A descrição deve ser informada")
        @Size(max = 40)
        String descricao
) {
}
