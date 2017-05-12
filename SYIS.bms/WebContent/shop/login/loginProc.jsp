<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.login.service.LoginService"%>
<%@ page import="minsu.bms.login.service.LoginServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>
<!DOCTYPE html>
<%
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	LoginService loginService = new LoginServiceImpl(loginDao); //

	String id = request.getParameter("id");	//login.jsp 페이지에서 id값 넘겨받음
	String pw = request.getParameter("pw"); //login.jsp 페이지에서 pw값 넘겨받음
	
	boolean isValid = false;	
	if(id !=null && !id.equals("") && pw != null && !pw.equals("")) { //아이디 비밀번호가 빈칸이거나 null이면 실행되지 않음
		id = id.trim();  // 아이디값 빈칸제거 
		pw = pw.trim();  // 비밀번호가 빈칸제거
		isValid = loginService.loginCheck(id, pw);	//loginCheck 메서드 실행 안에 실행코드 따라 가보세요
	}
	
	if(!isValid) {
		response.sendRedirect("login.jsp?msgld=-1");  // 로그인이 실패할때 파라미터값 하나 전달해주면서 
												      //다시 로그인 페이지로 이동시켜줌
	}else { session.setAttribute("login", id);// 성공시 세션값 저장하고 메인페이지로 이동
		//StringBuffer back = (StringBuffer)session.getAttribute("back");
		//back.toString();
	response.sendRedirect("../../main.jsp");
	}
%>