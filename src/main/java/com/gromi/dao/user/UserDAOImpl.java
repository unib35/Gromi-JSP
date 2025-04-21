package com.gromi.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gromi.dao.common.AbstractDAO;
import com.gromi.model.user.User;

public class UserDAOImpl extends AbstractDAO implements UserDAO {
    private static final String TABLE_NAME = "GROMIUSER";
    
    @Override
    public void insert(User user) throws Exception {
        String sql = "INSERT INTO " + TABLE_NAME + " VALUES(?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPw());
            pstmt.setString(3, user.getName());
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    @Override
    public User findById(String id) throws Exception {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getString("id"));
                user.setPw(rs.getString("pw"));
                user.setName(rs.getString("name"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return user;
    }
    
    @Override
    public List<User> findAll() throws Exception {
        String sql = "SELECT * FROM " + TABLE_NAME;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<User> users = new ArrayList<>();
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getString("id"));
                user.setPw(rs.getString("pw"));
                user.setName(rs.getString("name"));
                users.add(user);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return users;
    }
    
    @Override
    public void update(String id, User user) throws Exception {
        String sql = "UPDATE " + TABLE_NAME + " SET pw = ?, name = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getPw());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, id);
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    @Override
    public void delete(User user) throws Exception {
        deleteById(user.getId());
    }
    
    @Override
    public void deleteById(String id) throws Exception {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    @Override
    public User findByIdAndPassword(String id, String password) throws Exception {
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE id = ? AND pw = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getString("id"));
                user.setPw(rs.getString("pw"));
                user.setName(rs.getString("name"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return user;
    }
} 