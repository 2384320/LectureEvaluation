<%@ page import="projectBean.BoardBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<jsp:useBean id="boardMgr" class="projectBean.BoardMgr" scope="session" />
<jsp:useBean id="boardBean" class="projectBean.BoardBean" scope="session" />

<%
	int pageSu, spage = 1;
%>

<!DOCTYPE html>
<html>
<head>
<title>공지</title>
<script language="JavaScript" src="notice/admin_noticeScript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
	<h1 class="title">공지사항</h1>
	<table class="board" align="center" width="60%">
		<colgroup>
			<col width="5%">
			<col width="45%">
			<col width="20%">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<tr class="th">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			try {
				spage = Integer.parseInt(request.getParameter("page"));

			} catch (Exception e) {
				spage = 1;
			}

			if (spage <= 0)
				spage = 1;

			String stype = request.getParameter("stype"); //검색인 경우
			String sword = request.getParameter("sword"); //검색인 경우

			boardMgr.totalList();
			pageSu = boardMgr.getPageSu();

			ArrayList<BoardBean> list = boardMgr.getDataAll(spage, stype, sword);
			if (list.size() == 0) {
				%>
					<tr><td align="center" colspan="5">등록된 공지가 없습니다.</td></tr>
				<%
			} else {
			for (int i = 0; i < list.size(); i++) {
				boardBean = (BoardBean) list.get(i);
				int nest = boardBean.getNested();
				String gong = " ";
				for (int j = 0; j < nest; j++) {
					gong += "&nbsp;&nbsp;&nbsp;";
				}
		%>
		<tr>
			<td class="text_center"><%=boardBean.getNum()%></td>
			<td><%=gong%><a
				href="notice/admin_noticeContent.jsp?num=<%=boardBean.getNum()%>&page=<%=spage%>"><%=boardBean.getTitle()%></a></td>
			<td class="text_center"><%=boardBean.getName()%></td>
			<td class="text_center"><%=boardBean.getBdate()%></td>
			<td class="text_center"><%=boardBean.getReadcnt()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<br>
	<table style="width: 100%">
		<tr>
			<td style="text-align: center;">
				<%
					for (int i = 1; i <= pageSu; i++) {
					if (i == spage) {
						out.print("<b class='selected_b'>[" + i + "]</b>");
					} else {
						out.print(
						"<a class='selected_a' href='admin_index.jsp?contentPage_admin=notice/admin_notice.jsp&page=" + i + "' >[" + i + "]</a>");
					}
				}
				%> <br>
			<br>
				<form action="admin_index.jsp?contentPage_admin=notice/admin_notice.jsp&page=<%=spage%>" name="frm" method="post">
					<select class="searchSelect" name="stype">
						<option value="title" selected>글 제목</option>
						<option value="name">작성자</option>
					</select>
					<input class="searchInput" type="text" name="sword" placeholder=" 검색어를 입력하시오">
					<input class="btn" type="button" value="검색" onclick="btnSearch()">
					<input class="btn" type="button" value="공지 작성" onclick="location.href='notice/admin_noticeWrite.jsp'">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>