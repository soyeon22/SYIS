<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="syis.bms.config.Configuration"%>
<%@ page import="syis.bms.query.dao.mapper.QueryMapper" %>
<%@ page import="syis.bms.query.dao.QueryDao" %>
<%@ page import="syis.bms.query.dao.QueryDaoImpl" %>
<%@ page import="syis.bms.query.domain.Query" %>
<%@ page import="syis.bms.query.service.QueryService" %>
<%@ page import="syis.bms.query.service.QueryServiceImpl" %>
<%
QueryMapper queryMapper = Configuration.getMapper(QueryMapper.class);
QueryDao queryDao = new QueryDaoImpl(queryMapper);
QueryService queryService = new QueryServiceImpl(queryDao);

int boardNum = Integer.parseInt(request.getParameter("boardNum"));
String title = request.getParameter("title");
String content = request.getParameter("content");

if(boardNum!=0&&title!=null&&!title.equals("")&&content!=null&&!content.equals("")){
Query query = queryService.findQueryNum(boardNum);
query.setTitle(title);
query.setContent(content);
queryService.modifyQuery(query);

%>
<jsp:include page="queryList.jsp"/>
<%} %>
