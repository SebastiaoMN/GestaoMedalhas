package com.gmweb.app.repository;

import com.gmweb.app.domain.Agraciado;
import com.gmweb.app.domain.MedalType;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface AgraciadoRepository extends JpaRepository<Agraciado, Long> {

    @EntityGraph(attributePaths = {"cargoProfissao", "comarca"})
    @Query("""
            select a
            from Agraciado a
            where a.tipoMedalha = :tipo
              and a.dataExclusao is null
              and (:ano is null or a.ano = :ano)
              and (:nome is null or upper(a.nome) like concat('%', upper(:nome), '%'))
            order by a.ano desc, a.nome asc
            """)
    List<Agraciado> findActiveByFilters(@Param("tipo") MedalType tipo,
                                         @Param("ano") Integer ano,
                                         @Param("nome") String nome);

    @Query("select coalesce(max(a.codigo),0) + 1 from Agraciado a")
    Long nextCodigo();

    boolean existsByCpfAndTipoMedalhaAndDataExclusaoIsNull(String cpf, MedalType tipoMedalha);

    boolean existsByCpfAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(String cpf, MedalType tipoMedalha, Long codigo);

    boolean existsByNomeIgnoreCaseAndTipoMedalhaAndDataExclusaoIsNull(String nome, MedalType tipoMedalha);

    boolean existsByNomeIgnoreCaseAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(String nome, MedalType tipoMedalha, Long codigo);

    boolean existsByAnoAndComarcaCodigoAndTipoMedalhaAndDataExclusaoIsNull(Integer ano, Long comarcaCodigo, MedalType tipoMedalha);

    boolean existsByAnoAndComarcaCodigoAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(Integer ano, Long comarcaCodigo, MedalType tipoMedalha, Long codigo);

    @Query("""
            select a
            from Agraciado a
            where a.codigo = :codigo
              and a.dataExclusao is null
            """)
    Optional<Agraciado> findActiveByCodigo(@Param("codigo") Long codigo);

    @Query("""
            select count(a) > 0
            from Agraciado a
            where a.cargoProfissao.codigo = :cargoId
              and a.dataExclusao is null
            """)
    boolean isCargoProfissaoInUse(@Param("cargoId") Long cargoId);
}
