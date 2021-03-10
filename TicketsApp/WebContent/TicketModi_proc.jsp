<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	int tk_idx = Integer.parseInt(request.getParameter("tk_idx"));
	int tk_cnt = Integer.parseInt(request.getParameter("tk_cnt"));
	String tk_date= request.getParameter("tk_date");
	
	String sql1 = "UPDATE tickets SET tk_date=?,tk_cnt=? WHERE tk_idx =?";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, tk_date);
	pstmt.setInt(2, tk_cnt);
	pstmt.setInt(3, tk_idx);
	

	int result1 = pstmt.executeUpdate();
	
	if(result1 > 0) {
		response.sendRedirect("TicketList.jsp");
	}

%>

