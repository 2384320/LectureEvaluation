<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="projectBean.BoardBean" scope="session" />
<jsp:setProperty property ="*" name="bean"/> 
<jsp:useBean id="boardMgr" class="projectBean.BoardMgr" scope="session" />

<%
	int newNum = boardMgr.currentGetmaxnum() + 1;
	System.out.println("newNum : " + newNum);
	bean.setNum(newNum);
	bean.setBdate();
	bean.setGnum(newNum);
	boardMgr.saveData(bean);

	response.sendRedirect("../admin_index.jsp?contentPage_admin=notice/admin_notice.jsp");
%>