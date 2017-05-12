<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.login.service.SignUp" %>
<%@ page import="syis.bms.login.service.SignUpImpl" %>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.login.dao.LoginDao"%>
<%@ page import="syis.bms.login.dao.LoginDaoImpl"%>
<%@ page import="syis.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="syis.bms.login.domain.User"%>
<%
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	SignUp signUp = new SignUpImpl(loginDao);
	
	String id = (String)session.getAttribute("login");
	User user=signUp.findUser(id);
	signUp.deleteUser(user);
	session.invalidate(); 
%>
<jsp:forward page ="../../shop/system/leaveSuccess.jsp"/>