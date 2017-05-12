<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.SignUp" %>
<%@ page import="minsu.bms.login.service.SignUpImpl" %>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<!DOCTYPE html>
<% 	
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	SignUp signUp = new SignUpImpl(loginDao);

	String userId = request.getParameter("id");
	if(!userId.equals("") && userId != null) {
		User userid = signUp.findUser(userId);
		if(userid != null) {
%>
	<script>
	alert("중복된 아이디 입니다");	//경고창과 함께 스크립트 언어로 출력
	history.back();
	</script>
<% 
		}else {
	
	String password = request.getParameter("password"); 
	String name = request.getParameter("name");     
 	
 	String myNum = request.getParameter("myNum");
 	
 	String gender = request.getParameter("sex");
 	int age = Integer.parseInt(request.getParameter("age"));
	
	String em1 = request.getParameter("email1");
	String em2 = request.getParameter("email2");
	String email = em1+"@"+em2;
	
 	String phoneNum = request.getParameter("phoneNum"); 
	
 	String address = request.getParameter("address");
	int point = 0;
	
	User user = new User(userId,password,name,age,gender,myNum,
			email,phoneNum,address,point);
	signUp.join(user);
%>
<jsp:forward page= "../../shop/system/signUpSuccess.jsp"/>

<%
} }
%>
</body>
</html>