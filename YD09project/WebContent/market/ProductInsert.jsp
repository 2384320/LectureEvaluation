<!-- test_joinProcess.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="projectBean.ProductBean" id="proBean" scope="session" />
<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />
<jsp:setProperty name="proBean" property="*" />

<%
	boolean result = proMgr.insertProduct(request);
%>
<html>
<head>
<title></title>
</head>
<body>
<%
	if (result) {
%>
		<script>
			alert('상품등록이 완료되었습니다.');
			location.href='../index.jsp?CONTENTPAGE=market/ProductList.jsp';
	  	</script>
<%
	} else {
%>
		<script>
			alert("오류가 발생하였습니다.");
			location.href='../index.jsp?CONTENTPAGE=market/ProductList.jsp';
	  	</script>
<%
	}
%>
</body>
</html>