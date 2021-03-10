<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<section class="row">
<div class="col-md-8 col-md-offset-2">
<form method="post" action="" id="loginFrm" class="form-inline text-center">
	<%if(isLogin){
		out.println("<script>");
		out.println("alert('"+ username +" 님 환영 합니다. ');");
		out.println("location.replace('TicketList.jsp');");
		out.println("</script>");
	}else{ %>
		<label>아이디</label>
		<input type="text" name="userid" placeholder="아이디를 입력하세요" class="form-control"/>
		<label>비밀번호</label>
		<input type="password" name="userpwd" placeholder="비밀번호를 입력하세요" class="form-control"/>
		<input type="button" value="로그인" class="btn btn-primary" onclick="chkLogin()"/>
	<%} %>
</form>
	<section class="JoinSec row text-center">
		<div class="col-md-12">
			<a href="MemberJoin.jsp" class="btn btn-success btn-block">회원가입</a>
		</div>
	</section>
</div>
</section>
<%@ include file="incFooter.jsp" %>