package com.gromi.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * API 설정 정보를 관리하는 클래스
 * 설정 파일에서 API 키 등의 정보를 읽어옵니다.
 */
public class ApiConfig {
    private static final Logger LOGGER = Logger.getLogger(ApiConfig.class.getName());
    private static final String CONFIG_FILE = "config.properties";
    private static Properties properties;
    private static ApiConfig instance;
    
    // 기본 설정값
    private static final String DEFAULT_NONGSARO_API_KEY = "20230522XJWYEFWOSP5UXDCRIUCMG";
    private static final String DEFAULT_NONGSARO_SERVICE_NAME = "garden";
    private static final String DEFAULT_NONGSARO_BASE_URL = "http://api.nongsaro.go.kr/service";
    
    private ApiConfig() {
        loadProperties();
    }
    
    public static synchronized ApiConfig getInstance() {
        if (instance == null) {
            instance = new ApiConfig();
        }
        return instance;
    }
    
    private void loadProperties() {
        properties = new Properties();
        InputStream input = null;
        
        try {
            // 먼저 클래스패스에서 설정 파일 찾기
            input = getClass().getClassLoader().getResourceAsStream(CONFIG_FILE);
            
            // 설정 파일이 존재하면 로드
            if (input != null) {
                properties.load(input);
                LOGGER.info("설정 파일을 성공적으로 로드했습니다.");
            } else {
                LOGGER.warning("설정 파일을 찾을 수 없습니다. 기본값을 사용합니다: " + CONFIG_FILE);
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "설정 파일 로드 중 오류 발생: " + e.getMessage(), e);
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    LOGGER.log(Level.WARNING, "입력 스트림 닫기 실패: " + e.getMessage(), e);
                }
            }
        }
    }
    
    /**
     * 농사로 API 키 가져오기
     * 
     * @return API 키
     */
    public String getNongsaroApiKey() {
        return properties.getProperty("nongsaro.api.key", DEFAULT_NONGSARO_API_KEY);
    }
    
    /**
     * 농사로 서비스 이름 가져오기
     * 
     * @return 서비스 이름
     */
    public String getNongsaroServiceName() {
        return properties.getProperty("nongsaro.service.name", DEFAULT_NONGSARO_SERVICE_NAME);
    }
    
    /**
     * 농사로 기본 URL 가져오기
     * 
     * @return 기본 URL
     */
    public String getNongsaroBaseUrl() {
        return properties.getProperty("nongsaro.base.url", DEFAULT_NONGSARO_BASE_URL);
    }
} 