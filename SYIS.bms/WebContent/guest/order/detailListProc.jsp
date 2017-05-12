<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.purchase.service.PurchaseService"%>
<%@ page import="minsu.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="minsu.bms.purchase.dao.PurchaseDao"%>
<%@ page import="minsu.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="minsu.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="minsu.bms.purchase.domain.Purchase"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="java.util.*" %>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="minsu.bms.delivery.service.DeliveryService"%>
<%@ page import="minsu.bms.delivery.service.DeliveryServiceImpl"%>
<%@ page import="minsu.bms.delivery.dao.DeliveryDao"%>
<%@ page import="minsu.bms.delivery.dao.DeliveryDaoImpl"%>
<%@ page import="minsu.bms.delivery.dao.mapper.DeliveryMapper"%>
<%@ page import="minsu.bms.delivery.domain.Delivery"%>
<!DOCTYPE html>
<%
	PurchaseMapper purchaseMapper = Configuration.getMapper(PurchaseMapper.class);
	PurchaseDao purchaseDao = new PurchaseDaoImpl(purchaseMapper);
	PurchaseService purchaseService = new PurchaseServiceImpl(purchaseDao);
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	DeliveryMapper deliveryMapper = Configuration.getMapper(DeliveryMapper.class);
	DeliveryDao deliveryDao = new DeliveryDaoImpl(deliveryMapper);
	DeliveryService deliveryService = new DeliveryServiceImpl(deliveryDao);
	
	String bookCode = request.getParameter("bookCode");
 	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
 	int deliveryNum = Integer.parseInt(request.getParameter("deliveryNum"));
 	
	Purchase purchase = purchaseService.findPurchase(orderNum);
	Book book = bookService.findBook(bookCode.trim());
	Delivery delivery = deliveryService.findDelivery(deliveryNum);
	
	request.setAttribute("delivery", delivery);
	request.setAttribute("book", book);
	request.setAttribute("purchase", purchase);
	
	%>
	<jsp:include page="detaiList.jsp"/>
	