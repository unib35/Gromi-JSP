<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />

<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="text-center">로그인</h3>
            </div>
            <div class="card-body">
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/user/signin" method="post">
                    <div class="mb-3">
                        <label for="id" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" required>
                    </div>
                    <div class="mb-3">
                        <label for="pw" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="pw" name="pw" required>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
            <div class="card-footer text-center">
                <p>계정이 없으신가요? <a href="${pageContext.request.contextPath}/user/signup">회원가입</a></p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" /> 