<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.FindService"%>
<%@ page import="minsu.bms.login.service.FindServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	FindService findService = new FindServiceImpl(loginDao);
	
	String name = request.getParameter("name");
	String myNum = request.getParameter("myNum");
	System.out.print(name.trim());
	System.out.print(myNum);
	
	String msg1="";
	String msg2="";
	String userId=null;
	User user=null;
	if(name !=null && !name.equals("") && myNum != null && !myNum.equals("")) {
		name = name.trim();  
		myNum= myNum.trim(); 
		user = findService.findIdCheck(name, myNum);
		if(user!=null){
		userId = user.getUserId();
		msg1= "'"+name+"'"+"님의 아이디는";
		msg2="'"+userId+"'"+"입니다.";
		}else{
			msg1="가입정보가 없습니다.";
			msg2="다시한번 확인해주세요";
		}
	}else {
		msg1="가입정보가 없습니다.";
		msg2="다시한번 확인해주세요";

	}
	
	request.setAttribute("msg1", msg1);
	request.setAttribute("msg2", msg2);
	
	
	
%><jsp:include page="idFindAfter.jsp"/>