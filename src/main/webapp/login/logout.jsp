<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("user_id");
session.removeAttribute("user_name");
response.sendRedirect("../index.jsp");
%>