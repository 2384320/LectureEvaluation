<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/review.css">
</head>
<body>
	<header>
		<jsp:include page="../top.jsp" flush="false">
			<jsp:param name="detail" value="true" />
		</jsp:include>
	</header>
	
	<section id="rewrite">
		<h1 class="title">작성</h1>
		<form name="frm" method="post" action="reviewSave.jsp">
			<div align="center">
		    	<div class="main_write" align="center">
		        	<div>
		               <div class="horizontal">&nbsp;&nbsp;&nbsp;강의명&nbsp;<input class="re_input" name="lectureName"></div>
		               <div class="horizontal">&nbsp;&nbsp;교수명&nbsp;&nbsp;<input class="re_input" name="professName"></div>
		            </div><br>
		            <div>
		               <div class="horizontal">수강년도</div>
		               <select class="re_select" name="lectureYear" class="form-control">
		                  <option value="2021" selected>2021</option>
		                  <option value="2020">2020</option>
		                  <option value="2019">2019</option>
		                  <option value="2018">2018</option>
		                  <option value="2017">2017</option>
		                  <option value="2016">2016</option>
		                  <option value="2015">2015</option>
		            	</select>
		               <div class="horizontal">수강학기</div>
		               <select class="re_select" name="semesterDivide" class="form-control">
		                  <option name="1학기" selected>1학기</option>
		                  <option name="여름학기">여름학기</option>
		                  <option name="2학기">2학기</option>
		                  <option name="겨울학기">겨울학기</option>
		            	</select>
		            </div><br>
		            <div align="left">
		               <div class="horizontal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평점</div>
		               <select class="re_select" name="totalScore" class="form-control">
		                  <option value="A" selected>A</option>
		                  <option value="B">B</option>
		                  <option value="C">C</option>
		                  <option value="D">D</option>
		                  <option value="F">F</option>
		           		</select>
		            </div><br>
		            <div>
		               <textarea class="re_txtara" name="evaluationContent" placeholder="내용"></textarea>
		            </div>
		         </div><br>
		         <div>
		            <input class="btn" type="submit" value="작 성">
		            <input class="btn" type="button" value="목 록" onclick="history.back()">&nbsp;
		         </div>
		      </div>
		</form>
	</section>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>