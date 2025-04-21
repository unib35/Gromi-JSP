package com.gromi.dto.plant;

public class PlantDTO {
    private int plantId;
    private String plantName;
    private String scientificName;
    private String description;
    private int difficulty;
    private String sunlightNeeds;
    private String waterNeeds;
    private String optimalTemp;
    private String imageUrl;
    
    public PlantDTO() {}
    
    public PlantDTO(int plantId, String plantName, String scientificName, String description, 
                   int difficulty, String sunlightNeeds, String waterNeeds, 
                   String optimalTemp, String imageUrl) {
        this.plantId = plantId;
        this.plantName = plantName;
        this.scientificName = scientificName;
        this.description = description;
        this.difficulty = difficulty;
        this.sunlightNeeds = sunlightNeeds;
        this.waterNeeds = waterNeeds;
        this.optimalTemp = optimalTemp;
        this.imageUrl = imageUrl;
    }
    
    // Getters and Setters
    public int getPlantId() {
        return plantId;
    }
    
    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }
    
    public String getPlantName() {
        return plantName;
    }
    
    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }
    
    public String getScientificName() {
        return scientificName;
    }
    
    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getDifficulty() {
        return difficulty;
    }
    
    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }
    
    public String getSunlightNeeds() {
        return sunlightNeeds;
    }
    
    public void setSunlightNeeds(String sunlightNeeds) {
        this.sunlightNeeds = sunlightNeeds;
    }
    
    public String getWaterNeeds() {
        return waterNeeds;
    }
    
    public void setWaterNeeds(String waterNeeds) {
        this.waterNeeds = waterNeeds;
    }
    
    public String getOptimalTemp() {
        return optimalTemp;
    }
    
    public void setOptimalTemp(String optimalTemp) {
        this.optimalTemp = optimalTemp;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
} 