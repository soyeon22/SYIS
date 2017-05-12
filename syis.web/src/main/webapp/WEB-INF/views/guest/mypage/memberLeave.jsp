<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원탈퇴</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
ul {
	float: left;
}

.radio {
	text-align: center;
}
/*여기까지*/
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

.nav-header{
	color : #909090;
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
        	<li class="nav-header"><strong> 주문관리</strong></li>
            <li ><a href="../order/orderListProc.jsp"> 주문조회</a></li>
            <li><a href="../basket/Basket.jsp"> 장바구니</a></li>
            <li><a href="../refund/refundList.jsp">취소/교환내역</a></li>
            <li class="nav-divider"></li>
     		<li class="nav-header"><strong> 나의 정보</strong></li>
     		<li><a href="../../shop/system/idCheck.jsp"> 회원정보 수정</a></li>
            <li  class="active"><a href="../../shop/system/idCheck1.jsp"> 회원 탈퇴</a></li>
            <li class="nav-divider"></li>
            <li class="nav-header"><strong> 나의 상담</strong></li>
            <li ><a href="../customerCenter/queryList.jsp"> 나의 상담 내역</a></li>
        </ul>
    </nav>
				</div>
				<div class="col-md-10">
				<form action="../../shop/system/leaveSuccessProc.jsp">
					<div>
						<h3>회원을 탈퇴합니다.</h3>
						<hr>
						<div class="text" style="border: 1px solid black;">
							<p>인성문고를 이용해 주셔서 감사합니다.</p>
							<p>회원탈퇴시 이인성 님의 회원정보와 할인쿠폰, 마일리지, 통합포인트, 예치금 등의 통장 내역이 자동으로
								삭제처리됩니다.</p>
							<p>회원탈퇴시 회원가입 유형에 따라 인성문고 통합멤버십 회원탈퇴가 동시에 이뤄집니다.</p>
							<p>회원 ID에 대해서는 서비스 이용의 혼선 방지, 법령에서 규정하는 회원거래 정보의 보존기간 동안의
								보관의무의 이행, 기타 안정적인 서비스 제공을 위하여 필요한 정보이므로 탈퇴 후 동일 ID로의 재가입은 허용되지
								않습니다.</p>

						</div>
					</div>
					<br>
					<div>
						<fieldset class="" id="radio" style="border: 1px solid black;">
							<legend> 인성문고를 이용하면서 느낀 불편사항 </legend>
							<div id="radio">
								<ul>
									<li><label><input type="radio" name="spk">도서
											정보 미비</label></li>
									<li><label><input type="radio" name="spk">가격불만</label></li>
									<li><label><input type="radio" name="spk">회원혜택
											빈약</label></li>
									<li><label><input type="radio" name="spk">개인
											사정</label></li>
								</ul>
								<ul>
								</ul>
								<ul>
									<li><label><input type="radio" name="spk">도서
											검색 불편</label></li>
									<li><label><input type="radio" name="spk">배송
											지연</label></li>
									<li><label><input type="radio" name="spk">원하지
											않는 메일 수신</label></li>
									<li><label><input type="radio" name="spk">시스템
											불편</label></li>
								</ul>
								<ul>
								</ul>
								<ul>
									<li><label><input type="radio" name="spk">서비스
											불만</label></li>
									<li><label><input type="radio" name="spk">CF-LINE
											불만</label></li>
									<li><label><input type="radio" name="spk">이벤트
											불만</label></li>
									<li><label><input type="radio" name="spk">고객센터
											불만</label></li>
								</ul>
							</div>
						</fieldset>
						<br>
						<textarea class="form-control" rows="8" style="resize: none">입력하세요</textarea>
						<br>
						<nav style="float:right;">
						
						<input type="submit" value="탈퇴하기"> <a href="../../main.jsp"><input type="button" value="취소하기"></a></nav>
					</div>
					</form>
				</div>
			</div>
		</div>
		<br> <br>
	</article>

<br><br>

	<!-- //구매화면 -->
	<jsp:include page="../../footer.html"/>
</body>
</html>
