<!--test_form.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/market.css">
</head>
<body>
	<header>
		<jsp:include page="../top.jsp" flush="false">
				<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	
	
	<section id="pro_write">
		<h1 class="title">상품 등록</h1>
		<form enctype="multipart/form-data" action="ProductInsert.jsp" method="post">
			<div align="center">
				<div class="main_write" align="center">
					<div>
						<p class="horizontal">상품명&nbsp;&nbsp;<input class="pro_input" type="text" name="proname"></p>
						<p class="horizontal">&nbsp;&nbsp;저자이름&nbsp;&nbsp;<input class="pro_input" type="text" name="writer"></p>
						<p class="horizontal">&nbsp;&nbsp;가격&nbsp;&nbsp;<input class="pro_input" type="text" name="price"></p>
					</div>
					
					<div>
						<textarea class="pro_txtara" type="text" name="detail" placeholder="상세정보"></textarea>
					</div><br>
					
					<div align="center">
						이미지 파일&nbsp;&nbsp;<input type="file" name="image">
					</div><br>
					
					<div>
						<input class="btn" type="submit" value="등 록">
						<input class="btn" type="button" value="목 록" onclick="history.back()">&nbsp;
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>