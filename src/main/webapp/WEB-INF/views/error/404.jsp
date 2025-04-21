<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />

<div class="container text-center py-5">
    <h1 class="display-1">404</h1>
    <h2 class="mb-4">페이지를 찾을 수 없습니다</h2>
    <p class="lead mb-5">요청하신 페이지가 존재하지 않거나 이동되었을 수 있습니다.</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 돌아가기</a>
</div>

<jsp:include page="../common/footer.jsp" /> 