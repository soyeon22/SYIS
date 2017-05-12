<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.SignUp" %>
<%@ page import="minsu.bms.login.service.SignUpImpl" %>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호 재확인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>

</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("login");
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	SignUp signUp = new SignUpImpl(loginDao);
	User user=signUp.findUser(id);
%>
	<jsp:include page="../../header.jsp"/>
<article>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-5">
			<form action="../../guest/mypage/memberLeave.jsp">
				<div class="row" style="border: 1px solid black;">
				
					<div class="col-md-8">
						<h2>비밀번호 재확인</h2>
						<hr>
						<input type="text" 
							class="form-control" name="name"
							data-rule-required="true" readonly value="<%=user.getUserId() %>" maxlength="30"> 
						<input type="password"
							class="form-control" name="resident" 
							data-rule-required="true" placeholder="비밀번호입력" maxlength="30">
					</div>
					<div class="row">
					<div class="col-md-12">
						<nav class="Finds" style="float:right;">
							<button type="submit" class="btn  btn-md" >확인</button>
			
						</nav>
					</div>
				</div>
				</div>	
						</form>
				</div>
				<div class="col-md-5">
					<img src="../../img/ad/login.jpg" width="230px">
				</div>		
		</div>
	</div>
<br><br><br><br><br><br><br><br>

</article>
<jsp:include page="../../footer.html"/>
</body>
</html>