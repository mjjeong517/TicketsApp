<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%@ include file="incLogin.jsp" %>
<%
request.setCharacterEncoding("utf-8");
int tk_idx = Integer.parseInt(request.getParameter("tk_idx"));
int tk_price= 0;
int tk_cnt = 0;
String tk_date= "";
String sc_code= "";
String mv_code= "";

String sql = "SELECT * FROM tickets WHERE tk_idx = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, tk_idx);
rs = pstmt.executeQuery();


if(rs.next()){
	tk_idx = rs.getInt("tk_idx");
	userid = rs.getString("userid");
	tk_price = rs.getInt("tk_price");
	tk_date = rs.getString("tk_date").substring(0,10);
	tk_cnt = rs.getInt("tk_cnt");
	sc_code = rs.getString("sc_code");
	mv_code = rs.getString("mv_code");
}
%>
<p class="text-danger text-center">
관람인원/관람일자만 수정 가능합니다.
</p>
<form action="TicketModi_proc.jsp" method="post">
<table class="table table-hover table-striped">
	<tr>
		<th>티켓코드</th>
		<td><%=tk_idx %>
			<input type="hidden" name="tk_idx" value="<%=tk_idx %>"/>
		</td>		
	</tr>
	<tr>
		<th>회원 아이디</th>
		<td><%=userid %></td>		
	</tr>
	<tr>
		<th>영화 가격</th>
		<td><input type="text" value="<%=tk_price %>" class="form-control" disabled/></td>		
	</tr>
	<tr>
		<th>관람일자</th>
		<td><input type="date" value="<%=tk_date %>" name="tk_date" class="form-control"/></td>		
	</tr>
	<tr>
		<th>관람인원</th>
		<td><input type="text" value="<%=tk_cnt %>" name="tk_cnt" class="form-control"/></td>		
	</tr>
	<tr>
		<th>상영관 코드</th>
		<td><input type="text" value="<%=sc_code %>" disabled class="form-control"/></td>		
	</tr>
	<tr>
		<th>영화 코드</th>
		<td><input type="text" value="<%=mv_code %>" disabled class="form-control"/></td>	
	</tr>
	<tr>
		<th colspan="2" class="text-center">
			<input type="submit" value="수 정" class="btn btn-info"/>
		</th> 
	</tr>
</table>
</form>
<%@ include file="incFooter.jsp" %>