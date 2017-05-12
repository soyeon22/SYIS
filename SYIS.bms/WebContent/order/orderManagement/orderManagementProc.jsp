<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.orderManagement.service.OrderService"%>
<%@ page import="minsu.bms.orderManagement.service.OrderServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.orderManagement.dao.OrderDao"%>
<%@ page import="minsu.bms.orderManagement.dao.OrderDaoImpl"%>
<%@ page import="minsu.bms.orderManagement.dao.mapper.OrderMapper"%>
<%@ page import="minsu.bms.orderManagement.domain.Order"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html >
<%
	OrderMapper orderMapper = Configuration.getMapper(OrderMapper.class);
	OrderDao orderDao = new OrderDaoImpl(orderMapper);
	OrderService orderService = new OrderServiceImpl(orderDao);
	
	List<Order> orders = orderService.orderList();
	
	String registrationDate1 = request.getParameter("registrationDate1");
	String registrationDate2 = request.getParameter("registrationDate2");
	
	List<Order> orderDates = null;
	if(registrationDate1 != null || registrationDate2 != null ) {
		
	orderDates = orderService.searchDates(registrationDate1, registrationDate2);
	
	}
	if(registrationDate1 == null || registrationDate1.equals("") || registrationDate2==null || registrationDate2.equals("")){
		request.setAttribute("orders",orders);
	}else{
		request.setAttribute("orders", orderDates);
	}
	
%>
 	<jsp:forward page="orderManagement.jsp?registrationDate1=<%= registrationDate1 %>&registrationDate2=<%= registrationDate2 %>"/>
 