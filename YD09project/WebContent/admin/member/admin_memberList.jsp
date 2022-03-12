<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="projectBean.MemberBean"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="projectBean.MemberBean" id="memBean" scope="session" />
<jsp:useBean class="projectBean.MemberMgr" id="memMgr" scope="session" />

<html>
<head>
<title>관리자 페이지 - 회원 목록</title>
<script language="JavaScript" src="member/admin_memScript.js"></script>
</head>
<body>
	<h1 style="padding-left: 20%; font-size: 40px;">회원정보</h1>
	<table class="board" align="center" width="60%">
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="20%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<tr class="th">
		   <th><strong>아이디</strong></th>
		   <th><strong>비번</strong></th>
		   <th><strong>이름</strong></th>
		   <th><strong>이메일</strong></th>
		   <th><strong>학과</strong></th>
		   <th><strong>학번</strong></th>
		   <th><strong>수정</strong></th>
		</tr>
		<%
			ArrayList<MemberBean> list = memMgr.getMemberAll();
			if (list.size() == 0) {
		%>
				<tr><td align="center" colspan="7">등록된 회원이 없습니다.</tr>
		<%
			} else {
				for (MemberBean m: list) {
		%>
					<tr style="text-align:center;">
						<td><%= m.getMemberid() %></td>
          				<td><%= m.getPassword() %></td>
          				<td><%= m.getName() %></td>
          				<td><%= m.getEmail() %></td>
          				<td><%= m.getStudentdp() %></td>
          				<td><%= m.getStudentid() %></td>
          				<td><a href="Javascript:memberDelete('<%= m.getMemberid() %>')">계정삭제</a></td>
					</tr>
		<%
				}
			}
		%>
	</table>
	<form action="member/admin_memberDelete.jsp" name="mem_delete" method="post">
    	<input type="hidden" name="mem_id">
	</form>
</body>
</html>