package com.gmweb.app.api;

import com.gmweb.app.domain.MedalType;
import com.gmweb.app.service.AgraciadoService;
import com.gmweb.app.web.dto.AgraciadoRequest;
import com.gmweb.app.web.dto.AgraciadoResponse;
import com.gmweb.app.web.dto.AtualizarDisponibilidadeInternetRequest;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/agraciados")
public class AgraciadoController {

    private final AgraciadoService agraciadoService;

    public AgraciadoController(AgraciadoService agraciadoService) {
        this.agraciadoService = agraciadoService;
    }

    @GetMapping
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<List<AgraciadoResponse>> listar(
            @RequestParam(name = "tipo") MedalType tipo,
            @RequestParam(name = "ano", required = false) Integer ano,
            @RequestParam(name = "nome", required = false) String nome) {
        return ResponseEntity.ok(agraciadoService.listar(tipo, ano, nome));
    }

    @GetMapping("/{codigo}")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<AgraciadoResponse> detalhar(@PathVariable Long codigo) {
        return ResponseEntity.ok(agraciadoService.detalhar(codigo));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('SCOPE_agraciados:write')")
    public ResponseEntity<AgraciadoResponse> criar(@Valid @RequestBody AgraciadoRequest request) {
        AgraciadoResponse response = agraciadoService.criar(request);
        return ResponseEntity.created(URI.create("/api/agraciados/" + response.codigo())).body(response);
    }

    @PutMapping("/{codigo}")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:write')")
    public ResponseEntity<AgraciadoResponse> atualizar(@PathVariable Long codigo,
                                                       @Valid @RequestBody AgraciadoRequest request) {
        return ResponseEntity.ok(agraciadoService.atualizar(codigo, request));
    }

    @DeleteMapping("/{codigo}")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:write')")
    public ResponseEntity<Void> excluir(@PathVariable Long codigo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String usuario = authentication != null ? authentication.getName() : "system";
        agraciadoService.excluir(codigo, usuario);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/disponibilidade-internet")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:write')")
    public ResponseEntity<Void> atualizarDisponibilidade(@Valid @RequestBody AtualizarDisponibilidadeInternetRequest request) {
        agraciadoService.atualizarDisponibilidadeInternet(request.tipo(), request.ano(), request.disponivel());
        return ResponseEntity.noContent().build();
    }
}
