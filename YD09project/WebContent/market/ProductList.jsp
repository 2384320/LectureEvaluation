<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="projectBean.ProductBean"%>

<% request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean class="projectBean.ProductBean" id="proBean" scope="session" />
<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />

<%
	if (session.getAttribute("memLogin") == null) {
		out.println("<script>alert('로그인은 필수사항입니다.');</script>");
		out.println("<script>location.href='sign/login.jsp';</script>");
	} else {
%>

<!DOCTYPE html>
<html>
<head>
<script language="JavaScript" src="market/proScript.js"></script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/market.css">
<title>상품목록</title>
</head>
<body>
	<h1 class="title">장터</h1>
	<br><br>
	<table class="market" align="center">
		<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
		</colgroup>
		
    	
    	<tr>
	<%
		int pro_count = 0;
		ArrayList<ProductBean> list= proMgr.getProductAll();
		if (list.size() == 0) {
	%>
			<td align="center" colspan="4">등록된 상품이 없습니다.</td>
	<%		
		} else {
			for (ProductBean p: list) {
				if (pro_count >= 4) {
					if (pro_count % 4 == 0)	{
						%>
						</tr>
						<tr>
						<%
					}
				}
						%>
				<td class="market_img">
		        	<a href="Javascript:productDetail('<%=p.getProno()%>')"><img src="market/data/<%=p.getImage()%>" width="150px" height="100%"></a>
		            <div>
			            <%= p.getProname() %><br>
		          		<%= p.getWriter() %><br>
		          		<%= p.getPrice() %>
	          		</div>
		        </td>     	
	    <%
	    		pro_count++;
			}
		}
    %>
     	</tr>
	</table>
	<br>
	<div class="btnDiv">
		<input class="btn" type="button" value="물품 등록" onclick="location.href='market/Product.jsp'">
	</div>
	
	<form action="market/ProductDetail.jsp" name="pro_detail" method="post">
	     <input type="hidden" name="pro_no">
	</form>
</body>
</html>
<% } %>