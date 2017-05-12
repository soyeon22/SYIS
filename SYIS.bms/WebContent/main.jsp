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

article { /*본문*/
	background-color: white;
	height: 400px;
}

/* 회전판 */
.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}

.carousel-control {
	left: -12px;
	height: 40px;
	width: 40px;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	margin-top: 90px;
}

.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}

.carousel-indicators .active {
	background: #428bca;
}
/*바닥글*/
.footerul { /*바닥ul*/
	padding-top: 10px; /*위에여백*/
}

.footerli { /*바닥li*/
	display: inline-block; /*한줄로표시*/
	font-size: 12px; /*한줄로표시*/
	font-weight: bold; /* 진하게 */
	border-left: none;
	padding-right: 40px;
	padding-left: 40px;
}

footer { /*바닥글*/
	clear: both;
	background-color: #FFFFFF;
	border: 1px solid black;
}

.footerlogo { /*바닥 로고*/
	padding: 16px;
	width: 130px;
	height: 130px;
}
/*이미지*/
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
						  	<li class="topli"><a href="shop/login/logoutProc.jsp">로그아웃</a></li>
							<li class="topli"><a href="order/member/memberList.jsp">관리자페이지</a></li>
						 </c:when>
						 <c:when test="${id != ''&& id ne null}">
							<li class="topli"><a href="shop/login/logoutProc.jsp">로그아웃</a></li>
							<li class="topli"><a>적립금 : ${userPoint}점</a></li>
							<li class="topli"><a href="guest/basket/BasketProc.jsp">장바구니</a></li>
							<li class="topli"><a href="guest/order/orderListProc.jsp">마이페이지</a></li>
						 </c:when>
						 <c:otherwise>
						    <li class="topli"><a href="shop/login/login.jsp">로그인</a></li>
							<li class="topli"><a href="guest/signUp/signUp.jsp">회원가입</a></li>
							<li class="topli"><a href="guest/basket/BasketProc.jsp">장바구니</a></li>
							<li class="topli"><a href="guest/order/orderListProc.jsp">마이페이지</a></li>
						 </c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
		<br>
		<!-- 상단 -->
		<div class="jumbotron">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<a href="main.jsp"><img
							src="img/logo.png" class="headlogo"></a>
					</div>
					<div class="col-md-7">
						<form action="shop/search/searchResultProc.jsp">
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
								<a href="category/categoryBook/bestBook.jsp"><button class="dropbtn">베스트셀러</button></a>
							</div>
							<div class="dropdown">
								<a href="category/categoryBook/newBook.jsp"><button class="dropbtn">신간도서</button></a>
							</div>
							<div class="dropdown">
								<a href="category/categoryBook/saleBook.jsp"><button class="dropbtn">할인도서</button></a>
							</div>
							<div class="dropdown">
								<button class="dropbtn">
									국내도서 <span class="glyphicon glyphicon-chevron-down"></span>
								</button>
								<div class="dropdown-content">
									<a href="category/domesticBook/categoryList.jsp?kind=k1">문학</a> 
									<a href="category/domesticBook/categoryList.jsp?kind=k2">인문</a> 
									<a href="category/domesticBook/categoryList.jsp?kind=k3">참고서</a>
									<a href="category/domesticBook/categoryList.jsp?kind=k4">기타</a>
								</div>
							</div>
							<div class="dropdown">
								<button class="dropbtn">
									해외도서 <span class="glyphicon glyphicon-chevron-down"></span>
								</button>
								<div class="dropdown-content">
									<a href="category/foreignBook/categoryList.jsp?kind=f1">문학</a> 
									<a href="category/foreignBook/categoryList.jsp?kind=f2">인문</a> 
									<a href="category/foreignBook/categoryList.jsp?kind=f3">참고서</a>
									<a href="category/foreignBook/categoryList.jsp?kind=f4">기타</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	
	<!-- //메뉴바 -->

	<!-- //상단 -->

	<!-- 옆 광고 -->
	<aside class="aside">
		<div id="leftBanner"
			style="position: fixed; left: 0; z-index: 999; height: 265; top: 190px;">
			<div id="leftNotice"
				style="visibility: hidden position:absolute; left: 0; z-index: 1000; height: 265; top: 0;"
				onmouseover="dragObj=Notice;drag=1; move=0" onmouseout="drag=0">
				<table>
					<tr>
						<td><a href="event/event/event.jsp"> <img
								src="img/leftimg.jpg" alt="언어의 온도" border="0" width="144" />
						</a></td>
						<td width="21"><img id="arrow_leftBan" src="img/t.png"
							alt="닫기" border="0" style="cursor: pointer"
							onclick="javascript:visible_leftBanner();" /> <!-- 배너 안보이게하기 화살표-->
						</td>
					</tr>
				</table>
			</div>
		</div>
	</aside>
	<!-- //옆 광고 -->
	<!-- 본문 -->
	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="Carousel" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#Carousel" data-slide-to="0" class="active"></li>
							<li data-target="#Carousel" data-slide-to="1"></li>
							<li data-target="#Carousel" data-slide-to="2"></li>
						</ol>
						<!-- 회전판 -->
						<div class="carousel-inner" style="height: 370px;">

							<div class="item active">
								<div class="row">
									<h4 style="padding-left: 20px;">▶ 추천도서</h4>
									<c:forEach var="bestBook" items="${bestBookList}" begin="1" end="4" step="1">
									<div class="col-md-3">
										<div id="text1"
											style="max-width: 100%; height: 320px; text-align: center; padding: 30px;">
											<h3>${ bestBook.bookName }</h3>
											<p>저자 :${ bestBook.writer }</p>
										</div>
										<div id="imgInfo">
											<a href="shop/search/productInfoProc.jsp?bookCode=${bestBook.bookCode}" class="thumbnail"><img
												src="${fn:substring(bestBook.img,6,20)}" alt="Image"
												style="max-width: 100%; height: 320px;"></a>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>

							<div class="item">
								<div class="row">
									<h4 style="padding-left: 20px;">▶ 이벤트</h4>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad1.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>

									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad4.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad2.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad5.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
								</div>
							</div>

							<div class="item">
								<div class="row">
									<h4 style="padding-left: 20px;">▶ 이벤트</h4>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad3.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad7.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad6.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
									<div class="col-md-3">

										<a href="event/event/event.jsp" class="thumbnail"><img
											src="img/ad/ad8.jpg" alt="Image"
											style="max-width: 100%; height: 320px;"></a>
									</div>
								</div>
							</div>
							<!--.회전판-->

						</div>
						<!--.왼쪽-->
						<a data-slide="prev" href="#Carousel"
							class="left carousel-control">‹</a>
						<!--.오른쪽-->
						<a data-slide="next" href="#Carousel"
							class="right carousel-control">›</a>
					</div>
					<!--.Carousel-->
				</div>

			</div>
		</div>
		<!--베스트셀러-->
		<div class="container">
			<div class="row">
				<h3>베스트 Top5</h3>
				<hr>
				<div class="col-md-1"></div>
				<c:forEach var="bestBook" items="${bestBookList}" begin="1" end="5" step="1">
				<div class="col-md-2">
					<a href="shop/search/productInfoProc.jsp?bookCode=${bestBook.bookCode}" class="thumbnail"> 
					<img src="${fn:substring(bestBook.img,6,20)}" style="width: 150px; height: 150px">
					</a>
				</div>
				</c:forEach>
				<div class="col-md-1"></div>
			</div>
		</div>
		<!--신간 TOP5-->
		<div class="container">
			<div class="row">
				<h3>신간 Top5</h3>
				<hr>
				<div class="col-md-1"></div>
				<c:forEach var="newBook" items="${newBookList}" begin="1" end="5" step="1">
				<div class="col-md-2">
					<a href="shop/search/productInfoProc.jsp?bookCode=${newBook.bookCode}" class="thumbnail"> <img
						src="${fn:substring(newBook.img,6,20)}" style="width: 150px; height: 150px">
					</a>
				</div>
				</c:forEach>
				<div class="col-md-1"></div>
			</div>
		</div>
		<!--할인 TOP5-->
		<div class="container">
			<div class="row">
				<h3>할인 Top5</h3>
				<hr>
				<div class="col-md-1"></div>
				<c:forEach var="saleBook" items="${saleBookList}" begin="1" end="5" step="1">
				<div class="col-md-2">
					<a href="shop/search/productInfoProc.jsp?bookCode=${saleBook.bookCode}" class="thumbnail"> <img
						src="${fn:substring(saleBook.img,6,20)}" style="width: 150px; height: 150px">
					</a>
				</div>
				</c:forEach>
				<div class="col-md-1"></div>
			</div>
			<hr>
		</div>
	</article>
	<!--//본문 -->

	<div class="container">
		<footer>
			<div class="row">
				<ul class="footerul">
					<li class="footerli"><a href="footer/footer/insungInfo.jsp">회사소개</a></li>
					<li class="footerli"><a href="footer/footer/adInfo.jsp">광고안내</a></li>
					<li class="footerli"><a href="customerCenter/customerCenter/frequent10.jsp">고객센터</a></li>
					<li class="footerli"><a href="footer/footer/agreementUtilization.jsp">이용약관</a></li>
					<li class="footerli"><a href="footer/footer/individualInfo.jsp">개인정보처리</a></li>
					<li class="footerli"><a href="footer/footer/pictureInfo.jsp">영상정보관리방침</a></li>
					<li class="footerli"><a href="footer/footer/emailCollectBan.jsp">이메일무단복제금지</a></li>
				</ul>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-3">
					<img src="img/logo.png" class="footerlogo">
				</div>
				<div class="col-md-5">
					<h4>(주)인성문고</h4>
					<ul>
						<li>서울시 종로구 종각 soldesk</li>
						<li>사업자등록번호 : 123-45-67891</li>
						<li>대표번호 : 1544-1234(발신자부담전화)</li>
						<li>서울특별시 통신판매업신고번호 : 제 653호</li>
					</ul>
				</div>
				<div class="col-md-4">
					<h4>고객센터</h4>
					<ul>
						<li>일반문의:1234-1234</li>
						<li>월~금(09:00~18:00)</li>
						<li>토요일(09:00~13:00)</li>
						<li>일요일, 공휴일 휴무</li>
						<li>E-mail 문의:dlstjd@naver.com</li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
	<!-- //바닥글 -->
</body>
</html>
