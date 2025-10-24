package com.gmweb.app.api;

import com.gmweb.app.service.ReferenceDataService;
import com.gmweb.app.web.dto.SexoOption;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/referencias")
public class ReferenceDataController {

    private final ReferenceDataService referenceDataService;

    public ReferenceDataController(ReferenceDataService referenceDataService) {
        this.referenceDataService = referenceDataService;
    }

    @GetMapping("/sexos")
    @PreAuthorize("hasAuthority('SCOPE_cadastros:read')")
    public ResponseEntity<List<SexoOption>> listarSexos() {
        return ResponseEntity.ok(referenceDataService.listarSexos());
    }
}
