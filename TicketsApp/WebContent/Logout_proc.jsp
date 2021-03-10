<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	// 모든 세션 값 삭제해줌.. 
	// 그래서!!! 로그아웃하면.. 관심영화 들도 같이 삭제 됨.
	response.sendRedirect("index.jsp");
%>