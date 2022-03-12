<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/notice.css">
<link rel="stylesheet" type="text/css" href="../css/member.css">
<link rel="stylesheet" type="text/css" href="../css/market.css">
<link rel="stylesheet" type="text/css" href="../css/review.css">
<title>관리자 페이지</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String contentPage_admin = request.getParameter("contentPage_admin");
	if (contentPage_admin == null) {
		contentPage_admin = "admin_main.jsp";
	}
%>

<body>
	<header>
		<jsp:include page="admin_top.jsp" flush="false" />
	</header>
	<section id="main">
		<jsp:include page='<%= contentPage_admin %>' flush="false" />
	</section>
</body>
</html>