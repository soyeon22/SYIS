<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.purchase.domain.Purchase"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ page import="minsu.bms.basket.domain.Basket"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%!String bookNum1;
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>결제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>

<style>
/* 카드할인 혜택 css코드 */
.nav-tabs {
	border-bottom: 2px solid #DDD;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	border-width: 0;
}

.nav-tabs>li>a {
	border: none;
	color: #666;
}

.nav-tabs>li.active>a, .nav-tabs>li>a:hover {
	border: none;
	color: #4285F4 !important;
	background: transparent;
}

.nav-tabs>li>a::after {
	content: "";
	background: #4285F4;
	height: 2px;
	position: absolute;
	width: 100%;
	left: 0px;
	bottom: -1px;
	transition: all 250ms ease 0s;
	transform: scale(0);
}

.nav-tabs>li.active>a::after, .nav-tabs>li:hover>a::after {
	transform: scale(1);
}

.tab-nav>li>a::after {
	background: #21527d none repeat scroll 0% 0%;
	color: #fff;
}

.tab-pane {
	padding: 15px 0;
}

.tab-content {
	padding: 20px
}

.payType {
	background: #FFF none repeat scroll 0% 0%;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
	margin-bottom: 30px;
}
/* /카드할인 코드 */

/* 결제확인 버튼 */
.paymentBtn {
	text-align: center;
}

.btn-pay {
	letter-spacing: 1px;
	text-decoration: none;
	background: none;
	border: 1px solid transparent;
	border-radius: 0px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	font-size: 14px;
	line-height: 20px;
	font-weight: 700;
	text-transform: uppercase;
	border: 3px solid;
	padding: 8px 20px;
}

.btn-outlined {
	transition: all 0.3s;
}

.btn-outlined.btn-pay {
	background: none;
	color: blue;
	border-color: blue;
}

.btn-outlined.btn-pay:hover, .btn-outlined.btn-pay:active {
	color: #FFF;
	background: blue;
	border-color: blue;
}

.btn-lg {
	font-size: 18px;
	line-height: 22px;
	border: 4px solid;
	padding: 13px 40px;
}

/* /결제확인 버튼 */

/* 카드할인 설명 배경색 */
.payTypeDc {
	backgound-color: red;
}
/* /카드할인 설명 배경색 */
.buynav {
	float: right;
	padding: 15px 15px;
}

.img-responsive1 {
	width: 50px;
	height: 80px;
}

th, td {
	text-align: center;
}

.col1, .col2 {
	width: 150px;
}

.col3 {
	width: 540px;
}

.col4 {
	width: 300px;
}

.payTable tr th {
	width: 150px;
}

.payTable tr td {
	float: left;
}

th {
	text-align: center;
}
/
*
</style>

