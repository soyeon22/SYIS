<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ page import="minsu.bms.login.service.LoginService"%>
<%@ page import="minsu.bms.login.service.LoginServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<!-- 회원가입 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


</style>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
 
  
     $(function(){
      $('#pw').keyup(function(){
       $('font[name=check]').text('');
      }); 

      $('#password').keyup(function(){
       if($('#pw').val()!=$('#password').val()){
        $('font[name=check]').text('');
        $('font[name=check]').html("다시 확인해주세요");
       }else{
        $('font[name=check]').text('');
        $('font[name=check]').html("비밀번호 맞음");
       }
      }); 
     });

</script>
<body>
<jsp:include page="../../header.jsp"/>
	<article>
		<div class="container">
			<h2>회원가입을 환영합니다.</h2>
			<hr>
			<section>
				<div class="text" style="border: 1px solid black;">
					<!-- 가입안내 -->
					<p>동의를 거부하시고자 하는 경우 회원정보변경을 통해 직접 탈퇴 진행 또는 고객센터로 요청할 수 있습니다.</p>
					<p>단, 동의거부에 따른 서비스사용에 제한이 있을 수 있습니다.</p>
					<p>- 고객센터 전화 : 1234-5678</p>
					<p>- 개인정보 이메일 : dlstjd@dlstjd.co.kr</p>
				</div>
			</section>
			
			<p>
<form action="signUpProc.jsp">
				<!-- 이용약관 -->
			<div class="container">
				<hr>
				<h4 style="padding-top: 16px;">약관동의</h4>
				<div class="row">
					<div class="col-sm-6">
						<ul>
							<li>이용약관 안내</li>
						</ul>
						<section class="clauseIn">

							<h4>총칙(목적)</h4>
							<p>본 약관은 인성문고㈜(이하 “회사”라 한다)와 인성문고 계열사가 제공하는 오프라인 영업장 및 온라인 상의
								인터넷 서비스(이하 “서비스”라 하며, 접속 가능한 유.무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가
								제공하는 모든 “서비스”를 의미합니다)를 이용함에 있어서 “회사”와 이용자의 권리 의무 및 책임 사항을 규정함을
								목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을
								준용합니다」</p>

						</section>
						<input type="checkbox" required> 동의합니다.
					</div>
					<div class="col-sm-6">
						<ul>
							<li>개인정보 동의 안내</li>
						</ul>
						<section class="clauseIn">
							<h4>회사 내부 방침에 의한 정보보유 사유</h4>
							<p>- 보존 항목 : 이름, 생년월일, 성별, 아이디(ID), 자택 전화번호, 자택 주소, 휴대전화번호,
								본인 확인기관을 통해 받은 식별정보</p>
							<p>- 보존 근거 : 서비스 이용의 혼선 방지, 불법적 사용자에 대한 관련 기관 수사 협조</P>
							<p>- 보존 기간 : 1년</p>

						</section>
						<input type="checkbox" required> 동의합니다.
					</div>
				</div>
				<hr>
			</div>
			<div class="container">
				<h4 style="padding-top: 16px;">정보입력</h4>
				<section class="infoInput">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th>이 름</th>
								<td><input type="text" name="name" required></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" required></td>
							</tr>
							<tr>
								<th>비 밀 번 호</th>
								<td><input type="password" placeholder="password" name="pw" id="pw" required/></td>
							</tr>
							<tr>
								<th>비 밀 번 호 확 인</th>
								<td><input type="password" placeholder="password" name="password" id="password" required/>
								<font name="check" size="2" color="red"></font> 
								</td>
							</tr>
							<tr>
								<th>주민등록번호 앞자리</th>
								<td><input type="text"  name="myNum" required Maxlength="6"/></td>
							</tr>
							<tr>
								<th>나 이</th>
								<td><input type="text"  name="age" required/ Maxlength="3"></td>
							</tr>
							<tr>
								<th>성 별</th>
								<td><input type="radio" name="sex" value="여" required/>여 <input type="radio"
									name="sex" value="남" required/>남</td>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td><input type="text" name="phoneNum" required Maxlength="13" placeholder="' - '포함 입력하세요" required> </td>
								 
							</tr>
							<tr>
								<th>E-Mail</th>
								<td><input type="text" name="email1" required>@<input type="text"
									list="emailList" name="email2" required> <datalist id="emailList">
										<option value="naver.com"></option>
										<option value="daum.net"></option>
										<option value="hanmail.net"></option>
										<option value="gmail.net"></option>
									</datalist></td>
							</tr>
							
							<tr>
								<th>주 소</th>
								<td><input type="text" id="sample4_postcode" name="postal" placeholder="우편번호" required>
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호로 찾기"><br>
								<input type="text" id="sample4_roadAddress" name="address" size=50 placeholder="도로명주소" required>
								</td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
			<nav style="float:right;">
				<input type="submit" value="가입하기" /> <a href="../../main.jsp" style="text-color:black;"><input type="button"
					value="취소하기" /></a>
			</nav>
			</form>
		</div>
		
	<jsp:include page="../../footer.html"/>
</body>
</html>