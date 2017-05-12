<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.purchase.service.PurchaseService"%>
<%@ page import="syis.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDao"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="syis.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="syis.bms.purchase.domain.Purchase"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="java.util.*" %>
<%@ page import="syis.bms.bookmanagement.service.BookService"%>
<%@ page import="syis.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDao"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="syis.bms.bookmanagement.domain.Book"%>
<%@ page import="syis.bms.delivery.service.DeliveryService"%>
<%@ page import="syis.bms.delivery.service.DeliveryServiceImpl"%>
<%@ page import="syis.bms.delivery.dao.DeliveryDao"%>
<%@ page import="syis.bms.delivery.dao.DeliveryDaoImpl"%>
<%@ page import="syis.bms.delivery.dao.mapper.DeliveryMapper"%>
<%@ page import="syis.bms.delivery.domain.Delivery"%>
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
	