<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<form name="joinForm" action="joinShow.jsp" method="post"> <!-- 회원가입 폼 -->
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
					<td class="font" id="sort_right"><strong>아이디</strong></td>
					<td>
						<input id="join_input" type="text" name="memberid" size="10" placeholder="  ID"> <!-- 아이디 폼 -->
						<input class="btn" type="button" value="아이디 중복 확인" onClick="idCheck(this.form.memberid.value)"> <!-- 아이디 중복 확인 -->
					</td> 
				</tr>
				
				<tr>
					<td class="font" id="sort_right"><strong>비밀번호</strong></td>
					<td>
						<input id="join_input" type="password" name="password" size="23" placeholder="  Password"><br>
					</td> 
				</tr>
				
				<tr>
					<td class="font" id="sort_right"><strong>이름</strong></td>
					<td>
						<input id="join_input" type="text" name="name" size="10" placeholder="  Name"><br>
					</td> 
				</tr>
				
				<tr>
					<td class="font" id="sort_right"><strong>이메일</strong></td>
					<td>
						<input id="join_input" type="text" name="email" size="10" placeholder="  Email"><br>
					</td> 
				</tr>
				
				<tr>
					<td class="font" id="sort_right"><strong>학과</strong></td>
					<td>
						<select id="join_select" name="studentdp">
							<option value="0">학과선택</option>
							<option value="기계공학과">기계공학과</option>
							<option value="자동화공학과">자동화공학과</option>
							<option value="전기공학과">전기공학과</option>
							<option value="컴퓨터소프트웨어공학과">컴퓨터소프트웨어공학과</option>
							<option value="건축과">건축과</option>
							<option value="경영학과">경영학과</option>
						</select><br>
					</td> 
				</tr>
				
				<tr>
					<td class="font" id="sort_right"><strong>학번</strong></td>
					<td>
						<input id="join_input" type="text" name="studentid" size="10" placeholder="  학번"><br>
					</td> 
				</tr>
				<tr>
					<td colspan="2" id="sort_center"><input class="btn" type="button" value="회원가입" onclick="inputCheck()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>