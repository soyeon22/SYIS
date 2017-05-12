<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.purchase.service.PurchaseService"%>
<%@ page import="syis.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDao"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="syis.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="syis.bms.purchase.domain.Purchase"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.bookmanagement.service.BookService"%>
<%@ page import="syis.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDao"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="syis.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%
	PurchaseMapper purchaseMapper = Configuration.getMapper(PurchaseMapper.class);
	PurchaseDao purchaseDao = new PurchaseDaoImpl(purchaseMapper);
	PurchaseService purchaseService = new PurchaseServiceImpl(purchaseDao);
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	Purchase purchase = purchaseService.findPurchase(orderNum);
	String bookCode = purchase.getBookCode();

	Book book= (Book)bookService.findBook(bookCode);

	request.setAttribute("purchase", purchase);
	request.setAttribute("book", book);


	%><jsp:include page="refund.jsp"/>
