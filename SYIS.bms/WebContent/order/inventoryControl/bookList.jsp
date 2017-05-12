<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="minsu.bms.paging.domain.Page" %>
<%@ page import="minsu.bms.paging.service.BookPageService" %>
<%@ page import="minsu.bms.paging.service.BookPageServiceImpl" %>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<%
	Page myPage = null;
	String currentPage = request.getParameter("currentPage");
	if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
	else myPage = new Page();
	
	BookPageService pageService = new BookPageServiceImpl(5, myPage);
	pageContext.setAttribute("pageMaker", pageService);
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	pageContext.setAttribute("posts", bookService.listBooks(myPage));
%>
<html lang="ko">
<head>
<title>책목록조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.table {
	text-align: center;
} 

/*여기까지*/
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
	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<nav class="nav-sidebar">
						<ul class="nav">
							<li class="nav-header"><strong> 회원관리</strong></li>
							<li><a href="../member/memberList.jsp">회원목록조회</a></li>
							<li class="nav-divider"></li>
							<li class="nav-header"><strong> 주문관리</strong></li>
							<li class="active"><a href="bookList.jsp">도서목록조회</a></li>
							<li><a href="bookAdd.jsp">도서 추가</a></li>
							<li class="nav-divider"></li>
							<li class="nav-header"><strong> 재고관리</strong></li>
							<li><a href="../orderManagement/orderManagementProc.jsp">
									주문관리</a></li>
							<li class="nav-divider"></li>
							<li class="nav-header"><strong>고객센터</strong></li>
							<li><a href="../customerCenter/queryList.jsp">문의답하기</a></li>
						</ul>
					</nav>
				</div>
					<div class="col-md-10">
						<table class="table table-hover">
							<thead>
								<tr>
									<td></td>
									<td><strong>도서코드</strong></td>
									<td><strong>분류</strong></td>
									<td><strong>제목</strong></td>
									<td><strong>저자</strong></td>
									<td><strong>출판사</strong></td>
									<td><strong>출간일</strong></td>
									<td><strong>정가</strong></td>
									<td><strong>재고수량</strong>
									<td><strong>정보수정</strong></td>
									<td><strong>삭제</strong></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="book" items="${posts}">
								<form>
								<tr>
									<td><input type="hidden" name="bookCode"
										value="${book.bookCode}"></td>
									<td>${book.bookCode}</td>
									<td>${book.kind}</td>
									<td>${book.bookName}</td>
									<td>${book.writer}</td>
									<td>${book.company}</td>
									<td>${book.publiDate}</td>
									<td>${book.bookPrice}</td>
									<td><input type="number" name = "inventory" value="${book.inventory}" required style="width:50px;"/><button type="submit" formaction="inventoryModProc.jsp">수정</button></td>
									<td><button type="submit" formaction="modifyBookProc.jsp">정보수정</button></td>
									<td><button type="submit" formaction="deleteBookProc.jsp">삭제</button></td>
								</tr>
								</form>
							</c:forEach>
							</tbody>
						</table>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">
								<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="bookList.jsp?currentPage=${pageMaker.startPage-1}">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' :''}"/>>
						<a href="bookList.jsp?currentPage=${idx}">${idx}</a>
					</li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li><a href="bookList.jsp?currentPage=${pageMaker.endPage+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
								<div class="col-sm-3"></div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</article>
	<!-- //구매화면 -->
	<jsp:include page="../../footer.html" />
</body>
</html>
