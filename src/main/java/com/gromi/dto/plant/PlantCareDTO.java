package com.gromi.dto.plant;

public class PlantCareDTO {
    private int careId;
    private int plantId;
    private String careType;
    private String careDescription;
    private String frequency;
    private String season;
    
    public PlantCareDTO() {}
    
    public PlantCareDTO(int careId, int plantId, String careType, String careDescription, 
                       String frequency, String season) {
        this.careId = careId;
        this.plantId = plantId;
        this.careType = careType;
        this.careDescription = careDescription;
        this.frequency = frequency;
        this.season = season;
    }
    
    // Getters and Setters
    public int getCareId() {
        return careId;
    }
    
    public void setCareId(int careId) {
        this.careId = careId;
    }
    
    public int getPlantId() {
        return plantId;
    }
    
    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }
    
    public String getCareType() {
        return careType;
    }
    
    public void setCareType(String careType) {
        this.careType = careType;
    }
    
    public String getCareDescription() {
        return careDescription;
    }
    
    public void setCareDescription(String careDescription) {
        this.careDescription = careDescription;
    }
    
    public String getFrequency() {
        return frequency;
    }
    
    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
    
    public String getSeason() {
        return season;
    }
    
    public void setSeason(String season) {
        this.season = season;
    }
} 