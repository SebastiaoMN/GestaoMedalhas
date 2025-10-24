package com.gmweb.app.domain;

import java.util.Arrays;

public enum MedalType {
    HELIO_COSTA(1),
    COLAR_MERITO(2);

    private final int databaseValue;

    MedalType(int databaseValue) {
        this.databaseValue = databaseValue;
    }

    public int getDatabaseValue() {
        return databaseValue;
    }

    public static MedalType fromDatabase(int value) {
        return Arrays.stream(values())
                .filter(type -> type.databaseValue == value)
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Tipo de medalha desconhecido: " + value));
    }
}
