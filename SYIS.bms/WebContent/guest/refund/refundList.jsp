<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.refund.service.RefundService"%>
<%@ page import="minsu.bms.refund.service.RefundServiceImpl"%>
<%@ page import="minsu.bms.refund.dao.RefundDao"%>
<%@ page import="minsu.bms.refund.dao.RefundDaoImpl"%>
<%@ page import="minsu.bms.refund.dao.mapper.RefundMapper"%>
<%@ page import="minsu.bms.refund.domain.Refund"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="minsu.bms.paging.domain.Page"%>
<%@ page import="minsu.bms.paging.service.RefundPageService"%>
<%@ page import="minsu.bms.paging.service.RefundPageServiceImpl"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%
	Page myPage = null;
	String currentPage = request.getParameter("currentPage");
	String id=(String)session.getAttribute("login");
	if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
	else myPage = new Page();
	
	RefundPageService pageService = new RefundPageServiceImpl(id, 5, myPage);
	pageContext.setAttribute("pageMaker", pageService);

	RefundMapper refundMapper = Configuration.getMapper(RefundMapper.class);
	RefundDao refundDao = new RefundDaoImpl(refundMapper);
	RefundService refundService = new RefundServiceImpl(refundDao);
	
	
	pageContext.setAttribute("refund", refundService.listRefundPage(id, myPage));
	
	
	%>

<html lang="ko">
<head>
<title>환불목록조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
/*환불목록*/
.table {
	text-align: center;
}

/*//환불목록*/

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

.nav-header {
	color: #909090;
}

/*//사이드바*/

</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>

	<!-- 환불조회화면 -->
	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<nav class="nav-sidebar">
						<ul class="nav">
							<li class="nav-header"><strong> 주문관리</strong></li>
							<li><a href="../order/orderListProc.jsp"> 주문조회</a></li>
							<li><a href="../basket/BasketProc.jsp"> 장바구니</a></li>
							<li class="active"><a href="refundList.jsp">취소/교환내역</a></li>
							<li class="nav-divider"></li>
							<li class="nav-header"><strong> 나의 정보</strong></li>
							<li><a href="../../shop/system/idCheck.jsp"> 회원정보 수정</a></li>
           					<li><a href="../../shop/system/idCheck1.jsp"> 회원 탈퇴</a></li>
							<li class="nav-divider"></li>
							<li class="nav-header"><strong> 나의 상담</strong></li>
							<li><a href="../customerCenter/queryList.jsp"> 나의 상담
									내역</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-md-10">
				<h3 style="font-weight: bold;">환불 내역보기</h3>
				<hr>
					<table class="table">
						<thead>
							<tr>
								<td><strong>환불번호</strong></td>
								<td><strong>상품</strong></td>
								<td><strong>환불일시</strong></td>
								<td><strong>환불금액</strong></td>
								<td><strong>환불방법</strong></td>
								<td><strong>환불사유</strong></td>
								<td><strong>환불상태</strong></td>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="refund" items="${refund}">
						
							<tr>
								<td>${refund.refundNum}</td>
								<td>${refund.bookName}</td>
								<td>${refund.refundDate}</td>
								<td>${refund.refundAmount}</td>
								<td>${refund.cancelType}</td>
								<td>${refund.refundReason}</td>
								<td>${refund.refundNow}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-center">
										<ul class="pagination">
											<c:if test="${pageMaker.prev}">
												<li><a href="refundList.jsp?currentPage=${pageMaker.startPage-1}">&laquo;</a></li>
											</c:if>
											
											<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
												<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' :''}"/>>
													<a href="refundList.jsp?currentPage=${idx}">${idx}</a>
												</li>
											</c:forEach>
											
											<c:if test="${pageMaker.next}">
												<li><a href="refundList.jsp?currentPage=${pageMaker.endPage+1}">&raquo;</a></li>
											</c:if>
										</ul>
											</div>
				</div>
			</div>
		</div>
	</article>
	<!-- 환불조회화면 -->
	<jsp:include page="../../footer.html"/>
</body>
</html>