<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="top">
		<%
			String detail = request.getParameter("detail");
			String redetail = request.getParameter("redetail");
			String index, img, login, join, logout, mypage, home, notice, market, review;
			if (detail == null) {
				img = "img/icon.png";
				index = "index.jsp";
				
				login = "sign/login.jsp";
				join = "sign/join.jsp";
				logout = "sign/logoutProcess.jsp";
				mypage = "sign/myPage.jsp";
				
				home = "index.jsp?CONTENTPAGE=main.jsp";
				notice = "index.jsp?CONTENTPAGE=notice/boardlist.jsp";
				market = "index.jsp?CONTENTPAGE=market/ProductList.jsp";
				review = "index.jsp?CONTENTPAGE=review/reviewList.jsp";
			} else {
				img = "../img/icon.png";
				index = "../index.jsp";
				
				login = "../sign/login.jsp";
				join = "../sign/join.jsp";
				logout = "../sign/logoutProcess.jsp";
				mypage = "../sign/myPage.jsp";
				
				home = "../index.jsp?CONTENTPAGE=main.jsp";
				notice = "../index.jsp?CONTENTPAGE=notice/boardlist.jsp";
				market = "../index.jsp?CONTENTPAGE=market/ProductList.jsp";
				review = "../index.jsp?CONTENTPAGE=review/reviewList.jsp";
			}
		%>
            <div id="top_sort"><a id="logo" href=<%= index %>><img src=<%= img %> alt="로고" witdh="150px" height="150px"></a></div>
            <div id="top_sort">
                <div id="top_menu">
                    <div id="top_menu_horizontal">
                    	<%
                    		String memLogin = (String)session.getAttribute("memLogin");
                    		String id = (String)session.getAttribute("memId");
                    		if (memLogin == null) {
                    	%>
                    			<div id="li_top1"><a href=<%= login %>>로그인</a></div>
                                <div id="li_top2"><a href=<%= join %>>회원가입</a></div>
                    	<%
                    		} else {
                    	%>
                    			<div id="li_top1"><a href=<%= mypage %>>환영합니다, <%= id %>님!</a></div>
                                <div id="li_top2"><a href=<%= logout %>>로그아웃</a></div>
                    	<%
                        	}
                    	%>
                    </div>
                </div> <!-- top_menu -->
            </div>
        </section> <!-- section top -->

        <nav id="main_menu">
            <ul id="ul_main">
                <li id="li_main"><a href=<%= home %>>홈</a></li>
                <li id="li_main"><a href=<%= notice %>>공지</a></li>
                <li id="li_main"><a href=<%= market %>>장터</a></li>
                <li id="li_main"><a href=<%= review %>>리뷰</a></li>
            </ul>
        </nav>
</body>
</html>