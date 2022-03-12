<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="projectBean.ProductMgr" id="proMgr" scope="session" />
<jsp:useBean class="projectBean.MemberMgr" id="memMgr" scope="session" />

<%
	String memberid = (String)session.getAttribute("memId");
	String to = memMgr.getUserEmail(memberid);
	boolean sendEmail = proMgr.sendEmail(to);

	if (sendEmail) {
        out.println("<script>alert('Email sent!');</script>");
        out.println("<script>history.back()</script>");
	} else {
        out.println("<script>alert('no');</script>");
        out.println("<script>history.back()</script>");

	}
%>
<!doctype html>
<html>
  <head>
    <title>강의평가 웹 사이트</title>
    <meta charset="utf-8">
  </head>
  <body>
  </body>
</html>