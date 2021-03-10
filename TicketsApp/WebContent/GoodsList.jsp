<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<%@ include file="incReservation.jsp" %>
<%@ include file="incLogin.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
	
	<% ArrayList<String> list = (ArrayList)session.getAttribute("GoodList"); %>
		<hr/>
	<h4 class="text-primary text-center">'<%= session.getAttribute("uName") %>'님 관심 영화 목록 </h4>
		<% if( list == null){ %>
		<p class="text-danger text-center">관심영화가 없습니다.</p>
		<% }else {
				for(String i : list){%>
				<p class="text-center"><% out.println(i); %></p>
				<% }
		} %>
		<div class="text-center">
		<form action="ListEmpty.jsp">
				<input type="submit" class="btn btn-danger btn-sm" value="관심영화 비우기"/>
		</form>
		</div>
<%@ include file="incFooter.jsp" %>
