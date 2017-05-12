<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="minsu.bms.login.service.LoginService"%>
<%@ page import="minsu.bms.login.service.LoginServiceImpl"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	LoginService loginService = new LoginServiceImpl(loginDao);
	
	pageContext.setAttribute("bestBookList", bookService.bestBookList());
	pageContext.setAttribute("saleBookList", bookService.saleBookList());
	pageContext.setAttribute("newBookList", bookService.newBookList());
	
	pageContext.setAttribute("id", session.getAttribute("login"));
	String id="";
	if(session.getAttribute("login")!=null){
		 id =  (String)session.getAttribute("login");
		User user = loginService.findUser(id);
		pageContext.setAttribute("userPoint",user.getPoint());
	}
%>
<html lang="ko">
<head>
<title>인성문고</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	// 왼쪽 배너 애니메이션
	var check_leftBanner = true;
	function visible_leftBanner() {   
		var speed = 150;
		if (check_leftBanner) { // 숨기기
			check_leftBanner = false;
			$("#leftBanner").animate({
				left : "-=145px"
			}, speed);
	
			$("#arrow_leftBan").attr("src", "img/leftBan_on.png");
			$("#arrow_leftBan").attr("alt", "열기");
		} else { // 보이기
			check_leftBanner = true;
			$("#leftBanner").animate({
				left : "+=145px"
			}, speed);

			$("#arrow_leftBan").attr("src", "img/t.png");
			$("#arrow_leftBan").attr("alt", "닫기");
		}
	}
</script>
<style>
body {
	padding-top: 20px;
}

#text1 {
	background-color: rgba(0, 0, 0, 0.1);
	text-color: black;
}

#imgInfo {
	position: relative;
	top: -320px;
	transition-property: all;
}

#imgInfo:hover, #imgInfo1:hover {
	opacity: 0.1;
}

#imgInfo1 {
	position: relative;
	top: -150px;
	transition-property: all;
}

.jumbotron {
	padding-top: 30px;
	background-color: #FFFFFF; /*배경색 흰색*/
	border: 1px solid black; /*테두리선*/
	height: 180px; /*높이*/
}

.headlogo {
	width: 110px;
	height: 110px;
	margin: none;
}

a {
	text-decoration: none; /* 밑줄 없앰 */
	color: #000000; /*검정색*/
}
.btn11{
	text-decoration: none; /* 밑줄 없앰 */
	color: #000000; /*검정색*/
	border: none;
	background-color: rgb(115, 215, 209);
	font-family:고딕체;
	text-indent:-50px;
	line-height:0px;
	-moz-border-radius:0px;
	-webkit-border-radius:0px;
	border-radius:0px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	color:#000000;
	width:173px;
	height:0px;
	padding:19px;
	border-color:#73d7d0;
	border-width:0px;
	border-style:solid;
}

.btn11:active {
	position:relative;
	top:3px
}

.btn11:hover {
background-color: rgb(56, 194, 188);
}



.topul { /*위ul*/
	padding-top: 20px; /*위에여백*/
	float: right; /*오른쪽정렬*/
	background-color: #ffffff; /*배경색 흰색*/
}

.topli { /*위li*/
	display: inline; /*한줄로표시*/
	font-size: 12px;
	font-weight: bold; /* 진하게 */
	border-left: 1px solid #666666; /* menu글씨 왼쪽옆에 "|" 표시 */
} /*위li 앞에*/
.topli:first-child {
	border-left: none;
}

.topli a{ /*위li 링크*/
	margin: 0 10px 0 10px; /* 메뉴 글자 간격 */
}

.topli a:hover { /*위li*/
	color: #ff9900; /* li요소의 글자에 마우스 올렸을때 글자색 변경*/
}

.menubar { /*메뉴바색깔*/
	background-color: rgb(115, 215, 209);
}

/* 드롭다운 버튼 */
.dropbtn {
	background-color: rgb(115, 215, 209);
	padding: 17px; /*안쪽여백*/
	font-size: 13.5px; /*글씨크기*/
	border: none; /*테두리*/
	cursor: pointer; /*커서 손모양*/
	float: center; /* 가운데정렬 */
	font-weight: bold; /* 진하게 */
}

/*드롭다운 */
.dropdown {
	position: relative; /*상대적위치?*/
	display: inline-block; /*한줄로 보기*/
	padding-right: 60px; /*오른쪽 안여백*/
	padding-left: 60px; /*왼쪽 안여백*/
}

