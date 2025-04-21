#!/bin/bash

# Gromi 배포 스크립트

# Maven을 사용하여 프로젝트 빌드
echo "프로젝트 빌드 중..."
mvn clean package

# 배포 결과 확인
if [ $? -ne 0 ]; then
    echo "빌드 실패. 오류를 확인하세요."
    exit 1
fi

# Tomcat webapps 디렉토리 경로 가져오기
TOMCAT_PATH=$(brew --prefix tomcat)/libexec/webapps

# 기존 ROOT 애플리케이션 제거
echo "기존 ROOT 애플리케이션 제거 중..."
rm -rf $TOMCAT_PATH/ROOT
rm -f $TOMCAT_PATH/ROOT.war

# 새 WAR 파일 복사
echo "새 애플리케이션 배포 중..."
cp target/Gromi-0.0.1-SNAPSHOT.war $TOMCAT_PATH/ROOT.war

echo "배포 완료!"
echo "이제 Tomcat이 실행 중이라면 http://localhost:8080 에서 애플리케이션에 접속할 수 있습니다." 