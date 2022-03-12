<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="projectBean.EvaluationBean"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean class="projectBean.EvaluationMgr" id="evaMgr" scope="session" />

<html>
<head>
<title>리뷰 추천</title>
</head>
<body>
	<%
		String eva_id = request.getParameter("eva_id");
		evaMgr.like(eva_id);
		out.println("<script>alert('추천되었습니다.');");
		out.println("location.href='../index.jsp?CONTENTPAGE=review/reviewList.jsp';</script>");
	%>
</body>
</html>