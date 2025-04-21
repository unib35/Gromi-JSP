<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />

<div class="container text-center py-5">
    <h1 class="display-1">500</h1>
    <h2 class="mb-4">서버 내부 오류</h2>
    <p class="lead mb-5">죄송합니다. 서버에 문제가 발생했습니다. 나중에 다시 시도해 주세요.</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 돌아가기</a>
</div>

<jsp:include page="../common/footer.jsp" /> 