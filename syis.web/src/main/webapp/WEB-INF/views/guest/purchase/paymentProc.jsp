<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDao"%>
<%@ page import="syis.bms.bookmanagement.dao.BookDaoImpl"%>
<%@ page import="syis.bms.bookmanagement.dao.mapper.BookMapper"%>
<%@ page import="syis.bms.bookmanagement.service.BookService"%>
<%@ page import="syis.bms.bookmanagement.service.BookServiceImpl"%>
<%@ page import="syis.bms.bookmanagement.domain.Book"%>
<%@ page import="java.util.*" %>
<%@ page import="syis.bms.login.service.LoginService"%>
<%@ page import="syis.bms.login.service.LoginServiceImpl"%>
<%@ page import="syis.bms.login.dao.LoginDao"%>
<%@ page import="syis.bms.login.dao.LoginDaoImpl"%>
<%@ page import="syis.bms.login.dao.mapper.LoginMapper"%>
<%@ page import="syis.bms.login.domain.User"%>
<%@ page import="syis.bms.purchase.service.PurchaseService"%>
<%@ page import="syis.bms.purchase.service.PurchaseServiceImpl"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDao"%>
<%@ page import="syis.bms.purchase.dao.PurchaseDaoImpl"%>
<%@ page import="syis.bms.purchase.dao.mapper.PurchaseMapper"%>
<%@ page import="syis.bms.purchase.domain.Purchase"%>
<%@ page import="syis.bms.basket.service.BasketService"%>
<%@ page import="syis.bms.basket.service.BasketServiceImpl"%>
<%@ page import="syis.bms.basket.dao.BasketDao"%>
<%@ page import="syis.bms.basket.dao.BasketDaoImpl"%>
<%@ page import="syis.bms.basket.dao.mapper.BasketMapper"%>
<%@ page import="syis.bms.basket.domain.Basket"%>
<!DOCTYPE html>
<%
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	LoginMapper loginMapper = Configuration.getMapper(LoginMapper.class);
	LoginDao loginDao = new LoginDaoImpl(loginMapper);
	LoginService loginService = new LoginServiceImpl(loginDao); 
	PurchaseMapper purchaseMapper = Configuration.getMapper(PurchaseMapper.class);
	PurchaseDao purchaseDao = new PurchaseDaoImpl(purchaseMapper);
	PurchaseService purchaseService = new PurchaseServiceImpl(purchaseDao);
	BasketMapper basketMapper = Configuration.getMapper(BasketMapper.class);
	BasketDao basketDao = new BasketDaoImpl(basketMapper);
	BasketService basketService = new BasketServiceImpl(basketDao);
	
	String bookNum="1";
	if(request.getParameter("bookNum")!=null){
		bookNum = request.getParameter("bookNum");
		request.setAttribute("bookNum", bookNum);
	}
	
	String id=(String)session.getAttribute("login");
	
	if(id !=null){
	User user = loginService.findUser(id);
	request.setAttribute("user",user);
	}else {
%>
	<script>
		alert("로그인해주세요");
		window.location.href="../../shop/login/login.jsp";
	</script>
<% 
 	}
	
	
	List<Basket> basket= new ArrayList<Basket>();
	if(request.getParameterValues("basketNum")!=null){
		String[] basketNums = request.getParameterValues("basketNum");
		for(String basketNum : basketNums){
			int num = Integer.parseInt(basketNum);
			Basket baskets = null;
			baskets = basketService.findBasket(num);
			basket.add(baskets);
		}request.setAttribute("basket", basket);
	}else if(request.getParameter("bookCode")!=null){
		String bookCode = request.getParameter("bookCode");
		Book bookInfo = (Book)bookService.findBook(bookCode);
		request.setAttribute("bookInfo", bookInfo);
		
	}else {
%>
		<jsp:forward page="../basket/BasketProc.jsp?del=1"/>
<%
	}	
	
	request.setAttribute("bookNum", bookNum);
	
%>
<jsp:include page="payment.jsp"/>