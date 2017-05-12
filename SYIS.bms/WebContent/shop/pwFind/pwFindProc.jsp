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
	
	String userId=request.getParameter("userId");
	String name = request.getParameter("name");
	String myNum = request.getParameter("myNum");
	
	String msg1="";
	String msg2="";
	User user=null;
	String userPw=null;
	if(userId !=null && !userId.equals("") &&name !=null && !name.equals("") && myNum != null && !myNum.equals("")) {
		userId=userId.trim();
		name = name.trim();  
		myNum= myNum.trim(); 
		user = findService.findUserPw(userId, name, myNum);	
		if(user!=null){
			userPw = user.getPassword();
			msg1="'"+userId+"'"+"님의 비밀번호는";
			msg2="'"+userPw+"'"+"입니다.";
		}else{
			msg1="가입정보가 없습니다.";
			msg2="다시한번 확인해주세요";
		}

	}else if(userId ==null && userId.equals("")&&name ==null && name.equals("") && myNum == null && myNum.equals("")){
		msg1="가입정보가 없습니다.";
		msg2="다시한번 확인해주세요";
	}
	request.setAttribute("msg1", msg1);
	request.setAttribute("msg2", msg2);
	
	
%><jsp:include page="pwFindAfter.jsp"/>