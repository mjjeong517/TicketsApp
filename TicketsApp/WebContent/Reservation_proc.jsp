<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incReservation.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String tk_date = request.getParameter("tk_date");
	String tk_cnt = request.getParameter("tk_cnt");
	String tk_price =request.getParameter("tk_price");
	String sc_code =request.getParameter("sc_code");
	String mv_code =request.getParameter("mv_code");
	
	String sql = "SELECT * FROM movies, screens";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
		String sql1 = "INSERT INTO tickets values(null,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, userid);
		pstmt.setString(2, tk_price);
		pstmt.setString(3, tk_date);
		pstmt.setString(4, tk_cnt);
		pstmt.setString(5, sc_code);
		pstmt.setString(6, mv_code);

int result1 = pstmt.executeUpdate();

if(result1 > 0) {
	response.sendRedirect("TicketList.jsp");
}
	
%>

