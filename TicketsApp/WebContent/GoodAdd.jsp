<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%  request.setCharacterEncoding("UTF-8"); 
	
	ArrayList<String> Movielist = (ArrayList) session.getAttribute("GoodList");
	// ArrayList(String)자료형으로 Movielist 를 만들어줌.
	
	String productName= request.getParameter("mv_title");


	if (session.getAttribute("GoodList") == null) {
		Movielist = new ArrayList<String>();
    }
	
	Movielist.add(productName);
	// 이전 페이지에서 네임 속성이 mv_title 인것의 value값을
	// productName변수에 넣어준 상태인데..
	// 해당 값을 ArrayList 자료형으로 만든 Movielist 에 넣어줌.
    session.setAttribute("GoodList", Movielist);
	// 세션 이름을 "GoodList" 으로 만들고 해당 세션에 
	// Movielist 값을 넣어줌.

    response.sendRedirect("GoodsList.jsp");
%>