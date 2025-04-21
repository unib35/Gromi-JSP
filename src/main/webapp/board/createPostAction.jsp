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
	Board board = new Board(uid, uname, title, content, boardType);
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.insert(board);
	response.sendRedirect(String.format("viewBoard.jsp?boardType=%s", boardType));
	/*PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("history.go(-2)");
	script.println("</script>");*/
	%>
</body>
</html>