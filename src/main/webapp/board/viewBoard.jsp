<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ConnectMysql"%>
<%@ page import="model.boarddata.BoardDAO"%>
<%@ page import="model.boarddata.Board"%>
<%@ page import="java.util.ArrayList"%>
<%
String boardType = request.getParameter("boardType");
String pageTemp = request.getParameter("page");
Integer pageNum;
if(pageTemp == null) pageNum = 1;
else pageNum = Integer.parseInt(pageTemp);
%>
<!DOCTYPE html>
<html lang="en">
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
BoardDAO boardDAO = new BoardDAO();
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
<link href="./logo.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/ae70f4c5ab.js"
	crossorigin="anonymous"></script>
<script
	src="https://fonts.googleapis.com/css?family=Lato:300,400|Poppins:300,400,800&display=swap"></script>
<link href="../footer.css" rel="stylesheet" type="text/css">
<link href="../logo.css" rel="stylesheet" type="text/css">
<style>
.nav-item {
	padding-left: 50px;
}
</style>
<style>
.board {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}
</style>
<style>
.post-row:hover {
	background-color: #f8f9fa;
	cursor: pointer;
}
</style>
<style>
  .fixed-table {
    table-layout: fixed;
    width: 100%;
  }

  .ellipsis {
    display: block;
    width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    word-wrap: break-word;
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


	<!--코드 작성 시작-->

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<%
				if (boardType == null || boardType.equals("free")) {
					boardType = "free";
				%>
				<h1 class="mb-4">자유 게시판</h1>
				<%
				} else if (boardType.equals("QA")) {
				%>
				<h1 class="mb-4">Q&A 게시판</h1>
				<%
				} else if (boardType.equals("sale")) {
				%>
				<h1 class="mb-4">분양 게시판</h1>
				<%
				}
				ArrayList<Board> boards = (ArrayList) boardDAO.findByBdType(boardType);
				int postCnt = boards.size();
				int pageCnt = 0;
				if(postCnt%4 == 0) pageCnt = postCnt/4;
				else pageCnt = postCnt/4 + 1;
				int startPage = (pageNum - 1) * 4;
				int lastPage = (pageNum * 4);
				int nextPage = pageNum + 1;
				if(nextPage > pageCnt) nextPage = pageCnt;
				int prevPage = pageNum - 1;
				if(prevPage < 1) prevPage = 1;
				if(lastPage > postCnt) lastPage = postCnt;
				
				%>
				<table class="table fixed-table">
					<tbody>
						<%
						for (int i = startPage; i < lastPage; i++) {
							Board board = boards.get(i);
						%>
						<tr class="border-bottom border-1 post-row"
							onclick="location.href='viewPost.jsp?bdNo=<%=board.getBdNo() %>'">
							<td><strong><%=board.getBdTitle() %></strong><br> 
							<div class="ellipsis"><%=board.getBdContent() %></div> 
							<span><%=board.getUserName() %></span> · 
							<span><%=board.getBdDate() %></span> · 
							<span>조회수 <%=board.getBdViewCnt() %></span></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="d-flex justify-content-between align-items-center">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="viewBoard.jsp?boardType=<%=boardType%>&page=<%=prevPage%>"
								>이전</a></li>
								<%for(int i = 1; i <= pageCnt; i++){ 
								if(i == pageNum){%>
							<li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
							<%}else{ %>
							<li class="page-item"><a class="page-link" href="viewBoard.jsp?boardType=<%=boardType%>&page=<%=i%>"><%=i%></a></li>
							<%}}%>
							<li class="page-item"><a class="page-link" href="viewBoard.jsp?boardType=<%=boardType%>&page=<%=nextPage%>">다음</a></li>
						</ul>
					</nav>
					<button type="button" class="btn btn-outline-dark"
						onclick=<%if (uid != null) {%> "location.href='createPost.jsp?boardType=<%=boardType %>'
						"<%} else {%>"alert('로그인을 해주세요!')"<%}%>>게시글 작성</button>
				</div>
			</div>
		</div>
	</div>



	<!--코드 작성 종료-->

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