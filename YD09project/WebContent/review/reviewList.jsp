<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="projectBean.EvaluationBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="evaMgr" class="projectBean.EvaluationMgr" scope="session" />
<jsp:useBean id="evaBean" class="projectBean.EvaluationBean" scope="session" />

<%
	int re_pageSu, re_spage = 1;

	if (session.getAttribute("memLogin") == null) {
		out.println("<script>alert('로그인은 필수사항입니다.');</script>");
		out.println("<script>location.href='sign/login.jsp';</script>");
	} else {
%>

<!doctype html>
<html>
<head>
<script language="JavaScript" src="review/reviewScript.js"></script>
</head>
<body>
	<h1 class="title">리뷰</h1>
	<div class="review" align="center">
		<div align="center">
			<%
					try {
					re_spage = Integer.parseInt(request.getParameter("page"));
				} catch (Exception e) {
					re_spage = 1;
				}
		
				if (re_spage <= 0)
					re_spage = 1;
		
				String stype = request.getParameter("stype"); //검색인 경우
				String sword = request.getParameter("sword"); //검색인 경우
		
				evaMgr.totalList();
				re_pageSu = evaMgr.getPageSu();
		
				ArrayList<EvaluationBean> list = evaMgr.getDataAll(re_spage, stype, sword);
				if (list.size() == 0) {
					%>
						<div style="font-size: 20px;" align="center">등록된 리뷰가 없습니다.</div>
					<%		
				} else {
					for (int i = 0; i < list.size(); i++) {
						evaBean = (EvaluationBean) list.get(i);
						int nest = evaBean.getNested();
						String gong = " ";
						for (int j = 0; j < nest; j++) {
							gong += "&nbsp;&nbsp;&nbsp;";
						}
				%>
			<div class="review_board">
				<div class="review_header">
					<div class="padding">
						<div class="horizontal">
							<%=evaBean.getLectureName()%>&nbsp; <small><%=evaBean.getProfessName()%></small>
						</div>
						<div class="horizontal">
							종합 <span style="color: red;"><%=evaBean.getTotalScore()%></span>
						</div>
					</div>
				</div>
	
				<div class="review_body">
					<p class="padding_content"><%=evaBean.getEvaluationContent()%></p>
					<div class="padding">
						<div class="horizontal">
							<%=evaBean.getLectureYear()%>년&nbsp;<%=evaBean.getSemesterDivide()%>
						</div>
						<div class="horizontal">
							<a href="Javascript:reviewLike('<%=evaBean.getEvaluationID()%>')">추천(<%=evaBean.getLikeCount()%>)</a>
						</div>
					</div>
				</div>
			</div>
			<br>
			<%
					}
				}
			%>
			<table style="width: 100%">
				<tr>
					<td style="text-align: center;">
						<%
							for (int i = 1; i <= re_pageSu; i++) {
								if (i == re_spage) {
									out.print("<b class='selected_b'>[" + i + "]</b>");
								} else {
									out.print("<a class='selected_a' href='index.jsp?CONTENTPAGE=review/reviewList.jsp&page=" + i + "' >[" + i + "]</a>");
								}
							}
						%> <br> <br>
						<form action="index.jsp?CONTENTPAGE=review/reviewList.jsp&page=<%=re_spage%>" name="frm" method="post">
							<select class="searchSelect" name="stype">
								<option value="lectureName" selected>강의명</option>
								<option value="professName">교수명</option>
							</select>
							<input class="searchInput" type="text" name="sword">
							<input class="btn" type="button" value="검색" id="btnSearch">
							<input class="btn" type="button" value="리뷰 작성" onClick="location.href='review/reviewWrite.jsp'">
						</form>
					</td>
				</tr>
			</table>
		</div>
		<form action="review/reviewLike.jsp" name="re_like" method="post">
			<input type="hidden" name="eva_id">
		</form>
	</div>
	<%
		}
	%>
</body>
</html>