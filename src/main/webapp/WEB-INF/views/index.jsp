<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp" />

<div class="jumbotron bg-light p-5 rounded">
    <h1 class="display-4">Gromi에 오신 것을 환영합니다!</h1>
    <p class="lead">Gromi는 식물 관리, 추천 및 커뮤니티 서비스를 제공합니다.</p>
    <hr class="my-4">
    <p>식물에 관한 정보를 찾거나, 자신에게 맞는 식물을 추천받거나, 다른 사람들과 소통해보세요.</p>
    <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/plant/recommend" role="button">식물 추천 받기</a>
</div>

<div class="row mt-4">
    <div class="col-md-4 mb-4">
        <div class="card h-100">
            <div class="card-body">
                <h5 class="card-title">식물 검색</h5>
                <p class="card-text">다양한 식물 정보를 검색하고 확인해보세요.</p>
                <a href="${pageContext.request.contextPath}/plant/list" class="btn btn-outline-primary">식물 검색하기</a>
            </div>
        </div>
    </div>
    <div class="col-md-4 mb-4">
        <div class="card h-100">
            <div class="card-body">
                <h5 class="card-title">식물 추천</h5>
                <p class="card-text">자신의 환경과 취향에 맞는 식물을 추천받아보세요.</p>
                <a href="${pageContext.request.contextPath}/plant/recommend" class="btn btn-outline-primary">식물 추천받기</a>
            </div>
        </div>
    </div>
    <div class="col-md-4 mb-4">
        <div class="card h-100">
            <div class="card-body">
                <h5 class="card-title">커뮤니티</h5>
                <p class="card-text">식물에 관심있는 사람들과 정보를 공유하고 소통해보세요.</p>
                <a href="${pageContext.request.contextPath}/board/list?type=free" class="btn btn-outline-primary">게시판 가기</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp" /> 