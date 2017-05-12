<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.query.domain.Query" %>
<%@ page import="minsu.bms.query.service.QueryService" %>
<%@ page import="minsu.bms.query.service.QueryServiceImpl" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>1대1문의</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
/*사이드바*/
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

/* 고객센터 이용안내 배경색 */
.guide {
	border: 1px solid gray;
	background-color: #EAEAEA;
}

.answer {
	padding: 0 0 0 0;
}

.panel-body {
	background-color: #EAEAEA;
}


</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>

<article>

	<div class="container">
		<div class="col-md-2">
			<nav class="nav-sidebar">
				<ul class="nav">
		        	<li class="nav-header"><strong> FAQ</strong></li>
		            <li><a href="../../customerCenter/customerCenter/frequent10.jsp"> 자주 묻는 질문</a></li>
		            <li><a href="../../customerCenter/customerCenter/cancelPurchase.jsp"> 반품/교환/환불</a></li>
		            <li><a href="../../customerCenter/customerCenter/orderAndPayment.jsp"> 주문/결제</a></li>
		            <li><a href="../../customerCenter/customerCenter/userQnA.jsp"> 회원</a></li>
		            <li><a href="../../customerCenter/customerCenter/shipping.jsp"> 배송/수령일안내</a></li>
		            <li class="nav-divider"></li>
		            <li class="nav-header"><strong>문의하기</strong></li>
		            <li class="active"><a href="query.jsp"> 1:1 문의하기</a></li>
		           
		        </ul>
			</nav>
			<div class="guide">
				<p>-고객센터 이용안내-</p>
				<div class="contactNum">
					<p>0000-0000</p>
				</div>
				<p>*인터넷문의:</p>
				<p>-오전9시~오후6시(평일)</p>
				<p>*영업점문의:</p>
				<p>-오전9시~오후6시(평일)</p>
				<p>-오전9시~오후6시(주말 및 공휴일)</p>
				<p>*발신자부담전화</p>
			</div>
		</div>

		<div class="col-md-8">
			<div class="row">
			<div class="form-group row">
				<h2>1:1 문의하기</h2>
				<hr>
			</div>
		
			<form class="form" action="queryAddProc.jsp">
			<div class="form-group row">
				<label class="control-label col-md-2">분 류 </label>
				<div class="col-md-2">
					<select class="form-control" id="sel1" name="separation" >
						<option value="구매">구매</option>
						<option value="환불">환불</option>
						<option value="배송">배송</option>
						<option value="회원">회원</option>
					</select>
				</div>
				</div>
				
			<div class="form-group row">
				<label class="control-label col-md-2" for="title">제 목 : </label>
				<div class="col-md-10">
					<input type="text" class="form-control" id="title" placeholder="제목을 입력하세요." name="title" required/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="control-label col-md-2" for="content">문의 내용 : </label>
				<div class="col-md-10">
					<textarea class="form-control" rows="10" id="content" placeholder="내용을 입력하세요." name="content" required></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-9 col-sm-3">
					<button type="submit" class="btn btn-default">확인</button>
					<a href="queryListProc.jsp"><button type="button" class="btn btn-default">취소</button></a>
				</div>
			</div>
		</form>
				</div>
			</div>
		</div>
	</article>
<jsp:include page="../../footer.html"/>
</body>
</html>