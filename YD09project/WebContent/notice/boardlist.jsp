<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="projectBean.BoardBean"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="boardMgr" class="projectBean.BoardMgr" scope="session" />
<jsp:useBean id="boardBean" class="projectBean.BoardBean" scope="session" />

<%
	int pageSu, spage = 1;

	if (session.getAttribute("memLogin") == null) {
		out.println("<script>alert('로그인은 필수사항입니다.');</script>");
		out.println("<script>location.href='sign/login.jsp';</script>");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<title>공지</title>
<link rel="stylesheet" type="text/css" href="../css/notice.css">
<script language="JavaScript" src="notice/boardScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
	<h1 style="padding-left: 20%; font-size: 40px;">공지사항</h1>
	<br>
	<br>
	
	<table class="board" align="center" width="60%">
		<colgroup>
			<col width="5%">
			<col width="45%">
			<col width="20%">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<tr class="th">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
		try{
			spage = Integer.parseInt(request.getParameter("page"));
			
		}catch(Exception e){
			spage = 1;
		}
		if(spage <=0) spage = 1;
		
		String stype = request.getParameter("stype"); //검색인 경우
		String sword = request.getParameter("sword"); //검색인 경우
		
		boardMgr.totalList();
		pageSu = boardMgr.getPageSu();
		
		ArrayList<BoardBean> list = boardMgr.getDataAll(spage, stype, sword);
		if (list.size() == 0) {
			%>
				<tr> 
					<td align="center" colspan="5">등록된 공지가 없습니다.</td>
				</tr>
			<%		
		} else {
			for(int i = 0; i < list.size(); i++){
				boardBean = (BoardBean)list.get(i);
				int nest = boardBean.getNested();
				String gong = " ";
				for(int j=0; j < nest; j++){
					gong += "&nbsp;&nbsp;&nbsp;";
				}
			%>
			<tr>
				<td class="text-center"><%=boardBean.getNum() %></td>
				<td><%=gong %><a href="notice/boardcontent.jsp?num=<%=boardBean.getNum() %>&page=<%=spage%>"><%=boardBean.getTitle() %></a></td>
				<td class="text-center"><%=boardBean.getName() %></td>
				<td class="text-center"><%=boardBean.getBdate() %></td>
				<td class="text-center"><%=boardBean.getReadcnt() %></td>
			</tr>
			<%	
			}
		}
			%>
	</table>
	<br>
	<table style="width: 100%">
	  <tr>
		<td style="text-align:center;">
		<%
			for(int i= 1; i<= pageSu; i++){
			if(i == spage){
				out.print("<b class='selected_b'>[" + i + "]</b>");
			}else{
				out.print("<a class='selected_a' href='index.jsp?CONTENTPAGE=notice/boardlist.jsp&page=" + i + "' >[" + i + "]</a>");
			}
		}
		%>
		<br><br>
			<form action="index.jsp?CONTENTPAGE=notice/boardlist.jsp&page=<%= spage %>" name="frm" method="post">
				<select class="searchSelect" name="stype">
					<option value="title" selected>글 제목</option>
					<option value="name">작성자</option>
				</select>
				<input class="searchInput" type="text" name="sword" placeholder=" 검색어를 입력하시오">
				<input class="btn" type="button" value="검색" id="btnSearch">
			</form>
		</td>
	  </tr>
	</table>
</body>
</html>
<% } %>