<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css" href="../../css/notice.css">

<script>
function check(){
	if(frm.title.value ==""){
		alert("제목을 입력하세요");
		frm.title.focus();
	}else if(frm.cont.value ==""){
		alert("내용을 입력하세요");
		frm.cont.focus();
	}else
		frm.submit();
}
</script>
</head>
<body>
	<header>
		<jsp:include page="../admin_top.jsp" flush="false">
				<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	
	<section id="write">
		<h1 class="title">작성</h1>
		<form name="frm" method="post" action="admin_noticeSave.jsp">
			<div align="center">
				<div class="main_write" align="center">
					<div>
						<h2 align="left">제목</h2>
						<input class="writeInput" name="title">
					</div>
					
					<div>
						<h2 align="left">내용</h2>
						<textarea class="writeTxtara" name="cont"></textarea>
					</div>
					
					<div align="center" height="30">
							<input class="btn" type="button" value="작 성" onClick="check()">
							<input class="btn" type="button" value="목 록" onClick="location.href='../admin_index.jsp?contentPage_admin=notice/admin_notice.jsp'">&nbsp;
					</div>
				</div>
			</div>
			<input type="hidden" name="name" size="15" value=<%= session.getAttribute("memName") %>>
			<input type="hidden" name="pass" size="15" value=<%= session.getAttribute("memPw") %>>
		</form>
	</section>
	
</body>
</html>