package com.gmweb.app.api;

import com.gmweb.app.medals.Medal;
import com.gmweb.app.medals.MedalService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/api/medals")
public class MedalController {

    private final MedalService medalService;

    public MedalController(MedalService medalService) {
        this.medalService = medalService;
    }

    @GetMapping
    @PreAuthorize("hasAuthority('SCOPE_medals:read')")
    public ResponseEntity<List<Medal>> findAll() {
        return ResponseEntity.ok(medalService.findAll());
    }

    @PostMapping
    @PreAuthorize("hasAuthority('SCOPE_medals:write')")
    public ResponseEntity<Medal> create(@Valid @RequestBody Medal medal) {
        Medal saved = medalService.save(medal);
        return ResponseEntity.created(URI.create("/api/medals/" + saved.getId())).body(saved);
    }
}
