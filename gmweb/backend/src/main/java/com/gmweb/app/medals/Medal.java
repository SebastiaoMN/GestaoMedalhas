package com.gmweb.app.medals;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "TB_MEDAL")
public class Medal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ATHLETE_NAME", nullable = false)
    private String athleteName;

    @Column(name = "MODALITY", nullable = false)
    private String modality;

    @Column(name = "CATEGORY", nullable = false)
    private String category;

    @Column(name = "MEDAL_TYPE", nullable = false)
    private String medalType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAthleteName() {
        return athleteName;
    }

    public void setAthleteName(String athleteName) {
        this.athleteName = athleteName;
    }

    public String getModality() {
        return modality;
    }

    public void setModality(String modality) {
        this.modality = modality;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getMedalType() {
        return medalType;
    }

    public void setMedalType(String medalType) {
        this.medalType = medalType;
    }
}
