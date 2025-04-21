package com.gromi.dto.board;

import java.sql.Timestamp;

public class CommentDTO {
    private int commentId;
    private String boardType;
    private int postId;
    private String userId;
    private String content;
    private Timestamp regDate;
    private Timestamp updateDate;
    
    public CommentDTO() {}
    
    public CommentDTO(int commentId, String boardType, int postId, String userId, 
                     String content, Timestamp regDate, Timestamp updateDate) {
        this.commentId = commentId;
        this.boardType = boardType;
        this.postId = postId;
        this.userId = userId;
        this.content = content;
        this.regDate = regDate;
        this.updateDate = updateDate;
    }
    
    // Getters and Setters
    public int getCommentId() {
        return commentId;
    }
    
    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }
    
    public String getBoardType() {
        return boardType;
    }
    
    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }
    
    public int getPostId() {
        return postId;
    }
    
    public void setPostId(int postId) {
        this.postId = postId;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public Timestamp getRegDate() {
        return regDate;
    }
    
    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }
    
    public Timestamp getUpdateDate() {
        return updateDate;
    }
    
    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }
} 