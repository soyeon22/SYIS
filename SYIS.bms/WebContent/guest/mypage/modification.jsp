<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.SignUp" %>
<%@ page import="minsu.bms.login.service.SignUpImpl" %>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

.nav-header{
	color : #909090;
}

</style>
</head>
<body>
	<jsp:include page="../../header.jsp"/>
<%
	String id = ""; 
	if(session.getAttribute("login")!=null) {		//세션값이 비어있지 않다라면
		id = (String)session.getAttribute("login");} //세션값 추출하고 저장
	
		LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
		LoginDao loginDao = new LoginDaoImpl(loginMapper);
		SignUp signUp = new SignUpImpl(loginDao);
		User user=signUp.findUser(id);
%>					
		
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
     		<li  class="active"><a href="../../shop/system/idCheck.jsp"> 회원정보 수정</a></li>
            <li><a href="../../shop/system/idCheck1.jsp"> 회원 탈퇴</a></li>
            <li class="nav-divider"></li>
            <li class="nav-header"><strong> 나의 상담</strong></li>
            <li ><a href="../customerCenter/queryList.jsp"> 나의 상담 내역</a></li>
        </ul>
    </nav>
				</div>
				<div class="col-md-10">
				<form action="../../shop/system/updateSuccessProc.jsp">
				<h4 style="padding-top: 16px;">회원정보 수정</h4>
				*표시만 수정가능
				<section class="infoInput">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th>이 름</th>
								<td><input type="text" readOnly="readOnly" value="<%=user.getName()%>" name="name"></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" readOnly="readOnly" value="<%=user.getUserId()%>" name="id"></td>
							</tr>
							<tr>
								<th>비 밀 번 호 *</th>
								<td><input type="password" placeholder="password" name ="pw" id="pw" required/>대,소문자,특수기호, 숫자 사용가능</td>
							</tr>
							<tr>
								<th>비 밀 번 호 확 인 *</th>
								<td><input type="password" placeholder="password" name="password" id="password" required/>
								<font name="check" size="2" color="red"></font> 
								</td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td><input type="text" readOnly="readOnly" value="<%=user.getMyNum() %>" name="myNum">
							</tr>
							<tr>
								<th>나이</th>
								<td><input type="number" readOnly="readOnly" value="<%=user.getAge() %>" name="age">
							</tr>
				
							<%
							String gender = user.getGender();
							if(gender.equals("여")){%>
							<tr>
								<th>성 별</th>
								<td><input type="radio" name="sex" checked="checked" value="여"/>여 <input type="radio"
									name="sex'" disabled/>남</td>
							</tr>
							<%}else{ %>
							<tr>
								<th>성 별</th>
								<td><input type="radio" name="sex" disabled/>여 <input type="radio"
									name="sex" checked="checked" value="남"/>남</td>
							</tr>
							<%}%>
							<tr>
								<th>핸드폰 번호 *</th>
								<td><input type="text" name="phoneNum" required Maxlength="13" placeholder="' - '포함 입력하세요" 
									value="<%=user.getPhoneNum() %>" required></td>
								 
							</tr>
								<tr>
								<th>E-Mail *</th>
								<td><input type="text" name="email" required value="<%=user.getEmail() %>"></td>
							</tr>
							
							<tr>
								<th>주 소 *</th>
								<td><input type="text" id="sample4_postcode" name="postal" placeholder="우편번호" required>
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호로 찾기"><br>
								<input type="text" id="sample4_roadAddress" name="address" size=50 placeholder="도로명주소" required
									value="<%=user.getAddress()%>">
								</td>
							</tr>
						</tbody>
					</table>
				</section>
			
			<nav  style="float:right;">
				<input type="submit" value="수정하기" /> <a href="../../main.html" style="text-color:black;"><input type="button"
					value="취소하기" /></a>
			</nav>
			</form>
			</div>
		</div>
		</div>
		<br>
		<!-- 바닥글 -->
	<jsp:include page="../../footer.html"/>
</body>
</html>
