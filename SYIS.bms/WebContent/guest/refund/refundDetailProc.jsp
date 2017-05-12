<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.refund.service.RefundService"%>
<%@ page import="minsu.bms.refund.service.RefundServiceImpl"%>
<%@ page import="minsu.bms.refund.dao.RefundDao"%>
<%@ page import="minsu.bms.refund.dao.RefundDaoImpl"%>
<%@ page import="minsu.bms.refund.dao.mapper.RefundMapper"%>
<%@ page import="minsu.bms.refund.domain.Refund"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="java.util.*" %>
<%@ page import="minsu.bms.purchase.service.PurchaseService"%>
<%@ page import="minsu.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="minsu.bms.purchase.dao.PurchaseDao"%>
<%@ page import="minsu.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="minsu.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="minsu.bms.purchase.domain.Purchase"%>
<%@ page import="minsu.bms.login.service.LoginService"%>
<%@ page import="minsu.bms.login.service.LoginServiceImpl"%>
<%@ page import="minsu.bms.login.service.PointService"%>
<%@ page import="minsu.bms.login.service.PointServiceImpl"%>
<%@ page import="minsu.bms.login.dao.LoginDao"%>
<%@ page import="minsu.bms.login.dao.LoginDaoImpl"%>
<%@ page import="minsu.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="minsu.bms.login.domain.User"%>

<!DOCTYPE html>
<%
	RefundMapper refundMapper = Configuration.getMapper(RefundMapper.class);
	RefundDao refundDao = new RefundDaoImpl(refundMapper);
	RefundService refundService = new RefundServiceImpl(refundDao);
	PurchaseMapper purchaseMapper = Configuration.getMapper(PurchaseMapper.class);
	PurchaseDao purchaseDao = new PurchaseDaoImpl(purchaseMapper);
	PurchaseService purchaseService = new PurchaseServiceImpl(purchaseDao);
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	LoginService loginService = new LoginServiceImpl(loginDao); 
	PointService pointService = new PointServiceImpl(loginDao);
	
	String bookName=request.getParameter("bookName");
	int refundAmount=Integer.parseInt(request.getParameter("payAmount"));
	String reason= request.getParameter("reason");
	String cancelType =request.getParameter("cancelType");
	int orderNum= Integer.parseInt(request.getParameter("orderNum"));
	String id=(String)session.getAttribute("login");
	Purchase purchase = purchaseService.findPurchase(orderNum);
	int point = purchase.getPayAmount()/10;
	
	Refund refund =new Refund();
	refund.setCancelType(cancelType);
	refund.setRefundReason(reason);
	refund.setRefundAmount(refundAmount);
	refund.setBookName(bookName);
	refund.setOrderNum(orderNum);
	refund.setUserId(id);

	refundService.addRefund(refund);
	
	

	Refund refund2 = refundService.findRefund(orderNum);
	int refundNum = refund2.getRefundNum();
	System.out.print(refundNum);
	if(refund2.getOrderNum()== purchase.getOrderNum()){
		
		purchase.setRefundNum(refundNum);
		purchaseService.modifyRefund(purchase);
	
	}
	User user = loginService.findUser(id);

	int userReserve=user.getPoint();
	user.setPoint(userReserve-point);
	pointService.updatePoint(user);

	
	%>
	<jsp:include page="refundList.jsp"/>