<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="projectBean.MemberBean" id="memBean" scope="session" />
<jsp:setProperty name="memBean" property="*" />
<jsp:useBean class="projectBean.MemberMgr" id="memMgr" scope="session" />

<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3>회원정보</h3>
	<%
		memMgr.insertMember(memBean);
		out.println("<script>alert('회원가입이 완료되었습니다!');");
		out.println("location.href='../index.jsp';</script>");
	%>
</body>
</html>