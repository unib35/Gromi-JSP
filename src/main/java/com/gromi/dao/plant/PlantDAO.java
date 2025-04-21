package com.gromi.dao.plant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gromi.dao.common.AbstractDAO;
import com.gromi.dao.common.GenericDAO;
import com.gromi.dto.plant.PlantDTO;

public class PlantDAO extends AbstractDAO implements GenericDAO<PlantDTO, Integer> {
    
    @Override
    public void insert(PlantDTO plant) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "INSERT INTO plants (plant_name, scientific_name, description, difficulty, "
                    + "sunlight_needs, water_needs, optimal_temp, image_url) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, plant.getPlantName());
            pstmt.setString(2, plant.getScientificName());
            pstmt.setString(3, plant.getDescription());
            pstmt.setInt(4, plant.getDifficulty());
            pstmt.setString(5, plant.getSunlightNeeds());
            pstmt.setString(6, plant.getWaterNeeds());
            pstmt.setString(7, plant.getOptimalTemp());
            pstmt.setString(8, plant.getImageUrl());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }

    @Override
    public PlantDTO findById(Integer id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PlantDTO plant = null;
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plants WHERE plant_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                plant = new PlantDTO();
                plant.setPlantId(rs.getInt("plant_id"));
                plant.setPlantName(rs.getString("plant_name"));
                plant.setScientificName(rs.getString("scientific_name"));
                plant.setDescription(rs.getString("description"));
                plant.setDifficulty(rs.getInt("difficulty"));
                plant.setSunlightNeeds(rs.getString("sunlight_needs"));
                plant.setWaterNeeds(rs.getString("water_needs"));
                plant.setOptimalTemp(rs.getString("optimal_temp"));
                plant.setImageUrl(rs.getString("image_url"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return plant;
    }

    @Override
    public List<PlantDTO> findAll() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PlantDTO> plants = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plants ORDER BY plant_name";
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlantDTO plant = new PlantDTO();
                plant.setPlantId(rs.getInt("plant_id"));
                plant.setPlantName(rs.getString("plant_name"));
                plant.setScientificName(rs.getString("scientific_name"));
                plant.setDescription(rs.getString("description"));
                plant.setDifficulty(rs.getInt("difficulty"));
                plant.setSunlightNeeds(rs.getString("sunlight_needs"));
                plant.setWaterNeeds(rs.getString("water_needs"));
                plant.setOptimalTemp(rs.getString("optimal_temp"));
                plant.setImageUrl(rs.getString("image_url"));
                
                plants.add(plant);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return plants;
    }

    @Override
    public void update(Integer id, PlantDTO plant) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "UPDATE plants SET plant_name=?, scientific_name=?, description=?, "
                    + "difficulty=?, sunlight_needs=?, water_needs=?, optimal_temp=?, image_url=? "
                    + "WHERE plant_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, plant.getPlantName());
            pstmt.setString(2, plant.getScientificName());
            pstmt.setString(3, plant.getDescription());
            pstmt.setInt(4, plant.getDifficulty());
            pstmt.setString(5, plant.getSunlightNeeds());
            pstmt.setString(6, plant.getWaterNeeds());
            pstmt.setString(7, plant.getOptimalTemp());
            pstmt.setString(8, plant.getImageUrl());
            pstmt.setInt(9, id);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }

    @Override
    public void delete(PlantDTO plant) throws Exception {
        deleteById(plant.getPlantId());
    }

    @Override
    public void deleteById(Integer id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "DELETE FROM plants WHERE plant_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 식물 검색 기능
    public List<PlantDTO> searchPlants(String keyword) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PlantDTO> plants = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plants WHERE plant_name LIKE ? OR scientific_name LIKE ? "
                    + "OR description LIKE ? ORDER BY plant_name";
            
            pstmt = conn.prepareStatement(sql);
            String pattern = "%" + keyword + "%";
            pstmt.setString(1, pattern);
            pstmt.setString(2, pattern);
            pstmt.setString(3, pattern);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlantDTO plant = new PlantDTO();
                plant.setPlantId(rs.getInt("plant_id"));
                plant.setPlantName(rs.getString("plant_name"));
                plant.setScientificName(rs.getString("scientific_name"));
                plant.setDescription(rs.getString("description"));
                plant.setDifficulty(rs.getInt("difficulty"));
                plant.setSunlightNeeds(rs.getString("sunlight_needs"));
                plant.setWaterNeeds(rs.getString("water_needs"));
                plant.setOptimalTemp(rs.getString("optimal_temp"));
                plant.setImageUrl(rs.getString("image_url"));
                
                plants.add(plant);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return plants;
    }
    
    // 난이도별 식물 추천
    public List<PlantDTO> getPlantsByDifficulty(int difficulty) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PlantDTO> plants = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plants WHERE difficulty <= ? ORDER BY difficulty";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, difficulty);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlantDTO plant = new PlantDTO();
                plant.setPlantId(rs.getInt("plant_id"));
                plant.setPlantName(rs.getString("plant_name"));
                plant.setScientificName(rs.getString("scientific_name"));
                plant.setDescription(rs.getString("description"));
                plant.setDifficulty(rs.getInt("difficulty"));
                plant.setSunlightNeeds(rs.getString("sunlight_needs"));
                plant.setWaterNeeds(rs.getString("water_needs"));
                plant.setOptimalTemp(rs.getString("optimal_temp"));
                plant.setImageUrl(rs.getString("image_url"));
                
                plants.add(plant);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return plants;
    }
} 