<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incReservation.jsp" %>
<%@ include file="incLogin.jsp" %>
<script>
//현재 출력되어 있는 날짜를 새로 입력된 날짜로 변경 (value값 변경) 해주는 이벤트
$("#chkDate").on("propertychange change keyup paste input",function(){
	var old = $(this).val(); 
	// 자바스크립트에서 .value에 해당하는 메소드..val()
	var current = $(this).val();
	if(current == old){
		return;
	}
	old=current;
	// date 필드에서 날짜가 변경되면 변경된 날짜를 들고가서
	// 티켓 예매를 해야하는데.. 안되는 경우가 있습니다!
	// 그래서 스크립트 문으로 date 필드 값이 바뀌면 새로 value값
	// 넣어주는 함수 작성 해둔겁니다!!!! 
});
</script>
<div class="row">
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
<div class="col-md-3">
<div class="form_wrap ">
<form action="Reservation_proc.jsp" method="get" name="ResFrm" id="ResFrm">
<h4 class="text-primary" ><%=mv_title %> </h4>
<p>영화코드 : <%=mv_code %></p> 
<input type="date" value="<%=mv_open%>" name="tk_date" id="chkDate"/><br/>
	<select name="tk_cnt">
			<option value="1">1 매</option>
			<option value="2">2 매</option>
			<option value="3">3 매</option>
			<option value="4">4 매</option>
			<option value="5">5 매</option>
			<option value="6">6 매</option>
	</select><br/>
	<p><br/>티켓가격 : <%=mv_price %> <br/>극장코드 : <%=sc_code %></p>
	<input type="hidden" value="<%=mv_code%>" name="mv_code"/>
	<input type="hidden" value="<%=sc_code%>" name="sc_code"/>
	<input type="hidden" value="<%=mv_price%>" name="tk_price"/>
	<input type="submit" class="btn btn-success btn-block" value="바로예약" />
</form>
<br/>
<form action="GoodAdd.jsp" method="post">
	<input type="hidden" value="<%=mv_title%>" name="mv_title"/>
	<input type="submit" value="관심영화" class="btn btn-info  btn-block" />
</form>
</div>
</div>
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
</div>
<%@ include file="incFooter.jsp" %>