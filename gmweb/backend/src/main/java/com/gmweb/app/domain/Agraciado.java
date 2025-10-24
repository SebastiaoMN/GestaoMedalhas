package com.gmweb.app.domain;

import com.gmweb.app.domain.converter.BooleanToIntegerConverter;
import com.gmweb.app.domain.converter.MedalTypeConverter;
import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "AGRACIADOS")
public class Agraciado {

    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @Column(name = "NOME", nullable = false, length = 80)
    private String nome;

    @Column(name = "ANO", nullable = false)
    private Integer ano;

    @Column(name = "CPF", length = 11)
    private String cpf;

    @Column(name = "SEXO", length = 1)
    private String sexo;

    @Convert(converter = MedalTypeConverter.class)
    @Column(name = "TIPO_MEDALHA", nullable = false)
    private MedalType tipoMedalha;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CAPR_CODIGO")
    private CargoProfissao cargoProfissao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "COMR_CODIGO")
    private Comarca comarca;

    @Convert(converter = BooleanToIntegerConverter.class)
    @Column(name = "IDENTIFICADOR_ENVIADO")
    private Boolean enviado;

    @Convert(converter = BooleanToIntegerConverter.class)
    @Column(name = "IDENTIFICADOR_INTERNET")
    private Boolean disponivelInternet;

    @Convert(converter = BooleanToIntegerConverter.class)
    @Column(name = "IDENTIFICADOR_IN_MEMORIAN")
    private Boolean inMemorian;

    @Convert(converter = BooleanToIntegerConverter.class)
    @Column(name = "IDENTIFICADOR_HOMONIMO")
    private Boolean homonimo;

    @Column(name = "USUR_USERNAME")
    private String usuarioExclusao;

    @Column(name = "DATA_EXCLUSAO")
    private LocalDateTime dataExclusao;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public MedalType getTipoMedalha() {
        return tipoMedalha;
    }

    public void setTipoMedalha(MedalType tipoMedalha) {
        this.tipoMedalha = tipoMedalha;
    }

    public CargoProfissao getCargoProfissao() {
        return cargoProfissao;
    }

    public void setCargoProfissao(CargoProfissao cargoProfissao) {
        this.cargoProfissao = cargoProfissao;
    }

    public Comarca getComarca() {
        return comarca;
    }

    public void setComarca(Comarca comarca) {
        this.comarca = comarca;
    }

    public Boolean getEnviado() {
        return enviado;
    }

    public void setEnviado(Boolean enviado) {
        this.enviado = enviado;
    }

    public Boolean getDisponivelInternet() {
        return disponivelInternet;
    }

    public void setDisponivelInternet(Boolean disponivelInternet) {
        this.disponivelInternet = disponivelInternet;
    }

    public Boolean getInMemorian() {
        return inMemorian;
    }

    public void setInMemorian(Boolean inMemorian) {
        this.inMemorian = inMemorian;
    }

    public Boolean getHomonimo() {
        return homonimo;
    }

    public void setHomonimo(Boolean homonimo) {
        this.homonimo = homonimo;
    }

    public String getUsuarioExclusao() {
        return usuarioExclusao;
    }

    public void setUsuarioExclusao(String usuarioExclusao) {
        this.usuarioExclusao = usuarioExclusao;
    }

    public LocalDateTime getDataExclusao() {
        return dataExclusao;
    }

    public void setDataExclusao(LocalDateTime dataExclusao) {
        this.dataExclusao = dataExclusao;
    }

}
