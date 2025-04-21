package com.gromi.dao.plant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gromi.dao.common.AbstractDAO;
import com.gromi.dao.common.GenericDAO;
import com.gromi.dto.plant.PlantCareDTO;

public class PlantCareDAO extends AbstractDAO implements GenericDAO<PlantCareDTO, Integer> {

    @Override
    public void insert(PlantCareDTO plantCare) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "INSERT INTO plant_care (plant_id, care_type, care_description, frequency, season) "
                    + "VALUES (?, ?, ?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, plantCare.getPlantId());
            pstmt.setString(2, plantCare.getCareType());
            pstmt.setString(3, plantCare.getCareDescription());
            pstmt.setString(4, plantCare.getFrequency());
            pstmt.setString(5, plantCare.getSeason());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }

    @Override
    public PlantCareDTO findById(Integer id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PlantCareDTO plantCare = null;
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plant_care WHERE care_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                plantCare = new PlantCareDTO();
                plantCare.setCareId(rs.getInt("care_id"));
                plantCare.setPlantId(rs.getInt("plant_id"));
                plantCare.setCareType(rs.getString("care_type"));
                plantCare.setCareDescription(rs.getString("care_description"));
                plantCare.setFrequency(rs.getString("frequency"));
                plantCare.setSeason(rs.getString("season"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return plantCare;
    }

    @Override
    public List<PlantCareDTO> findAll() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PlantCareDTO> careTips = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plant_care";
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlantCareDTO plantCare = new PlantCareDTO();
                plantCare.setCareId(rs.getInt("care_id"));
                plantCare.setPlantId(rs.getInt("plant_id"));
                plantCare.setCareType(rs.getString("care_type"));
                plantCare.setCareDescription(rs.getString("care_description"));
                plantCare.setFrequency(rs.getString("frequency"));
                plantCare.setSeason(rs.getString("season"));
                
                careTips.add(plantCare);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return careTips;
    }

    @Override
    public void update(Integer id, PlantCareDTO plantCare) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "UPDATE plant_care SET plant_id=?, care_type=?, care_description=?, "
                    + "frequency=?, season=? WHERE care_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, plantCare.getPlantId());
            pstmt.setString(2, plantCare.getCareType());
            pstmt.setString(3, plantCare.getCareDescription());
            pstmt.setString(4, plantCare.getFrequency());
            pstmt.setString(5, plantCare.getSeason());
            pstmt.setInt(6, id);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }

    @Override
    public void delete(PlantCareDTO plantCare) throws Exception {
        deleteById(plantCare.getCareId());
    }

    @Override
    public void deleteById(Integer id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "DELETE FROM plant_care WHERE care_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 특정 식물의 관리 정보 조회
    public List<PlantCareDTO> findByPlantId(int plantId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PlantCareDTO> careTips = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plant_care WHERE plant_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, plantId);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlantCareDTO plantCare = new PlantCareDTO();
                plantCare.setCareId(rs.getInt("care_id"));
                plantCare.setPlantId(rs.getInt("plant_id"));
                plantCare.setCareType(rs.getString("care_type"));
                plantCare.setCareDescription(rs.getString("care_description"));
                plantCare.setFrequency(rs.getString("frequency"));
                plantCare.setSeason(rs.getString("season"));
                
                careTips.add(plantCare);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return careTips;
    }
    
    // 특정 관리 유형별 조회 (물주기, 비료 등)
    public List<PlantCareDTO> findByCareType(String careType) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PlantCareDTO> careTips = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM plant_care WHERE care_type = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, careType);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlantCareDTO plantCare = new PlantCareDTO();
                plantCare.setCareId(rs.getInt("care_id"));
                plantCare.setPlantId(rs.getInt("plant_id"));
                plantCare.setCareType(rs.getString("care_type"));
                plantCare.setCareDescription(rs.getString("care_description"));
                plantCare.setFrequency(rs.getString("frequency"));
                plantCare.setSeason(rs.getString("season"));
                
                careTips.add(plantCare);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return careTips;
    }
} 