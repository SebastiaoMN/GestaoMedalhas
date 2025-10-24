package com.gmweb.app.integration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Component
public class LegacyClient {

    private final WebClient webClient;

    public LegacyClient(@Value("${legacy.api.url:http://localhost:9000}") String baseUrl,
                        WebClient.Builder builder) {
        this.webClient = builder.baseUrl(baseUrl).build();
    }

    public Mono<String> fetchAthleteProfile(String athleteId) {
        return webClient.get()
                .uri(uriBuilder -> uriBuilder.path("/athletes/{id}").build(athleteId))
                .accept(MediaType.APPLICATION_JSON)
                .retrieve()
                .bodyToMono(String.class);
    }
}
