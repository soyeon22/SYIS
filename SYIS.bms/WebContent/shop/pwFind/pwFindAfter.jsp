<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>


</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-5">
						<div class="row" style="border: 1px solid black;">
							<div class="col-md-12">
								<h2>비밀번호 찾기</h2>
								<hr>

								<br>
								<p><%=request.getAttribute("msg1")%></p>
								<p><%=request.getAttribute("msg2") %></p>
								<br>
							</div>
							<form>
							<div class="row">
								<div class="col-md-12">
									<nav class="Finds" style="float: right; margin-bottom:10px; margin-right:10px;">
										<button type="submit" class="btn btn-md" formaction="../login/login.jsp">로그인하기</button>
										<button type="submit" class="btn btn-md" formaction="../../main.jsp">홈으로가기</button>
									</nav>
								</div>
							</div>
							</form>
				</div>
			</div>
			<div class="col-md-5">
				<img src="../../img/ad/login.jpg" width="230px">
			</div>
		</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</article>
	<jsp:include page="../../footer.html"/>
</body>
</html>