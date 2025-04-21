<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gromi - 식물 관리의 시작</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/logo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/ae70f4c5ab.js"
        crossorigin="anonymous"></script>
    <script
        src="https://fonts.googleapis.com/css?family=Lato:300,400|Poppins:300,400,800&display=swap"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark"
        aria-label="main-navbar">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <div class="box">
                    <div class="title">
                        <span class="block"></span>
                        <h1>
                            Gromi<span></span>
                        </h1>
                    </div>
                </div>
            </a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navBoard"
                aria-controls="navBoard" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navBoard">
                <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                    <li class="nav-item"><a class="nav-link active"
                        aria-current="page" href="${pageContext.request.contextPath}/">홈</a></li>
                    <li class="nav-item"><a class="nav-link"
                        href="${pageContext.request.contextPath}/plant/list">식물 검색</a></li>
                    <li class="nav-item"><a class="nav-link"
                        href="${pageContext.request.contextPath}/plant/recommend">식물 추천</a></li>

                    <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#"
                        data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"
                                href="${pageContext.request.contextPath}/board/list?type=free">자유 게시판</a></li>
                            <li><a class="dropdown-item"
                                href="${pageContext.request.contextPath}/board/list?type=QA">Q&A 게시판</a></li>
                            <li><a class="dropdown-item"
                                href="${pageContext.request.contextPath}/board/list?type=sale">분양 게시판</a></li>
                        </ul></li>
                </ul>

                <div class="justify-content-end">
                    <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                        <li class="nav-item dropdown">
                            <%
                            if (uid == null) {
                            %> <a class="nav-link dropdown-toggle" href="#"
                            data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/login">로그인</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/register">회원가입</a></li>
                            </ul> <%
 } else {
 %> <a class="nav-link dropdown-toggle" href="#"
                            data-bs-toggle="dropdown" aria-expanded="false"><%=uname%></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/edit">개인정보수정</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
                            </ul> <%
 }
 %>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!--코드 작성-->
    <main>
        <!-- 인디케이터 포함 캐러셀 -->

        <div class="spinner-border roadingStatus" id="roadingStatus"
            role="status" style="display: none;">
            <span class="sr-only">Loading...</span>
        </div>

        <div class="flex-md-equal p-3 p-md-5 m-md-3 text-center bg1 fade-in-section">
            <div class="col-md-5 mx-auto my-3">
                <h1 class="display-3 fw-bold">GROMI</h1>
                <p class="lead fw-bold">
                    알고싶은 식물을 검색하고</br> 원하는 식물에 대해 찾아보세요!
                </p>
                <a class="btn btn-hover-effect btn-lg" onclick="clickedBtn()"
                    href="${pageContext.request.contextPath}/plant/list">많은 식물 알아보기</a>
            </div>
            <div id="carouselExampleIndicators" class="carousel slide"
                data-bs-ride="carousel">
                <!-- data-bs-interval : 슬라이드 지연 시간 -->
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="2000">
                        <div class="bg-dark shadow-sm mx-auto bg-image5 shadow-effect"
                            style="width: 640px; height: 300px; border-radius: 21px 21px 0 0; background-size: cover;"></div>

                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <div class="bg-dark shadow-sm mx-auto bg-image2 shadow-effect"
                            style="width: 640px; height: 300px; border-radius: 21px 21px 0 0; background-size: cover;"></div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <div class="bg-dark shadow-sm mx-auto bg-image6 shadow-effect"
                            style="width: 640px; height: 300px; border-radius: 21px 21px 0 0; background-size: cover;"></div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <div class="bg-dark shadow-sm mx-auto bg-image7 shadow-effect"
                            style="width: 640px; height: 300px; border-radius: 21px 21px 0 0;"></div>
                    </div>
                </div>
            </div>

        </div>

        <!-- 새로운 섹션: 특징 소개 -->
        <div id="feature-section" class="container my-5">
            <div class="row text-center">
                <div class="col-12">
                    <h2 class="section-title">주요 기능</h2>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="feature-box shadow-effect">
                        <i class="fas fa-search feature-icon"></i>
                        <h3 class="feature-title">식물 도감</h3>
                        <p>다양한 식물 정보를 검색하고 상세 정보를 확인해보세요.</p>
                        <a href="${pageContext.request.contextPath}/plant/list" class="btn btn-hover-effect mt-2">식물 도감 바로가기</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box shadow-effect">
                        <i class="fas fa-seedling feature-icon"></i>
                        <h3 class="feature-title">식물 추천</h3>
                        <p>나에게 맞는 식물을 추천받고 가꾸는 방법을 배워보세요.</p>
                        <a href="${pageContext.request.contextPath}/plant/recommend" class="btn btn-hover-effect mt-2">식물 추천 바로가기</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box shadow-effect">
                        <i class="fas fa-comments feature-icon"></i>
                        <h3 class="feature-title">커뮤니티</h3>
                        <p>다른 사용자들과 식물 정보를 공유하고 질문해보세요.</p>
                        <a href="${pageContext.request.contextPath}/board/free/list" class="btn btn-hover-effect mt-2">커뮤니티 바로가기</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid px-0 my-5 fade-in-section">
            <div class="content-container">
                <div class="feature-container text-bg-dark pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden shadow-effect">
                    <div class="my-3 py-3">
                        <h2 class="display-4 fw-bold">식물 추천</h2>
                        <p class="lead fw-normal">그로미의 추천을 받아 당신의 식물을 찾아보세요.</p>
                        <a class="btn btn-hover-effect btn-lg" href="${pageContext.request.contextPath}/plant/recommend">식물
                            추천 바로가기</a>
                    </div>
                    <div class="img-container mx-auto">
                        <div class="bg-image4" style="width: 100%; height: 100%;"></div>
                    </div>
                </div>
                <div class="feature-container bg-light pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden shadow-effect">
                    <div class="my-3 p-3">
                        <h2 class="display-4 fw-bold">커뮤니티</h2>
                        <p class="lead fw-normal">당신의 식물을 공유해보세요.</p>
                        <a class="btn btn-hover-effect btn-lg" href="${pageContext.request.contextPath}/board/list?type=free">커뮤니티
                            바로가기</a>
                    </div>
                    <div class="img-container mx-auto">
                        <div class="bg-image" style="width: 100%; height: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 새로운 섹션: 간단한 통계 -->
        <div class="container my-5 py-5 text-center fade-in-section">
            <h2 class="mb-5 section-title">GROMI와 함께하는 식물 생활</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="p-4">
                        <h2 class="display-4 text-success">1,000+</h2>
                        <p class="lead">식물 데이터베이스</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4">
                        <h2 class="display-4 text-success">50,000+</h2>
                        <p class="lead">행복한 사용자</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4">
                        <h2 class="display-4 text-success">10,000+</h2>
                        <p class="lead">커뮤니티 게시글</p>
                    </div>
                </div>
            </div>
        </div>

    </main>


    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="instagram" viewBox="0 0 16 16">
            <path
            d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
        </symbol>
    </svg>


    <footer class="navbar-dark bg-dark py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <h6 class="text-white">Gromi</h6>
                    <p class="text-white-50">
                        Company. 구름빵 | Owner. 이종민 <br>Businuess No. 051-890-1724 |
                        E-mail. cse@gmail.com <br> Address. 부산광역시 부산진구 엄광로176(가야동)
                    </p>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 class="text-white">Categories</h6>
                    <ul class="list-unstyled">
                        <li><a class="text-white-50 text-decoration-none" href="https://se.deu.ac.kr/se/index.do">ABOUT US</a></li>
                        <li><a class="text-white-50 text-decoration-none" href="${pageContext.request.contextPath}/">HOME</a></li>
                        <li><a class="text-white-50 text-decoration-none" href="${pageContext.request.contextPath}/plant/recommend">RECOMMEND</a></li>
                        <li><a class="text-white-50 text-decoration-none" href="${pageContext.request.contextPath}/board/list?type=free">COMMUNITY</a></li>
                    </ul>
                </div>

                <div class="col-xs-6 col-md-3">
                    <h6 class="text-white">Social</h6>
                    <ul class="list-unstyled">
                        <li><a class="text-white-50 text-decoration-none" href="https://www.instagram.com/deu_smartcse/">CSE Instagram</a></li>
                        <li><a class="text-white-50 text-decoration-none" href="https://open.kakao.com/o/gfoeUk8e">Cloud Class Kakao</a></li>
                    </ul>
                </div>
            </div>
            <hr class="border-secondary">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-6 col-xs-12">
                    <p class="text-white-50 mb-0">Copyright &copy; Goormbbang Company,
                        All rights reserved.</p>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12 text-end">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item">
                            <a class="text-white-50" href="https://www.instagram.com/nuexsera/"><i class="fa fa-instagram fa-lg"></i></a>
                        </li>
                        <li class="list-inline-item ms-3">
                            <a class="text-white-50" href="https://www.instagram.com/jongmln_/"><i class="fa fa-instagram fa-lg"></i></a>
                        </li>
                        <li class="list-inline-item ms-3">
                            <a class="text-white-50" href="https://www.instagram.com/min_gon_med._.j/"><i class="fa fa-instagram fa-lg"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    
    <script>
        // 스크롤 시 네비게이션 바 스타일 변경
        $(window).scroll(function() {
            if ($(this).scrollTop() > 50) {
                $('.navbar').addClass('scrolled');
            } else {
                $('.navbar').removeClass('scrolled');
            }
        });
    </script>
</body>
</html> 