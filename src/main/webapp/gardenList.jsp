<%@page import="java.util.HashMap"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="./style.css">
<link href="./footer.css" rel="stylesheet">
<link href="./logo.css" rel="stylesheet">

<script src="https://kit.fontawesome.com/ae70f4c5ab.js"
	crossorigin="anonymous"></script>
<script
	src="https://fonts.googleapis.com/css?family=Lato:300,400|Poppins:300,400,800&display=swap"></script>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
	
</script>



<title>실내정원용 식물</title>
<script type="text/javascript">
	//상세보기
	function fncDtl(cNo) {
		with (document.searchApiForm) {
			cntntsNo.value = cNo;
			method = "get";
			action = "gardenDtl.jsp";
			target = "_self";
			submit();
		}
	}

	//검색
	function fncSearch() {
		with (document.searchApiForm) {

			pageNo.value = "1";
			method = "get";
			action = "gardenList.jsp";
			target = "_self";
			submit();
		}
	}
	//페이지 이동
	function fncGoPage(page) {
		with (document.searchApiForm) {
			pageNo.value = page;
			method = "get";
			action = "gardenList.jsp";
			target = "_self";
			submit();
		}
	}

	function fncWordTypeOption() {
		var wordType = document.getElementById("wordType")[document
				.getElementById("wordType").selectedIndex].value;

		if (wordType == "cntntsSj") {
			document.getElementById("englishSrch").style.display = "none";
			document.getElementById("koreanSrch").style.display = "block";
		} else if (wordType == "plntbneNm") {
			document.getElementById("koreanSrch").style.display = "none";
			document.getElementById("englishSrch").style.display = "block";
		}
	}

	function fncContSearch(word) {
		document.searchApiForm.word.value = word;
		fncSearch();
	}

	function fncCheckValue(obj) {
		var checkValue = "";

		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				checkValue += obj[i].value + ",";
			}
		}

		if (checkValue != "")
			checkValue = checkValue.substring(0, checkValue.length - 1);

		return checkValue;
	}
