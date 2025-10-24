package com.gmweb.app.web.dto;

import com.gmweb.app.domain.MedalType;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record AgraciadoRequest(
        @NotBlank(message = "O nome deve ser informado")
        @Size(max = 80)
        String nome,

        @NotNull(message = "O ano deve ser informado")
        @Min(value = 1900, message = "Ano informado inválido")
        Integer ano,

        @Size(max = 20)
        String cpf,

        @Size(max = 1)
        String sexo,

        @NotNull(message = "O tipo da medalha deve ser informado")
        MedalType tipoMedalha,

        @NotNull(message = "O cargo/profissão deve ser informado")
        Long cargoProfissaoId,

        Long comarcaId,

        boolean enviado,

        boolean disponivelInternet,

        boolean inMemorian,

        boolean homonimo
) {
}
