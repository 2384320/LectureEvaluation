<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="projectBean.ProductBean"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="projectBean.ProductBean" id="proBean" scope="session" />
<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />

<!DOCTYPE html>
<html>
<head>
<title>상품목록</title>
<script language="JavaScript" src="market/proScript.js"></script>
</head>
<body>
	<h1 class="title">장터</h1>
	<table class="market_admin" align="center">
		<colgroup>
				<col width="40%">
				<col width="7%">
				<col width="15%">
				<col width="7%">
				<col width="7%">
		</colgroup>
		<tr class="th">
	    	<th>상품</th>
	    	<th>글쓴이</th>
	    	<th>가격</th>
	    	<th>상세보기</th>
	    	<th>수정</th>
	    </tr>
		<%
			ArrayList<ProductBean> list= proMgr.getProductAll();
			if (list.size() == 0) {
		%>
			<tr> 
			<td align="center" colspan="5">등록된 상품이 없습니다.</td>
			</tr>
		<%		
			} else {
				for (ProductBean p: list) {
	    %>
	     		<tr style="text-align: center;">
	          		<td><img src="../market/data/<%=p.getImage()%>" width="70"><br><%=p.getProname() %></td>
	          		<td><%=p.getWriter() %></td>
	          		<td><%=p.getPrice() %></td>
	          		<td><a href="Javascript:productDetail('<%=p.getProno()%>')">보기</a></td>
	          		<td><a href="Javascript:productDelete('<%=p.getProno()%>')">삭제</a></td>
	     		</tr> 
			
	<%	
				}
			}
	%>
	</table>
	<form action="market/admin_productDetail.jsp" name="pro_detail" method="post">
		<input type="hidden" name="pro_no">
	</form>
     
	<form action="market/admin_productDelete.jsp" name="pro_delete" method="post">
		<input type="hidden" name="pro_no">
	</form>
</body>
</html>