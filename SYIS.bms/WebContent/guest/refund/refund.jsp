<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.purchase.service.PurchaseService"%>
<%@ page import="minsu.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="minsu.bms.purchase.dao.PurchaseDao"%>
<%@ page import="minsu.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="minsu.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="minsu.bms.purchase.domain.Purchase"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%
	PurchaseMapper purchaseMapper = Configuration.getMapper(PurchaseMapper.class);
	PurchaseDao purchaseDao = new PurchaseDaoImpl(purchaseMapper);
	PurchaseService purchaseService = new PurchaseServiceImpl(purchaseDao);
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	Purchase purchase = purchaseService.findPurchase(orderNum);
	String bookCode = purchase.getBookCode();

	pageContext.setAttribute("purchase", purchase);
	pageContext.setAttribute("book", bookService.findBook(bookCode));
	
	%>
<html lang="ko">
<head>
<title>환불하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
.img-responsive1 {
	width: 50px;
	height: 80px;
}

th, td {
	text-align: center;
}
li{
	display: inline-block; /*한줄로 보기*/
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
	<article>
	<form >
<div class="container">

		<h2>환불하기</h2>
		<hr>
		<table class="table table-hover" >
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문날짜</th>
					<th style="float:center;">상품정보</th>
					<th style="text-area : center; float:center;">수량</th>
					<th style="float:center;">합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${purchase.orderNum}</td>
					<td>${purchase.orderDate}</td>
					<td><a href="../../shop/search/productInfo.jsp"> <img src="../../img/nobody.jpg"
							class="img-responsive1" > [${book.kind}]${book.bookName}
					</a></td>
					<td style="padding:35px;" >${purchase.orderCount}</td>
					<td style="padding:35px;">${purchase.payAmount}원</td>

				</tr>
				<input type="hidden" name="orderNum" value="${purchase.orderNum}">
				<input type="hidden" name="bookName" value="${book.bookName}"/>
				<input type="hidden" name="payAmount" value="${purchase.payAmount}"/>
			
</tbody>
</table>
</div>
			
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<br>
					<div>
						<fieldset>
							<legend> 환불사유 </legend>
							<div id="radio">
								<ul>
									<li><label><input type="radio" name="reason" value="배송지연">배송지연</label></li>
									<li><label><input type="radio" name="reason" value="책손상">책손상</label></li>
									<li><label><input type="radio" name="reason" value="고객변심">고객변심</label></li>
									<li><label><input type="radio" name="reason" value="개인사유">개인사유</label></li>
									<li><label><input type="radio" name="reason" value="기타">기타</label></li>
								</ul>
							</div>
						</fieldset>
						<fieldset>
							<legend> 환불방법 </legend>
							<div id="radio">
								<ul>
									<li><label><input type="radio" name="cancelType" value="카드">카드</label></li>
									<li><label><input type="radio" name="cancelType" value="핸드폰">핸드폰</label></li>
									<li><label><input type="radio" name="cancelType" value="계좌이체">계좌이체</label></li>
								</ul>
							</div>
						</fieldset>
						
						<nav style="float:right;">
						
						
						<button class="btn btn-md" type="submit" formaction="refundDetailProc.jsp">환불하기</button>
						<button class="btn btn-md" type="submit" formaction="../order/orderListProc.jsp">취소하기</button>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		</form>
	</article>
	<br><br><br>
<jsp:include page="../../footer.html"/>
</body>
</html>