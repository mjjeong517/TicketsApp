<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%@ include file="incLogin.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String rsuserid= request.getParameter("rsuserid");
String userpwd = "";
String rsusername = "";
String phone = "";


String sql = "SELECT * FROM members WHERE userid = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, rsuserid);
rs = pstmt.executeQuery();


if(rs.next()){
	userpwd = rs.getString("userpwd");
	rsusername = rs.getString("username");
	phone = rs.getString("phone");
}
%>
<h4 class="text-danger text-center"> 회원 가입 </h4>
<form action="MemberModi_proc.jsp" method="post" class="text-center" name="JoinFrm">
<table class="table table-hover table-striped">
	<tr>
		<th class="text-center">아이디</th>
		<td>
			<h4 class="text-left"> <%=rsuserid %>
			<small class="text-danger">- 수정불가</small>
			</h4>
			<input type="hidden" value="<%=rsuserid%>" name="userid"/>
		</td>
	</tr>	
	<tr>
		<th class="text-center">비밀번호</th>
		<td>
			<input type="password" name="userpwd" value="<%=userpwd %>" class="form-control"/>
		</td>
	</tr>	
	<tr>
		<th class="text-center">이 름</th>
		<td>
			<input type="text" name="username" value="<%=rsusername %>" class="form-control"/>
		</td>
	</tr>	
	<tr>
		<th class="text-center">휴대폰 번호 </th>
		<td>
			<input type="text" name="phone" value="<%=phone%>" class="form-control"/>
		</td>
	</tr>	
	<tr>
		<th colspan="2" class="text-center">
			<input type="submit" value="정 보 수 정" class="btn btn-success"/>
		</th> 
	</tr>
</table>
</form>
<%@ include file="incFooter.jsp" %>