</head>
<body>
	<jsp:include page="../../header.jsp" />
	<%
	int basketMoney = 0;
	int delivery = 2500;
	int sumMoney = 0;
	int forecastPoint=0;
		if (request.getAttribute("user") != null) {
			User user = (User) request.getAttribute("user");
	%>
	<form action="paymentResult.jsp">
		<article>
			<div class="container">
				<!-- 주문상품목록 -->
				<h2 style="font-weight: bold;">01.주문상품목록</h2>
				<hr class="star-primary">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-align: center;">상품정보</th>
							<th style="text-align: center;">판매가</th>
							<th style="text-align: center;">수량</th>
							<th style="text-align: center;">합계</th>
							<th style="text-align: center;">도착예정일</th>
						</tr>
					</thead>
					<tbody>
						<%
							DecimalFormat df = new DecimalFormat("00");
								Calendar currentCalendar = Calendar.getInstance();

								//현재 날짜 구하기
								String strYear = Integer.toString(currentCalendar
										.get(Calendar.YEAR));
								String strMonth = df
										.format(currentCalendar.get(Calendar.MONTH) + 1);
								String strDay = df
										.format(currentCalendar.get(Calendar.DATE)+3);
								String strDate = strYear + "년" + strMonth + "월" + strDay + "일";

								if (request.getAttribute("bookInfo") != null) {

									Book book = (Book) request.getAttribute("bookInfo");
									bookNum1 = (String) request.getAttribute("bookNum");
									int bookNum = Integer.parseInt(bookNum1);
						%>
						<tr>
							<td><a href="../../shop/search/productInfo.jsp"> <img
									src="../../img/nobody.jpg" class="img-responsive1"> [<%=book.getKind()%>]<%=book.getBookName()%>
							</a></td>
							<td style="padding: 35px;"><%=book.getBookPrice()%>원</td>
							<td style="padding: 35px;"><input type="number" min="0"
								value="<%=bookNum%>" name="bookNum"
								style="display: block; width: 50px; float: center; margin: 0px 60px;" readonly/>
							</td>
							<td style="padding: 35px;"><%=book.getBookPrice()%>원</td>
							<td style="padding: 35px;"><%=strDate %> 도착예정</td>
							<!-- 배송에서받아오기 -->
							<input type="hidden" name="bookCode" value="<%=book.getBookCode()%>" />
							<%
								basketMoney = book.getBookPrice() * bookNum;
										if (basketMoney > 29999) {
											delivery = 0;
										}
										sumMoney = basketMoney + delivery;
										forecastPoint=sumMoney/10;
							%>
						</tr>
						<%
							} else if (request.getAttribute("basket") != null) {
									List<Basket> baskets = (List<Basket>) request.getAttribute("basket");
									for (Basket basket : baskets) {
						%><tr>
							<td><a href="../../shop/search/productInfo.jsp"> <img
									src="../../img/nobody.jpg" class="img-responsive1"> [문학]<%=basket.getBookName()%>
							</a></td>
							<td style="padding: 35px;"><%=basket.getBookPrice()%>원</td>
							<td style="padding: 35px;"><input type="number" min="0"
								value="<%=basket.getBookCount()%>" name="bookNum"
								style="display: block; width: 50px; float: center; margin: 0px 60px;"
								readonly /></td>
							<td style="padding: 35px;"><%=basket.getBookPrice() * basket.getBookCount()%>원</td>
							<td style="padding: 35px;"><%=strDate%> 도착예정</td>
							<!-- 배송에서받아오기 -->
							<input type="hidden" name="basketNum" value="<%=basket.getBasketNum()%>" />
							<input type="hidden" name="bookCodeList" value="<%=basket.getBookCode()%>" />
							<input type="hidden" name="bookPriceList" value="<%=basket.getBookPrice() * basket.getBookCount()%>" />
							<input type="hidden" name="bookNumList" value="<%=basket.getBookCount()%>" />

							<%
								basketMoney += basket.getBookPrice() * basket.getBookCount();
									}
									if (basketMoney > 29999) {
										delivery = 0;
									}
									sumMoney = basketMoney + delivery;
									forecastPoint=sumMoney/10;
									}
							%>
						</tr>
					</tbody>
				</table>
				<hr class="star-primary">
			</div>

			<div class="container">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>총 상품금액</th>
								<th>배송비</th>
								<th>결제 예정금액</th>
								<th>적립예정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=basketMoney%>원</td>
								<td><%=delivery%>원</td>
								<td><%=sumMoney%>원</td>
								<input type="hidden" name="bookPrice" value="<%=sumMoney%>" />
								<input type="hidden" name="forecastPoint" value="<%=forecastPoint%>" />
								<td><%=forecastPoint%>원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
			</div>


			<div class="container">
				<!-- 배송지 정보 -->
				<h2 style="font-weight: bold;">02.배송지</h2>
				<hr class="star-primary">
				<table class="table table-bordered deliveryTable">

					<!-- 배송지 정보 -->
					<tr>
						<th class="col1" rowspan="2">배송지 정보</th>
						<td class="col2">받으시는 분</td>
						<td class="col3" style="float: left;"><input type="text"
							style="width: 100px; float: left;" name="sender"> <span
							class="sub_text margin_left10"></span></td>
						<th>주문자 정보</th>
					</tr>
					<tr>
						<td class="col2">연락처</td>
						<td class="col3" style="float: left;"><span
							style="float: left;"> <select
								style="height: 26px; width: 50px;" name="number1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - <input type="text" maxlength="4" style="width: 50px;"
								name="number2"> - <input type="text" maxlength="4"
								style="width: 50px;" name="number3">
						</span></td>
						<td class="col4" rowspan="8"><span style="float: left;">보내는
								분</span> <input style="float: right;" type="text" name="recipient"
							value="<%=user.getName()%>" style="width:200px;" readonly>
							<span class="sub_text margin_left10"></span> <br> <br>
							<span style="float: left;"> 연락처 </span> <span
							style="float: right;"> <input type="text"
								value="<%=user.getPhoneNum()%>" style="width: 200px;" readonly>
						</span> <br> <br> <span style="float: left;"> e-mail </span> <span
							style="float: right;"> <input type="email"
								value="<%=user.getEmail()%>" style="width: 200px;" readonly>
						</span></td>
					</tr>
					<tr>
						<th rowspan="4">배송 주소</th>
						<td rowspan="3">주소</td>
						<td class="col3">
							<div>
								<input type="text" id="sample4_postcode" name="postal"
									placeholder="우편번호" style="float: left;" readonly> <input
									type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기" style="float: left;"><br>
							</div>
						</td>
					</tr>
					<tr>
						<td class="col3" style="float: left;">
							<div>
								<input type="text" id="sample4_roadAddress" size=50
									placeholder="도로명주소" name="address1" style="float: left;"
									readonly>
							</div>
						</td>
					</tr>
					<tr>
						<td class="col3" style="float: left;">
							<div>
								<input type="text" style="float: left; width: 400px;"
									placeholder="나머지 주소를 입력하세요." name="address2">
							</div>
						</td>
					</tr>

					<tr>
						<td>택배기사 메세지</td>
						<td class="col3" style="float: left;">
							<div>
								<input type="text"
									style="float: left; height: 60px; width: 400px;" name="message">
							</div>
						</td>
					</tr>
				</table>
			</div>

			<!-- 결제수단 -->
			<div class="container">
				<h2 style="font-weight: bold;">03.결제수단</h2>
				<hr class="star-primary">
				<div class="col-md-9">
					<!-- 결제수단선택 -->
					<div class="row">
						<!-- Nav tabs -->
						<div class="payType">
							<!-- 	<input type="radio" value="payType" name="card" id="card1"/>
								<label for="card1">
								카드결제</label>
								<input type="radio" name="payType" value="accountTransfer" id="accountTransfer1"/>
									<label for="accountTransfer1">계좌이체</label>
									<input type="radio" name="payType" value="mobilePayment" id="mobilePayment1"/>
									<label for="mobilePayment1">핸드폰결제</label>
					-->

							<ul class="nav nav-tabs" role="tablist">

								<li role="presentation" class="active"><a href="#card"
									aria-controls="home" role="tab" data-toggle="tab"> 카드결제 </a></li>
								<li role="presentation"><a href="#accountTransfer"
									aria-controls="profile" role="tab" data-toggle="tab"> 계좌이체
								</a></li>
								<li role="presentation"><a href="#mobilePayment"
									aria-controls="messages" role="tab" data-toggle="tab">
										핸드폰결제 </a></li>

							</ul>

							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="card">
									<input type="radio" value="카드결제" name="payType" id="card1" />
									<table>
										<tbody>
											<tr>
												<th>카드선택</th>
												<td><select style="height: 26px; width: 250px;">
														<option value="none">결제하실 카드를 선택해주세요</option>
														<option value="kb">국민KB카드</option>
														<option value="shinhan">신한카드</option>
														<option value="nonghyup">농협카드</option>
														<option value="woori">우리카드</option>
														<option value="hana">하나카드</option>
														<option value="bc">비씨카드</option>
														<option value="hyundai">현대카드</option>
												</select></td>
											</tr>
											<tr>
												<th>카드번호</th>
												<td><input type="text" maxlength="4"
													style="width: 50px;"> - <input type="text"
													maxlength="4" style="width: 50px;"> - <input
													type="text" maxlength="4" style="width: 50px;"> - <input
													type="text" maxlength="4" style="width: 50px;"></td>
											</tr>
										</tbody>

									</table>
									<br> <br>
									<hr>
									<!-- 카드사 별 할인 정보-->
									<div class="row">
										<div class="card">
											<ul class="nav nav-tabs" role="tablist">
												<li role="presentation" class="active"><a
													href="#kbCard" aria-controls="home" role="tab"
													data-toggle="tab"><img src="../../img/imgKbCard.jpg"
														style="height: 40px; width: 80px;"></a></li>
												<li role="presentation"><a href="#shinhanCard"
													aria-controls="profile" role="tab" data-toggle="tab"><img
														src="../../img/imgShinhanCard.jpg"
														style="height: 40px; width: 80px;"></a></li>
												<li role="presentation"><a href="#lotteCard"
													aria-controls="messages" role="tab" data-toggle="tab"><img
														src="../../img/imgLotteCard.jpg"
														style="height: 40px; width: 80px;"></a></li>
												<li role="presentation"><a href="#bcCard"
													aria-controls="settings" role="tab" data-toggle="tab"><img
														src="../../img/imgBcCard.jpg"
														style="height: 40px; width: 80px;"></a></li>
											</ul>


											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="kbCard">
													<p>
														KB국민 노리체크카드<br> - 인성문고 5% 환급 할인(건당 2만원이상 결제시 5만원까지
														할인)<br> KB국민 락스타체크카드<br> - 인성문고 5% 환급 할인(건당
														2만원이상 결제시 5만원까지 할인)<br> KB국민 스타체크카드<br> - 인성문고
														3% 환급 할인(건당 3만원이상 결제시 5만원까지 할인)<br> KB국민 비트윈체크카드<br>
														- 인성문고 3% 환급 할인(건당 3만원이상 결제시 5만원까지 할인)<br> KB국민
														주니어라이프체크카드<br> - 인성문고 3% 환급 할인(건당 2만원이상 결제시 5만원까지 할인)
													</p>
												</div>
												<div role="tabpanel" class="tab-pane" id="shinhanCard">
													<p>
														인성문고 sam 신한카드<br> - 전월 실적에 따라 sam 서비스 최대 30% 청구할인<br>
														- 오프라인 2천원 청구할인(5만원이상 구매시, 월 1회)<br> - 인성북클럽 멤버십 혜택
														적용
													</p>
												</div>
												<div role="tabpanel" class="tab-pane" id="lotteCard">
													<p>
														인성문고 핫트랙스 롯데카드<br> - 전월 실적에 따라 최대 25% 청구할인<br> -
														인성북클럽 멤버십 혜택 적용
													</p>
												</div>
												<div role="tabpanel" class="tab-pane" id="bcCard">
													<p>
														문화융성카드<br> - 전월 실적에 따라 sam 서비스 15% 청구할인<br> - 전월
														실적에 따라 15% 청구할인(구매건당 5천원, 월 최대 2회, 오프라인에 한함)<br> -
														오프라인 영업점에 한함(핫트랙스 포함)
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane" id="accountTransfer">
									<input type="radio" name="payType" value="계좌이체"
										id="accountTransfer1" />
									<table>
										<tbody>
											<tr>
												<th>계좌이체</th>
												<td><input type="text" maxlength="6"
													style="width: 100px;"> - <input type="text"
													maxlength="7" style="width: 120px;"></td>
											</tr>


										</tbody>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane" id="mobilePayment">
									<input type="radio" name="payType" value="핸드폰결제"
										id="mobilePayment1" />
									<table>
										<tbody>

											<tr>
												<th>휴대폰 번호</th>
												<td><select style="height: 26px; width: 50px;">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
												</select> - <input type="text" maxlength="4" style="width: 50px;">
													- <input type="text" maxlength="4" style="width: 50px;">
												</td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
					<!--//카드사 별 할인 정보// -->

				</div>

				<div class="col-md-3">
					<div>
						<table class="table divForPay">
							<tbody>
								<tr>
									<td>상품금액</td>
									<td><%=basketMoney%>원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td><%=delivery%>원</td><input type="hidden" name="deliveryPrice" value="<%=delivery %>"/>
								</tr>
								<tr>
									<td>최종결제금액</td>
									<td><%=sumMoney%>원</td>
								</tr>
							</tbody>
						</table>
						<div>
							<div class="row">
								<div class="paymentBtn">
									<p>
										<button type="submit" class="btn btn-outlined btn-pay btn-lg"
											data-wow-delay="0.7s">결제하기</button>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</article>
	</form>
	<%
		}
	%>
	<jsp:include page="../../footer.html" />
</body>
</html>