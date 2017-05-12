<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>
<%
	String kind = null;
	if(request.getAttribute("kind")!=null){
		kind = (String)request.getAttribute("kind");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	switch(kind) {
	case "k1" : %> <title>국내도서-문학</title><% break;
	case "k2" : %> <title>국내도서-인문</title><% break;
	case "k3" : %> <title>국내도서-참고서</title><% break;
	case "k4" : %> <title>국내도서-기타</title><% 
	}
%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
/* 간단한 책 소개 */
.text{
	text-align : center;
}
.classification{
	color:blue;
}

/* a tag가... 색이 안변한다?? */
/* .aTag:link {
	text-decoration:none; color:black;
} */

.author{
	color:gray;
}
.price{
	color:red;
}
/* 여기까지 */

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

</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
	
	<article>
		<div class="container">
			<!-- 사이드 네비 바 -->
		<div class="col-md-2">
			<nav class="nav-sidebar">
				<ul class="nav">
					<li class="nav-header"><strong> 국내도서</strong></li>
<% if(kind.equals("k1")){ %>
	<li class="active"><a href="categoryList.jsp?kind=k1">문학</a></li>
<% }else { %>
	<li><a href="categoryList.jsp?kind=k1">문학</a></li>
<% 	} %>
<% if(kind.equals("k2")){ %>
	<li class="active"><a href="categoryList.jsp?kind=k2">인문</a></li>
<% }else { %>
	<li><a href="categoryList.jsp?kind=k2">인문</a></li>
<% 	} %>
<% if(kind.equals("k3")){ %>
	<li class="active"><a href="categoryList.jsp?kind=k3">참고서</a></li>
<% }else { %>
	<li><a href="categoryList.jsp?kind=k3">참고서</a></li>
<% 	} %>
<% if(kind.equals("k4")){ %>
	<li class="active"><a href="categoryList.jsp?kind=k4">기타</a></li>
<% }else { %>
	<li><a href="categoryList.jsp?kind=k4">기타</a></li>
<% 	} %>
					<li class="nav-divider"></li>
					<li class="nav-header"><strong> 해외도서</strong></li>
					<li><a href="../foreignBook/categoryList.jsp?kind=f1">문학</a></li>
					<li><a href="../foreignBook/categoryList.jsp?kind=f2">인문</a></li>
					<li><a href="../foreignBook/categoryList.jsp?kind=f3">참고서</a></li>
					<li><a href="../foreignBook/categoryList.jsp?kind=f4">기타</a></li>
				</ul>
			</nav>
		</div>

		<div class="col-md-10">
			<!--베스트셀러-->
			<div class="row">
				<h3>▶ 베스트셀러</h3>
				<div class="col-md-1"></div>
<%
	request.getAttribute("books");
		if(request.getAttribute("books")!=null) {
			List<Book> books = (List<Book>)request.getAttribute("books");
			for(int i = 0; i<5; i++){
				Book book = books.get(i);
%>
				<div class="col-md-2">
					<a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>" class="thumbnail"> <img
						src="<%=book.getImg() %>" style="width: 150px; height: 150px">
					</a>
					<div class="text">
							<div class="classification"><p>[<%=book.getKind() %>]</p></div>
							<div class="aTag"><b><a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>"> <%= book.getBookName() %></a></b></div>
							<div class="author"><p><%= book.getWriter() %></p></div>
							<div class="price"><p><%= book.getBookPrice() %>원</p></div>
						</div>
				</div>
<%}} %>
			<div class="col-md-1"></div>
			</div>
			
			<!--MD추천작-->
			<div class="row">
				<h3>▶ MD추천작</h3>
				<div class="col-md-1"></div>
<%
	request.getAttribute("books");
		if(request.getAttribute("books")!=null) {
			List<Book> books = (List<Book>)request.getAttribute("books");
			for(int i = 5; i<10; i++){
				Book book = books.get(i);
%>
				<div class="col-md-2">
					<a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>" class="thumbnail"> <img
						src="<%=book.getImg() %>" style="width: 150px; height: 150px">
					</a>
					<div class="text">
							<div class="classification"><p>[<%=book.getKind() %>]</p></div>
							<div class="aTag"><b><a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>"><%= book.getBookName() %></a></b></div>
							<div class="author"><p><%= book.getWriter() %></p></div>
							<div class="price"><p><%= book.getBookPrice() %>원</p></div>
						</div>
				</div>
<%}} %>
			<div class="col-md-1"></div>
			</div>
			
			<!--신간-->
			<div class="row">
				<h3>▶ N E W</h3>
				<div class="col-md-1"></div>
<%
	request.getAttribute("books");
		if(request.getAttribute("books")!=null) {
			List<Book> books = (List<Book>)request.getAttribute("books");
			for(int i = 10; i<15; i++){
				Book book = books.get(i);
%>
				<div class="col-md-2">
					<a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>" class="thumbnail"> <img
						src="<%=book.getImg() %>" style="width: 150px; height: 150px">
					</a>
					<div class="text">
							<div class="classification"><p>[<%=book.getKind() %>]</p></div>
							<div class="aTag"><b><a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>"><%= book.getBookName() %></a></b></div>
							<div class="author"><p><%= book.getWriter() %></p></div>
							<div class="price"><p><%= book.getBookPrice() %>원</p></div>
						</div>
				</div>
<%}} %>
			<div class="col-md-1"></div>
			</div>
			<!--오늘의도서-->
			<div class="row">
				<h3>▶ 오늘의 도서</h3>
				<div class="col-md-1"></div>
			<%
	request.getAttribute("books");
		if(request.getAttribute("books")!=null) {
			List<Book> books = (List<Book>)request.getAttribute("books");
			for(int i = 15; i<20; i++){
				Book book = books.get(i);
%>
				<div class="col-md-2">
					<a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>" class="thumbnail"> <img
						src="<%=book.getImg() %>" style="width: 150px; height: 150px">
					</a>
					<div class="text">
							<div class="classification"><p>[<%=book.getKind() %>]</p></div>
							<div class="aTag"><b><a href="../../shop/search/productInfoProc.jsp?bookCode=<%= book.getBookCode() %>"><%= book.getBookName() %></a></b></div>
							<div class="author"><p><%= book.getWriter() %></p></div>
							<div class="price"><p><%= book.getBookPrice() %>원</p></div>
						</div>
				</div>
<%}} %>
			<div class="col-md-1"></div>
			</div>
		</div>
	</div>
</article>
<jsp:include page="../../footer.html"/>
</body>
</html>