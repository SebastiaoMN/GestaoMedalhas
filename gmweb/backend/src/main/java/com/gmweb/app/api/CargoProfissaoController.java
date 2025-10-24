package com.gmweb.app.api;

import com.gmweb.app.service.CargoProfissaoService;
import com.gmweb.app.web.dto.CargoProfissaoRequest;
import com.gmweb.app.web.dto.CargoProfissaoResponse;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/cargos-profissao")
public class CargoProfissaoController {

    private final CargoProfissaoService cargoProfissaoService;

    public CargoProfissaoController(CargoProfissaoService cargoProfissaoService) {
        this.cargoProfissaoService = cargoProfissaoService;
    }

    @GetMapping
    @PreAuthorize("hasAuthority('SCOPE_cadastros:read')")
    public ResponseEntity<List<CargoProfissaoResponse>> listar() {
        return ResponseEntity.ok(cargoProfissaoService.listar());
    }

    @PostMapping
    @PreAuthorize("hasAuthority('SCOPE_cadastros:write')")
    public ResponseEntity<CargoProfissaoResponse> criar(@Valid @RequestBody CargoProfissaoRequest request) {
        CargoProfissaoResponse response = cargoProfissaoService.criar(request);
        return ResponseEntity.created(URI.create("/api/cargos-profissao/" + response.codigo())).body(response);
    }

    @PutMapping("/{codigo}")
    @PreAuthorize("hasAuthority('SCOPE_cadastros:write')")
    public ResponseEntity<CargoProfissaoResponse> atualizar(@PathVariable Long codigo,
                                                            @Valid @RequestBody CargoProfissaoRequest request) {
        return ResponseEntity.ok(cargoProfissaoService.atualizar(codigo, request));
    }

    @DeleteMapping("/{codigo}")
    @PreAuthorize("hasAuthority('SCOPE_cadastros:write')")
    public ResponseEntity<Void> excluir(@PathVariable Long codigo) {
        cargoProfissaoService.excluir(codigo);
        return ResponseEntity.noContent().build();
    }
}
