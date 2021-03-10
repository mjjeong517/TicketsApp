<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
String mv_title = request.getParameter("mv_title");
String mv_open = request.getParameter("mv_open").substring(0,10);
String mv_close = request.getParameter("mv_close").substring(0,10);
int mv_price = Integer.parseInt(request.getParameter("mv_price"));
String sc_code = request.getParameter("sc_code");
String mv_code = request.getParameter("mv_code");
	
	String sql1 = "UPDATE movies SET mv_title = ?, mv_open =?, mv_close=?, mv_price=?, sc_code=? WHERE mv_code = ?";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, mv_title);
	pstmt.setString(2, mv_open);
	pstmt.setString(3, mv_close);
	pstmt.setInt(4, mv_price);
	pstmt.setString(5, sc_code);
	pstmt.setString(6, mv_code);
	

	int result1 = pstmt.executeUpdate();
	
	if(result1 > 0) {
		response.sendRedirect("MovieList.jsp");
	}

%>

