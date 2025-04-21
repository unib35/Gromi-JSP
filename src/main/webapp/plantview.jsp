<!DOCTYPE html>
<html lang="en">

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
            <script type = "text/javascript"src="js/jquery-3.7.0.min.js"></script>
            <script type = "text/javascript"src="js/plantcard.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
            <script
                src="https://fonts.googleapis.com/css?family=Lato:300,400|Poppins:300,400,800&display=swap"></script>
            <link href="footer.css" rel="stylesheet" type="text/css">
            <link href="logo.css" rel="stylesheet" type="text/css">
        <style>
            .nav-item {
                padding-left: 50px;
            }

            /* 기본 텍스트 스타일 및 크기 설정 */
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            /* 화면 너비가 768px 이상일 때 적용되는 스타일 */
            @media (min-width: 768px) {

            /* 더 큰 화면에서 텍스트 크기를 3.5rem으로 설정 */
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
                }
            }

            /* 구분선 스타일 */
            .b-example-divider {
                height: 3rem;
                /* 구분선 높이 */
                background-color: rgba(0, 0, 0, .1);
                /* 배경색 */
                border: solid rgba(0, 0, 0, .15);
                /* 테두리 */
                border-width: 1px 0;
                /* 테두리 굵기 */
                box-shadow: inset 0 .5em 1.5em(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
                /* 그림자 효과 */
            }

            /* 수직 구분선 스타일 */
            .b-example-vr {
                flex-shrink: 0;
                /* 수축 방지 */
                width: 1.5rem;
                /* 가로 폭 */
                height: 100vh;
                /* 높이 */
            }

            /* 아이콘 스타일 */
            .bi {
                vertical-align: -.125em;
                /* 수직 정렬 */
                fill: currentColor;
                /* 부모 요소의 글꼴 색상 채우기 */
            }

            /* 스크롤 가능 내비게이션 바 스타일 */
            .nav-scroller {
                position: relative;
                z-index: 2;
                height: 2.75rem;
                /* 고정 높이 */
                overflow-y: hidden;
                /* 수직 스크롤 숨김 */
            }

            /* 내비게이션 요소 스타일 */
            .nav-scrollernav {
                display: flex;
                flex-wrap: nowrap;
                /* 요소를 가로로 정렬 */
                padding-bottom: 1rem;
                /* 하단 패딩 */
                margin-top: -1px;
                /* 상단 여 */
                overflow-x: auto;
                /* 가로 스크롤 가능 설정 */
                text-align: center;
                /* 텍스트 중앙 정렬 */
                white-space: nowrap;
                /* 공백 줄바꿈 방지 */
                -webkit-overflow-scrolling: touch;
                /* 터치롤 효과 적용 */
            }

            body {
                margin: 0;
            }

            .header-container {
                display: flex;
                justify-content: flex-start;
                /* 왼쪽부터 배치 시작 */
                padding: 50px;
                padding-left: 0;
            }

            h1.fw-light {
                font-weight: 400;
            }

            /* 버튼에 마우스를 올려놓았을 때 배경색 변화 없음 */
            .btn-outline-secondary:hover {
                background-color: transparent !important;
                /* 배경색 투명으로 설정 */
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
			<a class="navbar-brand" href="./index.jsp">
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
						aria-current="page" href="./index.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./gardenList.jsp">식물 검색</a></li>
					<li class="nav-item"><a class="nav-link"
						href="./recommend.jsp">식물 추천</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="board/viewBoard.jsp?boardType=free">자유 게시판</a></li>
							<li><a class="dropdown-item"
								href="board/viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
							<li><a class="dropdown-item"
								href="board/viewBoard.jsp?boardType=sale">분양 게시판</a></li>
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
								<li><a class="dropdown-item" href="login/signin.jsp">로그인</a></li>
								<li><a class="dropdown-item" href="login/signup.jsp">회원가입</a></li>
							</ul> <%
 } else {
 %> <a class="nav-link dropdown-toggle" href="#"
							data-bs-toggle="dropdown" aria-expanded="false"><%=uname%></a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="login/editUser.jsp">개인정보수정</a></li>
								<li><a class="dropdown-item" href="login/logout.jsp">로그아웃</a></li>
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
        <!--<header>
            <div class="collapse bg-dark" id="navbarHeader">
              <div class="container">
                <div class="row">
                  <div class="col-sm-8 col-md-7 py-4">
                    <h4 class="text-white">About</h4>
                    <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
                  </div>
                  <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-white">Contact</h4>
                    <ul class="list-unstyled">
                      <li><a href="#" class="text-white">Follow on Twitter</a></li>
                      <li><a href="#" class="text-white">Like on Facebook</a></li>
                      <li><a href="#" class="text-white">Email me</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="navbar navbar-dark bg-dark shadow-sm">
              <div class="container">
                <a href="#" class="navbar-brand d-flex align-items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
                  <strong>Album</strong>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
              </div>
            </div>
          </header>-->

        <main>

            <section class="container">
                <div class="row py-lg-5 mx-0">
                    <div class="mx-auto px-0">
                        <div class="">
                            <h1 class="fw-light">어떤 종류의<br> 식물을 찾고있나요?</h1>
                            <br>
                            <p>
                                <a href="#" class="btn btn-outline-secondary btn-lg rounded-pill px-4 py-1"
                                    onclick="toggleButton(this)"
                                    style="border-color: green; color: green; font-size: 26px;" id="recommendBtn"></a>
                                <a href="#" class="btn btn-outline-secondary btn-lg rounded-pill px-4 py-1 mx-2"
                                    onclick="toggleButton(this)"
                                    style="border-color: green; color: green; font-size: 26px;" id="choiceBtn">
                                    action</a>
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <div class="album py-5 bg-light">
                <div class="container">

                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="plant_board">
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif"
                                    class="bd-placeholder-img card-img-top"
                                    width="100%"
                                    height="225"/>
                                <div class="card-body">
                                    <p class="card-text">식물 이름 로드중..</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        

                       
                    </div>
                </div>
            </div>
        </main>



        <!--footer-->
        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>Gromi</h6>
                        <p class="text-justify">Company. 구름빵 | Owner. 김시은
                            <br>Businuess No. 051-xxx-xxxx | E-mail. xxxxx@gmail.com <br>
                            Address. 부산광역시 부산진구 엄광로176(가야동)
                        </p>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Categories</h6>
                        <ul class="footer-links">
                            <li><a href="http://scanfcode.com/category/c-language/">ABOUT US</a></li>
                            <li><a href="http://scanfcode.com/category/front-end-development/">GUIDE</a></li>
                            <li><a href="http://scanfcode.com/category/back-end-development/">PRIVACY</a></li>
                            <li><a href="http://scanfcode.com/category/back-end-development/">HELP</a></li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Social</h6>
                        <ul class="footer-links">
                            <li><a href="http://scanfcode.com/about/">Instagram</a></li>
                            <li><a href="http://scanfcode.com/contact/">Kakao</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Copyright &copy; Goormbbang Company, All rights reserved.
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="https://www.instagram.com/nuexsera/"><i
                                        class="fa fa-instagram"></i></a></li>
                            <li><a class="twitter" href="https://www.instagram.com/jongmln_/"><i
                                        class="fa fa-instagram"></i></a></li>
                            <li><a class="dribbble" href="https://www.instagram.com/min_gon_med._.j/"><i
                                        class="fa fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>


        
    </body>

    <script>
        
        const category = localStorage.getItem('request');
        const detailCode = localStorage.getItem('detailCode');
        const queryString = category + "=" + detailCode;

        plantApi.recommend(queryString);

        console.log(category + "=" + detailCode);

        // const params = {
        //         apiKey: api_key,
        //         lightChkVal: '',
        //         grwhstleChkVal: '',
        //         lefcolrChkVal: '',
        //         lefmrkChkVal: '',
        //         flclrChkVal: '',
        //         fmldecolrChkVal: '',
        //         ignSeasonChkVal: '',
        //         winterLwetChkVal: '',
        //         priceType: '',
        //         priceTypeSel: '',
        //         waterCycleSel: '',
        //         pageNo: '',
        //         numOfRows: '',
        //     }

        let recommendData = localStorage.getItem('recommendBtn')
        let choiceData = localStorage.getItem('choiceBtn')

        const recommendBtn = document.querySelector('#recommendBtn');
        const choiceBtn = document.querySelector('#choiceBtn');

        recommendBtn.textContent = recommendData;
        choiceBtn.textContent = choiceData;
        console.log(recommendData);
        console.log(choiceData);
    </script>

</html>