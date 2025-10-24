package com.gmweb.app.medals;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MedalService {

    private final MedalRepository medalRepository;

    public MedalService(MedalRepository medalRepository) {
        this.medalRepository = medalRepository;
    }

    @Transactional(readOnly = true)
    public List<Medal> findAll() {
        return medalRepository.findAll();
    }

    @Transactional
    public Medal save(Medal medal) {
        return medalRepository.save(medal);
    }
}
