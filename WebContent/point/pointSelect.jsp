<%@page import="com.hyuna.point.PointDAO"%>
<%@page import="com.hyuna.point.PointDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = pointDAO.selectOne(num);


%>

	

<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../temp/header_nav.jsp"%>


	<% if(pointDTO != null) { %>

			<h1> Name : <%= pointDTO.getName() %> </h1>
			<h1> avg : <%= pointDTO.getAvg()%> </h1>
			
			<div>
			
				<a href="./pointUpdate.jsp?num=<%= pointDTO.getNum() %>">Update</a>
				<a href="./pointDelete.jsp?num=<%= pointDTO.getNum()%>">Delete</a>
				
			</div>

	<% } else { %>

			<h1>번호 없음</h1>

	<% } %>

	
	



	<%@ include file="../temp/footer.jsp"%>

</body>
</html>