<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    session.invalidate(); // ends session
    response.sendRedirect("login.jsp"); // redirects to login
%>
