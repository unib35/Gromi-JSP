<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나에게 맞는 식물 추천 - Gromi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <div class="container">
        <h1>나에게 맞는 식물 추천</h1>
        
        <div class="recommendation-form">
            <p>식물 가드닝 경험 수준을 선택해주세요. 당신에게 적합한 식물을 추천해 드립니다.</p>
            
            <form action="${pageContext.request.contextPath}/plant/recommend" method="get">
                <div class="difficulty-selection">
                    <label>
                        <input type="radio" name="difficulty" value="1" ${selectedDifficulty == 1 ? 'checked' : ''}>
                        <span class="difficulty-level">초보자 (Level 1)</span>
                        <span class="difficulty-desc">식물을 처음 키우거나 경험이 거의 없습니다.</span>
                    </label>
                    <label>
                        <input type="radio" name="difficulty" value="2" ${selectedDifficulty == 2 ? 'checked' : ''}>
                        <span class="difficulty-level">초보자+ (Level 2)</span>
                        <span class="difficulty-desc">몇 가지 식물을 키워 본 경험이 있습니다.</span>
                    </label>
                    <label>
                        <input type="radio" name="difficulty" value="3" ${selectedDifficulty == 3 ? 'checked' : ''}>
                        <span class="difficulty-level">중급자 (Level 3)</span>
                        <span class="difficulty-desc">여러 종류의 식물을 키워본 경험이 있습니다.</span>
                    </label>
                    <label>
                        <input type="radio" name="difficulty" value="4" ${selectedDifficulty == 4 ? 'checked' : ''}>
                        <span class="difficulty-level">고급자 (Level 4)</span>
                        <span class="difficulty-desc">까다로운 식물도 키울 수 있습니다.</span>
                    </label>
                    <label>
                        <input type="radio" name="difficulty" value="5" ${selectedDifficulty == 5 ? 'checked' : ''}>
                        <span class="difficulty-level">전문가 (Level 5)</span>
                        <span class="difficulty-desc">모든 종류의 식물을 키울 수 있습니다.</span>
                    </label>
                </div>
                
                <button type="submit" class="recommend-button">추천 받기</button>
            </form>
        </div>
        
        <c:if test="${not empty plants}">
            <div class="recommendation-results">
                <h2>
                    <c:choose>
                        <c:when test="${selectedDifficulty == 1}">초보자</c:when>
                        <c:when test="${selectedDifficulty == 2}">초보자+</c:when>
                        <c:when test="${selectedDifficulty == 3}">중급자</c:when>
                        <c:when test="${selectedDifficulty == 4}">고급자</c:when>
                        <c:when test="${selectedDifficulty == 5}">전문가</c:when>
                    </c:choose>
                    님을 위한 추천 식물
                </h2>
                
                <div class="plant-list">
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
            </div>
        </c:if>
        
        <div class="back-link">
            <a href="${pageContext.request.contextPath}/plant/list">식물 도감으로 돌아가기</a>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 