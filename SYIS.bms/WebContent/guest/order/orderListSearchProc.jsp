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
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<%
	PurchaseMapper purchaseMapper = Configuration.getMapper(PurchaseMapper.class);
	PurchaseDao purchaseDao = new PurchaseDaoImpl(purchaseMapper);
	PurchaseService purchaseService = new PurchaseServiceImpl(purchaseDao);
	
	String id = (String)session.getAttribute("login");
	List<Purchase> purchaseList = new ArrayList<Purchase>();
	if(session.getAttribute("login")!=null){
	 	if(request.getParameter("date1") != null
			&& !request.getParameter("date1").equals("")
			&& request.getParameter("date2") != null
			&& !request.getParameter("date2").equals("")){
			String date1= request.getParameter("date1");
		 	String date2= request.getParameter("date2");
			List<Purchase> purchases = purchaseService.findPurchaseSearch(date1, date2);
		for(Purchase purchase :purchases){
			if(purchase.getUserId().equals(id)){
				Purchase purchase1 = purchase;
				purchaseList.add(purchase1);
			}
		}	
		request.setAttribute("purchases", purchaseList);
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
	 }else{
		 DecimalFormat df = new DecimalFormat("00");
			Calendar currentCalendar = Calendar.getInstance();
			//현재 날짜 구하기
			String date1="";
			String date2="";
			String strYear = Integer.toString(currentCalendar
					.get(Calendar.YEAR));
			String strMonth = df.format(currentCalendar
					.get(Calendar.MONTH) + 1);
			String strMonth31 = df.format(currentCalendar
					.get(Calendar.MONTH));
			String strMonth90 = df.format(currentCalendar
					.get(Calendar.MONTH) - 2);
			String strDay = df.format(currentCalendar
					.get(Calendar.DATE));
			String strDay7 = df.format(currentCalendar
					.get(Calendar.DATE) - 7);
			String date = strYear +"-"+ strMonth  +"-"+ strDay;
			String date7 = strYear +"-"+strMonth +"-"+strDay7;
			String date31 = strYear+"-"+strMonth31  +"-"+ strDay;
			String date90 = strYear +"-"+ strMonth90 +"-"+ strDay;
			
			if (request.getParameter("date7") != null) {
				date1 = date7.trim();
				date2 = strYear +"-"+ strMonth  +"-"+ strDay;

			} else if (request.getParameter("date31") != null) {
				date1 = date31.trim();
				date2 = strYear +"-"+ strMonth  +"-"+ strDay;

			} else if (request.getParameter("date90") != null)  {
				date1 = date90.trim();
				date2 = strYear +"-"+ strMonth  +"-"+ strDay;
			}
			List<Purchase> purchases = purchaseService.findPurchaseSearch(date1, date2);
			for(Purchase purchase :purchases){
				if(purchase.getUserId().equals(id)){
					Purchase purchase1 = purchase;
					purchaseList.add(purchase1);
				}
			}	
			request.setAttribute("purchases", purchaseList);
			request.setAttribute("date1", date1);
			request.setAttribute("date2", date2);
	 	}
	 	
	 }else{%>
		<script>
			alert("로그인해주세요");
			window.location.href="../../shop/login/login.jsp";
		</script> 
	 <%}
	
%><jsp:include page="orderList.jsp"/>