<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.refund.service.RefundService"%>
<%@ page import="syis.bms.refund.service.RefundServiceImpl"%>
<%@ page import="syis.bms.refund.dao.RefundDao"%>
<%@ page import="syis.bms.refund.dao.RefundDaoImpl"%>
<%@ page import="syis.bms.refund.dao.mapper.RefundMapper"%>
<%@ page import="syis.bms.refund.domain.Refund"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="java.util.*" %>
<%@ page import="syis.bms.purchase.service.PurchaseService"%>
<%@ page import="syis.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDao"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="syis.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="syis.bms.purchase.domain.Purchase"%>
<%@ page import="syis.bms.login.service.LoginService"%>
<%@ page import="syis.bms.login.service.LoginServiceImpl"%>
<%@ page import="syis.bms.login.service.PointService"%>
<%@ page import="syis.bms.login.service.PointServiceImpl"%>
<%@ page import="syis.bms.login.dao.LoginDao"%>
<%@ page import="syis.bms.login.dao.LoginDaoImpl"%>
<%@ page import="syis.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="syis.bms.login.domain.User"%>

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