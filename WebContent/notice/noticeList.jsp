<%@page import="com.hyuna.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hyuna.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
   		request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	
    
    	NoticeDAO noticeDAO = new NoticeDAO();
    	//ArrayList<NoticeDTO> ar = noticeDAO.selectList(startRow, lastRow);
        
    
    	
    %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>

<title>Insert title here</title>

<script type="text/javascript">



</script>

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
					<td>NAME</td>
					<td>DATE</td>
					<td>HIT</td>

				</tr>

			
					
					
					<%-- <% for(NoticeDTO noticeDTO : ar) { %>
				
					
						<tr>

						<td><%= noticeDTO.getNum() %></td> 
						<td class="select"> <%= noticeDTO.getTitle() %> </td>
						<td> <%= noticeDTO.getName() %></td>
						<td> <%= noticeDTO.getReg_date() %></td>
						<td> <%= noticeDTO.getHit() %></td>
						
						</tr> 
						
						
			<% } %> --%>


			</table>
		</div>

		<div class="row">
			<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>

		</div>

	</div>



<%@ include file="../temp/footer.jsp"%>

<script type="text/javascript">



$(function() {
	
	$('.select').click(function() {
		
		var getNum = $(this).prev().text();
		location.href="./noticeSelect.jsp?num="+getNum;
		
	});
	
});



</script>

</body>
</html>