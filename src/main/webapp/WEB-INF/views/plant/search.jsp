<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>식물 검색 - Gromi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <div class="container">
        <h1>식물 검색</h1>
        
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/plant/search" method="get">
                <input type="text" name="keyword" placeholder="식물 이름, 학명, 키워드 검색..." value="${keyword}" required>
                <button type="submit">검색</button>
            </form>
        </div>
        
        <div class="search-results">
            <c:if test="${not empty keyword}">
                <h2>'${keyword}' 검색 결과</h2>
            </c:if>
            
            <c:if test="${empty plants}">
                <p class="no-result">검색 결과가 없습니다.</p>
            </c:if>
            
            <c:forEach var="plant" items="${plants}">
                <div class="plant-card">
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
                    <div class="plant-info">
                        <h3>${plant.plantName}</h3>
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
                        <p class="short-desc">${plant.description.length() > 50 ? plant.description.substring(0, 50).concat('...') : plant.description}</p>
                        <a href="${pageContext.request.contextPath}/plant/detail?id=${plant.plantId}" class="detail-link">상세 정보</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="search-help">
            <h3>검색 도움말</h3>
            <ul>
                <li>식물 이름(예: 몬스테라, 스투키)</li>
                <li>학명(예: Monstera deliciosa)</li>
                <li>특징(예: 공기정화, 키우기쉬운)</li>
            </ul>
        </div>
        
        <div class="back-link">
            <a href="${pageContext.request.contextPath}/plant/list">식물 도감으로 돌아가기</a>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 