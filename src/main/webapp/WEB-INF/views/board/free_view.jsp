<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${post.title} - 자유 게시판 - Gromi</title>
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
        
        <div class="post-view">
            <div class="post-title">
                <h2>${post.title}</h2>
                <div class="post-info">
                    <span class="author">작성자: ${post.userId}</span>
                    <span class="date">작성일: <fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd HH:mm"/></span>
                    <span class="views">조회수: ${post.viewCount}</span>
                </div>
            </div>
            
            <div class="post-content">
                ${post.content}
            </div>
            
            <div class="post-actions">
                <a href="${pageContext.request.contextPath}/board/free/list" class="list-btn">목록</a>
                
                <c:if test="${sessionScope.userId eq post.userId}">
                    <a href="${pageContext.request.contextPath}/board/free/edit?id=${post.postId}" class="edit-btn">수정</a>
                    <a href="javascript:void(0);" onclick="deletePost(${post.postId});" class="delete-btn">삭제</a>
                </c:if>
            </div>
        </div>
        
        <div class="comments-section">
            <h3>댓글 ${comments.size()}개</h3>
            
            <div class="comment-list">
                <c:if test="${empty comments}">
                    <p class="no-comments">댓글이 없습니다.</p>
                </c:if>
                
                <c:forEach var="comment" items="${comments}">
                    <div class="comment">
                        <div class="comment-info">
                            <span class="comment-author">${comment.userId}</span>
                            <span class="comment-date"><fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd HH:mm"/></span>
                        </div>
                        <div class="comment-content">
                            ${comment.content}
                        </div>
                        
                        <c:if test="${sessionScope.userId eq comment.userId}">
                            <div class="comment-actions">
                                <a href="javascript:void(0);" onclick="editComment(${comment.commentId});" class="edit-comment-btn">수정</a>
                                <a href="javascript:void(0);" onclick="deleteComment(${comment.commentId});" class="delete-comment-btn">삭제</a>
                            </div>
                            
                            <div id="edit-form-${comment.commentId}" class="edit-comment-form" style="display: none;">
                                <form action="${pageContext.request.contextPath}/board/comment/edit" method="post">
                                    <input type="hidden" name="commentId" value="${comment.commentId}">
                                    <textarea name="content" required>${comment.content}</textarea>
                                    <div class="form-actions">
                                        <button type="submit">수정하기</button>
                                        <button type="button" onclick="cancelEdit(${comment.commentId});">취소</button>
                                    </div>
                                </form>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            
            <c:if test="${not empty sessionScope.userId}">
                <div class="comment-form">
                    <form action="${pageContext.request.contextPath}/board/comment/add" method="post">
                        <input type="hidden" name="boardType" value="free">
                        <input type="hidden" name="postId" value="${post.postId}">
                        <textarea name="content" placeholder="댓글을 작성해주세요." required></textarea>
                        <button type="submit">댓글 등록</button>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
    
    <script>
        function deletePost(postId) {
            if (confirm("정말 삭제하시겠습니까?")) {
                location.href = "${pageContext.request.contextPath}/board/free/delete?id=" + postId;
            }
        }
        
        function editComment(commentId) {
            document.getElementById("edit-form-" + commentId).style.display = "block";
        }
        
        function cancelEdit(commentId) {
            document.getElementById("edit-form-" + commentId).style.display = "none";
        }
        
        function deleteComment(commentId) {
            if (confirm("댓글을 삭제하시겠습니까?")) {
                location.href = "${pageContext.request.contextPath}/board/comment/delete?id=" + commentId;
            }
        }
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html> 