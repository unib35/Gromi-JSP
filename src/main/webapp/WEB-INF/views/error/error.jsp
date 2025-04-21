<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오류 - Gromi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <div class="container">
        <div class="error-page">
            <div class="error-icon">
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <h1>오류가 발생했습니다</h1>
            
            <div class="error-message">
                <c:choose>
                    <c:when test="${not empty errorMessage}">
                        <p>${errorMessage}</p>
                    </c:when>
                    <c:otherwise>
                        <p>알 수 없는 오류가 발생했습니다. 잠시 후 다시 시도해주세요.</p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/" class="home-btn">홈으로 돌아가기</a>
                <button onclick="history.back()" class="back-btn">이전 페이지로 돌아가기</button>
            </div>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 