<%@ page import="projectBean.BoardBean"%>
<%@ page import="projectBean.BoardMgr" %>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="boardMgr" class="projectBean.BoardMgr"/>
<jsp:useBean id="boardBean" class="projectBean.BoardBean"/>

<%
	if (session.getAttribute("memLogin") == null) {
		out.println("<script>alert('�α����� �ʼ������Դϴ�.');</script>");
		out.println("<script>location.href='../sign/login.jsp';</script>");
	} else {

		String num = request.getParameter("num");
		String spage = request.getParameter("page");
		boardMgr.updateReadcnt(num);
		String pass = boardBean.getPass();
		boardBean = boardMgr.getData(num);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/notice.css">
<title>�Խ���</title>
</head>
<body>
	<header>
		<jsp:include page="../top.jsp" flush="false">
			<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	<section id="detail">
		<h1 class="title">��������</h1><br>
		<div align="center">
			<div class="detail_main" align="center">
				<div class="detail_title">
					<hr>&nbsp;<%= boardBean.getTitle() %><hr>
				</div>
				<div class="detail_info">
					&nbsp;�ۼ���&nbsp;|&nbsp;<%= boardBean.getName() %>&ensp;
					�ۼ���&nbsp;|&nbsp;<%= boardBean.getBdate() %>&ensp;
					��ȸ��&nbsp;|&nbsp;<%= boardBean.getReadcnt() %>
				</div><hr>
				<div class="detail_content">
					<%= boardBean.getCont() %>
				</div><br><hr>
			</div><br><br>
			<input class="btn" type="button" value="�� ��" onClick="location.href='../index.jsp?CONTENTPAGE=notice/boardlist.jsp'">
		</div>
	</section>
</body>
</html>
<% } %>