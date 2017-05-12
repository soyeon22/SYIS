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

int boardNum=Integer.parseInt(request.getParameter("boardNum"));

queryService.deleteQuery(boardNum);

%>
<jsp:include page="queryList.jsp"/>