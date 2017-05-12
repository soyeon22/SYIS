<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.query.domain.Query"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="minsu.bms.paging.domain.Page"%>
<%@ page import="minsu.bms.paging.service.QueryPageService"%>
<%@ page import="minsu.bms.paging.service.QueryPageServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.query.dao.mapper.QueryMapper"%>
<%@ page import="minsu.bms.query.dao.QueryDao"%>
<%@ page import="minsu.bms.query.dao.QueryDaoImpl"%>
<%@ page import="minsu.bms.query.domain.Query"%>
<%@ page import="minsu.bms.query.service.QueryService"%>
<%@ page import="minsu.bms.query.service.QueryServiceImpl"%>
<%
	Page myPage = null;
	String currentPage = request.getParameter("currentPage");
	if (currentPage != null)
		myPage = new Page(Integer.parseInt(currentPage));
	else
		myPage = new Page();

	QueryPageService querypageService = new QueryPageServiceImpl(5, myPage);
	pageContext.setAttribute("pageMaker", querypageService);

	QueryMapper queryMapper = Configuration
			.getMapper(QueryMapper.class);
	QueryDao queryDao = new QueryDaoImpl(queryMapper);
	QueryService queryService = new QueryServiceImpl(queryDao);

	pageContext.setAttribute("querys", queryService.queryLists(myPage));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글리스트</title>
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
	border: none;
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
					<li class="nav-header"><strong> 회원관리</strong></li>
					<li><a href="../member/memberList.jsp">회원목록조회</a></li>
					<li class="nav-divider"></li>
					<li class="nav-header"><strong> 주문관리</strong></li>
					<li><a href="../inventoryControl/bookList.jsp">도서목록조회</a></li>
					<li><a href="../inventoryControl/bookAdd.jsp">도서 추가</a></li>
					<li class="nav-divider"></li>
					<li class="nav-header"><strong>재고관리</strong></li>
					<li><a href="../orderManagement/orderManagementProc.jsp">주문관리</a></li>
					<li class="nav-divider"></li>
					<li class="nav-header"><strong>고객센터</strong></li>
					<li class="active"><a href="../customerCenter/queryList.jsp">문의답하기</a></li>
				</ul>
			</nav>
		</div>
		<div class="col-md-10">
			<h2>문의 내역 보기</h2>
			<hr>
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">분류</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">등록일</th>
						<th style="text-align: center;">상태</th>
						<th style="text-align: center;">답변</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="query" items="${querys}">
						<tr>
							<td style="text-align: center;">${query.boardNum}</td>
							<td style="text-align: center;">${query.separation}</td>
							<td style="text-align: center;">${query.userId}</td>
							<td style="text-align: center;">${query.title}</td>
							<td style="text-align: center;">${query.reportingDate}</td>
							<td style="text-align: center;">${query.answerState}</td>
							<td style="text-align: center;">
								<c:choose>
									<c:when test="${query.answerState=='답변완료'}">
										<c:set var="msg" value="답변수정" scope="page" />
									</c:when>
									<c:when test="${query.answerState=='답변전'}">
										<c:set var="msg" value="답변하기" scope="page" />
									</c:when>
								</c:choose>
								<form action="query.jsp?boardNum=${query.boardNum}" method="post">
									<input type="submit" class="btn btn-md" value="${msg }">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a href="queryList.jsp?currentPage=${pageMaker.startPage-1}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' :''}"/>>
							<a href="queryList.jsp?currentPage=${idx}">${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li><a href="queryList.jsp?currentPage=${pageMaker.endPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</article>
<jsp:include page="../../footer.html" />
</body>
</html>