<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="projectBean.MemberMgr" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="memMgr" class="projectBean.MemberMgr" />

<%
	String i = request.getParameter("memberid");
	boolean check = memMgr.checkId(i);
%>

<html>
<head>
<title>ID중복체크</title>
<script language="JavaScript" src="script.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sign.css">
</head>

<body align="center">
	<h2>아이디 중복검사</h2>
	<hr>
	<b><%=i%></b><br>
	<%
	  	if (check) {
	     	out.println("<h3>이미 존재하는 아이디 입니다.</h3>");
		} else {
	     	out.println("<h3>사용 가능한 아이디 입니다.</h3>");
		}
	%>
	<input class="btn" type="button" value="확인" onClick="window.close()">
</body>
</html>