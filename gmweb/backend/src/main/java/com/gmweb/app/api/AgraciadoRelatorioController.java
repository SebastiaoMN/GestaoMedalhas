package com.gmweb.app.api;

import com.gmweb.app.domain.MedalType;
import com.gmweb.app.service.AgraciadoService;
import com.gmweb.app.web.dto.AgraciadoRelatorioResponse;
import com.gmweb.app.web.dto.ComarcaSemIndicacaoResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;
import java.util.List;

@RestController
@RequestMapping("/api/agraciados/relatorios")
public class AgraciadoRelatorioController {

    private final AgraciadoService agraciadoService;

    public AgraciadoRelatorioController(AgraciadoService agraciadoService) {
        this.agraciadoService = agraciadoService;
    }

    @GetMapping("/ano")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<List<AgraciadoRelatorioResponse>> porAno(@RequestParam MedalType tipo,
                                                                   @RequestParam Integer ano) {
        return ResponseEntity.ok(agraciadoService.relatorioPorAno(tipo, ano));
    }

    @GetMapping("/ordem")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<List<AgraciadoRelatorioResponse>> porOrdem(@RequestParam MedalType tipo) {
        return ResponseEntity.ok(agraciadoService.relatorioPorOrdem(tipo));
    }

    @GetMapping("/cargo")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<List<AgraciadoRelatorioResponse>> porCargo(@RequestParam MedalType tipo,
                                                                     @RequestParam(required = false) Long cargoId) {
        return ResponseEntity.ok(agraciadoService.relatorioPorCargo(tipo, cargoId));
    }

    @GetMapping("/sem-indicacao")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<List<ComarcaSemIndicacaoResponse>> semIndicacao(@RequestParam Integer ano) {
        return ResponseEntity.ok(agraciadoService.comarcasSemIndicacao(ano));
    }

    @GetMapping("/minas-gerais")
    @PreAuthorize("hasAuthority('SCOPE_agraciados:read')")
    public ResponseEntity<byte[]> minasGerais(@RequestParam Integer ano) {
        String conteudo = agraciadoService.gerarArquivoMinasGerais(ano);
        byte[] bytes = conteudo.getBytes(StandardCharsets.UTF_8);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"minas-gerais-%d.txt\"".formatted(ano))
                .contentType(MediaType.parseMediaType("text/plain;charset=UTF-8"))
                .body(bytes);
    }
}
