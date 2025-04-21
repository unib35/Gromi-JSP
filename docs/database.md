# Gromi 데이터베이스 설정 가이드

## 데이터베이스 요구사항
- MariaDB 10.5 이상 또는 MySQL 8.0 이상
- UTF-8 문자셋 지원

## 데이터베이스 초기 설정

### 데이터베이스 및 사용자 생성

다음 SQL 명령을 사용하여 데이터베이스와 사용자를 생성합니다:

```sql
# MariaDB/MySQL에 접속
mysql -u root -p

# 데이터베이스 생성
CREATE DATABASE gromi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 사용자 생성 및 권한 부여
CREATE USER 'gromi_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON gromi_db.* TO 'gromi_user'@'localhost';
FLUSH PRIVILEGES;

# 종료
EXIT;
```

### 초기 데이터 로드

프로젝트에 포함된 초기 데이터베이스 스키마와 샘플 데이터를 로드합니다. 프로젝트 루트의 `database/init.sql` 파일에는 다음과 같은 내용이 포함되어 있습니다:

- 필요한 테이블 생성 (사용자, 게시판, 식물 정보 등)
- 관리자 계정 및 샘플 사용자 계정
- 샘플 게시글 및 댓글 데이터
- 기본 식물 정보 및 관리 방법

다음 명령으로 초기 데이터를 가져옵니다:

```bash
# 데이터베이스 스키마 및 초기 데이터 임포트
mysql -u gromi_user -p gromi_db < database/init.sql
```

### 데이터베이스 스키마

아래는 주요 테이블의 구조입니다:

1. **users**: 사용자 정보 관리
   - user_id: 사용자 식별자 (PK)
   - user_name: 사용자 이름
   - user_pwd: 암호화된 비밀번호
   - user_email: 이메일 주소
   - user_level: 사용자 권한 레벨 (1: 일반 사용자, 10: 관리자)

2. **board_free, board_qa, board_sale**: 각 게시판 정보
   - post_id: 게시글 ID (PK)
   - title: 게시글 제목
   - content: 게시글 내용
   - user_id: 작성자 ID (FK)
   - 기타 게시판 관련 필드

3. **plants**: 식물 정보
   - plant_id: 식물 ID (PK)
   - plant_name: 식물 이름
   - scientific_name: 학명
   - description: 설명
   - 기타 식물 관련 정보

4. **plant_care**: 식물 관리 정보
   - care_id: 관리 정보 ID (PK)
   - plant_id: 식물 ID (FK)
   - care_type: 관리 유형 (물주기, 비료, 번식 등)
   - care_description: 관리 방법 설명

5. **comments**: 댓글 정보
   - comment_id: 댓글 ID (PK)
   - board_type: 게시판 유형
   - post_id: 게시글 ID
   - user_id: 작성자 ID (FK)
   - content: 댓글 내용

## 데이터베이스 연결 설정

### 연결 설정 변경

애플리케이션의 데이터베이스 연결 설정은 `src/main/java/model/DBConnection.java` 파일에 정의되어 있습니다. 필요에 따라 이 파일을 수정하여 데이터베이스 연결 정보를 변경할 수 있습니다.

기본 설정은 다음과 같습니다:

```java
private static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
private static final String DB_URL = "jdbc:mariadb://localhost:3306/gromi_db";
private static final String USER = "gromi_user";
private static final String PASS = "your_password";
```

## 데이터베이스 백업 및 복원

### 데이터베이스 백업

정기적인 데이터베이스 백업을 위한 명령어:

```bash
# 전체 데이터베이스 백업
mysqldump -u gromi_user -p gromi_db > gromi_backup_$(date +%Y%m%d).sql

# 테이블 구조만 백업
mysqldump -u gromi_user -p --no-data gromi_db > gromi_schema_$(date +%Y%m%d).sql

# 데이터만 백업
mysqldump -u gromi_user -p --no-create-info gromi_db > gromi_data_$(date +%Y%m%d).sql
```

### 데이터베이스 복원

백업 파일에서 데이터베이스 복원:

```bash
# 데이터베이스 복원
mysql -u gromi_user -p gromi_db < gromi_backup.sql
```

## 데이터베이스 유지 관리

### 성능 최적화

데이터베이스 성능 최적화를 위한 팁:

1. 인덱스 관리
   ```sql
   -- 인덱스 확인
   SHOW INDEX FROM table_name;
   
   -- 인덱스 추가
   ALTER TABLE table_name ADD INDEX index_name (column_name);
   ```

2. 쿼리 최적화
   ```sql
   -- 쿼리 실행 계획 확인
   EXPLAIN SELECT * FROM table_name WHERE condition;
   ```

3. 테이블 최적화
   ```sql
   -- 테이블 최적화
   OPTIMIZE TABLE table_name;
   ```

### 모니터링

MariaDB/MySQL 상태 모니터링:

```sql
-- 현재 실행 중인 쿼리 확인
SHOW PROCESSLIST;

-- 테이블 상태 확인
SHOW TABLE STATUS;

-- 시스템 변수 확인
SHOW VARIABLES;
``` 