<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.purchase.domain.Purchase"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="minsu.bms.delivery.domain.Delivery"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>상세주문내역</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
.buynav {
	float: right;
	padding: 15px 15px;
}

.img-responsive1 {
	width: 50px;
	height: 80px;
}

th, td {
	text-align: center;
}

</style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<article>
<form >
<%					
Delivery delivery=(Delivery)request.getAttribute("delivery");
Book book=(Book)request.getAttribute("book");
Purchase purchase=(Purchase)request.getAttribute("purchase");
					%>	
		<div class="container">
		<h2 style="font-weight: bold;">상세 주문내역</h2>
				<hr>
			<div class="row">
				<table class="table table-hover">
					<caption>주문정보</caption>
					<thead>
						<tr>
							<th style="text-align: center;">주문번호</th>
							<th style="text-align: center;">주문상품</th>
							<th style="text-align: center;">수량</th>
							<th style="text-align: center;">결제금액</th>
							<th style="text-align: center;">배송조회</th>
							<th style="text-align: center;">교환/환불</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="padding: 35px;"><%=purchase.getOrderNum() %></td>
							<td><a href="../../shop/search/productInfo.jsp"> <img src="../../img/nobody.jpg"
									class="img-responsive1"> [<%=book.getKind() %>]<%=book.getBookName() %>
							</a></td>
							<td style="padding: 35px;"><%=purchase.getOrderCount() %></td>
							<td style="padding: 35px;"><%=purchase.getPayAmount() %>원</td>
							<td>
							<input type="hidden" name="deliveryNum" value="<%=purchase.getDeliveryNum() %>"> 
							<button type="submit" formaction="../shipment/shipmentProc.jsp"
							
										class="btn btn-default btn-block" style="margin-top:15px;">배송조회</button></td>
							<td>
							<input type="hidden" name="orderNum" value="<%=purchase.getOrderNum() %>">
							<input type="hidden" name="point" value="<%=purchase.getPayAmount()/10 %>">
							<%if(purchase.getRefundNum()==0){
							%>
							<button type="submit" formaction="../refund/refundProc.jsp" class="btn btn-default btn-block" style="margin-top:15px;">환불하기</button>
							<%}else{ %>
							<button type="button" class="btn btn-default btn-block" style="margin-top:15px;">환불완료</button>
							<%} %>
							</td>
						
						</tr>
					</tbody>
				</table>
				</div>
				<div class="row">
				<table class="table table-hover">
					<caption>결제정보</caption>
					<thead>
						<tr>
							<th style="text-align: center;">결제방식</th>
							<th style="text-align: center;">구매일시</th>
							<th style="text-align: center;">적립금</th>
							<th style="text-align: center;">배송비</th>
							<th style="text-align: center;">결제금액</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=purchase.getPayOption() %></td>
							<td><%=purchase.getOrderDate() %></td>
							<td><%=purchase.getPayAmount()/10 %>원</td>
							<th style="text-align: center;"><%=purchase.getDeliveryPrice() %>원</th>
							<td><%=purchase.getPayAmount() %>원</td>
						</tr>
					</tbody>
				</table>
				</div>
				
				
				<div class="row">
				<div style="padding-bottom: 16px;">
					<button type="button" class="btn" data-toggle="collapse"
						data-target="#notice">배송 유의사항 및 이용 혜택 안내</button>
					<div id="notice" class="collapse">
						<p>[국내도서/외국도서(교보배송)]</p>
						<p>도서만 1만원 이상 구매시 무료배송</p>
						<p>도서+음반/DVD/잡지/만화를 함께 1만원 이상 구매시 무료배송</p>
						<p>※ 1만원 미만시 2,000원 배송비 부과</p>
						<p>[음반/DVD/잡지/만화(교보배송)]</p>
						<p>각각 구매하거나 함께 2만원 이상 구매시 무료배송</p>
						<p>※ 2만원 미만시 2,000원 배송비 부과</p>
						<p>[양서해외주문도서/일서해외주문도서 (교보배송)]</p>
						<p>각각 구매하거나 함께 1만원 이상 구매시 무료배송</p>
						<p>※ 1만원 미만시 2,000원 배송비 부과</p>
						<p>[업체배송 상품(전집,GIFT 등)/중고장터 상품]</p>
						<p>해당 상품 상세페이지 “배송비” 참고</p>
						<p>(업체별/판매자별 무료배송 기준 다름)</p>
						<p>[그외 무료배송 기준]</p>
						<p>바로드림, eBook 상품을 주문한 경우</p>
						<p>프라임/플래티넘회원 무료배송쿠폰 이용하여 주문한 경우</p>
						<p>※ 유의 사항</p>
						<p>도서/음반/DVD 와 해외주문도서를 함께 구매시 분리배송으로 배송비가 각각 부과됨(장바구니 기준)</p>
						<p>예) 국내도서 7,000원 + 해외주문도서 7,000원을 함께 구매할 경우 배송비는 2,000원 +
							2,000원 = 4,000원 부과 (단, 주문/결제에서 합배송 신청시 배송비정책에 따라 무료배송 됨)</p>
					</div>
				</div>
			</div>
		</div>
		</form>
	</article>
<jsp:include page="../../footer.html"/>
</body>
</html>