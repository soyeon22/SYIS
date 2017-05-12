<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.basket.domain.Basket"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="minsu.bms.paging.service.BookPageService" %>
<%@ page import="minsu.bms.paging.service.BookPageServiceImpl" %>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>장바구니</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
/*//장바구니스타일*/
/*사이드바*/

/* CSS코드는 관리자나 회원이나 동일한 코드 */
.nav-sidebar { 
    width: 100%;
    padding: 8px 0; 
    border-right: 1px solid #ddd;
}
.nav-sidebar a {
    color: #333;
    transition: all 0.08s linear;
    border-radius: 4px 0 0 4px; 
}
.nav-sidebar .active a { 
    cursor: default;
    background-color: rgb(115, 215, 209); 
    color: #fff; 
    text-shadow: 1px 1px 1px #666; 
}
.nav-sidebar .active a:hover {
    background-color: rgb(115, 215, 209);   
}

/* Right-aligned sidebar */
.nav-sidebar.pull-right { 
    border-right: 0; 
    border-left: 1px solid #ddd; 
}
.nav-sidebar.pull-right a { 
    border-radius: 0 4px 4px 0; 
}

.nav-header{
	color : #909090;
}

/*//사이드바*/

</style>
<script src="//code.jpuery.com/jquery-1.7.1.min.js"></script>
<script>
$(document).ready(function(){
	$('.check-all').click(function(){
		$('.ab').prop('checked',this.checked);
	});
});

</script>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
	<!-- 장바구니 -->
	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
				<nav class="nav-sidebar">
        <ul class="nav">
        	<li class="nav-header"><strong> 주문관리</strong></li>
            <li ><a href="../order/orderListProc.jsp"> 주문조회</a></li>
            <li class="active"><a href="BasketProc.jsp"> 장바구니</a></li>
            <li><a href="../refund/refundList.jsp">취소/교환내역</a></li>
            <li class="nav-divider"></li>
     		<li class="nav-header"><strong> 나의 정보</strong></li>
            <li><a href="../../shop/system/idCheck.jsp"> 회원정보 수정</a></li>
            <li><a href="../../shop/system/idCheck1.jsp"> 회원 탈퇴</a></li>
            <li class="nav-divider"></li>
            <li class="nav-header"><strong> 나의 상담</strong></li>
            <li><a href="../customerCenter/queryListProc.jsp"> 나의 상담 내역</a></li>
        </ul>
    </nav>
				</div>
				<%
							DecimalFormat df = new DecimalFormat("00");
								Calendar currentCalendar = Calendar.getInstance();

								//현재 날짜 구하기
								String strYear = Integer.toString(currentCalendar
										.get(Calendar.YEAR));
								String strMonth = df
										.format(currentCalendar.get(Calendar.MONTH) + 1);
								String strDay = df
										.format(currentCalendar.get(Calendar.DATE) + 3);
								String strDate = strYear + "년" + strMonth + "월" + strDay + "일";
				%>
				<div class="col-md-10">
						<h2 style="font-weight: bold;">장바구니</h2>
						<p>주문하실 상품을 선택하세요</p>
						<p>
						<hr class="star-primary">
						<%
					if(request.getAttribute("listBasket")!=null){
						List<Basket> listBasket=(List<Basket>)request.getAttribute("listBasket");
						int basketPrice=0,delivery = 0;%>
						<form>
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align:center;"><label><input type="checkbox" name="all" class="check-all" value="grammer">전체선택</label></th>
									<th style="text-align:center;">책이름</th>
									<th style="text-align:center;">가격</th>
									<th style="text-align:center;">수량</th>
									<th style="text-align:center;">합계</th>
									<th style="text-align:center;">도착예정일</th>
								</tr>
							</thead>
							<tbody>
<%
						for (Basket book : listBasket) {
							Book bookimg = bookService.findBook(book.getBookCode());
%> 								
								<tr>
									<td><input type="checkbox" name="basketNum" class="ab" value="<%= book.getBasketNum() %>"
										style="margin: 35px;"></td>
									<td><a href="../../shop/search/productInfo.jsp"> <img src="<%= bookimg.getImg() %>"
											class="img-responsive1"> <%=book.getBookName() %>
									</a></td>
									<td style="padding: 35px 15px;"><%=book.getBookPrice() %>원</td>
									<form>
									<input type="hidden" name="basketNum1" value="<%=book.getBasketNum() %>"/>
									<td>
										<input type="number" min="0" value="<%=book.getBookCount() %>" name="bookNum"
										style="  width: 50px; float: center; margin:0px 60px;" />
										<button type="submit" formaction="BasketUpdateProc.jsp" class="btn btn-default" style="display: block; width: 50px; float: center; margin: 0px 60px; margin-left:100px;">변경</button>
									</form>	
									</td>
									<td style="padding: 35px 15px;"><%=book.getBookPrice()*book.getBookCount() %>원</td>
									<td style="padding: 35px 15px;"><%=strDate %> 도착예정</td>
								</tr>
<%
 basketPrice += book.getBookPrice()*book.getBookCount();
						
	}
						if(basketPrice >29999){
							delivery = 0;
						}else if(basketPrice > 1){
							delivery = 2500;
						}

%>							
							</tbody>
						</table>
						<hr class="star-primary">
						<nav class="buynav">
							<a href="../../main.jsp"><button type="button" class="btn btn-default ">쇼핑계속하기</button></a>
							<button type="submit" class="btn btn-default" formaction="delBasketProc.jsp">삭제하기</button>
							<button type="submit" formaction="../purchase/paymentProc.jsp" class="btn btn-default ">구매하기</button>
						</nav>
				<br><br>
		</form>
					<div class="table">
						<table class="table">
							<thead>
								<tr>
									<th>상품금액</th>
									<th>배송비</th>
									<th>결제 예정금액</th>
									<th>적립예정</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%= basketPrice %></td>
									<td><%= delivery %></td>
									<td><%= basketPrice+delivery %></td>
									<td><%= basketPrice/10 %>원</td>
								</tr>
							</tbody>
						</table>
<%}				%>
					</div>
					<hr>
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
	</article>
<%
	String del = request.getParameter("del");
	if(del != null && !del.equals("") && del.equals("1")) {
%>
<script>
alert("상품을 선택해주세요.");	//경고창과 함께 스크립트 언어로 출력
</script>
<%
	}
%>
	<!-- //장바구니 -->
<jsp:include page="../../footer.html"/>
</body>
</html>