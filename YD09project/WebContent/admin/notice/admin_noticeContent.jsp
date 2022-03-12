<%@ page import="projectBean.BoardMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="boardMgr" class="projectBean.BoardMgr" scope="session"/>
<jsp:useBean id="boardBean" class="projectBean.BoardBean" scope="session"/>
<%
	String num = request.getParameter("num");
	String spage = request.getParameter("page");
	boardMgr.updateReadcnt(num);
	boardBean = boardMgr.getData(num); 
	String pass = boardBean.getPass();
	String mypass = "****";
	String adminOk = (String)session.getAttribute("adminOk");
	if(adminOk != null){
		if(adminOk.equals("admin")) mypass = pass; 
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../../css/notice.css">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<script language="JavaScript" src="notice/admin_noticeScript.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../admin_top.jsp" flush="false">
			<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	
	<section id="detail">
		<h1 class="title">공지사항</h1><br>
			<div align="center">
				<div class="detail_main" align="center">
					<div class="detail_title">
						<hr>&nbsp;<%= boardBean.getTitle() %><hr>
					</div>
					<div class="detail_info">
						&nbsp;작성자&nbsp;|&nbsp;<%= boardBean.getName() %>&ensp;
						작성일&nbsp;|&nbsp;<%= boardBean.getBdate() %>&ensp;
						조회수&nbsp;|&nbsp;<%= boardBean.getReadcnt() %>
					</div><hr>
					<div class="detail_content">
						<%= boardBean.getCont() %>
					</div><br><hr>
				</div><br><br>
				<input class="btn" type="button" value="수 정" onClick="location.href='admin_noticeEdit.jsp?num=<%=num %>&page=<%=spage%>'">&nbsp;
				<input class="btn" type="button" value="목 록" onClick="location.href='../admin_index.jsp?contentPage_admin=notice/admin_notice.jsp'">
			</div>
	</section>
</body>
</html>