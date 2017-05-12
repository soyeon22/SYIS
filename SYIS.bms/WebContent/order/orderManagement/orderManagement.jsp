<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.orderManagement.domain.Order" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>주문관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#orderDate {
	padding-top: 25px;
}

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
	<article>
		<div class="container">
			<div class="col-md-2">
				<nav class="nav-sidebar">
					<ul class="nav">
						<li class="nav-header"><strong> 회원관리</strong></li>
						<li><a href="../member/memberList.jsp">회원목록조회</a></li>
						<li class="nav-divider"></li>
						<li class="nav-header"><strong> 주문관리</strong></li>
						<li><a href="../inventoryControl/bookList.jsp">도서목록조회</a></li>
						<li><a href="../inventoryControl/bookAdd.jsp">도서 추가</a></li>
						<li class="nav-divider"></li>
						<li class="nav-header"><strong> 재고관리</strong></li>
						<li class="active"><a href="orderManagementProc.jsp"> 주문관리</a></li>
						<li class="nav-divider"></li>
						<li class="nav-header"><strong>고객센터</strong></li>
						<li><a href="../customerCenter/queryList.jsp">문의답하기</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-3">
						<h2>주문관리</h2>
						<hr>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-5">
						<form class="form-horizontal col-md-12" id="orderDate" action="orderManagementProc.jsp"
							method="POST">
							<div class="form-group registration-date">
								<div class="input-group registration-date-time">
									<span class="input-group-addon" id="basic-addon1"><span
										class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
									<input class="form-control" name="registrationDate1"
										id="registration-date1" type="date" value="<%= request.getParameter("registrationDate1") %>"> <span
										class="input-group-addon" id="basic-addon1">~</span> 
										<input
										class="form-control" name="registrationDate2"
										id="registration-date2" type="date" value="<%= request.getParameter("registrationDate2") %>"> <span
										class="input-group-btn">
										<button class="btn btn-default" type="submit">확인</button>
									</span>
								</div>
							</div>
						</form>
					</div>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>회원아이디</th>
							<th>주문번호</th>
							<th>주문날짜</th>
							<th>배송주소</th>
							<th>상품코드</th>
							<th>주문수량</th>
							<th>배송상황</th>
							<th>지불방법</th>
							<th>책가격</th>
						</tr>
					</thead>
					<tbody>
						<%			
									if (request.getAttribute("orders") != null) {
										List<Order> orders = (List<Order>) request.getAttribute("orders");
										int totalPrice=0 ;
										for (Order order : orders) {
											 totalPrice += order.getPayAmount();
								%>
								<tr>
									<td><%=order.getUserId()%></td>
									<td><%=order.getOrderNum()%></td>
									<td><%=order.getOrderDate()%></td>
									<td><%=order.getDestination()%></td>
									<td><%=order.getBookCode()%></td>
									<td><%=order.getOrderCount()%></td>
									<td><%=order.getDeliveryNum()%></td>
									<td><%=order.getPayOption() %></td>				
									<td><%=order.getPayAmount() %>원</td>
								</tr>
								<%
									}
								%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7">
							</td>
							<th>총 금액 :</th>
							<td><%= totalPrice %>원</td>
							
							<%
								} 
							%>
							
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</article>

	<!-- //구매화면 -->
	<jsp:include page="../../footer.html"/>
</body>
</html>