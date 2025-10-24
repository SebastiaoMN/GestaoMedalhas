package com.gmweb.app.repository;

import com.gmweb.app.domain.Comarca;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ComarcaRepository extends JpaRepository<Comarca, Long> {

    @Query("select c from Comarca c where c.dataExclusao is null order by c.nome asc")
    List<Comarca> findActive();
}
