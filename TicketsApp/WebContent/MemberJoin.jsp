<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<h4 class="text-danger text-center"> 회원 가입 </h4>
<form action="MemberJoin_proc.jsp" method="post" class="text-center" name="JoinFrm">
<script>
function idChek(){ // 아이디 중복 체크 관련함수
	var chkID = document.JoinFrm.userid.value;
	//현재 문서에 JoinFrm 이름을 가진 폼 안에 있는
	//userid라는 이름속성을 가진 필드의 value값을
	//chkID 변수에 넣어줌.
	if(chkID == ""){ // 필드에 값을 입력하지 않은 경우
		alert("중복검사할 아이디를 입력 해주세요.");
		document.JoinFrm.userid.focus();
		return;
	}
	aa = window.open("IdCheck.jsp?chkID=" + chkID,"a","width=900,height=350" );
	/*
		주소 뒤에 필드의 네임 과 속성값을 가지고 감.
	*/
}
</script>
<table class="table table-hover table-striped">
	<tr>
		<th class="text-center">아이디</th>
		<td>
			<input type="text" name="userid" class="form-control"/>
			<input type="button" value="ID중복확인" name="chkID" onclick="idChek()" class="btn btn-primary btn-block" />
			<input type="hidden" name="isUnique" value="n"/>
		</td>
	</tr>	
	<tr>
		<th class="text-center">비밀번호</th>
		<td>
			<input type="password" name="userpwd" class="form-control"/>
		</td>
	</tr>	
	<tr>
		<th class="text-center">이 름</th>
		<td>
			<input type="text" name="username" class="form-control"/>
		</td>
	</tr>	
	<tr>
		<th class="text-center">휴대폰 번호 </th>
		<td>
			<input type="text" name="phone" class="form-control"/>
		</td>
	</tr>	
	<tr>
		<th colspan="2" class="text-center">
			<input type="submit" value="회 원 가 입" class="btn btn-success"/>
		</th> 
	</tr>
</table>
</form>
<%@ include file="incFooter.jsp" %>