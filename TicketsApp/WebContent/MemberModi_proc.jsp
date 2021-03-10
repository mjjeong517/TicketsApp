<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");

	String sql1 = "UPDATE members SET userpwd = ?, username =?, phone=? WHERE userid = ?";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, userpwd);
	pstmt.setString(2, username);
	pstmt.setString(3, phone);
	pstmt.setString(4, userid);
	

	int result1 = pstmt.executeUpdate();
	
	if(result1 > 0) {
		response.sendRedirect("MemberList.jsp");
	}

%>

