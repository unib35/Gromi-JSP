<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.boarddata.CommentDAO"%>
<%
Integer coNo = Integer.parseInt(request.getParameter("coNo"));
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
	CommentDAO commentDAO = new CommentDAO();
	commentDAO.deleteById(coNo);
	
	response.sendRedirect(String.format("viewPost.jsp?bdNo=%d", bdNo));
	%>
</body>
</html>