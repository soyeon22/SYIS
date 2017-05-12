<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>주문/결제</title>
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
		            <li class="active"><a href="orderAndPayment.jsp"> 주문/결제</a></li>
		            <li><a href="userQnA.jsp"> 회원</a></li>
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
				<h2>주문/결제</h2>
				<div class="panel-group" id="accordion">
					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c1">
									<span class="glyphicon glyphicon-question-sign"></span> 주문취소 할
									수 있나요?
								</a>
							</h4>
						</div>
						<div id="c1" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>
										<b>※주문취소 안내</b> <br> - 주문을 하고, 결제를 진행하는 단계에서만 주문취소 하실 수
										있습니다. <br> - eBook 상품은 주문 후, 7일 이내에만 취소 하실 수 있습니다. <br>
										- 주문취소할 수 없는 진행단계에 있는 상품의 경우에는 배송완료 후, 반품신청을 하시기 바랍니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c2">
									<span class="glyphicon glyphicon-question-sign"></span>
									실시간계좌이체란 무엇인가요?
								</a>
							</h4>
						</div>
						<div id="c2" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>실시간계좌이체는 고객님의 은행계좌에서 실시간으로 결제금액을 이체하여 결제할 수 있는 편리한 현금결제 방식입니다. <br>
									결제 후 따로 입금하지 않으셔도 되며 별도 수수료 부담 없이 이용하실 수 있습니다. <br>
									<br>
									* 실시간계좌이체 서비스 이용가능 은행 <br>
									: 국민,농협,우리,SC제일,기업,외환,수협중앙회,신한(조흥),한국씨티,대구,부산,광주,제주,전북,경남,하나,우체국,새마을금고,신협<br> 
									(은행별 실시간계좌이체 서비스를 이용하실 수 있는 시간이 상이할 수 있으니 해당 은행 홈페이지르 참고하세요.) 
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
									비회원도 주문할 수 있나요?
								</a>
							</h4>
						</div>
						<div id="c3" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p><b>네. 인터넷인성문고는 비회원으로도 주문하실 수 있습니다.</b><br>
									비회원으로 주문을 하시려면 비회원 주문을 클릭하시고 해당사항을 입력하시면 됩니다.<br>
									주문에 관련된 사항을 모두 입력하시고 결제과정에서 본인 확인을 위한 이메일주소와 비밀번호만 입력하시면 됩니다.<br>
									주문/배송조회시에는 주문시 입력한 이메일주소와 비밀번호로 로그인하실 수 있습니다.<br>
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
									주문과 관련된 E-Mail을 받을 수 있나요?
								</a>
							</h4>
						</div>
						<div id="c4" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p><b>네. 고객님께서 회원가입 시 지정하신 E-mail 주소로 주문완료, 배송처리안내 등 주문과 관련한 E-mail이 발송되고 있습니다.</b><br> 
									혹시 주문과 관련된 E-mail을 받지 못하셨다면 회원정보에 저장된 정보를 확인하시어 변경해주세요. <br>
									또한 주문, 배송과 관련된 메일은 수신동의와 관계없이 발송되는 메일임을 참고 부탁드립니다. <br>
									그 외 수신동의하에 신간도서정보, 이벤트 및 쿠폰 등의 할인혜택에 대한 정보도 E-mail로 받아보실 수 있습니다.
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
									결제방법을 변경할 수 있나요?
								</a>
							</h4>
						</div>
						<div id="c5" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>주문/결제하신 후에는 인터넷 상에서 결제방법을 변경하실 수 없습니다. <br>
									이 경우에는 기존 주문을 취소한 후 재주문하시거나, 고객센터를 통해 결제방법을 변경하시면 됩니다. <br>
									고객센터의 Q&A <주문/결제> 상담이나 전화(국번없이)1544-1234으로 <br>
									주문번호와 변경사항 등을 알려주시면 확인후 변경하여 드립니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c6">
									<span class="glyphicon glyphicon-question-sign"></span>
									온라인 송금시 계좌번호는?
								</a>
							</h4>
						</div>
						<div id="c6" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>온라인 송금으로 상품을 주문 하셨을 경우, 계좌번호를 발급해 드리고 있으며 이를 가상계좌(전용계좌)라고 합니다. <br>
									전용계좌는 은행별 로 최초 1회 부여하며, 그 이후에는 고객님께 부여된 전용 계좌로 계속 입금 가능합니다. <br>
									기존의 1회성 계좌 부여 방식의 불편함을 개선한 전용계좌는 동일한 계좌로 안전하게 입금하실 수 있습니다. <br>
									주문완료후 SMS로 주문번호,입금은행 및 전용계좌번호가 안내 발송됩니다. <br>
									<br>
									<과오납체크> <br>
									중복이나 착오 입금을 막기 위해 주문금액과 1원까지 정확한 금액을 입금하였을 경우에만 결제가 진행됩니다. 오류 메세지 발생 시 SMS에 안내되는 입금금액이나 결제 페이지상 미 입금액 확인을 통하여 정확한 금액을 입금하여 주시기 바랍니다.<br> 
									(1주문건 당 1회의 입금 처리가 원칙이나 동일 은행으로 2건 이상의 주문이 있을 경우 총 합계금액으로 입금 가능합니다)<br>
									<br>
									*동일금액으로 여러 주문건이 존재하고 한주문건에 대한 입금만을 하시게되면 가장 최근에 주문한 주문건이 입금확인이 됩니다. 
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c7">
									<span class="glyphicon glyphicon-question-sign"></span>
									공인인증서가 무엇인가요?
								</a>
							</h4>
						</div>
						<div id="c7" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>인터넷결제 시 신원을 확인하고, 문서의 위조와 변조, 거래 사실의 부인 방지 등을 목적으로 공인인증기관에서 발행한 사이버 거래용 인감증명서를 의미합니다.<br>
									30만원 이상 신용카드 결제 시, 실시간계좌이체 이용 시 반드시 공인인증서가 있어야 결제가 가능하므로 가까운 거래은행에 방문하시어 발급 받으시면 됩니다. <br>
									<br>
									* 발급방법 *<br> 
									거래은행 방문하여 인터넷뱅킹 신청 -> 해당 거래은행 홈페이지 접속하여 회원가입 및 인터넷뱅킹 등록 -> 해당 은행 홈페이지 공인인증센터에서 공인인증서를
									다운로드 받은 후 저장하여 이용(자세한 발급방법은 해당은행에 문의 부탁드립니다)<br>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c8">
									<span class="glyphicon glyphicon-question-sign"></span>
									안심클릭, ISP 서비스란 무엇인가요?
								</a>
							</h4>
						</div>
						<div id="c8" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>■ 안심클릭, ISP 서비스란? <br>
									신용카드사에서 개발한 온라인 전자상거래 지불인증 서비스로 인터넷결제 시 본인인증 및 보안을 위해 사용하는 방법입니다.<br> 
									<br>
									■ 이용가능 카드<br> 
									- 안심클릭 이용가능한 카드 : 현대, 삼성, 신한, 외환, 롯데, 하나SK 등<br> 
									- ISP(인터넷안전결제) 이용가능한 카드 : KB(국민), BC, 우리, 저축은행 등 <br>
									<br>
									해당 카드로 결제 시 반드시 안심클릭 또는 인터넷안전결제(ISP) 비밀번호가 등록이 되어 있어야 하며<br> 
									30만원 이상 결제시에는 추가로 공인인증서를 통해 본인 확인을 거쳐야 합니다. 안심클릭/인터넷안전결제(ISP) 서비스에 대한 추가 문의사항은 각 카드사로 문의 부탁드립니다.
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