<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="foreignError.jsp" %>
    
<%@ include file="incHeader.jsp" %>
<%@ include file="incLogin.jsp" %>
<div class="table-responsive table-wrap">
	<table class="table table-hover table-striped table-bordered text-center">
		<thead>
			<tr class="active">
				<th class="text-center">회원 아이디</th>
				<th class="text-center">이름</th>
				<th class="text-center">연락처</th>
				<th class="text-center">정보수정/탈퇴</th>
			</tr>
		</thead>
<%
String sql = "SELECT * FROM members order by userid";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	
	do{
		String rsuserid = rs.getString("userid");
		String rsusername = rs.getString("username");
		String phone = rs.getString("phone");

%>
			<tr>
				<td><%=rsuserid %></td>
				<td><%=rsusername %></td>
				<td><%=phone %></td>
				<td>
				<form action="MemberModiForm.jsp" method="post">
					<input type="hidden" value="<%=rsuserid%>" name="rsuserid"/>
					<input type="submit" class="btn btn-success" value="수정"/>
				</form>
				<form action="MemberDel_proc.jsp" method="post">
					<input type="hidden" value="<%=rsuserid%>" name="rsuserid"/>
					<input type="submit" class="btn btn-danger" value="삭제"/>
				</form>
				</td>
			</tr>
<%
		} while(rs.next());
	}else{
		out.println("조회실패");
	}
	try{
		pstmt.close();
		rs.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
		out.println("오류 메세지 : " + e.getMessage());
	}
	
%>
	</table>
</div>
<%@ include file="incFooter.jsp" %>