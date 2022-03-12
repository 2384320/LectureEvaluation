<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>동양미래 강의평가 회원가입</title>
<script language="JavaScript" src="memScript.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sign.css">
</head>
<body>
	<div align="center">
		<a href="../index.jsp"><img src="../img/icon2.png" width="150px"></a><br><br> <!-- 아이콘 -->
		<form name="joinForm" action="joinProcess.jsp" method="post"> <!-- 회원가입 폼 -->
			<table>
				<tr>
					<td>
						<h1>회원가입</h1>
					</td>
					<td>
						<div id="join_hint_btn" onmouseover="viewHint(true)" onmouseout="viewHint(false)">회원가입 방법</div>
						<div id="join_hint_visible">
    						<div id="join_hint_cont">
        						<div>
            						<strong>아이디</strong><br>
            						4~10자로 작성하셔야 합니다.<br>
            						아이디 중복 확인은 필수사항이므로 반드시 실행해 주셔야 합니다.<br>
            						<strong>비밀번호</strong><br>
            						4~10자로 작성하셔야 합니다.<br>
            						<strong>이메일</strong><br>
            						이메일 양식에 따라 작성해 주셔야 합니다.<br>
            						(ex: example@exam.com)<br>
    							</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td id="sort_right"><strong>아이디</strong></td>
					<td>
						<input id="join_input" type="text" name="memberid" size="10" value=<%= request.getParameter("memberid") %> readonly> <!-- 아이디 폼 -->
					</td> 
				</tr>
				
				<tr>
					<td id="sort_right"><strong>비밀번호</strong></td>
					<td>
						<input id="join_input" type="password" name="password" size="23" value=<%= request.getParameter("password") %> readonly><br>
					</td> 
				</tr>
				
				<tr>
					<td id="sort_right"><strong>이름</strong></td>
					<td>
						<input id="join_input" type="text" name="name" size="10"  value=<%= request.getParameter("name") %> readonly><br>
					</td> 
				</tr>
				
				<tr>
					<td id="sort_right"><strong>이메일</strong></td>
					<td>
						<input id="join_input" type="text" name="email" size="10" value=<%= request.getParameter("email") %> readonly><br>
					</td> 
				</tr>
				
				<tr>
					<td id="sort_right"><strong>학과</strong></td>
					<td>
						<input id="join_input" type="text" name="studentdp" size="10" value=<%= request.getParameter("studentdp") %> readonly>
					</td>
				</tr>
				
				<tr>
					<td id="sort_right"><strong>학번</strong></td>
					<td>
						<input id="join_input" type="text" name="studentid" size="10" value=<%= request.getParameter("studentid") %> readonly><br>
					</td> 
				</tr>
			</table>
			<input class="btn" type="submit" value="회원가입">
			<input class="btn" type="button" value="다시쓰기" onclick="history.back()">
		</form>
	</div>
</body>
</html>