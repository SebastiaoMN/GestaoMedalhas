package com.gmweb.app.config;

import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.ExchangeFilterFunction;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
public class WebClientConfig {

    @Bean
    public WebClient.Builder webClientBuilder(ObjectProvider<MeterRegistry> meterRegistryProvider) {
        WebClient.Builder builder = WebClient.builder();
        MeterRegistry registry = meterRegistryProvider.getIfAvailable();
        if (registry != null) {
            builder.filter(metricsFilter(registry));
        }
        return builder;
    }

    private ExchangeFilterFunction metricsFilter(MeterRegistry meterRegistry) {
        return (request, next) -> next.exchange(request)
                .doOnNext(response -> meterRegistry.counter(
                        "legacy.api.requests",
                        "method", request.method().name(),
                        "status", String.valueOf(response.statusCode().value())
                ).increment());
    }
}
