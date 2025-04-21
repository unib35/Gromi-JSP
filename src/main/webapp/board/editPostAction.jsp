<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.boarddata.BoardDAO"%>
<%@ page import="model.boarddata.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
String title = request.getParameter("title");
String content = request.getParameter("content");
Integer bdNo = Integer.parseInt(request.getParameter("bdNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	BoardDAO boardDAO = new BoardDAO();
	Board board = boardDAO.findById(bdNo);
	board.setBdTitle(title);
	board.setBdContent(content);
	boardDAO.update(bdNo, board);
	response.sendRedirect(String.format("viewPost.jsp?bdNo=%s", bdNo));
	%>
</body>
</html>