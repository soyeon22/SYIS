<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="minsu.bms.paging.domain.Page"%>
<%@ page import="minsu.bms.paging.service.UserPageService"%>
<%@ page import="minsu.bms.paging.service.UserPageServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ page import="minsu.bms.login.service.MemberService"%>
<%@ page import="minsu.bms.login.service.MemberServiceImpl"%>
<%
	Page myPage = null;
	String currentPage = request.getParameter("currentPage");
	if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
	else myPage = new Page();
	
	UserPageService userpageService = new UserPageServiceImpl(5, myPage);
	pageContext.setAttribute("pageMaker", userpageService);
	
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	MemberService memberService = new MemberServiceImpl(loginDao);
	
	pageContext.setAttribute("memberList", memberService.memberListPage(myPage));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원목록조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
/*회원목록*/
.table {
	text-align: center;
}
/*//회원목록*/

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

.nav-header{
	color : #909090;
}

/*//사이드바*/

</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<nav class="nav-sidebar">
						<ul class="nav">
							<li class="nav-header"><strong> 회원관리</strong></li>
							<li class="active"><a href="memberList.jsp">회원목록조회</a></li>
							<li class="nav-divider"></li>
							<li class="nav-header"><strong> 주문관리</strong></li>
							<li><a href="../inventoryControl/bookList.jsp">도서목록조회</a></li>
							<li><a href="../inventoryControl/bookAdd.jsp">도서 추가</a></li>
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
					<table class="table">
						<thead>
							<tr>
								<td><strong>아이디</strong></td>
								<td><strong>이름</strong></td>
								<td><strong>성별</strong></td>
								<td><strong>나이</strong></td>
								<td><strong>이메일</strong></td>
								<td><strong>핸드폰번호</strong></td>
								<td><strong>주소</strong></td>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td>${member.userId}</td>
								<td>${member.name}</td>
								<td>${member.gender}</td>
								<td>${member.age}</td>
								<td>${member.email}</td>
								<td>${member.phoneNum}</td>
								<td>${member.address}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a href="memberList.jsp?currentPage=${pageMaker.startPage-1}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' :''}"/>>
								<a href="memberList.jsp?currentPage=${idx}">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li><a href="memberList.jsp?currentPage=${pageMaker.endPage+1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</article>
<jsp:include page="../../footer.html"/>
</body>
</html>
