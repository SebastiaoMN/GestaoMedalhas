package com.gmweb.app.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "CARGO_PROFISSAO")
public class CargoProfissao {

    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "DESCRICAO", nullable = false, length = 40)
    private String descricao;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
