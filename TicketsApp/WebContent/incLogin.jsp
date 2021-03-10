<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="row">
<div class="col-md-8 col-md-offset-2">
	<p class="text-right"><strong class="text-info"><%=username %></strong> 님 환영합니다. &nbsp;
	<a href="Logout_proc.jsp" class="btn btn-default btn-xs"">로그아웃</a> &nbsp;
	<a href="GoodsList.jsp" class="btn btn-info btn-xs">관심영화&nbsp;<span class="glyphicon glyphicon-heart"></span></a></p>
	<nav class="text-center">
		<a href="TicketList.jsp" class="btn btn-mint">티켓조회</a>
		<a href="MovieList.jsp" class="btn btn-mint">영화목록</a>
		<a href="MemberList.jsp" class="btn btn-mint">회원관리</a>
		<a href="MovieReservation.jsp" class="btn btn-pink">티켓예매</a>
	</nav>
</div>
</section>