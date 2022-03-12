<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="evaBean" class="projectBean.EvaluationBean" scope="session" />
<jsp:setProperty name="evaBean" property="*" />
<jsp:useBean id="evaMgr" class="projectBean.EvaluationMgr" scope="session" />

<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3>리뷰완료</h3>
	<%
		evaMgr.write(evaBean);
		out.println("<script>alert('작성되었습니다.');");
		out.println("location.href='../index.jsp?CONTENTPAGE=review/reviewList.jsp';</script>");
	%>
</body>
</html>