</script>
</head>
<body>

	<header> <nav
		class="navbar navbar-expand-md navbar-dark bg-dark"
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
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navBoard" aria-controls="navBoard"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navBoard">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="./index.jsp">홈</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./gardenList.jsp">식물 검색</a></li>
				<li class="nav-item"><a class="nav-link" href="./recommend.jsp">식물
						추천</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
					aria-expanded="false">커뮤니티</a>
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
	</nav> </header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel" data-bs-wrap="true">
		<div class="carousel-inner">
			<!-- data-bs-interval : 슬라이드 지연 시간 -->
			<div class="carousel-item active bg-success" data-bs-interval="2000">
				<h6 class="text-center fw-normal text-white">
					원하던 식물을 그로미에서 만나보세요 :-)
					</h3>
			</div>
			<div class="carousel-item bg-success" data-bs-interval="2000">
				<h6 class="text-center fw-normal text-white">
					여러분의 식물을 커뮤니티를 통해 공유해보세요.
					</h3>
			</div>
			<div class="carousel-item bg-success" data-bs-interval="2000">
				<h6 class="text-center fw-normal text-white">
					식물에 대해 알아보세요
					</h3>
			</div>
		</div>
		<!--
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		    -->
	</div>
	<main> <%
 String sType = request.getParameter("sType") == null ? "" : request.getParameter("sType");
 String wordType = request.getParameter("wordType") == null ? "" : request.getParameter("wordType");
 String word = request.getParameter("word") == null ? "" : request.getParameter("word");
 String priceType = request.getParameter("priceType") == null ? "" : request.getParameter("priceType");
 String priceTypeSel = request.getParameter("priceTypeSel") == null ? "" : request.getParameter("priceTypeSel");
 String waterCycleSel = request.getParameter("waterCycleSel") == null ? "" : request.getParameter("waterCycleSel");
 %>
	<form name="searchApiForm">
		<input type="hidden" name="cntntsNo"> <input type="hidden"
			name="pageNo"
			value="<%=request.getParameter("pageNo") == null ? "" : request.getParameter("pageNo")%>">
		<input type="hidden" name="word"
			value="<%=request.getParameter("word") == null ? "" : request.getParameter("word")%>">

		<div class="container">
			<table class="mt-5 ">
				<tr>
					<th>
						<h1 class="h1 fw-bold">
							어떤 종류의 <br> 식물을 찾고 있나요?
						</h1>
					</th>
				</tr>
				<tr>
					<td><select class="form-select form-select-md" name="sType">
							<option value="sCntntsSj"
								<%=sType.equals("sCntntsSj") ? "selected" : ""%>>식물명</option>
							<option value="sPlntbneNm"
								<%=sType.equals("sPlntbneNm") ? "selected" : ""%>>한명</option>
							<option value="sPlntzrNm"
								<%=sType.equals("sPlntzrNm") ? "selected" : ""%>>영명</option>
					</select></td>

				</tr>
				<tr>
					<td><input class="form-control form-control-lg mr-3"
						type="text" name="sText"
						value="<%=request.getParameter("sText") == null ? "" : request.getParameter("sText")%>">
					</td>
					<td><button class="btn btn-secondary btn-lg" type="button"
							name="search" onclick="return fncSearch();">검색</button></td>
				</tr>

			</table>

			<%
			//apiKey
			String apiKey = "20230522XJWYEFWOSP5UXDCRIUCMG";
			//서비스 명
			String serviceName = "garden";
			//오퍼레이션 명	
			String[] operationName = { "lightList", "grwhstleList", "lefcolrList", "lefmrkList", "flclrList", "fmldecolrList",
					"ignSeasonList", "winterLwetList", "priceTypeList", "waterCycleList" };

			HashMap<String, Document> operationNameMap = new HashMap<String, Document>();

			Document doc = null;

			for (int i = 0; i < operationName.length; i++) {
				//XML 받을 URL 생성
				String parameter = "/" + serviceName + "/" + operationName[i];
				parameter += "?apiKey=" + apiKey;

				//서버와 통신
				URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
				InputStream apiStream = apiUrl.openStream();

				try {
					//xml document
					doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
					operationNameMap.put(operationName[i], doc);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					apiStream.close();
				}
			}

			int size = 0;
			String resultCode = "";
			String resultMsg = "";
			NodeList items = null;
			NodeList codes = null;
			NodeList codeNms = null;
			%>

			</table>
	</form>

	<%
	//목록
	if (operationName.length == operationNameMap.size()) {
		//오퍼레이션 명
		String operationNameList = "gardenList";

		//XML 받을 URL 생성
		String parameter = "/" + serviceName + "/" + operationNameList;
		parameter += "?apiKey=" + apiKey;
		parameter += "&pageNo=" + request.getParameter("pageNo");

		//검색 조건
		String[] searchNmArr = { "sType", "sText", "wordType", "word" };
		for (int i = 0; i < searchNmArr.length; i++) {
			if (request.getParameter(searchNmArr[i]) != null && !request.getParameter(searchNmArr[i]).equals("")) {
		parameter += "&" + searchNmArr[i] + "=" + request.getParameter(searchNmArr[i]);
			}
		}
		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
		InputStream apiStream = apiUrl.openStream();

		try {
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			apiStream.close();
		}

		items = doc.getElementsByTagName("item");
		size = doc.getElementsByTagName("item").getLength();
		NodeList cntntsNos = doc.getElementsByTagName("cntntsNo");
		NodeList cntntsSjs = doc.getElementsByTagName("cntntsSj");
		NodeList rtnFileSeCodes = doc.getElementsByTagName("rtnFileSeCode");
		NodeList rtnFileSns = doc.getElementsByTagName("rtnFileSn");
		NodeList rtnOrginlFileNms = doc.getElementsByTagName("rtnOrginlFileNm");
		NodeList rtnStreFileNms = doc.getElementsByTagName("rtnStreFileNm");
		NodeList rtnFileCourss = doc.getElementsByTagName("rtnFileCours");
		NodeList rtnImageDcs = doc.getElementsByTagName("rtnImageDc");
		NodeList rtnThumbFileNms = doc.getElementsByTagName("rtnThumbFileNm");
		NodeList rtnImgSeCodes = doc.getElementsByTagName("rtnImgSeCode");

		try {
			resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();
		} catch (Exception e) {
			resultCode = "";
		}
		try {
			resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();
		} catch (Exception e) {
			resultMsg = "";
		}

		if (resultCode.equals("00")) {
	%>

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-4">
				<%
				if (size == 0) {
				%>
				<h2>조회한 정보가 없습니다.</h2>
				<%
				} else {
				%>


				<%
				for (int i = 0; i < size; i++) {
					//콘텐츠 번호
					String cntntsNo = cntntsNos.item(i).getFirstChild() == null ? "" : cntntsNos.item(i).getFirstChild().getNodeValue();
					//콘텐츠 제목
					String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? "" : cntntsSjs.item(i).getFirstChild().getNodeValue();
					//저장 파일명
					String rtnStreFileNm = rtnStreFileNms.item(i).getFirstChild() == null ? ""
					: rtnStreFileNms.item(i).getFirstChild().getNodeValue();
					String[] rtnStreFileNmArr = rtnStreFileNm.split("[|]");
					//파일경로
					String rtnFileCours = rtnFileCourss.item(i).getFirstChild() == null ? ""
					: rtnFileCourss.item(i).getFirstChild().getNodeValue();
					String[] rtnFileCoursArr = rtnFileCours.split("[|]");
				%>

				<!-- 식물카드 -->
				<div class="plant_list-item col mr-3">
					<a id="plant_detail-link"
						href="javascript:fncDtl('<%=cntntsNo%>');"
						style="text-decoration: none; color: black;"> <img
						src="http://www.nongsaro.go.kr/<%=rtnFileCoursArr[0]%>/<%=rtnStreFileNmArr[0]%>"
						class="rounded" alt="<%=cntntsSj + "사진"%>" width="100%"
						height="200">
						<div class="plant_title mb-3">

							<p class="h6 mt-2"><%=cntntsSj%></p>
						</div>
					</a>
				</div>

				<%
				}
				}
				%>
			</div>
		</div>
	</div>


	<%
	//페이징 처리
	//한 페이지에 제공할 건수
	String numOfRows = "";
	//조회된 총 건수
	String totalCount = "";
	//조회할 페이지 번호
	String pageNo = "";
	try {
		numOfRows = doc.getElementsByTagName("numOfRows").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		numOfRows = "";
	}
	try {
		totalCount = doc.getElementsByTagName("totalCount").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		totalCount = "";
	}
	try {
		pageNo = doc.getElementsByTagName("pageNo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		pageNo = "";
	}

	int pageGroupSize = 10;
	int pageSize = 0;
	try {
		pageSize = Integer.parseInt(numOfRows);
	} catch (Exception e) {
		pageSize = 10;
	}
	int start = 0;
	try {
		start = Integer.parseInt(pageNo);
	} catch (Exception e) {
		start = 1;
	}

	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(pageNo);
	} catch (Exception e) {
	}

	int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호 
	int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호      
	int count = Integer.parseInt(totalCount);
	int number = 0;

	number = count - (currentPage - 1) * pageSize;//글목록에 표시할 글번호                                                                  

	//페이지그룹의 갯수                                                                                                             
	//ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.                                                       
	int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
	//페이지 그룹 번호                                                                                                              
	//ex) pageGroupSize가 3일 경우  '[1][2][3]'의 페이지그룹번호는 1 이고  '[2][3][4]'의 페이지그룹번호는 2 이다.                   
	int numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize);
	%> <nav aria-label="...">
	<div class="container">
		<ul class="pagination ">
			<%
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = pageGroupSize * (numPageGroup - 1) + 1;
				int endPage = startPage + pageGroupSize - 1;
				int prtPageNo = 0;

				if (endPage > pageCount) {
					endPage = pageCount;
				}

				if (numPageGroup > 1) {
					prtPageNo = (numPageGroup - 2) * pageGroupSize + 1;
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:fncGoPage(<%=prtPageNo%>)" tabindex="-1"
				aria-disabled="true">이전</a></li>
			<%
			//out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[이전]</a>");
			}

			for (int i = startPage; i <= endPage; i++) {
			prtPageNo = i;
			//out.print("<a href='javascript:fncGoPage("+prtPageNo+");'>");
			if (currentPage == i) {
			%>
			<li class="page-item active" aria-current="page"><a
				class="page-link"
				href="javascript:fncGoPage(<%="+" + prtPageNo + "+"%>)"><%=i%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:fncGoPage(<%=prtPageNo%>)"><%=i%></a></li>
			<%
			}
			}

			if (numPageGroup < pageGroupCount) {
			prtPageNo = (numPageGroup * pageGroupSize + 1);
			//out.println("<a href='javascript:fncGoPage("+prtPageNo+");'>[다음]</a>");
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:fncGoPage(<%=prtPageNo%>)">다음</a></li>
			<%
			}
			}
			//페이징 처리 끝
			} else {
			out.print(resultMsg);
			}
			%>
		</ul>
	</div>
	</nav> <%
 }
 %> </main>
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