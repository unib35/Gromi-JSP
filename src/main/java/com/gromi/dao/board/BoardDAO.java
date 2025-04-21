package com.gromi.dao.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.gromi.dao.common.AbstractDAO;
import com.gromi.dto.board.BoardDTO;

public class BoardDAO extends AbstractDAO {
    
    // 자유 게시판 게시글 목록 조회
    public List<BoardDTO> getFreeboardList() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDTO> boardList = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM board_free ORDER BY post_id DESC";
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setPostId(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setUserId(rs.getString("user_id"));
                board.setViewCount(rs.getInt("view_count"));
                board.setRegDate(rs.getTimestamp("reg_date"));
                board.setUpdateDate(rs.getTimestamp("update_date"));
                
                boardList.add(board);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return boardList;
    }
    
    // 자유 게시판 게시글 상세 조회
    public BoardDTO getFreeboardPost(int postId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO board = null;
        
        try {
            conn = getConnection();
            
            // 조회수 증가
            increaseViewCount("board_free", postId);
            
            String sql = "SELECT * FROM board_free WHERE post_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                board = new BoardDTO();
                board.setPostId(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setUserId(rs.getString("user_id"));
                board.setViewCount(rs.getInt("view_count"));
                board.setRegDate(rs.getTimestamp("reg_date"));
                board.setUpdateDate(rs.getTimestamp("update_date"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return board;
    }
    
    // 자유 게시판 게시글 작성
    public void insertFreeboardPost(BoardDTO board) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "INSERT INTO board_free (title, content, user_id) VALUES (?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getUserId());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 자유 게시판 게시글 수정
    public void updateFreeboardPost(BoardDTO board) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "UPDATE board_free SET title=?, content=? WHERE post_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getPostId());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 자유 게시판 게시글 삭제
    public void deleteFreeboardPost(int postId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "DELETE FROM board_free WHERE post_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // Q&A 게시판 게시글 목록 조회
    public List<BoardDTO> getQAboardList() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDTO> boardList = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM board_qa ORDER BY post_id DESC";
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setPostId(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setUserId(rs.getString("user_id"));
                board.setViewCount(rs.getInt("view_count"));
                board.setRegDate(rs.getTimestamp("reg_date"));
                board.setUpdateDate(rs.getTimestamp("update_date"));
                
                boardList.add(board);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return boardList;
    }
    
    // Q&A 게시판 게시글 상세 조회
    public BoardDTO getQAboardPost(int postId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDTO board = null;
        
        try {
            conn = getConnection();
            
            // 조회수 증가
            increaseViewCount("board_qa", postId);
            
            String sql = "SELECT * FROM board_qa WHERE post_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                board = new BoardDTO();
                board.setPostId(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setUserId(rs.getString("user_id"));
                board.setViewCount(rs.getInt("view_count"));
                board.setRegDate(rs.getTimestamp("reg_date"));
                board.setUpdateDate(rs.getTimestamp("update_date"));
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return board;
    }
    
    // Q&A 게시판 게시글 작성
    public void insertQAboardPost(BoardDTO board) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "INSERT INTO board_qa (title, content, user_id) VALUES (?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getUserId());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // Q&A 게시판 게시글 수정
    public void updateQAboardPost(BoardDTO board) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "UPDATE board_qa SET title=?, content=? WHERE post_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getPostId());
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // Q&A 게시판 게시글 삭제
    public void deleteQAboardPost(int postId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "DELETE FROM board_qa WHERE post_id=?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 조회수 증가
    private void increaseViewCount(String tableName, int postId) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            String sql = "UPDATE " + tableName + " SET view_count = view_count + 1 WHERE post_id = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            
            pstmt.executeUpdate();
        } finally {
            close(conn, pstmt);
        }
    }
    
    // 게시글 검색
    public List<BoardDTO> searchBoard(String tableName, String keyword) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDTO> boardList = new ArrayList<>();
        
        try {
            conn = getConnection();
            String sql = "SELECT * FROM " + tableName + " WHERE title LIKE ? OR content LIKE ? ORDER BY post_id DESC";
            
            pstmt = conn.prepareStatement(sql);
            String pattern = "%" + keyword + "%";
            pstmt.setString(1, pattern);
            pstmt.setString(2, pattern);
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setPostId(rs.getInt("post_id"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setUserId(rs.getString("user_id"));
                board.setViewCount(rs.getInt("view_count"));
                board.setRegDate(rs.getTimestamp("reg_date"));
                board.setUpdateDate(rs.getTimestamp("update_date"));
                
                boardList.add(board);
            }
        } finally {
            close(conn, pstmt, rs);
        }
        
        return boardList;
    }
} 