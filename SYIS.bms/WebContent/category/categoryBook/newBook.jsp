<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	pageContext.setAttribute("newBookList", bookService.newBookList());
	
	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();

	//현재 날짜 구하기
	String strYear = Integer.toString(currentCalendar
			.get(Calendar.YEAR));
	String strMonth = df
			.format(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay = df
			.format(currentCalendar.get(Calendar.DATE));
	String strDate = strMonth + "월" + strDay + "일";
%>
<html lang="ko">
<head>
<title>신간도서</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
#block {
	display: block;
	margin-top: 10px;
	width: 150px;
}

</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>

<article>
<div class="container">
	<br>
	<h2>신간도서</h2>
	<hr>
<c:forEach var="bestBook" items="${newBookList}">
<div class="row">
				<div class="col-md-2">
					<div>
						<a href="../../shop/search/productInfoProc.jsp?bookCode=${bestBook.bookCode}" class="thumbnail">
							<img src="${bestBook.img}" >
						</a>
					</div>
				</div>
				<div class="col-md-7">
					
					<br>
					<p>
						[신간도서]<a href="../../shop/search/productInfoProc.jsp?bookCode=${bestBook.bookCode}">${bestBook.bookName}</a><br><br> ${bestBook.writer}(지은이)|
						${bestBook.company}|${bestBook.publiDate}<br><br> ${bestBook.bookPrice}원<!--  →<b>12,420</b>(10%
						할인), 마일리지 690점(5% 적립)<br> -->
						<br>
						<br> 출고예상일 : 지금 주문하면 <b><%= strDate %> 출고</b>예상 (출고후 1~2일 이내 수령)
					</p>
				</div>
				<div class="col-md-3">
				<form>
					<input type="hidden" name="bookCode" value = "${bestBook.bookCode}">
					<button id="block" type="submit" formaction="../../guest/basket/addBasketProc.jsp"  class="btn btn-default btn-md">장바구니</button>
					<button id="block" type="submit" formaction="../../guest/purchase/paymentProc.jsp" class="btn btn-default btn-md">바로구매</button>
				</form>
				</div>
			</div>
	<hr>
	</c:forEach>
	</div>
</article>
<jsp:include page="../../footer.html"/>
</body>
</html>