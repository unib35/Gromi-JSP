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
└── pom.xml                  # Maven 설정 파일
```

## 설치 및 실행 방법
1. 저장소 클론
   ```
   git clone https://github.com/your-username/Gromi-JSP.git
   ```

2. Maven 의존성 설치
   ```
   mvn install
   ```

3. 서버 배포 및 실행
   - Apache Tomcat이나 기타 Servlet 컨테이너에 배포

## 데이터베이스 설정
- MariaDB 또는 MySQL 데이터베이스 필요
- src/main/java/model 디렉토리의 데이터베이스 연결 클래스에서 설정 가능

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
