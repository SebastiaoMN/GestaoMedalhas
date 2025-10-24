package com.gmweb.app.repository;

import com.gmweb.app.domain.CargoProfissao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CargoProfissaoRepository extends JpaRepository<CargoProfissao, Long> {

    @Query("select coalesce(max(c.codigo),0) + 1 from CargoProfissao c")
    Long nextCodigo();

    List<CargoProfissao> findAllByOrderByDescricaoAsc();
}
