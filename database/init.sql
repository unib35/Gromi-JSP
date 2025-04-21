-- Gromi 데이터베이스 초기화 스크립트

-- 기존 테이블 삭제
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS board_free;
DROP TABLE IF EXISTS board_qa;
DROP TABLE IF EXISTS board_sale;
DROP TABLE IF EXISTS plants;
DROP TABLE IF EXISTS plant_care;
DROP TABLE IF EXISTS comments;

-- 사용자 테이블 생성
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_pwd VARCHAR(200) NOT NULL, -- 해시된 비밀번호 저장
    user_email VARCHAR(100) NOT NULL UNIQUE,
    user_level INT DEFAULT 1,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- 자유 게시판 테이블
CREATE TABLE board_free (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    view_count INT DEFAULT 0,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Q&A 게시판 테이블
CREATE TABLE board_qa (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    view_count INT DEFAULT 0,
    is_solved BOOLEAN DEFAULT FALSE,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 분양 게시판 테이블
CREATE TABLE board_sale (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    price INT NOT NULL,
    plant_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    view_count INT DEFAULT 0,
    is_sold BOOLEAN DEFAULT FALSE,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 식물 정보 테이블
CREATE TABLE plants (
    plant_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100),
    description TEXT,
    difficulty INT DEFAULT 3, -- 1-5 난이도
    sunlight_needs VARCHAR(50),
    water_needs VARCHAR(50),
    optimal_temp VARCHAR(50),
    image_url VARCHAR(200)
);

-- 식물 관리 정보 테이블
CREATE TABLE plant_care (
    care_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_id INT NOT NULL,
    care_type VARCHAR(50) NOT NULL, -- 물주기, 비료, 번식 등
    care_description TEXT NOT NULL,
    frequency VARCHAR(100),
    season VARCHAR(50),
    FOREIGN KEY (plant_id) REFERENCES plants(plant_id) ON DELETE CASCADE
);

-- 댓글 테이블
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    board_type ENUM('free', 'qa', 'sale') NOT NULL,
    post_id INT NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 관리자 계정 추가
INSERT INTO users (user_id, user_name, user_pwd, user_email, user_level) 
VALUES ('admin', '관리자', SHA2('admin123', 256), 'admin@gromi.com', 10);

-- 일반 사용자 추가
INSERT INTO users (user_id, user_name, user_pwd, user_email) 
VALUES 
('user1', '홍길동', SHA2('user123', 256), 'user1@example.com'),
('user2', '김철수', SHA2('user123', 256), 'user2@example.com'),
('user3', '이영희', SHA2('user123', 256), 'user3@example.com');

-- 샘플 게시글 추가 (자유 게시판)
INSERT INTO board_free (title, content, user_id) 
VALUES 
('안녕하세요, 반갑습니다!', '식물 초보자입니다. 앞으로 잘 부탁드립니다.', 'user1'),
('다육이 관리 팁', '제가 다육이를 키우면서 알게 된 꿀팁을 공유합니다...', 'user2'),
('식물 키우기 시작했어요', '요즘 식물 키우기를 시작했는데 너무 재밌네요!', 'user3');

-- 샘플 게시글 추가 (Q&A 게시판)
INSERT INTO board_qa (title, content, user_id, is_solved) 
VALUES 
('몬스테라 잎이 누렇게 변해요', '몬스테라를 한 달 전에 구매했는데 잎이 누렇게 변하고 있어요. 어떻게 해야 할까요?', 'user1', FALSE),
('다육이에 벌레가 생겼어요', '다육이에 작은 벌레가 생겼는데 어떻게 퇴치할 수 있을까요?', 'user2', TRUE),
('스파티필룸 물주기', '스파티필룸에 물을 얼마나 자주 줘야 하나요?', 'user3', FALSE);

-- 샘플 게시글 추가 (분양 게시판)
INSERT INTO board_sale (title, content, price, plant_name, location, user_id, is_sold) 
VALUES 
('몬스테라 분양합니다', '건강한 몬스테라 나눔합니다. 키운지 1년 되었고 아주 건강해요.', 15000, '몬스테라', '서울 강남', 'user1', FALSE),
('스투키 무료 나눔', '스투키가 너무 많이 자라서 무료로 나눔합니다.', 0, '스투키', '서울 마포', 'user2', FALSE),
('알로카시아 분양', '알로카시아 분양합니다. 잎이 크고 건강합니다.', 20000, '알로카시아', '부산 해운대', 'user3', TRUE);

-- 식물 정보 추가
INSERT INTO plants (plant_name, scientific_name, description, difficulty, sunlight_needs, water_needs, optimal_temp, image_url) 
VALUES 
('몬스테라', 'Monstera deliciosa', '큰 잎이 특징적인 열대 식물로, 실내 공기 정화에 좋습니다.', 2, '간접광', '일주일에 한 번', '18-27°C', 'https://example.com/monstera.jpg'),
('스투키', 'Sansevieria cylindrica', '키우기 쉬운 다육식물로, 공기 정화 효과가 있습니다.', 1, '밝은 곳에서 간접광', '2주에 한 번', '18-24°C', 'https://example.com/snake_plant.jpg'),
('알로카시아', 'Alocasia', '큰 잎이 매력적인 열대 식물로, 습도가 높은 환경을 좋아합니다.', 4, '밝은 간접광', '흙이 말랐을 때', '18-25°C', 'https://example.com/alocasia.jpg'),
('스파티필룸', 'Spathiphyllum', '공기 정화 능력이 뛰어나며 꽃이 피는 관엽식물입니다.', 2, '간접광', '일주일에 한 번', '18-30°C', 'https://example.com/peace_lily.jpg'),
('용설란', 'Agave', '사막 지역에서 자라는, 키우기 쉬운 다육식물입니다.', 1, '직사광선', '2-3주에 한 번', '15-25°C', 'https://example.com/agave.jpg');

-- 식물 관리 정보 추가
INSERT INTO plant_care (plant_id, care_type, care_description, frequency, season) 
VALUES 
(1, '물주기', '화분 겉흙이 마르면 충분히 물을 주세요.', '일주일에 한 번', '연중'),
(1, '비료', '성장기에 액체 비료를 주세요.', '한 달에 한 번', '봄, 여름'),
(2, '물주기', '흙이 완전히 마른 후 물을 주세요. 과습에 약합니다.', '2주에 한 번', '연중'),
(3, '물주기', '흙이 마르면 물을 주고, 습도를 높게 유지해주세요.', '일주일에 한 번', '연중'),
(3, '분무', '잎에 물을 분무해 습도를 유지해주세요.', '매일', '연중'),
(4, '물주기', '흙이 약간 마르면 물을 주세요. 과습과 건조 모두 주의하세요.', '일주일에 한 번', '연중'),
(5, '물주기', '흙이 완전히 마른 후 물을 주세요. 과습에 매우 약합니다.', '2-3주에 한 번', '연중');

-- 댓글 추가
INSERT INTO comments (board_type, post_id, user_id, content) 
VALUES 
('free', 1, 'user2', '환영합니다! 저도 초보자예요.'),
('free', 2, 'user3', '좋은 정보 감사합니다!'),
('qa', 1, 'user2', '과습일 수 있어요. 물 주기를 줄여보세요.'),
('qa', 2, 'admin', '식초와 물을 1:4로 섞어서 분무하면 좋아요.'),
('sale', 1, 'user3', '아직 분양 중인가요?'); 