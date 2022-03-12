<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="projectBean.MemberMgr" id="memMgr" scope="session" />


<%
	String i = request.getParameter("id");
	String p = request.getParameter("password");
	
	boolean adminLoginCheck = memMgr.adminLoginCheck(i, p);
	boolean loginCheck = memMgr.loginCheck(i, p);

	if (adminLoginCheck) { // 관리자 아이디 비밀번호 입력
		out.println("<script>alert('로그인 되었습니다.');</script>");
				
		if (request.getParameter("idSave") == null) {
			session.removeAttribute("memSave");
		} else {
			session.setAttribute("memSave", "check");
		}
		String n = memMgr.getAdminName(i);
		
		session.setAttribute("memId", i);
		session.setAttribute("memPw", p);
		session.setAttribute("memName", n);
	
		out.println("<script>location.href='../admin/admin_index.jsp';</script>");
	} else {
		if (loginCheck) { // 클라이언트 아이디 비밀번호 입력
			out.println("<script>alert('로그인 되었습니다.');</script>");
			
			session.setAttribute("memLogin", "ok");
			
			if (request.getParameter("idSave") == null) {
				session.removeAttribute("memSave");
			} else {
				session.setAttribute("memSave", "check");
			}
			String n = memMgr.getUserName(i);
			
			session.setAttribute("memId", i);
			session.setAttribute("memPw", p);
			session.setAttribute("memName", n);

			out.println("<script>location.href='../index.jsp';</script>");
		} else { // 아이디 비밀번호 다르게 입력
			out.println("<script>alert('다시 입력해주세요.');</script>");
			out.println("<script>location.href='login.jsp';</script>");
		}
	}
	
%>