<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="minsu.bms.search.service.SearchService"%>
<%@ page import="minsu.bms.search.service.SearchServiceImpl"%>
<%@ page import="minsu.bms.search.domain.SearchResult"%>
<%@ page import="minsu.bms.review.service.ReviewService"%>
<%@ page import="minsu.bms.review.service.ReviewServiceImpl"%>
<%@ page import="minsu.bms.review.domain.Review"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8"); 
	
	SearchService searchService=new SearchServiceImpl();
	ReviewService reviewService=new ReviewServiceImpl();
	
	String bookCode = request.getParameter("bookCode");
	SearchResult searchResult=searchService.bookInfo(bookCode);
	request.setAttribute("searchResult", searchResult);


 	if(request.getParameter("comments")!=null && !request.getParameter("comments").equals("")){
 		String userId=(String)session.getAttribute("login");
		String comments=request.getParameter("comments");
		int gpa=Integer.parseInt(request.getParameter("gpa"));
		Review review=new Review(userId, bookCode, comments, gpa);
		reviewService.insertReview(review);
	}
	
 	List<Review> reviews = null;
 	reviews=reviewService.listReviews(bookCode);
	request.setAttribute("reviews", reviews);
%>
	<jsp:forward page="productInfo.jsp?bookCode=<%= bookCode %>"/>
	<%-- <jsp:forward page="test.jsp"/>  --%>