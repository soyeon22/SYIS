<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.delivery.domain.Delivery"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>배송조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="../../header.jsp"/>
<div class="container">
<div class="row">

<div class="col-md-12">
	<h3 style="font-weight: bold;">배송조회</h3>
	<table class="table table-bordered">
	<thead>
		<tr>
			<th style="text-align: center;">배송번호</th>
			<th style="text-align: center;">배송상태</th>
			<th style="text-align: center;">보내는사람</th>
			<th style="text-align center;">받는사람</th>
			<th style="text-align: center;">연락처</th>
			<th style="text-align: center;">배송지</th>
			<th style="text-align: center;">메세지</th>
			<th style="text-align: center;">도착예정일</th>
		</tr>
	</thead>
	<tbody>
	<tr>
	<%if(request.getAttribute("delivery")!=null){
		Delivery delivery = (Delivery)request.getAttribute("delivery");
		
	%>
		<td><%= delivery.getDeliveryNum()%></td>
		<td><%= delivery.getDeliveryNow()%></td>
		<td><%= delivery.getRecipient() %></td>
		<td><%= delivery.getSender() %></td>
		<td><%= delivery.getPhoneNum() %></td>
		<td><%= delivery.getAddress() %></td>
		<td><%= delivery.getMessage() %></td>
		<td><%= delivery.getDeliveryDate() %></td>
		<%} %>
		</tr>
	</tbody>
	</table>
	</div>
	</div>
</div>
<jsp:include page="../../footer.html"/>
</body>
</html>