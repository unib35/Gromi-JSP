# Gromi (그로미) - 식물 정보 커뮤니티

## 프로젝트 소개
JSP를 이용한 식물 정보 커뮤니티 웹 애플리케이션입니다. 사용자들이 다양한 식물 정보를 검색하고, 추천받으며, 커뮤니티를 통해 소통할 수 있는 플랫폼을 제공합니다.

## 주요 기능
- **식물 검색**: 다양한 종류의 식물 정보 검색 기능
- **식물 추천**: 사용자에게 적합한 식물 추천 시스템
- **커뮤니티 게시판**:
  - 자유 게시판
  - Q&A 게시판
  - 분양 게시판
- **사용자 관리**: 회원가입, 로그인, 개인정보 수정 기능

## 기술 스택
- **프론트엔드**: HTML, CSS, JavaScript, Bootstrap
- **백엔드**: Java, JSP
- **데이터베이스**: MariaDB, MySQL
- **빌드 도구**: Maven

## 개발 환경
- Java 17
- Servlet/JSP
- Maven 프로젝트 구조

## 프로젝트 구조
```
Gromi-JSP/
├── src/main/
│   ├── java/
│   │   ├── model/           # 데이터 모델 클래스
│   │   │   ├── boarddata/   # 게시판 관련 모델
│   │   │   └── userdata/    # 사용자 관련 모델
│   │   └── parser/          # 데이터 파싱 관련 클래스
│   └── webapp/
│       ├── board/           # 게시판 관련 JSP 파일
│       ├── login/           # 로그인/회원가입 관련 JSP 파일
│       ├── WEB-INF/         # 웹 설정 파일
│       ├── js/              # JavaScript 파일
│       └── *.jsp            # 주요 페이지 JSP 파일
├── database/                # 데이터베이스 초기화 스크립트
│   └── init.sql            # 데이터베이스 스키마 및 샘플 데이터
├── docs/                    # 문서 디렉토리
└── pom.xml                  # Maven 설정 파일
```

## 설치 및 배포 가이드

상세한 설치 및 배포 가이드는 다음 문서들을 참조하세요:

- [설치 가이드](docs/installation.md) - 개발 환경 설정 및 설치 방법
- [배포 가이드](docs/deployment.md) - 애플리케이션 배포 방법
- [데이터베이스 설정](docs/database.md) - 데이터베이스 설정 및 관리

### 빠른 시작

1. 저장소 클론
   ```bash
   git clone https://github.com/your-username/Gromi-JSP.git
   cd Gromi-JSP
   ```

2. 데이터베이스 설정
   ```bash
   # MariaDB에 접속
   mysql -u root -p
   
   # 데이터베이스 및 사용자 생성
   CREATE DATABASE gromi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   CREATE USER 'gromi_user'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON gromi_db.* TO 'gromi_user'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   
   # 초기 데이터 임포트
   mysql -u gromi_user -p gromi_db < database/init.sql
   ```

3. 배포 스크립트 실행
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

4. 웹 브라우저에서 접속
   ```
   http://localhost:8080
   ```

## 기여자
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/unib35">
        <img src="https://github.com/unib35.png" width="100px;" alt="unib35"/>
        <br />
        <sub><b>unib35</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/KMINGON">
        <img src="https://github.com/KMINGON.png" width="100px;" alt="KMINGON"/>
        <br />
        <sub><b>KMINGON</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/nuexs">
        <img src="https://github.com/nuexs.png" width="100px;" alt="nuexs"/>
        <br />
        <sub><b>nuexs</b></sub>
      </a>
    </td>
  </tr>
</table>

## 라이센스
이 프로젝트는 MIT 라이센스를 따릅니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.
