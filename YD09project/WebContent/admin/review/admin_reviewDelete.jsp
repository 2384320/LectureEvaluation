<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="projectBean.ProductBean"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean class="projectBean.EvaluationMgr" id="evaMgr" scope="session" />

<html>
<head>
<title>상품 정보 삭제</title>
</head>
<body>
	<%
	String eva_id = request.getParameter("eva_id");
	evaMgr.delete(eva_id);
	out.println("<script>alert('리뷰 삭제가 완료되었습니다!');");
	out.println("location.href='../admin_index.jsp?contentPage_admin=review/admin_review.jsp';</script>");
	%>
</body>
</html>