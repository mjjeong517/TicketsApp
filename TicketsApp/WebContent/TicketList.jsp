<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%@ include file="incLogin.jsp" %>
<div class="table-responsive table-wrap">
	<table class="table table-hover table-striped table-bordered">
		<thead>
			<tr class="active">
				<th class="text-center">티켓 코드</th>
				<th class="text-center">회원 아이디</th>
				<th class="text-center">영화 가격</th>
				<th class="text-center">관람 일자</th>
				<th class="text-center">관람 인원</th>
				<th class="text-center">상영관 코드</th>
				<th class="text-center">영화 코드</th>
				<th class="text-center">수정/삭제</th>
			</tr>
		</thead>
<%
String sql = "SELECT * FROM tickets";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	
	do{
		int tk_idx = rs.getInt("tk_idx");
		userid = rs.getString("userid");
		int tk_price = rs.getInt("tk_price");
		String tk_date = rs.getString("tk_date");
		int tk_cnt = rs.getInt("tk_cnt");
		String sc_code = rs.getString("sc_code");
		String mv_code = rs.getString("mv_code");

%>
			<tr>
				<td><%=tk_idx %></td>
				<td><%=userid %></td>
				<td><%=tk_price %></td>
				<td><%out.println(tk_date.substring(0,10)); %></td>
				<td><%=tk_cnt %></td>
				<td><%=sc_code %></td>
				<td><%=mv_code %></td>
				<td>
				<form action="TicketModiForm.jsp" method="post">
					<input type="hidden" value="<%=tk_idx%>" name="tk_idx"/>
					<input type="submit" class="btn btn-success" value="수정">
				</form>
				<form action="TicketDel_proc.jsp" method="post">
					<input type="hidden" value="<%=tk_idx%>" name="tk_idx"/>
					<input type="submit" class="btn btn-danger" value="삭제">
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