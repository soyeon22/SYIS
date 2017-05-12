<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.SignUp" %>
<%@ page import="minsu.bms.login.service.SignUpImpl" %>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
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