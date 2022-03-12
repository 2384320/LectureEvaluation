<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="projectBean.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="projectBean.BoardMgr"/>

<%
	String num = request.getParameter("num");
	String spage = request.getParameter("page");
	String edit = request.getParameter("edit");
	boolean b = boardMgr.checkPass(bean.getNum(), bean.getPass());
	if (edit.equals("1")) {
		if (b) {
			boardMgr.saveEdit(bean);
			response.sendRedirect("admin_noticeContent.jsp?num="+num+"&page="+spage);
		} else {
%>
				<script>
					alert("비밀번호 불일치!!!");
					history.back();
				</script>
<%
		}
	} else {
		if (b) {
			boardMgr.saveDelete(bean);
			response.sendRedirect("../admin_index.jsp?contentPage_admin=notice/admin_notice.jsp&page="+spage);
		} else {
%>
			<script>
				alert("비밀번호 불일치!!!");
				history.back();
			</script>
<%
		}
	}
%>