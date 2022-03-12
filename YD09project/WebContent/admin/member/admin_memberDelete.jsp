<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="projectBean.MemberBean"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean class="projectBean.MemberMgr" id="memMgr" scope="session" />

<html>
<head>
<title>회원 정보 삭제</title>
</head>
<body>
	<%
		String mem_id = request.getParameter("mem_id");
		memMgr.deleteMember(mem_id);
		out.println("<script>alert('계정삭제가 완료되었습니다!');");
		out.println("location.href='../admin_index.jsp?contentPage_admin=member/admin_memberList.jsp';</script>");
	%>
</body>
</html>