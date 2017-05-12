<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.SignUp" %>
<%@ page import="minsu.bms.login.service.SignUpImpl" %>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<body>
<%
	String id = ""; 
	if(session.getAttribute("login")!=null) {		//세션값이 비어있지 않다라면
	id = (String)session.getAttribute("login");} 
	
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	SignUp signUp = new SignUpImpl(loginDao);
	User user1 = signUp.findUser(id);
	
	String userId = request.getParameter("id");
	String password = request.getParameter("password"); 
	String name = request.getParameter("name");   
	
	String myNum = request.getParameter("myNum");
	
	String gender = request.getParameter("sex");
	int age = Integer.parseInt(request.getParameter("age"));

	
	String email = request.getParameter("email");

	String phoneNum = request.getParameter("phoneNum");

	String address = request.getParameter("address");
	int point = user1.getPoint();
	
	User user = new User(userId,password,name,age,gender,myNum,
			email,phoneNum,address,point);
	signUp.modifyUser(user);
%>

<jsp:forward page="../../shop/system/updateSuccess.jsp"/>
</body>
</html>