<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="projectBean.ProductBean"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />

<%
		ProductBean product= proMgr.getProduct(request.getParameter("pro_no"));
%>

<html>
<head>
<title>마켓 상세보기</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css" href="../../css/market.css">
<script language="JavaScript" src="proScript.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../admin_top.jsp" flush="false">
			<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	
	<section id="pro_detail">
		<h2 class="title">상품 상세보기</h2>
		<div class="main_board">
			<div class="board_detail">
				<div class="detail_board">
					<img title="<%=product.getProname() %>" src="../../market/data/<%=product.getImage() %>" width="250px">
				</div>
				
				<div class="detail_board">
					<p class="detail_info">
						&nbsp;&nbsp;번   호 : <%=product.getProno() %><br>
						&nbsp;&nbsp;상품명 : <%=product.getProname() %><br>
						&nbsp;&nbsp;글쓴이 : <%=product.getWriter() %><br>
						&nbsp;&nbsp;가   격 : <%=product.getPrice() %><br>
						&nbsp;&nbsp;상품 설명<br>
						<p class="detail_content">&nbsp;&nbsp;&nbsp;<%=product.getDetail() %></p>
					</p>
				</div>
				<div class="detail_btn">
					<form class="btnss" action="emailSendAction.jsp" method="post">
						<input class="btn" type="submit" value="구 매">
					</form>
					<div class="btnss">
						<input class="btn" type="button" value="목 록" onclick="history.back()">
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>