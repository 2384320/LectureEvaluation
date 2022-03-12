<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="projectBean.ProductBean" %>
<%@ page import="projectBean.BoardBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="projectBean.ProductBean" id="proBean" scope="session" />
<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />
<jsp:useBean id="boardMgr" class="projectBean.BoardMgr" scope="session" />
<jsp:useBean id="boardBean" class="projectBean.BoardBean" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript" src="market/proScript.js"></script>
<script language="JavaScript" src="notive/boardScript.js"></script>
</head>
<body>
	<div id="main_img">
		    <img src="img/main.jpg">
	    </div>
		<div id="main_post">
			<section id="post_review">
	            <a id="title" href="index.jsp?CONTENTPAGE=notice/boardlist.jsp">공지 ▷</a>
	            <hr style="border-top: 3px double #bbb">
	            <%
	            	int spage = 1;
	            	ArrayList<BoardBean> list_board = boardMgr.getBoardAll_main();	
	    			if (list_board.size() == 0) {
	            %>
	            	<table>
	            		<tr><td align="center" colspan="5">등록된 공지가 없습니다.</td></tr>
	            	</table>
	            <%
	    			} else {
	    		%>
	    				<ul>
		    		<%		
		    				for (BoardBean b: list_board) {
		            %>
		            			<li>
		            				<a href="notice/boardcontent.jsp?num=<%=b.getNum()%>&page=<%=spage%>"><%=b.getTitle() %></a>
		       	     			</li>
				    <%
		    				}
		    		%>
		    				</ul>
	    		<%
	    			}
		        %>
	        </section>
			
	        <section id="post_review">
	            <a id="title" href="index.jsp?CONTENTPAGE=market/ProductList.jsp">장터 ▷</a>
	            <hr style="border-top: 3px double #bbb">
	            <%
	            	ArrayList<ProductBean> list_pro = proMgr.getProductAll_main();	
	    			if (list_pro.size() == 0) {
	            %>
	            	<table>
	            		<tr><td align="center" colspan="5">등록된 상품이 없습니다.</td></tr>
	            	</table>
	            <%
	    			} else {
	    		%>
	    				<table>
			            	<tr>
		    		<%		
		    				for (ProductBean p: list_pro) {
		            %>
				            	<td class="market_img">
				            		<a href="Javascript:productDetail('<%=p.getProno()%>', '<%=spage%>')"><img src="market/data/<%=p.getImage()%>" width="100px" height="100%"></a>
				            	</td>
				    <%
		    				}
		    		%>
		    				</tr>
		            	</table>
	    		<%
	    			}
		        %>
	        </section>
		</div>
	<form action="market/ProductDetail.jsp" name="pro_detail" method="post">
     	<input type="hidden" name="pro_no">
	</form>
	<form action="notice/boardcontent.jsp" name="board_detail" method="post">
     	<input type="hidden" name="board_no">
     	<input type="hidden" name="board_spage">
	</form>
</body>
</html>