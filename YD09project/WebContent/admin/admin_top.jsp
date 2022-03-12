<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>관리자 메인 페이지</title>
</head>
<body>
	<header>
        <section id="top">
	        <%
				String detail = request.getParameter("detail");
				String index, img, logout, home, notice, review, market, member;
				if (detail == null) {
					img = "../img/icon3.png";
					index = "admin_index.jsp";
					
					logout = "../index.jsp";
					
					home = "admin_index.jsp?contentPage_admin=admin_main.jsp";
					notice = "admin_index.jsp?contentPage_admin=notice/admin_notice.jsp";
					review = "admin_index.jsp?contentPage_admin=review/admin_review.jsp";
					market = "admin_index.jsp?contentPage_admin=market/admin_market.jsp";
					member = "admin_index.jsp?contentPage_admin=member/admin_memberList.jsp";
				} else {
					img = "../../img/icon3.png";
					index = "../admin_index.jsp";
					
					logout = "../../index.jsp";
					
					home = "../admin_index.jsp?contentPage_admin=admin_main.jsp";
					notice = "../admin_index.jsp?contentPage_admin=notice/admin_notice.jsp";
					review = "../admin_index.jsp?contentPage_admin=review/admin_review.jsp";
					market = "../admin_index.jsp?contentPage_admin=market/admin_market.jsp";
					member = "../admin_index.jsp?contentPage_admin=member/admin_memberList.jsp";
				}
			%>
            <div id="top_sort"><a id="logo" href=<%= index %>><img src=<%= img %> alt="로고" witdh="150px" height="150px"></a></div>
            <div id="top_sort">
                <div id="top_menu_align" align="right">
                	<div id="li_top3"><a href=<%= logout %>>로그아웃</a></div>
                </div> <!-- top_menu -->
            </div>
        </section> <!-- section top -->

        <nav id="main_menu">
            <ul id="ul_main">
                <li id="li_main"><a href=<%= home %>>홈</a></li>
                <li id="li_main"><a href=<%= notice %>>공지</a></li>
                <li id="li_main"><a href=<%= market %>>장터</a></li>
                <li id="li_main"><a href=<%= review %>>리뷰</a></li>
                <li id="li_main"><a href=<%= member %>>회원정보</a></li>
            </ul>
        </nav>
  </header> <!--header -->
</body>
</html>