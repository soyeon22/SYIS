<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>이메일 무단 수집금지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
	<jsp:include page="../../header.jsp"/>


	<article>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<nav class="nav-sidebar">
						<ul class="nav">
							<li class="nav-header"><strong>인성문고</strong></li>
							<li><a href="insungInfo.jsp">회사소개</a></li>
							<li><a href="adInfo.jsp">광고안내</a></li>
							<li><a href="agreementUtilization.jsp">이용약관</a></li>
							<li><a href="individualInfo.jsp">개인정보처리방침</a></li>
							<li><a href="pictureInfo.jsp">영상정보처리방침</a></li>
							<li class="active"><a href="emailCollectBan.jsp">이메일무단복제금지</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-md-10">
					<br>
					<h2>이메일 무단 수집 금지</h2>
					<hr>
					<br> <img src="../../img/emailCollectBan.jpg"
						style="width: 100%;">

				</div>
			</div>

		</div>
	</article>
	<jsp:include page="../../footer.html"/>
</body>
</html>