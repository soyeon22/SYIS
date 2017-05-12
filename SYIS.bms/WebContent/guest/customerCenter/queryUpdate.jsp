<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.query.dao.mapper.QueryMapper" %>
<%@ page import="minsu.bms.query.dao.QueryDao" %>
<%@ page import="minsu.bms.query.dao.QueryDaoImpl" %>
<%@ page import="minsu.bms.query.domain.Query" %>
<%@ page import="minsu.bms.query.service.QueryService" %>
<%@ page import="minsu.bms.query.service.QueryServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
QueryMapper queryMapper = Configuration.getMapper(QueryMapper.class);
QueryDao queryDao = new QueryDaoImpl(queryMapper);
QueryService queryService = new QueryServiceImpl(queryDao);

int boardNum = Integer.parseInt(request.getParameter("boardNum"));
Query query = queryService.findQueryNum(boardNum);
request.setAttribute("query", query);


%>
<html lang="ko">
<head>
<title>글자세히보기</title>
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
</style>
</head>
<body>
	<jsp:include page="../../header.jsp" />
	<article>

		<div class="container">
			<div class="col-md-2">
				<nav class="nav-sidebar">
					<ul class="nav">
						<li class="nav-header"><strong> 주문관리</strong></li>
						<li><a href="orderList.jsp"> 주문조회</a></li>
						<li><a href="../basket/BasketProc.jsp"> 장바구니</a></li>
						<li><a href="refundDetail.jsp">취소/교환내역</a></li>
						<li class="nav-divider"></li>
						<li class="nav-header"><strong> 나의 정보</strong></li>
						<li><a href="../../shop/system/idCheck.jsp"> 회원정보 수정</a></li>
						<li><a href="../../shop/system/idCheck1.jsp"> 회원 탈퇴</a></li>
						<li class="nav-divider"></li>
						<li class="nav-header"><strong> 나의 상담</strong></li>
						<li class="active"><a href="queryList.jsp"> 나의 상담 내역</a></li>
					</ul>
				</nav>
			</div>
			<c:if test="${query.answer!=null}">
				<c:set var="answer" value="${query.answer}" scope="page" />
				<c:set var="readonly" value="readonly" scope="page" />
				<c:set var="title" value="답변보기" scope="page" />
				<c:set var="button" value="확인" scope="page" />
			</c:if>
			<c:if test="${query.answer==null}">
				<c:set var="answer" value="" scope="page" />
				<c:set var="readonly" value="" scope="page" />
				<c:set var="button" value="수정" scope="page" />
			</c:if>
			
			<div class="col-md-8">
				<div class="row">

					<div class="form-group row">
						<h2>${title}</h2>
						<hr>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-1" for="className">번 호
						</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="className"
								name="boardNum" value="${query.boardNum}" readonly />
						</div>
						<label class="control-label col-md-1" for="classification">분
							류 </label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="classification"
								name="separation" value="${query.separation}" readonly />
						</div>
						<label class="control-label col-md-1" for="person">ID :</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="person" name="userId"
								value="${query.userId}" readonly />
						</div>
						<label class="control-label col-md-1" for="reportingDate">날
							짜</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="reportingDate"
								name="reportingDate" value="${query.reportingDate}"
								readonly />
						</div>
					</div>
					<form action="queryUpdateProc.jsp">
						<div class="form-group row">
							<label class="control-label col-md-2" for="title">제 목 : </label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="title" name="title"
									value="${query.title}" required ${readonly} />
							</div>
						</div>

						<div class="form-group row">
							<label class="control-label col-md-2" for="content">문의 내용
								: </label>
							<div class="col-md-10">
								<input class="form-control" rows="10" id="content"
									name="content" value="${query.content}" required ${readonly}/>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2" for="answer">답변 내용
								: </label>
							<div class="col-md-10">
							
								<input class="form-control" rows="10" id="answer" name="answer"
									value="${answer}" readonly />
								
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-10 col-sm-3">
								<input type="hidden" name="boardNum"
									value="${query.boardNum}" />
								<input type="submit" class="btn btn-md" value="${button}"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</article>
	<jsp:include page="../../footer.html" />
</body>
</html>
