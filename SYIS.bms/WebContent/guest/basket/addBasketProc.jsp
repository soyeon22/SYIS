<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.basket.service.BasketService"%>
<%@ page import="minsu.bms.basket.service.BasketServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.basket.dao.BasketDao"%>
<%@ page import="minsu.bms.basket.dao.BasketDaoImpl"%>
<%@ page import="minsu.bms.basket.dao.mapper.BasketMapper"%>
<%@ page import="minsu.bms.basket.domain.Basket"%>
<%@ page import="minsu.bms.bookmanagement.service.BookService"%>
<%@ page import="minsu.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDao"%>
<%@ page import="minsu.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="minsu.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="minsu.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%
	BasketMapper basketMapper = Configuration.getMapper(BasketMapper.class);
	BasketDao basketDao = new BasketDaoImpl(basketMapper);
	BasketService basketService = new BasketServiceImpl(basketDao);
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	String id = (String)session.getAttribute("login");//아이디
	
	if(id == null) {
%>
<script>
	window.location.href="../../shop/login/login.jsp";
</script>
<% } %>
<%
	/*  boolean test1 = false;
	 Basket basket5 = null;
 	 if(id != null && request.getParameterValues("bookCodes") != null) {
		String[] bookCodes = request.getParameterValues("bookCodes");
		List<Basket> baskets = basketService.listBaskets(id);
		for(String bookCode:bookCodes) {
			test1 = false;
			basket5 = null;
			for(Basket basket:baskets) {
				if(basket.getBookCode().equals(bookCode)){
					basket.setBookCount(basket.getBookCount()+1);
					basket5 = basket;
					test1 = true;
				}
			}
			if(test1) {
				basketService.modifyBasket(basket5);
			}else {
			Book book = bookService.findBook(bookCode);
			Basket basket=new Basket();
			basket.setBookCode(bookCode);
			basket.setBookCount(1);
			basket.setBookName(book.getBookName());
			basket.setBookPrice(book.getBookPrice());
			basket.setUserId(id);
			basketService.plusBasket(basket); 
			}
		}
	} else */ if(id != null && request.getParameter("bookCode") != null) {
		String addCode = request.getParameter("bookCode");//책코드
		List<Basket> baskets = basketService.listBaskets(id);
		boolean test = false;
		int bookCount = 1;
		Basket basket = null;
		if(request.getParameter("bookNum")!=null){
			bookCount = Integer.parseInt(request.getParameter("bookNum"));
		}
		for(Basket basket1:baskets) {
			if(basket1.getBookCode().equals(addCode)){
				basket1.setBookCount(basket1.getBookCount()+bookCount);
				basket = basket1;
				test = true;
			}
		}
		if(test) {
			basketService.modifyBasket(basket);
		}else {
			Book book = bookService.findBook(addCode);
		
			Basket addbasket = new Basket();
			addbasket.setBookCode(addCode);
			addbasket.setBookCount(bookCount);
			addbasket.setBookName(book.getBookName());
			addbasket.setBookPrice(book.getBookPrice());
			addbasket.setUserId(id);
			basketService.plusBasket(addbasket);  
		}
	} 
		
%>
 	<jsp:forward page="BasketProc.jsp"/>