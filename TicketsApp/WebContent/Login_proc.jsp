<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%

userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");


String sql = "select userid, userpwd, username";
sql+= " from members where userid=?";

pstmt = conn.prepareStatement(sql); 
pstmt.setString(1,userid);
rs = pstmt.executeQuery();

String msg = "존재하지 않는 아이디 입니다.";

if(rs.next()){
	if(userpwd.equals(rs.getString("userpwd"))){ 
		session.setAttribute("uID", userid);
		session.setAttribute("uName", rs.getString("username"));
		response.sendRedirect("index.jsp");
	}
	msg = "비밀번호를 잘못 입력 하였습니다";
}

out.println("<script>");
out.println("alert('"+ msg +"')");
out.println("location.replace('index.jsp')");
out.println("</script>");
%>