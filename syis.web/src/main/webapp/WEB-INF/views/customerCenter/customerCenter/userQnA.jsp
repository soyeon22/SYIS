<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원안내</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
/*사이드바*/
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

/* 고객센터 이용안내 배경색 */
.guide {
	border: 1px solid gray;
	background-color: #EAEAEA;
}

.answer {
	padding: 0 0 0 0;
}

.panel-body {
	background-color: #EAEAEA;
}

</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
<article>

	<div class="container">
		<div class="col-md-2">
			<nav class="nav-sidebar">
				<ul class="nav">
		        	<li class="nav-header"><strong> FAQ</strong></li>
		            <li><a href="frequent10.jsp"> 자주 묻는 질문</a></li>
		            <li><a href="cancelPurchase.jsp"> 반품/교환/환불</a></li>
		            <li><a href="orderAndPayment.jsp"> 주문/결제</a></li>
		            <li class="active"><a href="userQnA.jsp"> 회원</a></li>
		            <li><a href="shipping.jsp"> 배송/수령일안내</a></li>
		            <li class="nav-divider"></li>
		            <li class="nav-header"><strong>문의하기</strong></li>
		            <li><a href="../../guest/customerCenter/query.jsp"> 1:1 문의하기</a></li>
		        </ul>
			</nav>
			<div class="guide">
				<p>-고객센터 이용안내-</p>
				<div class="contactNum">
					<p>0000-0000</p>
				</div>
				<p>*인터넷문의:</p>
				<p>-오전9시~오후6시(평일)</p>
				<p>*영업점문의:</p>
				<p>-오전9시~오후6시(평일)</p>
				<p>-오전9시~오후6시(주말 및 공휴일)</p>
				<p>*발신자부담전화</p>
			</div>
		</div>

		<div class="col-md-8">
			<div class="row">
				<h2>회원</h2>
				<div class="panel-group" id="accordion">
					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c1">
									<span class="glyphicon glyphicon-question-sign"></span>
									회원가입/회원탈퇴는 어떻게 하나요?
								</a>
							</h4>
						</div>
						<div id="c1" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p><b>회원가입</b><br>
									인터넷인성문고 화면 상단의 [회원가입]을 클릭하시면 <br>
									인증 및 약관동의 → 고객정보입력 → 가입완료의 단계를 거치시면 회원가입이 가능합니다. <br>
									인성문고는 고객님의 개인정보보호와 안전쇼핑을 위해 실명확인제를 실시하고 있습니다. <br>
									회원가입 바로가기 <br>
									<br>
									<b>회원탈퇴</b> <br>
									인성문고의 회원가입 및 탈퇴는 방문자의 의사를 존중합니다. <br>
									자유롭게 탈퇴하실 수 있으며 마이페이지 > 나의정보 > 회원탈퇴 > 탈퇴사유를 입력 후 확인을 누르시면 탈퇴처리됩니다. <br>
									회원탈퇴시 오프라인회원도 함께 탈퇴처리되며, 회원탈퇴와 동시에 <br>
									회원정보 및 구매실적, 보관함 등의 모든 기록이 삭제되므로 다시 한번 확인바랍니다.<br>
									<br>
									직접 탈퇴가 어려우신 경우 고객센터 0000-0000번 전화로 문의를 주시거나 1:1상담을 통해 문의를 남겨주신 뒤에 <br>
									[개인정보(정정 삭제)요구서 양식]을 작성하신 후 성명, 연락처를 기재해서 FAX(0000-0000)로 보내주시면 <br>
									요청하신 내역에 대해 확인 후 처리하고 답변 드리겠습니다. </p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c2">
									<span class="glyphicon glyphicon-question-sign"></span>
									회원정보변경은 어떻게 하나요?
								</a>
							</h4>
						</div>
						<div id="c2" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p><b>1) 회원 로그인 후, 인터넷인성문고 또는 모바일인성문고의 마이룸 > 회원정보관리 > 회원정보수정에서 변경 할 수 있습니다.</b><br> 
									<br>
									<b>2) 직접 변경이 어려우신 경우 고객센터 1544-1900번 전화로 문의를 주시거나 1:1상담을 통해 문의를 남겨주신 뒤에<br>
									[개인정보(정정 삭제)요구서 양식]을 작성하신 후 성명, 연락처를 기재해서 FAX(0502-987-5711)로 보내주시면 <br>
									요청하신 내역에 대해 확인 후 처리하고 답변 드리겠습니다. </b> <br>
									<br>
									본인이 아닐 경우는 위임장을 함께 전달해 주셔야 합니다. <br>
									<br>
									※ 단, 아이디(ID)와 실명관련정보는 변경 불가능합니다. <br>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c3">
									<span class="glyphicon glyphicon-question-sign"></span>
									개명으로 인한 이름변경은 어떻게 하나요?
								</a>
							</h4>
						</div>
						<div id="c3" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>회원가입 시 등록하신 이름이 개명절차를 통해 변경된 경우 아래의 절차를 통해 회원명 변경이 가능합니다. <br>
									<br>
									▶ [마이룸 → 회원정보관리 → 회원정보수정] 에서 이름 영역에 있는 [개명회원 성명변경] 클릭 <br>
									: [아이핀 인증]버튼 클릭→ 아이핀 아이디/비밀번호/숫자 입력 → 확인 후 변경된 이름으로 입력. <br>
									<br>
									* 현재 개인고객에 한해 이름이 변경됩니다. 법인고객의 경우 [1:1상담]또는 1544-1900으로 문의부탁드립니다. <br>
									* 만약 법적으로 개명이 완료 되었으나, 실명확인 절차시 비실명으로 확인되는 경우는 <br>
									아직 실명확인 기관에서 제공하는 실명정보에 변경된 성명이 등록되지 않았거나 또는 일치하지 않기 때문입니다. 아래 해당 기관을 통해 실명정보를 확인 하신 후 개명된 이름으로 변경 다시 신청해 주세요. 
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c4">
									<span class="glyphicon glyphicon-question-sign"></span>
									우수회원 선정 후, 유지기간이 남았는데도 등급이 상향조정 될 수 있나요?
								</a>
							</h4>
						</div>
						<div id="c4" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p><b>네. 가능합니다.</b><br> 
									<br>
									유지기간 중 직전 6개월 순수주문액이 상위 등급에 충족되시면 등급은 상향조정 되어 3개월간 유지됩니다.<br> 
									또한,인성핫트랙스 제3자 정보제공에 대한 동의로 인해 핫트랙스 매출이 합산되어 등급은 상향조정 될 수 있습니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c5">
									<span class="glyphicon glyphicon-question-sign"></span>
									새주소(도로명주소)란 무엇인가요?
								</a>
							</h4>
						</div>
						<div id="c5" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>
									현재의 번지중심의 주소체계를 물류·정보화시대에 맞는 위치정보체계를 도입한 주소체계로서 <br>
									도로에는 도로명을 건물에는 건물번호를 부여하는 도로방식에 의한 주소체계입니다. <br>
									<br>
									2007년 4월 5일부터 법적주소로서의 효력을 발생하였으나<br> 
									국민의 혼란방지를 위해 현행 지번주소와 병행하여 사용합니다. 
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