<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="incHeader.jsp" %>
<%
String chkID = request.getParameter("chkID");

String sql = "select userid from members where userid = ? "; 

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, chkID);
rs = pstmt.executeQuery();

String msg = "이미 사용중인 아이디 입니다.<br /> 다른 아이디를 검색하세요.";
String dis = " disabled = 'disabled' ";

if (!rs.next()) {		
	msg = "사용 할 수 있는 아이디 입니다.";
	dis = " ";
}

%>

<style type="text/css">
#id_text { width:120px; }
body { font-size:11px; }
</style>
<script>
function idInput(){
	var val= document.frm_id.chkID.value;
	opener.JoinFrm.userid.value=val;
	// 열려있는 창중에 JoinFrm 이름가진폼에 userid필드에 value값을
	// 현재 창에 있는 chkID에 있는 value값으로 넣어줌
	opener.JoinFrm.isUnique.value="y";
	/*
		회원가입 유효성 검사 시 submit 하기전에
		ID중복확인을 했는지 여부를 판별하기 위한 필드 (isUnique)
	*/
	self.close();
	// 현재 열려있는 창 닫기.
}
</script>
<div class="text-center">
<form name="frm_id" action="IdCheck.jsp" method="post" class="form-inline">
	<input type="text" id="userid" name="chkID" value="<%=chkID%>" class="form-control"/> 
	<input type="submit" value="검색" class="btn btn-info" />
</form>
<br /><%=msg %><br /><br />
	<input type="button" value="ID 적용" <%=dis %> onclick="idInput();" class="btn btn-mint"/>
	<input type="button" value="취 소" onclick="self.close();"  class="btn btn-danger"/>
</div>
<%@ include file="incFooter.jsp" %>