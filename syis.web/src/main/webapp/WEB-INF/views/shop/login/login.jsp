<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
<article>
	<jsp:include page="../../header.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
				<div class="col-md-5">
					<div class="row" style="border: 1px solid black;">
					<form action ="loginProc.jsp" method="post">
						<div class="col-md-8">
							<h2>회원 로그인</h2>
							<hr>
							<input type="text" class="form-control" name="id"
								data-rule-required="true" placeholder="아이디"
								maxlength="30"> 
							<input type="password" name="pw"
								class="form-control" 
								data-rule-required="true" placeholder="패스워드" maxlength="30">
							<br>
						</div>
						<div class="col-md-3">
							<br> <br> <br> <br>
							<button type="submit" style="width: 130px; height: 100px;">로그인</button>
						</div>
						<div class="row">
							<div class="col-md-12">
								<nav style="float:right;">
<% 			String msgld = request.getParameter("msgld");  //실패시 받은 파라미터값 추출
			if(msgld != null && !msgld.equals("") && msgld.equals("-1")) { //파라미터값 검사
%>	
<script>
	alert("로그인정보가 틀렸습니다.");	//경고창과 함께 스크립트 언어로 출력
</script>
		
<%
}
%> 
									<a href="../../guest/signUp/signUp.jsp">회원가입</a>
									<a href="../idFind/idFind.jsp">아이디찾기</a>
									<a href="../pwFind/pwFind.jsp">비밀번호찾기</a>
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
<br><br><br>
</article>
<jsp:include page="../../footer.html"/>
</body>
</html>