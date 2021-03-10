<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;

	String driver = "com.mysql.jdbc.Driver";
	String location = "localhost:3306/";
	String dbName = "TicketsDB";
	String url = "jdbc:mysql://" + location + dbName;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "root", "1234");
		
	} catch (Exception e) {
		out.println("<h3>DB연결실패</h3>");
	    e.printStackTrace();
	}
%>