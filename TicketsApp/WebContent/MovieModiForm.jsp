<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%@ include file="incLogin.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String mv_code = request.getParameter("mv_code");
String mv_title = "";
String mv_open = "";
String mv_close = "";
int mv_price = 0;
String sc_code = "";

String sql = "SELECT * FROM movies WHERE mv_code = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, mv_code);
rs = pstmt.executeQuery();
if(rs.next()){
		mv_code = rs.getString("mv_code");
		mv_title = rs.getString("mv_title");
		mv_open = rs.getString("mv_open").substring(0,10);
		mv_close = rs.getString("mv_close").substring(0,10);
		mv_price = rs.getInt("mv_price");
		sc_code = rs.getString("sc_code");
}
%>
<p class="text-danger text-center">
제목,개봉일,상영종료일,티켓가격,상영관만 수정 가능합니다.
</p>
<form action="MovieModi_proc.jsp" method="post" id="MvModiFrm">
<table class="table table-hover table-striped">
	<tr>
		<th>영화코드</th>
		<td><%=mv_code %>
			<input type="hidden" name="mv_code" value="<%=mv_code %>"/>
		</td>		
	</tr>
	<tr>
		<th>영화 제목</th>
		<td><input type="text" value="<%=mv_title %>" name="mv_title"  class="form-control" /></td>		
	</tr>
	<tr>
		<th>개봉일</th>
		<td><input type="date" value="<%=mv_open %>" name="mv_open" class="form-control" /></td>		
	</tr>
	<tr>
		<th>상영종료일</th>
		<td><input type="date" value="<%=mv_close %>" name="mv_close" class="form-control"/></td>		
	</tr>
	<tr>
		<th>티켓가격</th>
		<td><input type="text" value="<%=mv_price %>" name="mv_price" class="form-control"/></td>		
	</tr>
	<tr>
		<th>상영관 코드</th>
		<td>
		<input type="hidden" name="hd_code" value="<%=sc_code%>">
		<select name="sc_code" class="form-control">
					<option value="sc01">sc01</option>
					<option value="sc02">sc02</option>
					<option value="sc03">sc03</option>
					<option value="sc05">sc05</option>
					<option value="sc06">sc06</option>
					<option value="sc07">sc07</option>
					<option value="sc08">sc08</option>
				</select>		
		</td>		
	</tr>
	<tr>
		<th colspan="2" class="text-center">
			<input type="submit" value="수 정" class="btn btn-info"/>
		</th> 
	</tr>
</table>
</form>
<%@ include file="incFooter.jsp" %>