<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.basket.service.BasketService"%>
<%@ page import="minsu.bms.basket.service.BasketServiceImpl"%>
<%@ page import="minsu.bms.config.Configuration"%>
<%@ page import="minsu.bms.basket.dao.BasketDao"%>
<%@ page import="minsu.bms.basket.dao.BasketDaoImpl"%>
<%@ page import="minsu.bms.basket.dao.mapper.BasketMapper"%>
<%@ page import="minsu.bms.basket.domain.Basket"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%
	BasketMapper basketMapper = Configuration.getMapper(BasketMapper.class);
	BasketDao basketDao = new BasketDaoImpl(basketMapper);
	BasketService basketService = new BasketServiceImpl(basketDao);
	
	int bookNum = Integer.parseInt(request.getParameter("bookNum"));
	int basketNum =Integer.parseInt(request.getParameter("basketNum1"));
	
	Basket basket = basketService.findBasket(basketNum);
	basket.setBookCount(bookNum);
	basketService.modifyBasket(basket);
	
	
%><jsp:include page="BasketProc.jsp"/>