<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 - 자유 게시판 - Gromi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <div class="container">
        <div class="board-header">
            <h1>자유 게시판 - 글 수정</h1>
            <div class="board-menu">
                <a href="${pageContext.request.contextPath}/board/free/list" class="active">자유 게시판</a>
                <a href="${pageContext.request.contextPath}/board/qa/list">Q&A 게시판</a>
            </div>
        </div>
        
        <div class="edit-form">
            <form action="${pageContext.request.contextPath}/board/free/edit" method="post">
                <input type="hidden" name="id" value="${post.postId}">
                
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" value="${post.title}" required>
                </div>
                
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content" rows="15" required>${post.content}</textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="submit-btn">수정하기</button>
                    <a href="${pageContext.request.contextPath}/board/free/view?id=${post.postId}" class="cancel-btn">취소</a>
                </div>
            </form>
        </div>
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 