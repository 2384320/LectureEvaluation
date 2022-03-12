<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="market/proScript.js"></script>
<script language="JavaScript" src="notive/boardScript.js"></script>
</head>
<body>
<%
	String id = (String)session.getAttribute("memId");
%>
	<br><br><br><br><br><br><br><br>
	<h1 style="text-align: center;"><%= id %> 관리자 계정으로 접속하셨습니다.</h1>			
</body>
</html>