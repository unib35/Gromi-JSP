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
	String id = request.getParameter("inputID");
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
	} else if(userDAO.findById(id) != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다!')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		User user = new User(id, pw, name);
		userDAO.insert(user);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입 완료!')");
		script.println("location.href = 'signin.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>