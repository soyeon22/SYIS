<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회사소개</title>
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
/*/사이드바*/

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
							<li class="active"><a href="insungInfo.jsp">회사소개</a></li>
							<li><a href="adInfo.jsp">광고안내</a></li>
							<li><a href="agreementUtilization.jsp">이용약관</a></li>
							<li><a href="individualInfo.jsp">개인정보처리방침</a></li>
							<li><a href="pictureInfo.jsp">영상정보처리방침</a></li>
							<li><a href="emailCollectBan.jsp">이메일무단복제금지</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<br>
							<h2>인사말 및 소개</h2>
							<hr>
						</div>
						<div class="row">
							<div class="col-md-10">
								<p>인성문고에 오신 것을 환엽합니다.</p>
								<p>
									<strong>"책 읽는 사람이 세상을 바꾼다!"</strong>
								</p>
								<p>(주)인성문고는 모든 고객들이 책을 통해 지식을 습득하고 마음의 양식을 얻으실 수 있는 지식 정보
									문화의 중심 역할을 수행하고, 급변해가는 사회 문화와 환경에 발 맞추어 고객 여러분의 소리에 능동적으로 대응하는
									고객 서비스 제일의 회사가 되기 위해 항상 노력하겠습니다.</p>
								<ul>
									<li><strong>고객과 보다 가까이 함께하는 지식 문화공간</strong></li>
									<li><strong>증겁고 유익한 행사 및 이벤트가 함께하는 문화공간</strong></li>
									<li><strong>기업과 고객이 믿음으로 함께하는 문화공간</strong></li>
								</ul>
							</div>
							<div class="col-md-2">
								<img src="../../img/insungInfo/introduction1.jpg">
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<br>
								<h2>회사 연혁</h2>
								<hr>
								<p>인성문고가 걸어온 발자취 입니다.</p>
								<p>인성문고의 설립부터 현재까지, 인성의 연혁을 소개합니다.</p>
								<dl>
									<dt>2010.08.03</dt>
									<dd>㈜인성문고 일산점 개점</dd>
									<dt>2010.08.25</dt>
									<dd>㈜인성문고 광복점 개점</dd>
									<dt>2010.12.03</dt>
									<dd>㈜인성문고 천안아산점 개점</dd>
									<dt>2010.12.10</dt>
									<dd>㈜인성문고 청량리점 개점</dd>
									<dt>2011.07.30</dt>
									<dd>㈜인성문고 목포점 개점</dd>
									<dt>2011.12.09</dt>
									<dd>㈜인성문고 김포공항점 개점</dd>
									<dt>2011.12.22</dt>
									<dd>㈜인성문고 대전점 개점</dd>
									<dt>2012.03.29</dt>
									<dd>㈜인성문고 평촌점 개점</dd>
									<dt>2012.04.20</dt>
									<dd>㈜인성문고 의정부점 개점</dd>
									<dt>2012.08.30</dt>
									<dd>㈜인성문고 여의도점 개점</dd>
									<dt>2014.11.27</dt>
									<dd>㈜인성문고 코엑스몰점 개점</dd>
									<dt>2015.09.01</dt>
									<dd>㈜인성문고 강남역점 개점</dd>
									<dt>2016.04.14</dt>
									<dd>㈜인성문고 남포점 개점</dd>
									<dt>2016.05.13</dt>
									<dd>㈜인성문고 전주점 개점</dd>
									<dt>2016.08.29</dt>
									<dd>㈜인성문고 죽전점 개점</dd>
									<dt>2016.09.05</dt>
									<dd>㈜인성문고 하남스타필드점 개점</dd>
									<dt>2016.10.10</dt>
									<dd>㈜인성문고 대구 대백점 개점</dd>
								</dl>
								<br>
								<h2>CEO 인사말</h2>
								<hr>
								<p>
									<strong>"인성문고는 좋은 책을 추천하고, 읽은 방법을 소개하여 고객이 책을 총해 꿈을
										키워하는 사회가 될 수 있도록 노력하겠습니다."</strong>
							</div>
							<div class="row">
								<div class="col-md-8">
									<br> <br>
									<p>인성문고는 지금의 성장에 안주하지 않고, 고객만족을 위해 최선을 다할 것이며,</p>
									<p>그 이름에 걸맞는 글로벌 지식문화 브랜드로 성장하여 최상의 고객가치를</p>
									<p>제공할 수 있도록 전력을 다하겠습니다.</p>
									<br>
									<p>
										<strong>인성문고를 이용하시는 모든 고객들께 다시 한 번 진심으로 감사의 말씀을 드립니다.</strong>
									</p>

								</div>
								<div class="col-md-4">
									<img src="../../img/ceo.jpg"
										style="border-radius: 100%; width: 300px; height: 400px;">
									<div class="text">
										<p>인성문고 주식회사 대표이사</p>
										<p>
											<strong>이 인 석</strong>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
	<jsp:include page="../../footer.html"/>
</body>
</html>