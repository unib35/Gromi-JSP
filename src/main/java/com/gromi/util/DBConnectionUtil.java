package com.gromi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;

public class DBConnectionUtil {
    private static final String PROPERTIES_FILE = "/db.properties";
    private static Properties properties = new Properties();
    
    static {
        try (InputStream inputStream = DBConnectionUtil.class.getResourceAsStream(PROPERTIES_FILE)) {
            properties.load(inputStream);
            Class.forName(properties.getProperty("driver"));
        } catch (Exception e) {
            throw new RuntimeException("데이터베이스 드라이버 로드 실패", e);
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
            properties.getProperty("url"),
            properties.getProperty("username"),
            properties.getProperty("password")
        );
    }
    
    public static void close(AutoCloseable... resources) {
        for (AutoCloseable resource : resources) {
            if (resource != null) {
                try {
                    resource.close();
                } catch (Exception e) {
                    // 로깅 처리
                    e.printStackTrace();
                }
            }
        }
    }
} 