<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
String userid = (String)session.getAttribute("uID");
String username = (String)session.getAttribute("uName");

boolean isLogin = false; 
if(userid != null){
	isLogin = true;
}else{
	userid = "";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 티켓 관리</title>
<link href="./resource/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="./resource/css/style.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="./resource/js/script.js"></script>
</head>
<body>
<div class="container">
<header>
<h2 class="text-success text-center">영화 예매 페이지</h2>
</header>