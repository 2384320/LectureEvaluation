<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/notice.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/market.css">
<link rel="stylesheet" type="text/css" href="css/review.css">
<title>동양미래 강의평가</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");
	if (contentPage == null) {
			contentPage = "main.jsp";
	}
%>

<body>
	<header>
		<jsp:include page="top.jsp" flush="false" />
	</header>
	<section id="main">
		<jsp:include page='<%= contentPage %>' flush="false" />
	</section>
</body>
</html>