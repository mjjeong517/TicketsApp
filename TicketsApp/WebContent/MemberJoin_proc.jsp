<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String username = request.getParameter("username");
String phone = request.getParameter("phone");
	
	String sql1 = "INSERT INTO members values(?,?,?,?)";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, userid);
	pstmt.setString(2, userpwd);
	pstmt.setString(3, username);
	pstmt.setString(4, phone);
	

	int result1 = pstmt.executeUpdate();
	
	if(result1 > 0) {
		response.sendRedirect("index.jsp");
	}

%>

