<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
Query queryList = queryService.findQueryNum(boardNum);

request.setAttribute("query", queryList);

%>
<!DOCTYPE html>
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
           		 	<li><a href="../inventoryControl/listBooksProc.jsp">도서목록조회</a></li>
            		<li><a href="../inventoryControl/bookAdd.jsp">도서 추가</a></li>
            		<li class="nav-divider"></li>
           			<li class="nav-header"><strong> 재고관리</strong></li>
            		<li><a href="../orderManagement/orderManagementProc.jsp"> 주문관리</a></li>
            		<li class="nav-divider"></li>
					<li class="nav-header"><strong>고객센터</strong></li>
					<li class="active"><a href="../customerCenter/queryList.jsp">문의답하기</a></li> 
				</ul>
   			 </nav>
		</div>
		<div class="col-md-8">
			<div class="row">
				<form class="form">
					<div class="form-group row">
						<h2>문의 답하기</h2>
						<hr>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-1" for="className">번 호 </label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="className" name="boardNum" value="${query.boardNum}" readonly/>
						</div>
						<label class="control-label col-md-1" for="classification">분 류 </label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="classification" name="separation" value="${query.separation}" readonly/>
						</div>
						<label class="control-label col-md-1" for="person">ID :</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="person" name="userId" value="${query.userId}" readonly/>
						</div>
						<label class="control-label col-md-1" for="reportingDate">날 짜</label>
						<div class="col-md-2">
							<input type="text" class="form-control" id="reportingDate" name="reportingDate" value="${query.reportingDate}" readonly/>
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-2" for="title">제 목 : </label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="title" name="title" value="${query.title}" readonly/>
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-2" for="content">문의 내용 : </label>
						<div class="col-md-10">
							<input class="form-control" rows="10" id="content" name="content" value="${query.content}" readonly/>
						</div>
					</div>
					<c:if test="${query.answerState=='답변완료'}"><c:set var="answer" value="${query.answer}" scope="page" /></c:if>
					<div class="form-group row">
						<label class="control-label col-md-2" for="answer">답변 내용 : </label>
						<div class="col-md-10">
							<textarea class="form-control" rows="10" id="answer" placeholder="답변을 입력하세요." name="answer" >${answer}</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-9 col-sm-3" style="margin-bottom:15px;">
							<button type="submit" formaction="queryResultProc.jsp" class="btn btn-default" >확인</button>
							<button type="submit" formaction="queryList.jsp" class="btn btn-default">취소</button>
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