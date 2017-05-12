<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.search.domain.SearchResult"%>
<%@ page import="minsu.bms.review.domain.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
%>
<html lang="ko">
<head>
<title>상품정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

/*구매창*/
.productInfo {
	float: right;
}
</style>
</head>
<body>
	<%
		SearchResult searchResult = (SearchResult)request.getAttribute("searchResult");
		List<Review> reviews = (List<Review>)request.getAttribute("reviews");
		String bookCode = searchResult.getBookCode();
	%>

	<jsp:include page="../../header.jsp" />
	<article>
		<form>
			<div class="container">
				<div class="row">
					<br> <br>
					<div class="col-sm-5">
						<a href="../../img/1.jpg" class="thumbnail"><img
							src="<%= searchResult.getImg() %>" style="width: 200px; height: 300px"></a>
					</div>

					<div class="col-sm-7">
						<h3 style="font-weight: bold;"><%=searchResult.getBookName()%></h3>
						<hr>
						<div>
							<em><%=searchResult.getWriter()%> </em><span class="bar"> | </span><em><%=searchResult.getCompany()%>
							</em><span class="bar"> | </span><%=searchResult.getPubliDate()%>
						</div>
						<hr>
						<p>
							<em>정가</em>
							<%=searchResult.getBookPrice()%>원
						</p>
						<p>
							<em>판매가</em>
							<%=searchResult.getBookPrice() * 9 / 10%>원
						</p>
						<br>
						<hr>
						<p>배송료 : 2500원</p>
						<br>
						<hr>
						<em>주문수량</em><input type="number" value="1" min="0" name="bookNum">
					</div>

				</div>
				<hr>
				<nav class="productInfo">
					<input type="hidden" name="bookCode" value="<%=bookCode%>" />
					<button type="submit" formaction="../../guest/basket/addBasketProc.jsp" class="btn btn-md">장바구니넣기</button>
					<button type="submit" formaction="../../guest/purchase/paymentProc.jsp" class="btn btn-md">바로구매하기</button>
				</nav>
			</div>
		</form>

		<div class="container">
			<div class="row">
				<h3>신간 Top5</h3>
				<hr>
				<div class="col-sm-1"></div>
				
			<%List<Book> newBook = (List<Book>)bookService.newBookList();
			for(int i=0;i<5;i++){ %>
			
				<div class="col-md-2">
					<a href="productInfoProc.jsp?bookCode=<%= newBook.get(i).getBookCode() %>" class="thumbnail"> 
					<img src="<%= newBook.get(i).getImg() %>" style="width: 150px; height: 150px">
					</a>
				</div>
			<%} %>
				<div class="col-sm-1"></div>
			</div>
		</div>
		<hr>
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#productInfo">상품정보</a></li>
				<li><a data-toggle="tab" href="#review">상품리뷰</a></li>
				<li><a data-toggle="tab" href="#swapRefund ">교환/환불</a></li>
			</ul>

			<div class="tab-content">
				<div id="productInfo" class="tab-pane fade in active">
					<h3>책소개</h3>
					<div class="text" style="border: 1px solid black;">
						<%= searchResult.getBookIntro() %>
					</div>
					<hr>
					<h3>저자소개</h3>
					<div class="text" style="border: 1px solid black;">
						<em><%= searchResult.getWriter() %></em><br>
						<%= searchResult.getWriterIntro() %>
					</div>
					<h3>출판사 서평</h3>
					<div class="text" style="border: 1px solid black;">
						<%= searchResult.getCompanyEval() %>
					</div>
					<br> <br>
					<jsp:include page="../../footer.html" />
				</div>
				<div id="review" class="tab-pane fade">
					<h3>리뷰작성</h3>
					<br>
					
					<form action="productInfoProc.jsp?bookCode=<%= bookCode %>" method="post">
						<strong>아이디:</strong> 
						
					<%
					if(session.getAttribute("login")!=null){
					%>
						<%= session.getAttribute("login") %>
					<%}else{ %>
						<span>로그인을 해주세요</span>	
					<%} %>
						<strong>평점:</strong> <input type="number" min="1" max="5"
							placeholder="1~5" name="gpa" style="width: 50px" required/>점<br> <br>
						<textarea name="comments" cols="100" rows="3"
							placeholder="리뷰내용을 작성하시오." required></textarea>
					
					<%
						if(session.getAttribute("login")!=null){
					%>
						<input type="submit" value="입력" />
					<%
						}else{
					%>
						<button formaction="../login/login.jsp">입력</button>
					<%
						}
					%>
					</form>
					
					<hr>
					<%
					if(request.getAttribute("reviews")!=null){
						for(Review review:reviews){
					%>
					
					<sapn><strong>아이디:</strong> <%= review.getUserId() %> </sapn><span> <strong>평점:</strong> <%= review.getGpa() %>점</p></span><br>
					<textarea name="comments" readonly cols="100" rows="3"><%= review.getReviewContent() %></textarea><br>
					<%
						}
					}
					%>
					<br> <br>
					<jsp:include page="../../footer.html" />
				</div>
				<div id="swapRefund" class="tab-pane fade">
					<h3>교환/환불안내</h3>
					<hr>
					<p>※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질
						수 있습니다.)</p>
					<table border="1">
						<tr>
							<th>반품 교환방법</th>
							<td>마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환신청 ,[1:1상담>반품/교환/환불]
								또는 고객센터 (1544-1900)</td>
						</tr>
						<tr>
							<th>반품/교환가능 기간</th>
							<td>변심반품의 경우 수령 후 7일 이내, 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일
								이내</td>
						</tr>
						<tr>
							<th>반품/교환비용</th>
							<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
						</tr>
						<tr>
							<th>반품/교환 불가 사유</th>
							<td><p>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우(단지 확인을 위한 포장
									훼손은 제외)</p>
								<p>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우 예) 화장품, 식품,
									가전제품(악세서리 포함) 등</p></td>
						</tr>
						<tr>
							<th>상품 품절</th>
							<td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는 이메일과
								문자로 안내드리겠습니다.</td>
						</tr>
					</table>
					<br> <br>
					<jsp:include page="../../footer.html" />
				</div>
			</div>
		</div>
	</article>

	<!-- //구매화면 -->

</body>
</html>