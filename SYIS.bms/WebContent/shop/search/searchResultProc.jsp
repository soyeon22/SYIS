<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.search.service.SearchService"%>
<%@ page import="minsu.bms.search.service.SearchServiceImpl"%>
<%@ page import="minsu.bms.search.domain.SearchResult"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	SearchService searchService=new SearchServiceImpl();
	String searchText = request.getParameter("searchText");
	String searchOption = request.getParameter("searchOption");
	String pageNum = request.getParameter("pageNum");
	String orderOption="";
	
	List<SearchResult> searchResults = null;
	if(request.getParameter("orderOption") == null || request.getParameter("orderOption").equals("")||request.getParameter("orderOption").equals("salesNum desc")){
		searchResults=searchService.salesNum(searchOption,searchText);
	}else if(request.getParameter("orderOption").equals("reviewCnt desc")){
		searchResults=searchService.reviewCnt(searchOption,searchText);
	}else if(request.getParameter("orderOption").equals("publiDate desc")){
		searchResults=searchService.publiDate(searchOption,searchText);
	}else if(request.getParameter("orderOption").equals("bookPrice desc")){
		searchResults=searchService.highPrice(searchOption,searchText);
	}else if(request.getParameter("orderOption").equals("bookPrice")){
		searchResults=searchService.lowPrice(searchOption,searchText);
	}
	
	request.setAttribute("searchResults", searchResults);
	request.setAttribute("searchText", searchText);
	request.setAttribute("searchOption", searchOption);
	request.setAttribute("orderOption", orderOption);
	request.setAttribute("pageNum", pageNum);
%>
	<jsp:forward page="searchResult.jsp?searchOption=<%= searchOption %>&searchText=<%= searchText %>&pageNum=<%= pageNum %>&orderOption=<%= orderOption %>"/>