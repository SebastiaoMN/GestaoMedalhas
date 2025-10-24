package com.gmweb.app.api;

import com.gmweb.app.service.ComarcaService;
import com.gmweb.app.web.dto.ComarcaResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/comarcas")
public class ComarcaController {

    private final ComarcaService comarcaService;

    public ComarcaController(ComarcaService comarcaService) {
        this.comarcaService = comarcaService;
    }

    @GetMapping
    @PreAuthorize("hasAuthority('SCOPE_cadastros:read')")
    public ResponseEntity<List<ComarcaResponse>> listar() {
        return ResponseEntity.ok(comarcaService.listarAtivas());
    }
}
