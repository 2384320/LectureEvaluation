<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="projectBean.ProductBean"%>
<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />
<script language="JavaScript" src="market/proScript.js"></script>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<title>상품 삭제</title>
</head>
<body>
	<%
		String pro_no = request.getParameter("pro_no");
		System.out.println(pro_no);
		proMgr.delete(pro_no);
		out.println("<script>alert('상품 삭제가 완료되었습니다!');");
		out.println("location.href='../admin_index.jsp?contentPage_admin=market/admin_market.jsp';</script>");
	%>
</body>
</html>