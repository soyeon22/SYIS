<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>반품/교환/환불</title>
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
		            <li class="active"><a href="cancelPurchase.jsp"> 반품/교환/환불</a></li>
		            <li><a href="orderAndPayment.jsp"> 주문/결제</a></li>
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
				<h2>반품/교환/환불</h2>
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
									파본/훼손/오발송된 상품을 교환하고 싶습니다. 어떻게 해야하나요?
								</a>
							</h4>
						</div>
						<div id="c2" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>
										일반 택배로 배송 받으신 상품에 하자가 있는 경우, 인터넷 홈페이지에서 배송 완료일로 부터 <b>30일
											이내</b> <br> <b>교환신청 가능합니다.</b> <br> <br> ※ 도서 자체
										인쇄 파본인 경우 문제점 발견 후 30일이내 <br> ※ 단, 우편/ 편의점택배 수령의 경우 회수주소지
										정보에 일반 주소지 입력해 주시면 일반택배로 맞교환 진행됩니다. <br> <br> 또는,
										고객센터 1:1상담에서
										<파본 / 상품불량 신고> 또는 <반품 /교환/환불> 상담에 주문번호와 내용을 기재하여
										주십시오. <br>
										담당자 확인 후 주문시의 주소로 상품을 재발송 해 드립니다. <br>
										파본도서는 재발송 된 상품을 받으시면서 맞교환해주시면 됩니다. <br>
										<br>
										택배직원 편에 반송을 못하셨을 경우, 고객센터의 Q&A <반품 /교환/환불>로 문의 접수해주시면, <br>
										택배기사가 반품회수 재방문을 하도록 조치해드립니다. <br>
										또는 주문번호와 반송사유를 간략하게 메모하여 착불 반품을 보내주셔도 됩니다. 
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c3">
									<span class="glyphicon glyphicon-question-sign"></span> 반품/교환이
									안되는 상품도 있나요?
								</a>
							</h4>
						</div>
						<div id="c3" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>
										영업점에서 구입하신 상품은 해당 영업점에서만 반품/교환이 됩니다. <br> 부득이 방문이 어려워
										우편으로 반품/교환을 원하시는 경우에는 해당 영업점으로 문의해 주시기 바랍니다.<Br> 반품 후
										신용카드 결제등 현금 결제를 제외한 기타 결제의 경우 환불이 불가능하고 재결제를 해주셔야 하는 상황이 발생할수
										있습니다. 참조 부탁 드립니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c4">
									<span class="glyphicon glyphicon-question-sign"></span> 주문취소시
									환불은 어떻게 되나요?
								</a>
							</h4>
						</div>
						<div id="c4" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>
										주문시 사용 된 결제수단 별로 환불되며, 결제수단별 자세한 환불방법은 아래와 같습니다. <br> <br>
										<b><결제수단별 환불안내></b> <br> <b>(1)신용카드 (간편결제 포함)
										</b><br> - 전체취소 : 카드사 매입전은 당일 취소 되며, 카드사 매입후는 카드사에 따라 2일~ 최대
										2주(공휴일 제외) 소요 됩니다. <br> - 부분취소 : 카드사 매입후 취소 처리 되며, 카드사에
										따라 2일~ 최대 2주(공휴일 제외) 소요 됩니다. <br> (당일 부분취소한 경우도 동일함) <br>
										<br> ※신용카드 부분취소 유의 사항 <br> - 카드사 취소 처리 되는 시점에 카드사에서
										취소 문자 전송됩니다. (단, 카드사 문자 신청한 경우만 전송됨) <br> - 부분취소 불가한 경우
										예치금으로 처리 될 수 있습니다. <br> : 카드사 포인트를 사용하여 결제한 경우 (롯데카드,
										현대카드, 외환카드) <br> : 카드사 정책에 따라 부분취소 불가능한 카드 (기프트 카드,
										법인복지카드 등) <br> - 카드사정책에 따라 할부거래에 대해 부분취소 후, 잔여금액이 5만 원
										미만인 경우 할부유지 또는 일시불로 전환 됩니다. <br> :삼성: 기존할부 유지, 비씨 : 일시불로
										전환 등 <br> <br> <b>(2)실시간계좌이체 </b><br> - 전체취소 :
										승인한 당일 실시간계좌이체시 결제한 본인 계좌로 입금됩니다. <br> - 부분취소 : 익일에
										실시간계좌이체시 결제한 본인 계좌로 입금됩니다. <br> <br> <b>(3)온라인입금
										</b><br> - 전체/부분 취소 : 예치금으로 환원됩니다. (마이룸>예치금 환불신청 가능) <br>
										<br> <b>(4)휴대폰결제 </b><br> - 전체취소 : 주문한상품을 모두 취소 한경우
										즉시 취소 됩니다. <br> - 부분취소 : 주문한 상품중 일부 상품을 취소한 경우 예치금으로 환불
										됩니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c5">
									<span class="glyphicon glyphicon-question-sign"></span> 주문한 상품이
									품절/절판인 경우, 환불은 어떻게 이루어 지나요?
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
										주문하신 상품이 품절/절판인 경우는 상품준비가 불가능하기 때문에 보내드리기가 어려워 자동으로 주문취소가 됩니다.
										<br> <br> <b>1. 주문시 카드로 결제하신 경우</b> <br> 주문 전체가
										품절.절판인 경우에는 카드승인내역을 취소해 드리며 일부 도서가 품절/절판인 경우에는 예치금으로 전환됩니다. <br>
										<br> <b>2. 주문시 현금성 결제를 하신 경우</b> <br> 실시간 계좌이체, 온라인
										송금 등으로 입금하신 경우는 품절/주문취소된 금액이 예치금으로 전환됩니다. <br> 모든 상품의 유통
										상태에 대한 정보를 수집하여 반영하는 시스템을 구축하고는 있으나, <br> 도서의 종수 등이 방대한
										관계로 간혹 주문 이후에 해당 상품이 품절/절판이라는 것을 알게 되는 경우가 있을 수 있습니다. <br>
										품절/절판 상태의 상품(도서)은 사전에 정보를 구하여 주문을 받지 않는 것이 원칙이겠으나 방대한 도서 종류
										모두에 대해서 하나도 빠짐없이 유통 상태를 확인하는 것은 현실적으로 거의 불가능하기에 일어나는 상황이라는 점을
										널리 양해해 주십시오.<br> 또한 저희 인터넷교보문고는 실제 유통 상황을 반영하는 정보에 근거하여
										유통 상태를 표시함으로써 <br> 위와 같은 번거로움을 겪으시지 않도록 원천적으로 방지하는 일에 노력을
										기울이고 있습니다.
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#c6">
									<span class="glyphicon glyphicon-question-sign"></span> 영업점에서
									구입한 상품도 우편으로 반품/교환이 가능한가요?
								</a>
							</h4>
						</div>
						<div id="c6" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>
										우편이나 택배로 반품/교환이 가능한 상품은 인터넷교보문고 및 전화로 주문하신 상품에 한합니다. <br>
										<b>영업점에서 구입하신 상품은 해당 매장에서만 반품/교환이 가능</b>합니다. 이는 온/오프라인 영업의 특성상
										실시간으로 구입내역 교류/확인이 가능하지 않기 때문입니다.
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
									인터넷 주문도서의 반품이 가능한가요?
								</a>
							</h4>
						</div>
						<div id="c7" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p><b>1.고객님의 변심 또는 주문오류로 인한 반품신청일때,</b> <br>
									<br>
									타도서로의 교환이 불가하며,인터넷교보문고에서 주문하신 상품의 경우, 반품 교환이 가능한 종류에 한해 <br>
									상품을 수령하신 날로부터 7일이내로 반품신청이가능하며, 반송료는 고객님께서 부담하시게 됩니다. <br>
									<br>
									단, 반품하실 도서는 사용하지않고,책자체의 비닐래핑이 되어있는 책은 비닐래핑은 벗기지 않고, <br>
									음반의 경우 비닐개봉을 하지 않은 상태로 재생하지 않는 상태일때만 가능합니다. <br>
									<br>
									<br>
									<b>2. 주문하신 상품의 결함 및 계약내용과 다를 경우, 문제점 발견 후 30일 이내 반품신청이 가능합니다.</b> <br>
									<br>
									<b>3. 반품보내기 전 다음과 같이 반품도서의 준비를 완료해주십시오.</b> <br>
									도서와 함께 받으신 "거래명세서" 뒷편의 반품신청서 양식을 모두 작성하여 <br>
									도서와 함께 택배밀봉포장을 준비하여 주십시오. <br>
									혹시 반품신청서가 없으시면 메모지에 아래의 내용을 기입하여 주십시오. <br>
									<br>
									(반품신청서 양식) <br>
									주문번호: <br>
									고객명: <br>
									환불요청방법; <br>
									(참고로, 카드 및 핸드폰결제(당월결제), 실시간계좌이체는 반품 시 승인취소로 환불되며, <br>
									온라인무통장송금은 예치금으로 1차 환원 또는 환불계좌를 적어주시면 환불계좌로 환불됩니다.) <br>
									반품보내실 도서와 청약철회서가 준비되셨으면 인터넷교보문고에서 반품신청을 해주시면 됩니다. 
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
									일본만화나 문고 중 띠지가 없는 도서는 반품이 되나요?
								</a>
							</h4>
						</div>
						<div id="c8" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="col-md-1">
									<span class="glyphicon glyphicon-menu-right"></span>
								</div>
								<div class="col-md-11 answer">
									<p>일본만화나 문고의 띠지가 없는 경우는 반품사유가 되지 않습니다. <br>
									띠지는 광고효과로 도서에 첨부되는 것이고, 상품이 아니기 때문에 도서가 파손된 것이 아니므로 반품이 불가합니다.
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