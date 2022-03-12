<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="boardMgr" class="projectBean.BoardMgr"/>
<jsp:useBean id="boardBean" class="projectBean.BoardBean"/>

<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
boardBean = boardMgr.getData(num);
%>

<!DOCTYPE html>
<html>
<head>
<title>수정</title>
<link rel="stylesheet" type="text/css" href="../../css/notice.css">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<script type="text/javascript">
function editCheck(){
	if(frm.pass.value === ""){
		frm.pass.focus();
		alert("비밀번호를 입력하시오");
		return false;
	}
	if(confirm("정말 수정하시겠습니까?")){
		frm.edit.value = 1;
		frm.submit();
	}
}

function deleteCheck(){
	if(frm.pass.value === ""){
		frm.pass.focus();
		alert("비밀번호를 입력하시오");
		return false;
	}
	if(confirm("정말 삭제하시겠습니까?")){
		frm.edit.value = 0;
		frm.submit();
	}
}
</script>

</head>
<body>
	<header>
		<jsp:include page="../admin_top.jsp" flush="false">
				<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	
	<section id="edit">
		<h2 class="title">수정</h2>
		<form action="admin_noticeEditSave.jsp" method="post" name="frm">
			<div align="center">
				<div class="edit_write" align="center">
					<div>
						<h2 align="left">제목</h2>
						<input class="edit_input" name="title" value="<%=boardBean.getTitle()%>">
					</div>
					
					<div>
						<h2 align="left">비밀번호</h2>
						<input class="edit_input" type="password" name="pass">
					</div>
					
					<div>
						<h2 align="left">내용</h2>
						<textarea class="edit_txtara" name="cont"><%=boardBean.getCont() %></textarea>
					</div>
					
					<div align="center" height="30">
						<input class="btn" type="button" value="수 정" onclick="editCheck()">
						<input class="btn" type="button" value="삭 제" onclick="deleteCheck()">
						<input class="btn" type="button" value="목 록" onClick="location.href='../admin_index.jsp?contentPage_admin=notice/admin_notice.jsp'">&nbsp;
					</div>
				</div>
			</div>
			<input type="hidden" name="name" value="<%=boardBean.getName() %>">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="page" value="<%=spage%>">
			<input type="hidden" name="edit">
		</form>
	</section>
</body>
</html>