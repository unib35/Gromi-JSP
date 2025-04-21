<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.boarddata.BoardDAO"%>
<%
Integer bdNo = Integer.parseInt(request.getParameter("bdNo"));
String boardType = request.getParameter("boardType");
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
	boardDAO.deleteById(bdNo);
	
	System.out.print(boardType);
	response.sendRedirect(String.format("viewBoard.jsp?boardType=%s", boardType));
	%>
</body>
</html>