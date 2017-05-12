<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자주묻는질문</title>
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
	            <li class="active"><a href="frequent10.jsp"> 자주 묻는 질문</a></li>
	            <li><a href="cancelPurchase.jsp"> 반품/교환/환불</a></li>
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
    	<h2>자주 묻는 질문</h2>
			<div class="panel-group" id="accordion">
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c1">
								<span class="glyphicon glyphicon-question-sign"></span>
								검색이 되지 않거나 품절/절판인 도서는 구입할 수 없나요?
							</a>
						</h4>
					</div>
					<div id="c1" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>검색이 되지 않는 도서는 품절/절판일 경우가 대부분이므로 <br>
								<b>검색 옵션 중 [품절/절판상품 포함] 란에 체크하신 후 한번 더 검색해보시기 바랍니다. </b><br>
								<br>
								품절이나 절판으로 표시된 도서는 출판사에서도 더 이상 발행되지 않고 재고가 없는 경우가 대부분이라, <br>
								구하기 어려운 도서입니다. 이 경우 회원님께서 요청하셔도 구입시기를 확실하게 약속드릴 수 없습니다.<br> 
								이러한 도서의 구입가능 여부를 확인하시려면 고객센터의 1:1 상담을 이용하여 주십시오. <br>
								최대한 확인하여 답변드리겠습니다.<br><br>
								<b>원하는 답변을 얻지 못하셨나요 ? [1:1상담]을 이용해주세요.</b></p>
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
								주문을 취소할 수 있나요?
							</a>
						</h4>
					</div>
					<div id="c3" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p><b>회원님께서 주문하신 상품은 아래에 해당하는 경우</b>에만 가능합니다. <br>
								<b>1.주문접수 2.결제완료 3.상품준비중</b> <br>
								주문취소는 주문/배송조회에서 회원 로그인 후 하실 수 있습니다. <br>
								비회원 주문의 경우는 주문하실 때 입력했던 이메일주소와 비밀번호로 로그인하실 수 있습니다. <br>
								<br>
								[반송 주소] <br>
								(우편번호:10881) 경기도 파주시 문발로 249, 인성문고 A동 2층 인터넷반품담당자 앞 <br>
								<br>
								영업점에서 구매하신 고객님께서는 해당 영업점으로 <br>
								영수증(회원일 경우 안내데스크에서 재발급 가능)을 지참하여 방문해주시면 됩니다.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c4">
								<span class="glyphicon glyphicon-question-sign"></span>
								주문하면 얼마 만에 받아볼 수 있나요?
							</a>
						</h4>
					</div>
					<div id="c4" class="panel-collapse collapse">
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
							<a data-toggle="collapse" data-parent="#accordion" href="#c5">
								<span class="glyphicon glyphicon-question-sign"></span>
								배송예고제(예상발송일)로 주문상품이 언제쯤 도착할지 알 수 있나요?
							</a>
						</h4>
					</div>
					<div id="c5" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>각 상품별 재고량을 기준으로 상세 상품정보에 예상발송일이 표시됩니다. <br>
								<br>
								예상발송일이란, 주문상품의 결제(무통장입금의 경우 입금확인)가 확인된 날 기준으로 상품을 준비하여 상품 포장 후 인성문고 물류센터에서 택배사로 전달하게 되는 예상 일자 입니다. <br>
								도착예정일은 예상발송일에 택배사의 배송일(약 2일)이 더해진 날이며 연휴 및 토.일,공휴일을 제외한 근무일 기준입니다. <br>
								다양한 상품을 함께 주문하실 경우 가장 늦은 도착예정일에 맞춰 함께 배송됩니다.<br>
								<br>
								*서울,수도권의 10시~11시 대 2권 이상 주문은 당일배송 안될 수 있습니다. <br>
								*수도권 외 지역 바로배송 서비스의 경우 경품수령 선택 여부에 따라 도착예정일이 변경됩니다. <br>
								*발송예정일이 5일 이상인 상품의 경우, 출판사/유통사 사정으로 품/절판 되어 구입이 어려울 수 있습니다. 이 경우 SMS,메일로 알려드립니다. </p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c6">
								<span class="glyphicon glyphicon-question-sign"></span>
								주문한 상품이 아직 안 왔어요.
							</a>
						</h4>
					</div>
					<div id="c6" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>주문하신 도서를 아직 못받아 보셨다면 다음 사항을 확인해 주십시오. <br>
								<br>
								<b>1. 주문 및 발송확인에서 상품의 처리상태가 포장완료로 되어 있는 경우</b> <br>
								이 상품은 당사에서는 발송처리를 한 것입니다. <br>
								당사에서 발송처리가 되었으나 2~3일 이내에 받아보시지 못한 경우는 다음을 확인하시기 바랍니다. <br>
								<br>
								* 배송조회를 확인하셔서 주문하신 상품이 받아보실 주소의 근처 취급소에 있다고 조회되면, 택배사 직원이 방문했음에도 불구하고 부재중이셔서 배송받지 못하신 경우가 많습니다. <br>
								  이 경우 고객센터의 Q&A <배송/수령일 안내> 상담이나 전화(국번없이)1544-1900을 이용하시면 신속히 처리해 드립니다. <br>
								* 당일 배송지역의 경우, 배송조회가 되지 않습니다. <br>
								  주문하신 당일 신속한 배송처리가 되기 때문에 배송조회가 무의미하기 때문입니다. <br>
								<br>
								<b>2. 주문 및 발송 확인에서 상품의 처리상태가 품절/절판이라고 되어 있는 경우</b> <br>
								상품이 품절/절판인 경우에는 당사에 재고가 없으며, 거래처에서 상품을 더 이상 취급하지 않기 때문에 보내드릴 수 없습니다. <br>
								이 경우 메일로 별도 안내해 드리고 있습니다. <br>
								만약 메일을 받아 보지 못하셨다면, 네트워크의 오류나 메일주소의 오기 또는 메일주소가 없기 때문입니다. <br>
								[마이룸]의 [회원정보 수정]에서 메일주소의 등록 또는 수정을 하십시오.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c7">
								<span class="glyphicon glyphicon-question-sign"></span>
								파본/훼손/오발송된 상품을 교환하고 싶습니다. 어떻게 해야하나요?
							</a>
						</h4>
					</div>
					<div id="c7" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p>일반 택배로 배송 받으신 상품에 하자가 있는 경우, 인터넷 홈페이지에서 배송 완료일로 부터 <b>30일 이내</b> <br>
								<b>교환신청 가능합니다.</b> <br>
								<br>
								※ 도서 자체 인쇄 파본인 경우 문제점 발견 후 30일이내 <br>
								※ 단, 우편/ 편의점택배 수령의 경우 회수주소지 정보에 일반 주소지 입력해 주시면 일반택배로 맞교환 진행됩니다. <br>
								<br>
								또는, 고객센터 1:1상담에서 <파본/ 상품불량 신고> 또는 <반품/교환/환불> 상담에 주문번호와 내용을 기재하여 주십시오. <br>
								담당자 확인 후 주문시의 주소로 상품을 재발송 해 드립니다. <br>
								파본도서는 재발송 된 상품을 받으시면서 맞교환해주시면 됩니다. <br>
								<br>
								택배직원 편에 반송을 못하셨을 경우, 고객센터의 Q&A <반품/교환/환불>로 문의 접수해주시면, <br>
								택배기사가 반품회수 재방문을 하도록 조치해드립니다. <br>
								또는 주문번호와 반송사유를 간략하게 메모하여 착불 반품을 보내주셔도 됩니다. </p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c8">
								<span class="glyphicon glyphicon-question-sign"></span>
								국내 배송료는 얼마인가요?
							</a>
						</h4>
					</div>
					<div id="c8" class="panel-collapse collapse">
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
							<a data-toggle="collapse" data-parent="#accordion" href="#c9">
								<span class="glyphicon glyphicon-question-sign"></span>
								인터넷 주문도서의 반품이 가능한가요?
							</a>
						</h4>
					</div>
					<div id="c9" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-1">
								<span class="glyphicon glyphicon-menu-right"></span>
							</div>
							<div class="col-md-11 answer">
								<p><b>1.고객님의 변심 또는 주문오류로 인한 반품신청일때,</b> <br>
								<br>
								타도서로의 교환이 불가하며,인터넷인성문고에서 주문하신 상품의 경우, 반품 교환이 가능한 종류에 한해 <br>
								상품을 수령하신 날로부터 7일이내로 반품신청이가능하며, 반송료는 고객님께서 부담하시게 됩니다. <br>
								<br>
								단, 반품하실 도서는 사용하지않고,책자체의 비닐래핑이 되어있는 책은 비닐래핑은 벗기지 않고, <br>
								음반의 경우 비닐개봉을 하지 않은 상태로 재생하지 않는 상태일때만 가능합니다. <br>
								<br>
								<b>2. 주문하신 상품의 결함 및 계약내용과 다를 경우, 문제점 발견 후 30일 이내 반품신청이 가능합니다.</b> <br>
								<br>
								<b>3. 반품보내기 전 다음과 같이 반품도서의 준비를 완료해주십시오. </b><br>
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
								반품보내실 도서와 청약철회서가 준비되셨으면 인터넷인성문고에서 반품신청을 해주시면 됩니다. </p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#c10">
								<span class="glyphicon glyphicon-question-sign"></span>
								회원가입/회원탈퇴는 어떻게 하나요?
							</a>
						</h4>
					</div>
					<div id="c10" class="panel-collapse collapse">
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
			</div>
		</div>
    </div>
</div>
</article>
<jsp:include page="../../footer.html"/>

</body>
</html>