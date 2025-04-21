package com.gromi.dto.board;

import java.sql.Timestamp;

public class BoardDTO {
    private int postId;
    private String title;
    private String content;
    private String userId;
    private int viewCount;
    private Timestamp regDate;
    private Timestamp updateDate;
    
    public BoardDTO() {}
    
    public BoardDTO(int postId, String title, String content, String userId, 
                   int viewCount, Timestamp regDate, Timestamp updateDate) {
        this.postId = postId;
        this.title = title;
        this.content = content;
        this.userId = userId;
        this.viewCount = viewCount;
        this.regDate = regDate;
        this.updateDate = updateDate;
    }
    
    // Getters and Setters
    public int getPostId() {
        return postId;
    }
    
    public void setPostId(int postId) {
        this.postId = postId;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public int getViewCount() {
        return viewCount;
    }
    
    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
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