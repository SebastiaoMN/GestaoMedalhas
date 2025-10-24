package com.gmweb.app.service;

import com.gmweb.app.repository.ComarcaRepository;
import com.gmweb.app.web.dto.ComarcaResponse;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ComarcaService {

    private final ComarcaRepository comarcaRepository;

    public ComarcaService(ComarcaRepository comarcaRepository) {
        this.comarcaRepository = comarcaRepository;
    }

    @Transactional(readOnly = true)
    public List<ComarcaResponse> listarAtivas() {
        return comarcaRepository.findActive()
                .stream()
                .map(comarca -> new ComarcaResponse(comarca.getCodigo(), comarca.getNome()))
                .toList();
    }
}
