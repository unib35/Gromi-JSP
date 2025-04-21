<!DOCTYPE html>
<html lang="en">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
String boardType = request.getParameter("boardType");
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/variable.js"></script>
<script
	src="https://fonts.googleapis.com/css?family=Lato:300,400|Poppins:300,400,800&display=swap"></script>
<link href="../footer.css" rel="stylesheet" type="text/css">
<link href="../logo.css" rel="stylesheet" type="text/css">
<style>
.nav-item {
	padding-left: 50px;
}
/* 버튼 선택했을 때 테두리 색 변경 */
.btn-outline-secondary:focus, .btn-outline-secondary:active,
	.btn-outline-secondary.active {
	outline: none;
	box-shadow: none;
	border-color: green !important;
	background-color: transparent !important; /* 배경색 투명으로 설정 */
	color: green !important; /* 글자색 초록색으로 설정 */
}

/* 버튼에 마우스를 올려놓았을 때 배경색 변화 없음 */
.btn-outline-secondary:hover {
	background-color: transparent !important; /* 배경색 투명으로 설정 */
}

.btn-outline-secondary:focus:not(:active) {
	box-shadow: none;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark"
		aria-label="main-navbar">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp">
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

            <div class="collapse navbar-collapse" id = "navBoard">
                <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../index.jsp">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../gardenList.jsp">식물 검색</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../recommend.jsp">식물 추천</a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                            aria-expanded="false">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="../board/viewBoard.jsp?boardType=free">자유 게시판</a></li>
                            <li><a class="dropdown-item" href="../board/viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
                            <li><a class="dropdown-item" href="../board/viewBoard.jsp?boardType=sale">분양 게시판</a></li>
                        </ul>
                    </li>
                </ul>
                
                <div class="justify-content-end">
                    <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                        <li class="nav-item dropdown">
                                <%if(uid == null) {%>
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                aria-expanded="false">마이페이지</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../login/signin.jsp">로그인</a></li>
                                <li><a class="dropdown-item" href="../login/signup.jsp">회원가입</a></li>
                            </ul>
                            <%} else{%>
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                aria-expanded="false"><%=uname %></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../login/editUser.jsp">개인정보수정</a></li>
                                <li><a class="dropdown-item" href="../login/logout.jsp">로그아웃</a></li>
                            </ul>
                            <%} %>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>


	<!--코드 작성-->
	<div
		class="container-fluid d-flex align-items-center justify-content-center"
		style="height: 100vh;">
		<div class="row">
			<div class="col-md-12 text-center mb-5">
				<h1 class="fw-bold"
					style="font-family: 'Arial Rounded MT Bold', sans-serif; font-size: 50px;">
					<span style="color: green; text-decoration: underline;">가격대</span>을
					찾고 있나요?
				</h1>
			</div>
			<div class="col-md-12 d-flex justify-content-center">
				<div class="d-flex justify-content-center">
					<button
						class="btn btn-primary btn-lg rounded-pill mx-2 custom-button"
						onclick="toggleButton(this)"
						style="border-color: green; color: white; font-size: 1.2rem; background-color: green;">&lt;</button>
					<button
						class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
						onclick="toggleButton(this)"
						style="border-color: gray; color: gray; font-size: 26px;">5천원
						미만</button>
					<button
						class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
						onclick="toggleButton(this)"
						style="border-color: gray; color: gray; font-size: 26px;">5천원-1만원</button>
					<button
						class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
						onclick="toggleButton(this)"
						style="border-color: gray; color: gray; font-size: 26px;">1-3만원</button>
					<button
						class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
						onclick="toggleButton(this)"
						style="border-color: gray; color: gray; font-size: 26px;">3-5만원</button>
				</div>
			</div>
			<div class="col-md-12 d-flex justify-content-center mt-3">
				<div class="d-flex justify-content-center">
					<button
						class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
						onclick="toggleButton(this)"
						style="border-color: gray; color: gray; font-size: 26px;">5-10만원</button>
					<button
						class="btn btn-outline-secondary btn-lg rounded-pill mx-2 px-4 py-1"
						onclick="toggleButton(this)"
						style="border-color: gray; color: gray; font-size: 26px;">10만원
						이상</button>
					<button
						class="btn btn-primary btn-lg rounded-pill mx-2 custom-button"
						onclick="toggleButton(this)"
						style="border-color: green; color: white; font-size: 1.2rem; background-color: green;">검색</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		function toggleButton(button) {
			// 첫 페이지 버튼의 텍스트
			const requestCategory = localStorage.getItem('recommendBtn');
			// 현재 페이지에서 선택한 버튼의 텍스트
			const btnText = button.textContent;
			// 선택한 세부 항목에 대한 코드
			const detailCode = categoryCode[requestCategory][btnText];

			localStorage.setItem('detailCode', detailCode);
			localStorage.setItem('choiceBtn', button.textContent);
			button.classList.toggle('active');
			button.style.borderColor = button.classList.contains('active') ? 'green'
					: 'gray';
			button.style.color = button.classList.contains('active') ? 'white'
					: 'gray';
			if (button.classList.contains('active')) {
				// 선택한 버튼의 텍스트 가져오기
				let buttonText = button.textContent.trim();

				// 버튼이 '>'인 경우 recommend.jsp로 이동
				if (buttonText === '<') {
					window.location.href = '../recommend.jsp';
				} else if (buttonText === '5천원 미만') {
					window.location.href = '../plantview.jsp';
				} else if (buttonText === '5천원-1만원') {
					window.location.href = '../plantview.jsp';
				} else if (buttonText === '1-3만원') {
					window.location.href = '../plantview.jsp';
				} else if (buttonText === '3-5만원') {
					window.location.href = '../plantview.jsp';
				} else if (buttonText === '5-10만원') {
					window.location.href = '../plantview.jsp';
				} else if (buttonText === '10만원 이상') {
					window.location.href = '../plantview.jsp';
				}
			}
		}
	</script>


	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="instagram" viewBox="0 0 16 16">
            <path
			d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
        </symbol>
    </svg>


	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<h6>Gromi</h6>
					<p class="text-justify">
						Company. 구름빵 | Owner. 이종민 <br>Businuess No. 051-890-1724 |
						E-mail. cse@gmail.com <br> Address. 부산광역시 부산진구 엄광로176(가야동)
					</p>
				</div>

				<div class="col-xs-6 col-md-3">
					<h6>Categories</h6>
					<ul class="footer-links">
						<li><a href="https://se.deu.ac.kr/se/index.do">ABOUT US</a></li>
						<li><a href="./index.jsp">HOME</a></li>
						<li><a href="./recommend.jsp">RECOMMEND</a></li>
						<li><a href="./board/viewBoard.jsp?boardType=free">COMMUNITY</a></li>
					</ul>
				</div>

				<div class="col-xs-6 col-md-3">
					<h6>Social</h6>
					<ul class="footer-links">
						<li><a href="https://www.instagram.com/deu_smartcse/">CSE
								Instagram</a></li>
						<li><a href="https://open.kakao.com/o/gfoeUk8e">Cloud
								Class Kakao</a></li>
					</ul>
				</div>
			</div>
			<hr>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-6 col-xs-12">
					<p class="copyright-text">Copyright &copy; Goormbbang Company,
						All rights reserved.</p>
				</div>

				<div class="col-md-4 col-sm-6 col-xs-12">
					<ul class="social-icons">
						<li><a class="facebook"
							href="https://www.instagram.com/nuexsera/"><i
								class="fa fa-instagram"></i></a></li>
						<li><a class="twitter"
							href="https://www.instagram.com/jongmln_/"><i
								class="fa fa-instagram"></i></a></li>
						<li><a class="dribbble"
							href="https://www.instagram.com/min_gon_med._.j/"><i
								class="fa fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>