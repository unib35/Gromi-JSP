<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유 게시판 - Gromi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <div class="container">
        <div class="board-header">
            <h1>자유 게시판</h1>
            <div class="board-menu">
                <a href="${pageContext.request.contextPath}/board/free/list" class="active">자유 게시판</a>
                <a href="${pageContext.request.contextPath}/board/qa/list">Q&A 게시판</a>
            </div>
        </div>
        
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/board/free/search" method="get">
                <input type="text" name="keyword" placeholder="검색어를 입력하세요..." value="${keyword}">
                <button type="submit">검색</button>
            </form>
        </div>
        
        <div class="board-list">
            <table>
                <thead>
                    <tr>
                        <th class="num">번호</th>
                        <th class="title">제목</th>
                        <th class="author">작성자</th>
                        <th class="date">작성일</th>
                        <th class="views">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty boardList}">
                        <tr>
                            <td colspan="5" class="no-data">게시글이 없습니다.</td>
                        </tr>
                    </c:if>
                    
                    <c:forEach var="post" items="${boardList}" varStatus="status">
                        <tr>
                            <td class="num">${post.postId}</td>
                            <td class="title">
                                <a href="${pageContext.request.contextPath}/board/free/view?id=${post.postId}">${post.title}</a>
                            </td>
                            <td class="author">${post.userId}</td>
                            <td class="date">
                                <fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td class="views">${post.viewCount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="board-actions">
            <c:if test="${not empty sessionScope.userId}">
                <a href="${pageContext.request.contextPath}/board/free/write" class="write-btn">글쓰기</a>
            </c:if>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 