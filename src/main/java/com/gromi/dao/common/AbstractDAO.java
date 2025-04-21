package com.gromi.dao.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gromi.util.DBConnectionUtil;

public abstract class AbstractDAO {
    protected Connection getConnection() throws SQLException {
        return DBConnectionUtil.getConnection();
    }
    
    protected void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        DBConnectionUtil.close(rs, pstmt, conn);
    }
    
    protected void close(Connection conn, PreparedStatement pstmt) {
        DBConnectionUtil.close(pstmt, conn);
    }
} 