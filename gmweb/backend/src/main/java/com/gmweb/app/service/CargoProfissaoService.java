package com.gmweb.app.service;

import com.gmweb.app.domain.CargoProfissao;
import com.gmweb.app.repository.AgraciadoRepository;
import com.gmweb.app.repository.CargoProfissaoRepository;
import com.gmweb.app.web.dto.CargoProfissaoRequest;
import com.gmweb.app.web.dto.CargoProfissaoResponse;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CargoProfissaoService {

    private final CargoProfissaoRepository cargoProfissaoRepository;
    private final AgraciadoRepository agraciadoRepository;

    public CargoProfissaoService(CargoProfissaoRepository cargoProfissaoRepository,
                                 AgraciadoRepository agraciadoRepository) {
        this.cargoProfissaoRepository = cargoProfissaoRepository;
        this.agraciadoRepository = agraciadoRepository;
    }

    @Transactional(readOnly = true)
    public List<CargoProfissaoResponse> listar() {
        return cargoProfissaoRepository.findAllByOrderByDescricaoAsc()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    @Transactional
    public CargoProfissaoResponse criar(CargoProfissaoRequest request) {
        CargoProfissao cargo = new CargoProfissao();
        cargo.setCodigo(cargoProfissaoRepository.nextCodigo());
        cargo.setDescricao(request.descricao().trim());
        cargoProfissaoRepository.save(cargo);
        return toResponse(cargo);
    }

    @Transactional
    public CargoProfissaoResponse atualizar(Long codigo, CargoProfissaoRequest request) {
        CargoProfissao cargo = cargoProfissaoRepository.findById(codigo)
                .orElseThrow(() -> new EntityNotFoundException("Cargo/Profissão não encontrado"));
        cargo.setDescricao(request.descricao().trim());
        return toResponse(cargo);
    }

    @Transactional
    public void excluir(Long codigo) {
        CargoProfissao cargo = cargoProfissaoRepository.findById(codigo)
                .orElseThrow(() -> new EntityNotFoundException("Cargo/Profissão não encontrado"));
        if (agraciadoRepository.isCargoProfissaoInUse(codigo)) {
            throw new IllegalStateException("Este cargo/profissão está vinculado a um agraciado e não pode ser excluído");
        }
        cargoProfissaoRepository.delete(cargo);
    }

    private CargoProfissaoResponse toResponse(CargoProfissao cargo) {
        return new CargoProfissaoResponse(cargo.getCodigo(), cargo.getDescricao());
    }
}
