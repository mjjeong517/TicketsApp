<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="foreignError.jsp" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String rsuserid = request.getParameter("rsuserid");
	
	String sql = "delete from members where userid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,rsuserid);
	int result1 = pstmt.executeUpdate();
	
	if(result1 > 0){
		response.sendRedirect("MemberList.jsp");
	}
	
%>