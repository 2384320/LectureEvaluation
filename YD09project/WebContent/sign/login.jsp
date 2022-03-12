<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동양미래 강의평가 로그인</title>
<link rel="stylesheet" type="text/css" href="../css/sign.css">
</head>
<body>
<%
	String memLogin = (String)session.getAttribute("memLogin");
	String id = (String)session.getAttribute("memId");
	String pw = (String)session.getAttribute("memPw");
	String check = (String)session.getAttribute("memSave");
	String idStr = null, pwStr = null, checkStr = null;
	
	if (check == null) {
		idStr = ""; pwStr = ""; checkStr = "";
	} else {
		idStr = id; pwStr = pw; checkStr = "checked";
	} // 아이디/비밀번호 저장
	
	if (memLogin == null) {
%>
	<div align="center">
		<a href="../index.jsp"><img src="../img/icon2.png" width="150px"></a><br><br>
		<form method="post" action="loginProcess.jsp">
			<table style="font-size: 20px;">
				<tr>
					<td colspan="2"><h1>로그인</h1></td>
				</tr>

				<tr>
					<td id="sort_right"><strong>아이디</strong><br></td>
					<td>
						<input id="login_input" type="text" name="id" size="10" placeholder=" ID" value=<%= idStr %>><br>
					</td>
				</tr>
				
				<tr>
					<td id="sort_right"><strong>비밀번호</strong><br></td>
					<td>
						<input id="login_input" type="password" name="password" size="10" placeholder=" Password" value=<%= pwStr %>><br>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="checkbox" name="idSave" value="c1" <%= checkStr %>> 로그인 정보 저장<br>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" id="sort_center">
						<input class="btn" type="submit" value="로그인"><br>
					</td>
				</tr>
			</table>
		</form><br>
		<a href="join.jsp">아직 계정이 없으신가요? // 회원가입</a>
	</div>
	<%
		} else {		
			response.sendRedirect("../index.jsp");
		}
	%>
</body>
</html>

