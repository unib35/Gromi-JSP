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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실내정원용 식물</title>
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
String cntntsNo = request.getParameter("cntntsNo");
%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" src="style.css">
<link href="./footer.css" rel="stylesheet">
<link href="./logo.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/ae70f4c5ab.js"
	crossorigin="anonymous"></script>
<script
	src="https://fonts.googleapis.com/css?family=Lato:300,400|Poppins:300,400,800&display=swap"></script>

</head>
<body>
	<%
	//인테러뱅 상세조회

	//apiKey
	String apiKey = "20230522XJWYEFWOSP5UXDCRIUCMG";
	//서비스 명
	String serviceName = "garden";
	//오퍼레이션 명
	String operationName = "gardenDtl";

	//XML 받을 URL 생성
	String parameter = "/" + serviceName + "/" + operationName;
	parameter += "?apiKey=" + apiKey;
	parameter += "&cntntsNo=" + request.getParameter("cntntsNo");

	//서버와 통신
	URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
	InputStream apiStream = apiUrl.openStream();

	Document doc = null;
	try {
		//xml document
		doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		apiStream.close();
	}
	String resultCode = "";
	String resultMsg = "";
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

	//콘텐츠 번로 
	cntntsNo = "";
	//식물 학명         
	String plntbneNm = "";
	//식물 영명        
	String plntzrNm = "";
	//유통 명                 
	String distbNm = "";
	//과명                  
	String fmlNm = "";
	String fmlCodeNm = "";
	//원산지 명           
	String orgplceInfo = "";
	//조언 정보                  
	String adviseInfo = "";
	;
	//성장 높이 정보               
	String growthHgInfo = "";
	//성장 넓이 정보              
	String growthAraInfo = "";
	//잎 형태 정보             
	String lefStleInfo = "";
	//냄새 코드               
	String smellCode = "";
	//독정 정보                 
	String toxctyInfo = "";
	//번식 시기             
	String prpgtEraInfo = "";
	//기타 시기 정보             
	String etcEraInfo = "";
	//관리수준 코드          
	String managelevelCode = "";
	//생장속도 코드             
	String grwtveCode = "";
	//생육 온도 코드        
	String grwhTpCode = "";
	//겨울 최저 온도 코드         
	String winterLwetTpCode = "";
	//습도 코드    
	String hdCode = "";
	//비료 정보                 
	String frtlzrInfo = "";
	//토양 정보           
	String soilInfo = "";
	//물주기 봄 코드          
	String watercycleSprngCode = "";
	//물주기 여름 코드            
	String watercycleSummerCode = "";
	//물주기 가을 코드            
	String watercycleAutumnCode = "";
	//물주기 겨울 코드               
	String watercycleWinterCode = "";
	//병충해 관리 정보          
	String dlthtsManageInfo = "";
	//특별관리 정보              
	String speclmanageInfo = "";
	//기능성 정보                 
	String fncltyInfo = "";
	//관리요구도 코드                  
	String managedemanddoCode = "";

	try {
		cntntsNo = doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		cntntsNo = "";
	}
	try {
		plntbneNm = doc.getElementsByTagName("plntbneNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		plntbneNm = "";
	}
	try {
		plntzrNm = doc.getElementsByTagName("plntzrNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		plntzrNm = "";
	}
	try {
		distbNm = doc.getElementsByTagName("distbNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		distbNm = "";
	}
	try {
		fmlNm = doc.getElementsByTagName("fmlNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		fmlNm = "";
	}
	try {
		fmlNm = doc.getElementsByTagName("fmlCodeNm").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		fmlCodeNm = "";
	}
	try {
		orgplceInfo = doc.getElementsByTagName("orgplceInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		orgplceInfo = "";
	}
	try {
		adviseInfo = doc.getElementsByTagName("adviseInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		adviseInfo = "";
	}

	try {
		growthHgInfo = doc.getElementsByTagName("growthHgInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		growthHgInfo = "";
	}
	try {
		growthAraInfo = doc.getElementsByTagName("growthAraInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		growthAraInfo = "";
	}
	try {
		lefStleInfo = doc.getElementsByTagName("lefStleInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		lefStleInfo = "";
	}
	try {
		smellCode = doc.getElementsByTagName("smellCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		smellCode = "";
	}
	try {
		toxctyInfo = doc.getElementsByTagName("toxctyInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		toxctyInfo = "";
	}
	try {
		prpgtEraInfo = doc.getElementsByTagName("prpgtEraInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		prpgtEraInfo = "";
	}
	try {
		etcEraInfo = doc.getElementsByTagName("etcEraInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		etcEraInfo = "";
	}
	try {
		managelevelCode = doc.getElementsByTagName("managelevelCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		managelevelCode = "";
	}
	try {
		grwtveCode = doc.getElementsByTagName("grwtveCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwtveCode = "";
	}
	try {
		grwhTpCode = doc.getElementsByTagName("grwhTpCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		grwhTpCode = "";
	}
	try {
		winterLwetTpCode = doc.getElementsByTagName("winterLwetTpCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		winterLwetTpCode = "";
	}
	try {
		hdCode = doc.getElementsByTagName("hdCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		hdCode = "";
	}
	try {
		frtlzrInfo = doc.getElementsByTagName("frtlzrInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		frtlzrInfo = "";
	}
	try {
		soilInfo = doc.getElementsByTagName("soilInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		soilInfo = "";
	}
	try {
		watercycleSprngCode = doc.getElementsByTagName("watercycleSprngCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleSprngCode = "";
	}
	try {
		watercycleSummerCode = doc.getElementsByTagName("watercycleSummerCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleSummerCode = "";
	}
	try {
		watercycleAutumnCode = doc.getElementsByTagName("watercycleAutumnCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleAutumnCode = "";
	}
	try {
		watercycleWinterCode = doc.getElementsByTagName("watercycleWinterCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		watercycleWinterCode = "";
	}
	try {
		dlthtsManageInfo = doc.getElementsByTagName("dlthtsManageInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		dlthtsManageInfo = "";
	}
	try {
		speclmanageInfo = doc.getElementsByTagName("speclmanageInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		speclmanageInfo = "";
	}
	try {
		fncltyInfo = doc.getElementsByTagName("fncltyInfo").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		fncltyInfo = "";
	}

	try {
		managedemanddoCode = doc.getElementsByTagName("managedemanddoCode").item(0).getFirstChild().getNodeValue();
	} catch (Exception e) {
		managedemanddoCode = "";
	}

	if (resultCode.equals("00")) {
	%>
	<header> <nav class="navbar navbar-expand-md navbar-dark bg-dark"
		aria-label="main-navbar">
		<div class="container">
			<a class="navbar-brand" href="./index.jsp">
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
                        <a class="nav-link active" aria-current="page" href="./index.jsp">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./gardenList.jsp">식물 검색</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./recommend.jsp">식물 추천</a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                            aria-expanded="false">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="board/viewBoard.jsp?boardType=free">자유 게시판</a></li>
                            <li><a class="dropdown-item" href="board/viewBoard.jsp?boardType=QA">Q&A 게시판</a></li>
                            <li><a class="dropdown-item" href="board/viewBoard.jsp?boardType=sale">분양 게시판</a></li>
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
                                <li><a class="dropdown-item" href="login/signin.jsp">로그인</a></li>
                                <li><a class="dropdown-item" href="login/signup.jsp">회원가입</a></li>
                            </ul>
                            <%} else{%>
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                aria-expanded="false"><%=uname %></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="login/editUser.jsp">개인정보수정</a></li>
                                <li><a class="dropdown-item" href="login/logout.jsp">로그아웃</a></li>
                            </ul>
                            <%} %>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav> </header>

	<table class="table container" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<tr>
			<th>식물학명</th>
			<td><%=plntbneNm%></td>
		</tr>
		<tr>
			<th>식물영명</th>
			<td><%=plntzrNm%></td>
		</tr>
		<tr>
			<th>유통명</th>
			<td><%=distbNm%></td>
		</tr>
		<tr>
			<th>과명</th>
			<td><%=fmlNm%></td>
		</tr>
		<tr>
			<th>원산지 정보</th>
			<td><%=orgplceInfo%></td>
		</tr>
		<tr>
			<th>조언 정보</th>
			<td><%=adviseInfo%></td>
		</tr>
		<tr>
			<th>성장 높이 정보</th>
			<td><%=growthHgInfo + "cm"%></td>
		</tr>
		<tr>
			<th>성장 넓이 정보</th>
			<td><%=growthAraInfo + "cm"%></td>
		</tr>


		<tr>
			<%
			String manage;
			if (managelevelCode.equals("089001")) {
				manage = "초보자에게 추천";
			} else if (managelevelCode.equals("089002")) {
				manage = "경험자에게 추천";
			} else {
				manage = "전문에게 추천";
			}
			%>
			<th>관리수준 코드</th>
			<td><%=manage%></td>
		</tr>
		<tr>
			<%
			String speed;
			if (grwtveCode.equals("090001")) {
				speed = "빠름";
			} else if (grwtveCode.equals("090002")) {
				speed = "보통";
			} else {
				speed = "느림";
			}
			%>
			<th>생장속도 코드</th>
			<td><%=speed%></td>
		</tr>
		<tr>
			<%
			String temperature;
			if (grwhTpCode.equals("082001")) {
				temperature = "10~15℃ 적정";
			} else if (grwhTpCode.equals("082002")) {
				temperature = "16~20℃ 적정";
			}

			else if (grwhTpCode.equals("082003")) {
				temperature = "21~25℃ 적정";
			} else {
				temperature = "26~30℃ 적정";
			}
			%>
			<th>생육 온도 코드</th>
			<td><%=temperature%></td>
		</tr>
		<tr>
			<%
			String wintertemp;
			if (winterLwetTpCode.equals("057001")) {
				wintertemp = "0℃ 이하";
			} else if (winterLwetTpCode.equals("057002")) {
				wintertemp = "7℃";
			}

			else if (winterLwetTpCode.equals("057003")) {
				wintertemp = "10℃";
			} else {
				wintertemp = "13℃ 이상";
			}
			%>
			<th>겨울 최저 온도 코드</th>
			<td><%=wintertemp%></td>
		</tr>
		<tr>
			<%
			String humid;
			if (hdCode.equals("083001")) {
				humid = "40% 미만";
			} else if (hdCode.equals("083002")) {
				humid = "40 ~ 70%";
			}

			else {
				humid = "70% 이상";
			}
			%>
			<th>습도 코드</th>
			<td><%=humid%></td>
		</tr>
		<tr>
			<th>비료 정보</th>
			<td><%=frtlzrInfo%></td>
		</tr>


		<tr>
			<%
			String summerWater;
			if (watercycleSummerCode.equals("053001")) {
				summerWater = "항상 흙을 촉촉하게 유지함(물에 잠김)";
			} else if (watercycleSummerCode.equals("053002")) {
				summerWater = "흙을 촉촉하게 유지 해야함(물에 잠기지 않도록 주의)";
			} else if (watercycleSummerCode.equals("053003")) {
				summerWater = "토양 표면이 말랐을때 충분히 관수해야함";
			} else {
				summerWater = "화분 흙 대부분 말랐을때 충분히 관수해야함";
			}
			%>
			<th>물주기 여름 코드</th>
			<td><%=summerWater%></td>
		</tr>

		<tr>
			<%
			String winterWater;
			if (watercycleSummerCode.equals("053001")) {
				winterWater = "항상 흙을 촉촉하게 유지함(물에 잠김)";
			} else if (watercycleSummerCode.equals("053002")) {
				winterWater = "흙을 촉촉하게 유지 해야함(물에 잠기지 않도록 주의)";
			} else if (watercycleSummerCode.equals("053003")) {
				winterWater = "토양 표면이 말랐을때 충분히 관수해야함";
			} else {
				winterWater = "화분 흙 대부분 말랐을때 충분히 관수해야함";
			}
			%>
			<th>물주기 겨울 코드</th>
			<td><%=winterWater%></td>
		</tr>

	</table>
	<%
	} else {
	out.println(resultMsg);
	}
	%>
	<footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <h6>Gromi</h6>
                            <p class="text-justify">Company. 구름빵 | Owner. 이종민
                                <br>Businuess No. 051-890-1724 | E-mail. cse@gmail.com <br>
                                Address. 부산광역시 부산진구 엄광로176(가야동)
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
                                <li><a href="https://www.instagram.com/deu_smartcse/">CSE Instagram</a></li>
                                <li><a href="https://open.kakao.com/o/gfoeUk8e">Cloud Class Kakao</a></li>
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
</html>