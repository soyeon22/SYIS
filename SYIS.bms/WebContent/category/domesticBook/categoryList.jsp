<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.bookmanagement.service.BookService"%>
<%@ page import="syis.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDao"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="syis.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	String kind = request.getParameter("kind");
	List<Book> domesticBookList = bookService.domesticBookList(kind);
	
	request.setAttribute("books", domesticBookList);
	request.setAttribute("kind", kind);
%>
	<jsp:include page="domesticBook.jsp"/>