<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.boarddata.BoardDAO"%>
<%@ page import="model.boarddata.Board"%>
<%@ page import="model.boarddata.Comment"%>
<%@ page import="model.boarddata.CommentDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
String uid = (String) session.getAttribute("user_id");
String uname = (String) session.getAttribute("user_name");
String bdComment = request.getParameter("bdComment");
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
	Comment comment = new Comment(bdNo, uid, uname, bdComment);
	CommentDAO commentDAO = new CommentDAO();
	commentDAO.insert(comment);
	response.sendRedirect(String.format("viewPost.jsp?bdNo=%d", bdNo));
	/*PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("history.go(-2)");
	script.println("</script>");*/
	%>
</body>
</html>