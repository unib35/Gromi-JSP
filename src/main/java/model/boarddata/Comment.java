package model.boarddata;
import java.sql.*;

public class Comment {
	private int bdNo;
	private String userId;
	private String userName;
	private String bdComment;
    private Timestamp coDate;
    private int coNo;
    
    public Comment(int bdNo, String userId, String userName, String bdComment) {
        this.bdNo = bdNo;
        this.userId = userId;
        this.userName = userName;
        this.bdComment = bdComment;
    }
    
    public Comment(int bdNo, String userId, String userName, String bdComment, Timestamp coDate, int coNo) {
        this.bdNo = bdNo;
        this.userId = userId;
        this.userName = userName;
        this.bdComment = bdComment;
        this.coDate = coDate;
        this.coNo = coNo;
    }
    
    public int getBdNo() {
        return bdNo;
    }

    public void setBdNo(int bdNo) {
        this.bdNo = bdNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getBdComment() {
        return bdComment;
    }

    public void setBdComment(String bdComment) {
        this.bdComment = bdComment;
    }

    public Timestamp getCoDate() {
        return coDate;
    }

    public void setCoDate(Timestamp coDate) {
        this.coDate = coDate;
    }

    public int getCoNo() {
        return coNo;
    }

    public void setCoNo(int coNo) {
        this.coNo = coNo;
    }
    
}
