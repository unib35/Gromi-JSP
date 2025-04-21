<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${plant.plantName} - Gromi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <div class="container">
        <div class="plant-detail">
            <div class="back-link">
                <a href="${pageContext.request.contextPath}/plant/list">← 목록으로 돌아가기</a>
            </div>
            
            <div class="plant-header">
                <div class="plant-image">
                    <c:choose>
                        <c:when test="${not empty plant.imageUrl}">
                            <img src="${plant.imageUrl}" alt="${plant.plantName}">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/resources/images/default_plant.jpg" alt="기본 이미지">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="plant-title">
                    <h1>${plant.plantName}</h1>
                    <p class="scientific-name">${plant.scientificName}</p>
                    <div class="difficulty">
                        난이도: 
                        <c:forEach begin="1" end="5" varStatus="loop">
                            <c:choose>
                                <c:when test="${loop.index <= plant.difficulty}">
                                    <span class="difficulty-dot filled"></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="difficulty-dot"></span>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </div>
            
            <div class="plant-description">
                <h2>식물 소개</h2>
                <p>${plant.description}</p>
            </div>
            
            <div class="plant-growing-info">
                <h2>재배 조건</h2>
                <div class="growing-conditions">
                    <div class="condition">
                        <h3>햇빛</h3>
                        <p>${plant.sunlightNeeds}</p>
                    </div>
                    <div class="condition">
                        <h3>물주기</h3>
                        <p>${plant.waterNeeds}</p>
                    </div>
                    <div class="condition">
                        <h3>온도</h3>
                        <p>${plant.optimalTemp}</p>
                    </div>
                </div>
            </div>
            
            <div class="plant-care-tips">
                <h2>관리 팁</h2>
                <c:if test="${empty careTips}">
                    <p>등록된 관리 정보가 없습니다.</p>
                </c:if>
                
                <c:forEach var="careTip" items="${careTips}">
                    <div class="care-tip">
                        <h3>${careTip.careType}</h3>
                        <p>${careTip.careDescription}</p>
                        <div class="care-details">
                            <span class="frequency">주기: ${careTip.frequency}</span>
                            <span class="season">적용 계절: ${careTip.season}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="related-community">
                <h2>관련 커뮤니티 게시글</h2>
                <p>
                    <a href="${pageContext.request.contextPath}/board/qa/list" class="community-link">Q&A 게시판 바로가기</a>
                </p>
            </div>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 