/* 드롭다운 아래 */
.dropdown-content {
	display: none; /*화면상에 아무것도 나타내지 않겠다*/
	position: absolute;
	background-color: rgb(115, 215, 209);
	min-width: 160px;
	z-index: 1;
}

/* 드롭다운 아래 링크 */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: rgb(56, 194, 188);
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
	background-color: rgb(56, 194, 188);
}
</style>
</head>
<body>
<div class="container">
		<!-- 위에 고정바 -->
		<nav class="btnRight navbar-fixed-top">
			<div class="container">
				<ul class="topul">
					<c:choose>
						 <c:when test="${id eq 'admin'}">
						  	<li class="topli"><a href="../../shop/login/logoutProc.jsp">로그아웃</a></li>
							<li class="topli"><a href="../../order/member/memberList.jsp">관리자페이지</a></li>
						 </c:when>
						 <c:when test="${id != ''&& id ne null}">
							<li class="topli"><a href="../../shop/login/logoutProc.jsp">로그아웃</a></li>
							<li class="topli"><a>적립금 : ${userPoint}점</a></li>
							<li class="topli"><a href="../../guest/basket/BasketProc.jsp">장바구니</a></li>
							<li class="topli"><a href="../../guest/order/orderListProc.jsp">마이페이지</a></li>
						 </c:when>
						 <c:otherwise>
						    <li class="topli"><a href="../../shop/login/login.jsp">로그인</a></li>
							<li class="topli"><a href="../../guest/signUp/signUp.jsp">회원가입</a></li>
							<li class="topli"><a href="../../guest/basket/BasketProc.jsp">장바구니</a></li>
							<li class="topli"><a href="../../guest/order/orderListProc.jsp">마이페이지</a></li>
						 </c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
		<br>
		<!-- 상단 -->
		<div class="jumbotron" style="padding-top: 30px; background-color: #FFFFFF;  border: 1px solid black; height: 180px; /*높이*/">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<a href="../../main.jsp"><img
							src="../../img/logo.png" class="headlogo"></a>
					</div>
					<div class="col-md-7">
						<form action="../../shop/search/searchResultProc.jsp">
							<div class="input-group" class="searchBar" style="margin: 80px;">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default ">
										<SELECT name=searchOption style="border: none;">
											<OPTION value=bookTitle>도서명</OPTION>
											<OPTION value=writer>저자</OPTION>
											<OPTION value=company>출판사</OPTION>
										</SELECT>
									</button>
								</div>
								<input type="text" class="form-control" name="searchText"
									placeholder="입력하세요"> <span class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</form>
					</div>
				</div>
				<!-- 검색바 -->
			</div>
		</div>
	</div>

	<!-- 메뉴바 -->
	<div class="container">
		<div class="navbar">
			<nav class="navbar navbar-inverse">
				<div class="menubar">
					<div class="menubar collapse navbar-collapse navbar-center"
						id=myNavbar>
						<div class="#myNavbar">
							<div class="dropdown">
								<a href="../../category/categoryBook/bestBook.jsp"><button class="dropbtn">베스트셀러</button></a>
							</div>
							<div class="dropdown">
								<a href="../../category/categoryBook/newBook.jsp"><button class="dropbtn">신간도서</button></a>
							</div>
							<div class="dropdown">
								<a href="../../category/categoryBook/saleBook.jsp"><button class="dropbtn">할인도서</button></a>
							</div>
							<div class="dropdown">
								<button class="dropbtn">
									국내도서 <span class="glyphicon glyphicon-chevron-down"></span>
								</button>
								<div class="dropdown-content">
									<a href="../../category/domesticBook/categoryList.jsp?kind=k1">문학</a> 
									<a href="../../category/domesticBook/categoryList.jsp?kind=k2">인문</a> 
									<a href="../../category/domesticBook/categoryList.jsp?kind=k3">참고서</a>
									<a href="../../category/domesticBook/categoryList.jsp?kind=k4">기타</a>
								</div>
							</div>
							<div class="dropdown">
								<button class="dropbtn">
									해외도서 <span class="glyphicon glyphicon-chevron-down"></span>
								</button>
								<div class="dropdown-content">
									<a href="../../category/foreignBook/categoryList.jsp?kind=f1">문학</a> 
									<a href="../../category/foreignBook/categoryList.jsp?kind=f2">인문</a> 
									<a href="../../category/foreignBook/categoryList.jsp?kind=f3">참고서</a>
									<a href="../../category/foreignBook/categoryList.jsp?kind=f4">기타</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	

</body>