<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gromi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/logo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/ae70f4c5ab.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plantcard.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="main-navbar">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <div class="box">
                    <div class="title">
                        <span class="block"></span>
                        <h1>Gromi<span></span></h1>
                    </div>
                </div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navBoard" 
                    aria-controls="navBoard" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navBoard">
                <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">홈</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/plant/list">식물 검색</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/plant/recommend">식물 추천</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?type=free">자유 게시판</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?type=QA">Q&A 게시판</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/list?type=sale">분양 게시판</a></li>
                        </ul>
                    </li>
                </ul>

                <div class="justify-content-end">
                    <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                        <li class="nav-item dropdown">
                            <c:choose>
                                <c:when test="${empty sessionScope.user_id}">
                                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/signin">로그인</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/signup">회원가입</a></li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">${sessionScope.user_name}</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/edit">개인정보수정</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div class="container mt-4"> 