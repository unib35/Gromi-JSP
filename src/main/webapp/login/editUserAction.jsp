<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.userdata.UserDAO"%>
<%@ page import="model.userdata.User"%>
<%@ page import="java.io.PrintWriter"%>
<%
String uid = (String)session.getAttribute("user_id");
String uname = (String)session.getAttribute("user_name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String pw = request.getParameter("inputPassword");
	String cpw = request.getParameter("inputConfirmPassword");
	String name = request.getParameter("inputName");
	
	UserDAO userDAO = new UserDAO();
	
	if (!pw.equals(cpw)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다!')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		User user = userDAO.findById(uid);
		user.setPw(pw);
		user.setName(name);
		userDAO.update(uid, user);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정 완료!')");
		script.println("location.href = 'logout.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>