<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.userdata.UserDAO"%>
<%@ page import="model.userdata.User"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("inputEmail");
	String pw = request.getParameter("inputPassword");
	UserDAO userDAO = new UserDAO();
	User user = userDAO.findById(id);
	if (user == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디를 확인해주세요!')");
		script.println("history.back()");
		script.println("</script>");
	} else if (user.getPw().equals(pw)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", user.getName());
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호를 확인해주세요!')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>