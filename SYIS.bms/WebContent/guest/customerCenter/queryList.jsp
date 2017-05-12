<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	QueryMapper queryMapper = Configuration.getMapper(QueryMapper.class);
	QueryDao queryDao = new QueryDaoImpl(queryMapper);
	QueryService queryService = new QueryServiceImpl(queryDao);

	Page myPage = null;
	String userId=(String)session.getAttribute("login");
	String currentPage = request.getParameter("currentPage");
	if(currentPage != null)myPage = new Page(Integer.parseInt(currentPage));
	else myPage = new Page();
	
	QueryPageService querypageService = new QueryPageServiceImpl(userId, 5, myPage);
	pageContext.setAttribute("pageMaker", querypageService);
	
	
	pageContext.setAttribute("querys", queryService.queryList(userId, myPage));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>나의 상담내역</title>
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
	<div class="container">
		<div class="col-md-2">

			<nav class="nav-sidebar">
				<ul class="nav">
					<li class="nav-header"><strong> 주문관리</strong></li>
					<li><a href="../order/orderListProc.jsp"> 주문조회</a></li>
					<li><a href="../basket/BasketProc.jsp"> 장바구니</a></li>
					<li><a href="../refund/refundList.jsp">취소/교환내역</a></li>
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
		<div class="col-md-10">
			<h2>나의 상담 내역</h2>
			<table class="table table-hover">
				<form>
					<button type="submit" formaction="query.jsp" class="btn btn-md"
						style="float: right;">문의하기</button>
				</form>
				<thead>

					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>등록일</th>
						<th>답변상태</th>
						<th>답변</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="query" items="${querys}">

						<tr>
							<td>${query.boardNum}</td>
							<td>${query.separation}</td>
							<td>${query.title}</td>
							<td>${query.reportingDate}</td>
							<td>${query.answerState}</td>
							<td>

									<c:if test="${query.answerState=='답변완료'}">
									<c:set var="msg" value="답변보기" scope="page" />
									</c:if>
									<c:if test="${query.answerState=='답변전'}">
									<c:set var="msg" value="답변없음" scope="page" />
									</c:if>
									
									<form action="queryUpdate.jsp">
									<input type="hidden" name="boardNum" value="${query.boardNum}" />
										<input type="submit" class="btn btn-md" value="${msg}" />

														</form>
													</td>
													<td>
																<button class="btn btn-md" data-toggle="modal"
																	data-target="#del${query.boardNum}">삭제</button>
																	
																<div class="modal fade" id="del${query.boardNum}"
																role="dialog" aria-labelledby="delete" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button type="button" class="close" data-dismiss="modal"
																				aria-hidden="true">
																				<span class="glyphicon glyphicon-remove"
																					aria-hidden="true"></span>
																			</button>
																			<h4 class="modal-title custom_align" id="Heading">문의내역
																				삭제</h4>
																		</div>
																		<form action="queryDelProc.jsp" method="post"
																			class="modal-body">
																			<div class="alert alert-danger">
																				<span class="glyphicon glyphicon-warning-sign"></span> 문의내역을
																				삭제하시겠습니까? <input type="hidden" name="boardNum"
																					value="${query.boardNum}"/>
																			</div>
																			<div class="modal-footer ">
																				<button type="submit" class="btn btn-default">
																					<span class="glyphicon glyphicon-ok-sign"></span> 확인
																				</button>
																				<button type="button" class="btn btn-default"
																					data-dismiss="modal">
																					<span class="glyphicon glyphicon-remove"></span> 취소
																				</button>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
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
										<jsp:include page="../../footer.html" />
									</body>
									</html>
									