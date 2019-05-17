<%@page import="com.hyuna.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hyuna.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
   		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    	NoticeDAO noticeDAO = new NoticeDAO();
    	NoticeDTO noticeDTO = noticeDAO.selectOne(num);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>

<title>Insert title here</title>

<style type="text/css">
.main {
	min-height: 800px;
}

a {

	text-decoration: none;
	color : red;

}

a:hover {

	color : blue;
	text-decoration: none;
	
}
</style>
</head>


<body>

<%@ include file="../temp/header_nav.jsp"%>


<div class="container main">

		<div class="row">

			<h1>Notice Page</h1>
		</div>


		<div>

			<table class="table table-hover">



				<tr>
					<td>NUM</td>
					<td>TITLE</td>
					<td>Contents</td>
					<td>NAME</td>
					<td>DATE</td>
					<td>HIT</td>

				</tr>

					
						<tr>

						<td> <%= noticeDTO.getNum() %> </td> 
						<td> <%= noticeDTO.getTitle() %> </td>
						<td> <%= noticeDTO.getContents() %> </td>
						<td> <%= noticeDTO.getName() %></td>
						<td> <%= noticeDTO.getReg_date() %></td>
						<td> <%= noticeDTO.getHit() %></td>
						
						</tr> 
						

			</table>
		</div>

		<div class="row">
			<a href="./noticeUpdate.jsp?num=<%=noticeDTO.getNum()%>" class="btn btn-primary">Update</a>
			<a href="./noticeDelete.jsp?num=<%=noticeDTO.getNum()%>" class="btn btn-primary">Delete</a>

		</div>

	</div>



<%@ include file="../temp/footer.jsp"%>

</body>
</html>