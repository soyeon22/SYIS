<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.search.domain.SearchResult"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat"%>
<%
	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();
	
	//현재 날짜 구하기
	String strYear = Integer.toString(currentCalendar
			.get(Calendar.YEAR));
	String strMonth = df
			.format(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay = df
			.format(currentCalendar.get(Calendar.DATE));
	String strDate = strMonth + "월" + strDay + "일";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색결과</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

/* 정렬 옵션 버튼 */
 .orderOption{
 	border : none;
 	background-color : #fff;
 	margin : 15px 0 15px 15px;
 }

.nav {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

/* Style The Dropdown Button */
.dropbtn1 {
	background-color: #ffffff;
	padding: 16px;
	font-size: 13px;
	border: none;
	cursor: pointer;
	float: center;
	display: inline-block;
}

/* The container <div> - needed to position the dropdown content */
.dropdown1 {
	position: relative;
	display: inline-block;
	padding-right: 30px;
	padding-left: 50px;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

#searchPageNum {
	float: left;
}

#optBtn {
	float: right;
}

#line {
	display: inline;
	width: 50px;
}

#block {
	display: block;
	margin-top: 10px;
	width: 150px;
}
/*search end*/
article { /*본문*/
	background-color: white;
	height: 400px;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp" />
	<article> 
<%
	List<SearchResult> searchResults = (List<SearchResult>)request.getAttribute("searchResults");
	
	String pageNum=request.getParameter("pageNum");
	int currentNum=0;
	int startNum=0;
	int endNum=0;
	int dataNum=0;
	int totalPageNum=0;
	int startDataNum=0;
	int endDataNum=0;
	
	String searchText=(String)request.getAttribute("searchText");
	String searchOption=(String)request.getAttribute("searchOption");
	String orderOption=(String)request.getAttribute("orderOption");
%>
	<div class="container">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<p>
				총 <%= searchResults.size() %>개의 상품이 검색되었습니다.
			</p>
			<div class="navbar">
				<nav class="navbar">
				<div class="row">
					<div class="nav">
						<form>
							<input type="text" name="searchOption" value="<%= searchOption %>" hidden/>
							<input type="text" name="searchText" value="<%= searchText %>" hidden/>
							<input type="text" name="pageNum" value="1" hidden/>
							<button class="orderOption" name="orderOption" value="salesNum desc" formaction="searchResultProc.jsp">판매량순</button>
							<button class="orderOption" name="orderOption" value="reviewCnt desc" formaction="searchResultProc.jsp">리뷰순</button>
							<button class="orderOption" name="orderOption" value="publiDate desc" formaction="searchResultProc.jsp">출간일순</button>
							<button class="orderOption" name="orderOption" value="bookPrice desc" formaction="searchResultProc.jsp">높은가격순</button>
							<button class="orderOption" name="orderOption" value="bookPrice" formaction="searchResultProc.jsp">낮은가격순</button>
						</form>
					</div>
				</div>
				</nav>
			</div>
			<br>
			<%
				if(searchResults == null || searchResults.size()==0){
			%>
			<p>검색 결과가 없습니다.</p>
			<%
				}else{
					if(pageNum == null || pageNum.equals("")){
						currentNum=1;	
					}else{
						currentNum=Integer.parseInt(pageNum);
					}
					dataNum=searchResults.size();
					totalPageNum=(dataNum-1)/10+1;
					startNum=((currentNum-1)/10)*10+1;
					if(startNum/10 == totalPageNum/10){
						endNum=totalPageNum;
					}else{
						endNum=startNum+9;
					}
					startDataNum=(currentNum-1)*10+1;
					if(currentNum==totalPageNum){
						endDataNum=dataNum;
					}else{
						endDataNum=currentNum*10;
					}
					for(int i=startDataNum; i<=endDataNum; i++){
						SearchResult searchResult = searchResults.get(i-1);
			%>
			<form>
			<div class="row">
				<div class="col-md-2">
					<div>
						<a href="productInfoProc.jsp?bookCode=<%= searchResult.getBookCode() %>" class="thumbnail"> <img
							src="<%= searchResult.getImg() %>">
						</a>
					</div>
				</div>
				<div class="col-md-7">
					<p>[<%= searchResult.getKind() %>]
					</p> <br>
					<p>
						[<%= searchResult.getCountry() %>도서]<a href="productInfoProc.jsp?bookCode=<%= searchResult.getBookCode() %>"><%= searchResult.getBookName() %></a><br>
						<span><%= searchResult.getWriter() %></span>(지은이) | <span><%= searchResult.getCompany() %></span> | <%= searchResult.getPubliDate() %><br>
						<%= searchResult.getBookPrice() %>원 <%-- →<%= searchResult.getBookPrice()*9/10 %>원(10%
						할인), --%> 마일리지 <%= searchResult.getBookPrice()*9/10/20 %>점(5% 적립)<br> <br> 출고예상일 : 지금 주문하면 <b><%= strDate %> 출고</b>예상 (출고후 1~2일 이내 수령)
					</p>
				</div>
				<div class="col-md-3">
					<input type="hidden" name="bookCode" value="<%=searchResult.getBookCode() %>"/>
					<button id="block" type="submit" formaction="../../guest/basket/addBasketProc.jsp" class="btn btn-default btn-md">장바구니</button> 
					<button id="block" type="submit" formaction="../../guest/purchase/paymentProc.jsp" class="btn btn-default btn-md">바로구매</button>
				</div>
			</div>
			</form>
			<%
					}
				}
			%>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="text-center" id="searchPageNum">
						<ul class="pagination pagination-sm" id="pageNum">
							<%
								if (totalPageNum > 10) {
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=1">&laquo;</a></li>
							<%
									if (currentNum > 10) {
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=<%=currentNum / 10 * 10%>">&lsaquo;</a></li>
							<%
									} else {
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=1">&lsaquo;</a></li>
							<%
									}
								}
							%>
							<%
								if (startNum != 0) {
									for (int j = startNum; j <= endNum; j++) {
										if (j == currentNum) {
							%>
							<li class="active"><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=<%=j%>"><%=j%></a></li>
							<%
										} else {
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=<%=j%>"><%=j%></a></li>
							<%
										}
									}
								}
							%>
							<%
								if (totalPageNum > 10) {
									if ((currentNum-1) / 10 == totalPageNum / 10) {
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=<%=endNum%>">&rsaquo;</a></li>
							<%
									} else {
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=<%=(currentNum-1) / 10 * 10 + 11%>">&rsaquo;</a></li>
							<%
									}
							%>
							<li><a
								href="searchResultProc.jsp?searchOption=<%=searchOption%>&searchText=<%=searchText%>&pageNum=<%=totalPageNum%>">&raquo;</a></li>
							<%
								}
							%>
						</ul>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</div>
		</div>
	</div>
	</article>
	<jsp:include page="../../footer.html" />
</body>
</html>
