package com.gromi.dao.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gromi.dao.common.AbstractDAO;
import com.gromi.dao.common.GenericDAO;
import com.gromi.dto.board.CommentDTO;

public class CommentDAO extends AbstractDAO implements GenericDAO<CommentDTO, Integer> {

    @Override
    public void insert(CommentDTO comment) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "INSERT INTO comments (board_type, post_id, user_id, content) VALUES (?, ?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, comment.getBoardType());
            pstmt.setInt(2, comment.getPostId());
            pstmt.setString(3, comment.getUserId());
            pstmt.setString(4, comment.getContent());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }

    @Override
    public CommentDTO findById(Integer id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        CommentDTO comment = null;
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM comments WHERE comment_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                comment = new CommentDTO();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setBoardType(rs.getString("board_type"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setUserId(rs.getString("user_id"));
                comment.setContent(rs.getString("content"));
                comment.setRegDate(rs.getTimestamp("reg_date"));
                comment.setUpdateDate(rs.getTimestamp("update_date"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return comment;
    }

    @Override
    public List<CommentDTO> findAll() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO> comments = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM comments ORDER BY comment_id DESC";
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                CommentDTO comment = new CommentDTO();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setBoardType(rs.getString("board_type"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setUserId(rs.getString("user_id"));
                comment.setContent(rs.getString("content"));
                comment.setRegDate(rs.getTimestamp("reg_date"));
                comment.setUpdateDate(rs.getTimestamp("update_date"));
                
                comments.add(comment);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return comments;
    }

    @Override
    public void update(Integer id, CommentDTO comment) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "UPDATE comments SET content=? WHERE comment_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, comment.getContent());
            pstmt.setInt(2, id);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }

    @Override
    public void delete(CommentDTO comment) throws Exception {
        deleteById(comment.getCommentId());
    }

    @Override
    public void deleteById(Integer id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "DELETE FROM comments WHERE comment_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 특정 게시글의 댓글 목록 조회
    public List<CommentDTO> getCommentsByPost(String boardType, int postId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO> comments = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM comments WHERE board_type=? AND post_id=? ORDER BY comment_id";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardType);
            pstmt.setInt(2, postId);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                CommentDTO comment = new CommentDTO();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setBoardType(rs.getString("board_type"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setUserId(rs.getString("user_id"));
                comment.setContent(rs.getString("content"));
                comment.setRegDate(rs.getTimestamp("reg_date"));
                comment.setUpdateDate(rs.getTimestamp("update_date"));
                
                comments.add(comment);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return comments;
    }
    
    // 특정 사용자의 댓글 목록 조회
    public List<CommentDTO> getCommentsByUser(String userId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO> comments = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM comments WHERE user_id=? ORDER BY comment_id DESC";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                CommentDTO comment = new CommentDTO();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setBoardType(rs.getString("board_type"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setUserId(rs.getString("user_id"));
                comment.setContent(rs.getString("content"));
                comment.setRegDate(rs.getTimestamp("reg_date"));
                comment.setUpdateDate(rs.getTimestamp("update_date"));
                
                comments.add(comment);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return comments;
    }
} 