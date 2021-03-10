<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%@ include file="incLogin.jsp" %>
<div class="table-responsive table-wrap">
	<table class="table table-hover table-striped table-bordered">
			<tr>
				<th class="text-center">영화 코드</th>
				<th class="text-center">제 목</th>
				<th class="text-center">개봉일</th>
				<th class="text-center">상영종료</th>
				<th class="text-center">티켓 가격</th>
				<th class="text-center">상영관</th>
				<th class="text-center">수정/삭제</th>
			</tr>
<%
String sql = "SELECT * FROM movies order by mv_code";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	
	do{
		String mv_code = rs.getString("mv_code");
		String mv_title = rs.getString("mv_title");
		String mv_open = rs.getString("mv_open").substring(0,10);
		String mv_close = rs.getString("mv_close").substring(0,10);
		int mv_price = rs.getInt("mv_price");
		String sc_code = rs.getString("sc_code");

%>
			<tr>
				<td><%=mv_code %>
					<input type="hidden" name="mv_code" value="<%=mv_code %>"/>
				</td>
				<td><%=mv_title %></td>
				<td><%=mv_open %></td>
				<td><%=mv_close %></td>
				<td><%=mv_price %></td>
				<td><%=sc_code %></td>
				<td>
				<form action="MovieModiForm.jsp" method="post" id="MvFrm">
					<input type="hidden" value="<%=mv_code%>" name="mv_code"/>
					<input type="submit" class="btn btn-success" value="수정">
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