<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	int hd_idx = Integer.parseInt(request.getParameter("tk_idx"));
	
	String sql = "delete from tickets where tk_idx = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,hd_idx);
	
	int result1 = pstmt.executeUpdate();
	if(result1 > 0){
		response.sendRedirect("TicketList.jsp");
	}
%>