package com.gmweb.app.domain.converter;

import com.gmweb.app.domain.MedalType;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class MedalTypeConverter implements AttributeConverter<MedalType, Integer> {

    @Override
    public Integer convertToDatabaseColumn(MedalType attribute) {
        return attribute == null ? null : attribute.getDatabaseValue();
    }

    @Override
    public MedalType convertToEntityAttribute(Integer dbData) {
        return dbData == null ? null : MedalType.fromDatabase(dbData);
    }
}
