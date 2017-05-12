<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>배송/수령일안내</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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

.nav-header{
	color : #909090;
}
/*//사이드바*/

/* 고객센터 이용안내 배경색 */
.guide{
	border : 1px solid gray;
	background-color: #EAEAEA;
}

.answer{
	padding : 0 0 0 0;
}

.panel-body{
	background-color:#EAEAEA;
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
	            <li><a href="userQnA.jsp"> 회원</a></li>
	            <li class="active"><a href="shipping.jsp"> 배송/수령일안내</a></li>
	            <li class="nav-divider"></li>
	            <li class="nav-header"><strong>문의하기</strong></li>
	            <li><a href="../../guest/customerCenter/query.jsp"> 1:1 문의하기</a></li>
	            </ul>
    	</nav>
    	<div class="guide">
    		<p>-고객센터 이용안내-</p>
    		<div class="contactNum"><p>0000-0000</p></div>
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
    	<h2>배송/수령일안내</h2>
			<div class="panel-group" id="accordion">
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c1">
								<span class="glyphicon glyphicon-question-sign"></span>
								국내 배송료는 얼마인가요?
							</a>
						</h4>
					</div>
					<div id="c1" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>국내 배송료는 주문 건당 구매금액이 1만원 미만인 경우 <br>
								<b>배송료 2,000원</b>이 부과되며 구매금액이 <b>1만원 이상이면 무료 배송</b>해 드립니다. <br>
								(동일 일자에 여러 건으로 주문하신 경우 통합되지 않음) <br>
								<br>
								무료배송 도서 주문 또는 무료배송 도서를 포함하여 <br>
								주문하신 경우에는 구매금액에 관계없이 무료로 배송해 드립니다. <br>
								인터넷 인성문고는 보다 빠르고 안전한 배송을 위해 주문하신 도서를 택배로 배송해 드리고 있습니다.
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
								해외주문도서를 주문하면 얼마 후에 받아볼 수 있나요?
							</a>
						</h4>
					</div>
					<div id="c2" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p><b>1. 인터넷 주문가능상태 </b>
								주문접수된 도서는 대금결제가 완료되는 즉시 해외거래처(B&T)로 자동발주 처리되어, <br>
								도서입고까지 업무일 기준 약 1-2주 정도 소요됩니다. <br>
								<br>
								<b>2. Special order 상태</b><br> 
								Special order 는 4~6주 안에 공급가능하며, 현지 출판사 사정에 의해 구입이 어려울 경우<br> 2~3주안에 공지해 드립니다.<br> 
								<br>
								※ 주말 또는 휴일에 주문하신 주문건들은 1-2일 정도 해외발주가 지연되오니 양지해 주시기 바랍니다.<br> 
								    또한 미국 내 현지 사정에 의해 도서 입고일이 지연될 수 있습니다. <br>
								    ex)크리스마스, 추수감사절 연휴 등</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c3">
								<span class="glyphicon glyphicon-question-sign"></span>
								주문하면 얼마 만에 받아볼 수 있나요?
							</a>
						</h4>
					</div>
					<div id="c3" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>고객님께서 주문하신 상품을 실제 받으시는 날은 "예상발송일+배송일"입니다.  <br>
								 <br>
								'예상발송일'이란 근무일 기준으로 도서가 준비되는 시간만을 안내하는 것이며, 배송시간은 예상발송일 외 택배를 통해 고객님께 실제 배달되는 기간을 말합니다.  <br>
								발송예정일은 상품에 따라 준비기간이 다르며 <b>배송 시간은 지역에 따라 약간씩 다르나 보통 1~3일정도 소요됩니다.</b>(도서산간지역은 최대 7일 소요)  <br>
								 <br>
								* 예상발송일은 영업일 기준으로 산정되며, 일요일과 공휴일 및 기타 휴무일에는 배송되지 않습니다.(우체국 배송은 토요일 휴무로 배송 불가함)  <br>
								* 주문한 상품의 당사에 재고가 없을 때는 거래처로 다시 주문요청한후 발송이 되므로 3∼7일내외 정도 더 소요됩니다.  <br>
								* 천재지변 등의 불가항력적 사유로 인한 배송 지연은 그 해당기간 동안의 배송소요 기간에서 제외됩니다.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c4">
								<span class="glyphicon glyphicon-question-sign"></span>
								해외로 배송되나요?(Do You Ship Overseas?)
							</a>
						</h4>
					</div>
					<div id="c4" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>인성문고를 통해 국내에서 주문하여 해외로 보내실 수 있고, <br>
								또한 해외에서 주문하여 직접 받아보실 수 있습니다. <br>
								<br>
								해외배송은 인터넷인성문고와 특약을 맺은 배송업체 FedEx로 빠르고 안전하게 받아 보실 수 있으며 <br>
								다른 방법으로는 해외배송이 어렵습니다. <br>
								<br>
								배송 예정 기일은 약 2~6일이나 국가와 지역, 선택하신 배송업체에 따라서 일부 차이가 발생할 수 있습니다.<br> 
								<br>
								<b>우송료는 주문권수에 따라 요금이 부과됩니다.</b> <br>
								(1+1 행사 도서인 경우 본 도서 1권만 발송됩니다.) </p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c5">
								<span class="glyphicon glyphicon-question-sign"></span>
								바로배송이란 무엇인가요?
							</a>
						</h4>
					</div>
					<div id="c5" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p><b>바로배송은 원하시는 상품을 서비스 시간 안에 주문하실 경우 그 날 바로 받아보실 수 있는 초특급 배송서비스입니다.</b><br> 
								* 서울 및 수도권 : 00시~ 11시 결제완료 건 / 월요일~ 토요일 <br>
								* 부산 : 00시 ~ 11시30분 결제완료 건 / 월요일 ~ 토요일 <br>
								* 대구, 창원 : 00시~ 11시30분 결제완료 건 / 월요일~ 토요일<br>
								<br>
								※ 서울 및 수도권 지역의 오전10시~11시 주문 중 2권 이상 주문 시 익일배송됩니다.<br> 
								※ 천안지역은 2011년 8월 12일자로 바로배송 서비스가 중단되었습니다. <br>
								(단.비회원은 바로배송 서비스 이용이 불가합니다.)</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c6">
								<span class="glyphicon glyphicon-question-sign"></span>
								몇 시까지 주문하면 바로배송이 되나요?
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
								* 서울 및 수도권 : 00시~ 11시 결제완료 건 / 월요일 ~ 토요일 <br>
								* 부산 : 00시 ~ 11시30분 결제완료 건 / 월요일 ~ 토요일 <br>
								* 대구, 창원 : 00시~ 11시30분 결제완료 건 / 월요일 ~ 토요일 <br>
								<br>
								단, 배송방법은 택배여야 하며 배송지는 서비스 가능지역일 경우에만 당일배송이 가능합니다.<br>
								서울 및 수도권 지역의 오전10시~11시 주문 중 2권 이상 주문 시 익일배송됩니다.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c7">
								<span class="glyphicon glyphicon-question-sign"></span>
								주문한 상품 중 일부가 오지 않았습니다.
							</a>
						</h4>
					</div>
					<div id="c7" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>고객님께서 주문하신 상품이 한꺼번에 배송되지 않는 것은 고객님의 편의를 위해 준비된 것부터 보내드리기 때문입니다.<br> 
								주문건의 도서가 예상 발송일 보다 경과돼 지연된 경우에는 먼저 준비돼 있는 도서를 발송해 드립니다. <br>
								나머지 상품은 별도로 배송 중이거나 상품을 준비하고 있는 단계이며, 거래처로 주문된 상품은 입고되는 즉시 배송해 드립니다.<br> 
								선발송이 된 후 나머지 도서는 별도로 준비하여 보내드릴 예정이며 거래처에서 준비된 후 입고되는 즉시 신속하게 배송해 드립니다 <br>
								그러나 안타깝게도 거래처로 주문이 되었더라도 품절/절판이 될 수가 있으며, 이 경우에는 별도로 고객님께 메일과 SMS를 통하여 알려 드립니다.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c8">
								<span class="glyphicon glyphicon-question-sign"></span>
								모든 도서가 이용 가능합니까?
							</a>
						</h4>
					</div>
					<div id="c8" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>네, 인성문고에서 보유하고 있는 도서는 물론, 현재 없는 도서도 최대한 수소문하여 찾아드리도록 하겠습니다. <br>
								또한 서비스 이용시 일부 1+1도서, 경품, 사은품이 포함되지 않을 수 있습니다. <br>
								이점 유념하여 구매하여 주시기 바랍니다.(단 이벤트 응모는 가능)
								</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c9">
								<span class="glyphicon glyphicon-question-sign"></span>
								주문한 상품의 배송추적을 할 수 있나요?
							</a>
						</h4>
					</div>
					<div id="c9" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>고객님이 주문하신 상품은 인터넷인성문고 웹사이트 상단의 [주문/배송조회]를 통해 확인하실 수 있습니다. <br>
								회원인 경우는 로그인을 하시고, 비회원으로 주문하신 경우에는 주문 시 기입한 이메일과 비밀번호로 로그인 하실 수 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c10">
								<span class="glyphicon glyphicon-question-sign"></span>
								대상지역이 한정되어 있는 이유는 무엇인가요?
							</a>
						</h4>
					</div>
					<div id="c10" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>바로배송은 당사의 물류시스템과 택배배송시스템을 최대한 가동시켜 배송기일을 단축해 고객님께 빠르게 상품을 전달해드리는 것이 목적인 배송서비스입니다.<br> 
								다만 지역적으로 거리가 있는 경우에는 해당 서비스로 당일배송이 어려워 부득이하게 지역을 한정지을 수밖에 없었습니다. <br>
								향후 서비스 가능지역을 단계별로 확대시켜 나갈 예정입니다.</p>
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