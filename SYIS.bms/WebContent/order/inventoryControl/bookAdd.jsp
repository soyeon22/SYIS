<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="minsu.bms.writer.domain.Writer" %>
<%@ page import="minsu.bms.writer.service.WriterService"%>
<%@ page import="minsu.bms.writer.service.WriterServiceImpl"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	WriterService writerService = new WriterServiceImpl();
	pageContext.setAttribute("writers", writerService.listWriters());
%>
<html lang="ko">
<head>
<title>책추가</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
	<div class="col-md-2">
	<nav class="nav-sidebar">
        <ul class="nav">
        	<li class="nav-header"><strong> 회원관리</strong></li>
            <li><a href="../member/memberList.jsp">회원목록조회</a></li>
            <li class="nav-divider"></li>
     		<li class="nav-header"><strong> 주문관리</strong></li>
            <li><a href="bookList.jsp">도서목록조회</a></li>
            <li class="active"><a href="bookAdd.jsp">도서 추가</a></li>
            <li class="nav-divider"></li>
            <li class="nav-header"><strong> 재고관리</strong></li>
            <li><a href="../orderManagement/orderManagementProc.jsp"> 주문관리</a></li>
            <li class="nav-divider"></li>
			<li class="nav-header"><strong>고객센터</strong></li>
			<li><a href="../customerCenter/queryList.jsp">문의답하기</a></li>
        </ul>
    </nav>
	</div>
	<div class="col-md-10">
		<form class="form-horizontal">
		<br>
		<h2>도서 추가하기</h2>
		<br>
			<div class="col-md-12">
				<!-- 분류 -->
				<div class="form-group">
					<label class="col-md-2">분류 :</label>
					<div class="col-md-10">
						<div class="col-md-3">
<!-- 각 분류 버튼들 '>' 넣고 한줄 정렬 하기 -->
<%
	if(request.getAttribute("modBook") != null) { 
		Book book = (Book)request.getAttribute("modBook");
%> 
					<form>
					<input type="hidden" name="choice" value="mod"/> 
							<select class="form-control" name="country">
								<option value="국내">국내</option>
								<option value="해외">해외</option>
							</select>
						</div>
						<div class="col-md-3">
							<select class="form-control" name="kind">
								<option value="문학">문학</option>
								<option value="인문">인문</option>
								<option value="참고서">참고서</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="bookCode">도서 코드 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="bookCode" readonly value="<%= book.getBookCode()  %>" placeholder="도서 코드를 입력하세요.">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="bookName">도서 제목 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="bookName" value="<%= book.getBookName() %>" placeholder="도서 제목을 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="author">저자 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="writer" value="<%= book.getWriter() %>" placeholder="저자를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="publisher">출판사 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="company" value="<%= book.getCompany() %>" placeholder="출판사를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="publicationDate">출간일 :</label>
					<div class="col-md-10">
						<input type="date" class="form-control" name="publiDate" value="<%= book.getPubliDate() %>" placeholder="출간일을 입력하세요." required>
					</div>
				</div>
							
				<div class="form-group">
					<label class="col-md-2" for="listPrice">판매가 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="bookPrice" value="<%= book.getBookPrice() %>" placeholder="판매가를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="inventory">재고 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="inventory" value="<%= book.getInventory() %>" placeholder="재고를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="inventory">이미지 경로 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="img" value="<%= book.getImg() %>" placeholder="이미지경로를 입력하세요." required>
					</div>
				</div>
				<input type="hidden" class="form-control" name="salesNum" value="<%= book.getSalesNum() %>" placeholder="판매수량을 입력하세요." required>
				
				</div>
			<br><br>
			</div>
			<div class="row">
				<h3>책 소개</h3>
				<br>
				<div class="form-group">
					<label class="col-md-2" for="introduceContent">소개 내용 :</label>
					<div class="col-md-9">
						<textarea class="form-control" rows="10" id="introduceContent" name="bookIntro" placeholder="내용을 입력하세요." required><%= book.getBookIntro() %></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</div>
			</div>

			<!-- 출판사 서평 -->
			<div class="row">
				<h3>출판사 서평</h3>
				<br>
				<div class="form-group">
					<div class="col-md-11">
						<textarea class="form-control" rows="5" name = "companyEval" placeholder="내용을 입력하세요." required><%= book.getCompanyEval() %></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-9 col-sm-3">
				<button type="submit" formaction="addBookProc.jsp" style="float:right;">책수정</button>
			</form>
<%
	}else {
%>
					<form>
					<input type="hidden" name="choice" value="add"/> 
							<select class="form-control" name="country">
								<option value="국내">국내</option>
								<option value="해외">해외</option>
							</select>
						</div>
						<div class="col-md-3">
							<select class="form-control" name="kind">
								<option value="문학">문학</option>
								<option value="인문">인문</option>
								<option value="참고서">참고서</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2" for="bookCode">도서 코드 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="bookCode" placeholder="도서 코드를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="bookName">도서 제목 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="bookName" placeholder="도서 제목을 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="author">저자 :</label>
					<div class="col-md-10">
						<select class="form-control" name="writer">
							<c:forEach var="writer" items="${writers}">
								<option value="${writer.writer}">${writer.writer}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="publisher">출판사 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="company" placeholder="출판사를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="publicationDate">출간일 :</label>
					<div class="col-md-10">
						<input type="date" class="form-control" name="publiDate" placeholder="출간일을 입력하세요." required>
					</div>
				</div>
							
				<div class="form-group">
					<label class="col-md-2" for="listPrice">판매가 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="bookPrice" placeholder="판매가를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="inventory">재고 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="inventory" placeholder="재고를 입력하세요." required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2" for="inventory">이미지 경로 :</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="img" placeholder="이미지경로를 입력하세요." required>
					</div>
				</div>
				
				<input type="hidden" class="form-control" name="salesNum" value="0" placeholder="판매수량을 입력하세요." required>
				
			<br><br>
			</div>
			<div class="row">
				<h3>책 소개</h3>
				<br>
				<div class="form-group">
					<label class="col-md-2" for="introduceContent">소개 내용 :</label>
					<div class="col-md-9">
						<textarea class="form-control" rows="10" id="introduceContent" name="bookIntro" placeholder="내용을 입력하세요." required></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</div>
			</div>
			
			<!-- 출판사 서평 -->
			<div class="row">
				<h3>출판사 서평</h3>
				<br>
				<div class="form-group">
					<div class="col-md-11">
						<textarea class="form-control" rows="5" name = "companyEval" placeholder="내용을 입력하세요." required></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-9 col-sm-3">
				<button type="submit" formaction="addBookProc.jsp" style="float:right;">책추가</button>
				</form>
<%
	}
%>
				</div>
			</div>
	</div>
</div>
</article>
<br>
<jsp:include page="../../footer.html"/>
</body>
</html>

