<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="projectBean.MemberBean"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="projectBean.MemberBean" id="memBean" scope="session" />
<jsp:useBean class="projectBean.MemberMgr" id="memMgr" scope="session" />

<html>
<head>
<title>마이페이지</title>
<script language="JavaScript" src="memScript.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sign.css">
</head>
<body>
	<br><br><br>
	<div align="center">
		<a href="../index.jsp"><img src="../img/icon2.png" width="150px"></a><br><br>
		<br>
		<table align="center">
			<%
				String mem_id = (String)session.getAttribute("memId");
				ArrayList<MemberBean> list = memMgr.getMyAll(mem_id);
				for (MemberBean m: list) {
			%>
			<tr>
				<td colspan="2"><h1 style="font-size: 30px">마이페이지</h1></td>
			</tr>
			<tr>
				<td class="font" id="sort_right"><strong>아이디</strong></td>
				<td>
					<input id="join_input" type="text" size="10" value=<%= m.getMemberid() %> readonly>
				</td>
			</tr>
			
			<tr>
				<td class="font" id="sort_right"><strong>비밀번호</strong></td>
				<td>
					<input id="join_input" type="text" size="10" value=<%= m.getPassword() %> readonly>
				</td>
			</tr>
			
			<tr>
				<td class="font" id="sort_right"><strong>이름</strong></td>
				<td>
					<input id="join_input" type="text" size="10" value=<%= m.getName() %> readonly>
				</td>
			</tr>
			
			<tr>
				<td class="font" id="sort_right"><strong>이메일</strong></td>
				<td>
					<input id="join_input" type="text" size="10" value=<%= m.getEmail() %> readonly>
				</td>
			</tr>
			
			<tr>
				<td class="font" id="sort_right"><strong>학과</strong></td>
				<td>
					<input id="join_input" type="text" size="10" value=<%= m.getStudentdp() %> readonly>
				</td>
			</tr>
			<tr>
				<td class="font" id="sort_right"><strong>학번</strong></td>
				<td>
					<input id="join_input" type="text" size="10" value=<%= m.getStudentid() %> readonly>
				</td>
			</tr>
			<tr>
				<td class="font" id="sort_right"><strong>수정</strong></td>
				<td>
					&nbsp;<input class="btn" type="button" value="계정삭제" onclick="myDelete('<%= m.getMemberid() %>')" style="width: 200px;">
				</td>
			</tr>
								
			<%
				}
			%>
		</table>
		<form action="myDelete.jsp" name="my_delete" method="post">
	    	<input type="hidden" name="my_id">
		</form>
	</div>
</body>
</html>