<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.invalidate(); //로그 아웃로 오는경우는 로그인을 했을 경우니까 세션값이 있음 그러므로 로그아웃페이지로
						  //접근하면 세션값을 삭제해준다음 메인페이지로 이동시킴
	response.sendRedirect("../../main.jsp");
%>