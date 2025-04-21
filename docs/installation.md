# Gromi 설치 및 배포 가이드

## 사전 요구사항
- Java 개발 환경 (JDK 17 이상)
- Maven
- Apache Tomcat 9 이상
- MariaDB 또는 MySQL

## macOS에서 설치하기
1. 필요한 도구 설치 (Homebrew 사용)
   ```bash
   # Homebrew가 설치되어 있지 않은 경우 설치
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   
   # Java, Maven, Tomcat 설치
   brew install openjdk@17
   brew install maven
   brew install tomcat
   
   # MariaDB 설치 (또는 MySQL)
   brew install mariadb
   # MariaDB 시작
   brew services start mariadb
   ```

2. 저장소 클론
   ```bash
   git clone https://github.com/your-username/Gromi-JSP.git
   cd Gromi-JSP
   ```

3. 데이터베이스 설정
   ```bash
   # MariaDB에 접속
   mysql -u root -p
   
   # 데이터베이스 생성 및 사용자 설정
   CREATE DATABASE gromi_db;
   CREATE USER 'gromi_user'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON gromi_db.* TO 'gromi_user'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   
   # 초기 데이터베이스 스키마 및 데이터 임포트 (제공된 경우)
   mysql -u gromi_user -p gromi_db < database/init.sql
   ```

4. 프로젝트 배포
   - 자동 배포 스크립트 사용 (권장)
     ```bash
     # 배포 스크립트에 실행 권한 부여
     chmod +x deploy.sh
     
     # 배포 스크립트 실행
     ./deploy.sh
     ```
   
   - 수동 배포 방법
     ```bash
     # Maven으로 프로젝트 빌드
     mvn clean package
     
     # Tomcat의 웹앱 디렉토리에 WAR 파일 복사
     rm -rf $(brew --prefix tomcat)/libexec/webapps/ROOT
     rm -f $(brew --prefix tomcat)/libexec/webapps/ROOT.war
     cp target/Gromi-0.0.1-SNAPSHOT.war $(brew --prefix tomcat)/libexec/webapps/ROOT.war
     ```

5. Tomcat 서버 실행 및 중지
   ```bash
   # Tomcat 서버 시작
   brew services start tomcat
   
   # 또는 직접 실행
   $(brew --prefix tomcat)/bin/catalina run
   
   # Tomcat 서버 중지
   brew services stop tomcat
   ```

6. 웹 애플리케이션 접속
   - 웹 브라우저에서 `http://localhost:8080` 접속

## Linux(Ubuntu)에서 설치하기
1. 필요한 도구 설치
   ```bash
   # Java 설치
   sudo apt update
   sudo apt install openjdk-17-jdk
   
   # Maven 설치
   sudo apt install maven
   
   # Tomcat 설치
   sudo apt install tomcat9
   
   # MariaDB 설치
   sudo apt install mariadb-server
   sudo systemctl start mariadb
   sudo systemctl enable mariadb
   sudo mysql_secure_installation
   ```

2. 저장소 클론 및 빌드
   ```bash
   git clone https://github.com/your-username/Gromi-JSP.git
   cd Gromi-JSP
   mvn clean package
   ```

3. Tomcat에 배포
   ```bash
   sudo rm -rf /var/lib/tomcat9/webapps/ROOT
   sudo rm -f /var/lib/tomcat9/webapps/ROOT.war
   sudo cp target/Gromi-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/ROOT.war
   ```

4. 서비스 재시작
   ```bash
   sudo systemctl restart tomcat9
   ```

5. 웹 애플리케이션 접속
   - 웹 브라우저에서 `http://localhost:8080` 접속

## 데이터베이스 설정
데이터베이스 설정은 `src/main/java/model` 디렉토리의 데이터베이스 연결 클래스에서 변경할 수 있습니다. 기본 설정은 다음과 같습니다:

- 데이터베이스: MariaDB
- 호스트: localhost
- 포트: 3306
- 데이터베이스 이름: gromi_db
- 사용자: gromi_user
- 비밀번호: your_password

## 문제 해결

### Tomcat 연결 오류
Tomcat에 연결할 수 없는 경우:
1. Tomcat 서비스가 실행 중인지 확인
   ```bash
   # macOS
   brew services list | grep tomcat
   
   # Linux
   sudo systemctl status tomcat9
   ```
2. 포트 충돌 확인 및 해결
   ```bash
   # 8080 포트 사용 확인
   lsof -i :8080
   
   # 포트 변경이 필요한 경우 Tomcat 설정 파일 수정
   # macOS
   vi $(brew --prefix tomcat)/libexec/conf/server.xml
   
   # Linux
   sudo vi /etc/tomcat9/server.xml
   ```

### 데이터베이스 연결 오류
데이터베이스 연결에 문제가 있는 경우:
1. 데이터베이스 서비스 실행 상태 확인
   ```bash
   # macOS
   brew services list | grep mariadb
   
   # Linux
   sudo systemctl status mariadb
   ```
2. 데이터베이스 사용자 및 권한 확인
   ```bash
   mysql -u root -p
   SELECT User, Host, Grant_priv FROM mysql.user WHERE User = 'gromi_user';
   SHOW GRANTS FOR 'gromi_user'@'localhost';
   ```