<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인성문고</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<style>
.msg{
	margin-top : 100px;
	text-align:center;
}
.toHome{
	margin: 30px 100px 0 0;
	float:right;
}


</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
<div class="container">
	<div class="col-md-8 col-md-offset-2">
		<div class="msg"><p><h1>회원 수정이 정상적으로 완료되었습니다.</h1></p></div>
		<div class="toHome"><a href="../../main.jsp">홈으로</a></div>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../../footer.html"/>
</body>
</html>