# Gromi 배포 가이드

## 배포 방법

### 자동 배포 (권장)

Gromi 프로젝트는 배포를 간소화하기 위한 배포 스크립트를 제공합니다. 이 스크립트는 다음과 같은 작업을 자동으로 수행합니다:

1. Maven을 사용하여 프로젝트 빌드
2. Tomcat의 ROOT 애플리케이션 제거
3. 새 WAR 파일을 Tomcat에 복사

배포 스크립트를 사용하려면:

```bash
# 배포 스크립트에 실행 권한 부여 (처음 한 번만)
chmod +x deploy.sh

# 배포 스크립트 실행
./deploy.sh
```

### 수동 배포

스크립트를 사용하지 않고 수동으로 배포하려면 다음 명령을 순서대로 실행하세요:

```bash
# Maven으로 프로젝트 빌드
mvn clean package

# Tomcat의 웹앱 디렉토리에 WAR 파일 복사
# macOS
rm -rf $(brew --prefix tomcat)/libexec/webapps/ROOT
rm -f $(brew --prefix tomcat)/libexec/webapps/ROOT.war
cp target/Gromi-0.0.1-SNAPSHOT.war $(brew --prefix tomcat)/libexec/webapps/ROOT.war

# Linux
sudo rm -rf /var/lib/tomcat9/webapps/ROOT
sudo rm -f /var/lib/tomcat9/webapps/ROOT.war
sudo cp target/Gromi-0.0.1-SNAPSHOT.war /var/lib/tomcat9/webapps/ROOT.war
```

## 배포 후 서버 관리

### Tomcat 서버 시작 및 중지

```bash
# macOS
# Tomcat 서버 시작
brew services start tomcat

# 또는 직접 실행
$(brew --prefix tomcat)/bin/catalina run

# Tomcat 서버 중지
brew services stop tomcat

# Linux
# Tomcat 서버 시작
sudo systemctl start tomcat9

# Tomcat 서버 상태 확인
sudo systemctl status tomcat9

# Tomcat 서버 중지
sudo systemctl stop tomcat9
```

### 로그 확인

오류나 문제가 발생했을 때 Tomcat 로그를 확인하세요:

```bash
# macOS
tail -f $(brew --prefix tomcat)/libexec/logs/catalina.out

# Linux
sudo tail -f /var/log/tomcat9/catalina.out
```

## 운영 환경을 위한 추가 설정

실제 운영 환경에 배포할 때는 다음 사항을 고려하세요:

1. **보안 설정**:
   - HTTPS 설정
   - 방화벽 구성
   - 불필요한 기본 앱 제거

2. **성능 최적화**:
   - Tomcat 메모리 설정 조정
   - 연결 풀 최적화
   - 정적 리소스 캐싱

3. **백업 및 복구 계획**:
   - 정기적인 데이터베이스 백업
   - 환경 설정 백업
   - 롤백 전략

4. **모니터링**:
   - 서버 리소스 모니터링
   - 애플리케이션 로그 모니터링
   - 사용자 활동 모니터링 