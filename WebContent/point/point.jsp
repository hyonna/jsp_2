<%@page import="com.hyuna.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hyuna.point.PointDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
		PointDAO pointDAO = new PointDAO();
	
		int curPage=1;//페이지 번호 
		try {
		
		curPage = Integer.parseInt(request.getParameter("curPage"));
		if(curPage<1) {
			
			curPage=1;
			
		}
		
		} catch(Exception e) {
		
		
		}
		
		int perPage = 10; //한 페이지에 나와야하는 수
		int startRow = (curPage-1)*perPage+1; //1 
		int lastRow = curPage * perPage; //10
		
		String kind = request.getParameter("kind");
		
		if(kind == null) {
			
			kind = "name";
			
		} else if(kind.equals("k")) {
			
			kind = "kor";
			
		} else if(kind.equals("e")) {
			
			kind = "eng";
			
		} else if(kind.equals("m")) {
			
			kind = "math";
			
		} else {
			
			kind = "name";
			
		}
		
		String search = request.getParameter("search");
		
		if(search == null) {
			
			search = "";
		}
		
		/* System.out.println("kind : " + kind);
		System.out.println("search : " + search); */
		
		
		//1. 총 글의 갯수
		int totalCount = pointDAO.getTotalCount(kind, search);
		
		//2. 총 페이지의 갯수
		int totalPage = totalCount / perPage;
		
		if(totalCount % perPage != 0) {
			
			totalPage++;
		}
		
		try {
			
			if(curPage > totalPage) {
				
				response.sendRedirect("./point.jsp?curPage=1");
			}
			
		} catch(Exception e) {
			
			
		} 
		
		
		//3. block당 숫자의 갯수
		int perBlock = 5; //한 페이지에 나오는 페이지번호 갯수
		

		//4. 총 block 수 //perblock의 총 갯수
		int totalBlock = totalPage / perBlock;
		
		if(totalPage % perBlock != 0) {
			
			totalBlock++;
		}
		
		
		//5. curPage를 이용해서 현재 block번호 찾기 //현재의 block번호
		int curBlock = curPage / perBlock;
		
		if(curPage % perBlock != 0) {
			
			curBlock++;
		}
		
		
		//6. curBlock에서 startNum과 lastNum찾기
		
		int startNum = (curBlock-1)*perBlock+1;
		int lastNum = curBlock*perBlock;
		
		
		if(curBlock == totalBlock) {
			
			lastNum = totalPage;
		}
		
		
		ArrayList<PointDTO> ar = pointDAO.selectList(kind, search ,startRow, lastRow); 
		
		
	%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="../temp/css_meta.jsp"%>

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

<title>Insert title here</title>
</head>

<body>


	<%@ include file="../temp/header_nav.jsp"%>

	<!-- -------------------------------------------------------------- -->

	<div class="container main">

		<div class="row">

			<h1>Point Page</h1>
		</div>
		
		<!-- -------------------------------------------------------------- -->

		<div>

			<table class="table table-hover">



				<tr>
					<td>NUM</td>
					<td>NAME</td>
					<td>KOR</td>
					<td>ENG</td>
					<td>MATH</td>
					<td>TOTAL</td>
					<td>AVG</td>

				</tr>

			
					
					
				<% 	for (PointDTO pointDTO : ar) { %>
					
						<tr>

						<td> <%= pointDTO.getNum() %> </td> 
						<td><a href="./pointSelect.jsp?num=<%= pointDTO.getNum() %>"> <%= pointDTO.getName() %> </a></td>
						<td> <%= pointDTO.getKor() %></td>
						<td> <%= pointDTO.getEng() %></td>
						<td> <%= pointDTO.getMath() %></td>
						<td> <%= pointDTO.getTotal() %></td>
						<td> <%= pointDTO.getAvg() %></td>
						
						</tr>
						
						
				<% } %>


			</table>
		</div>
		
		<!-- -------------------------------------------------------------- -->
		
		<div id="form_box">
		
		<form action="./point.jsp" method="get" id="serach">
		
			<select name="kind">
			
				<option value="n">제목</option>
				<option value="k">국어점수</option>
				<option value="e">영어점수</option>
				<option value="m">수학점수</option>
			
			</select>
			
			<input type="text" class="" name="search" value="<%=search%>">
			
			<button>Search</button>
		
		
		</form>
		
		
		</div>
		
		<!-- -------------------------------------------------------------- -->
		
		<div>
		
		<% if(curBlock>1) { %>
		
		<a href="./point.jsp?curPage=<%= startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a> 
		
		<% } %>
		
		<% for(int i = startNum; i <= lastNum; i++) { %>
		
		
		
			<a href="./point.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a>
			
		
		
		<% } %>	
		
		<% if(curBlock<totalBlock) { %>
		
		<a href="./point.jsp?curPage=<%= lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
		
		<% } %>
		
		</div>
		
		<!-- -------------------------------------------------------------- -->

		<div class="row">
			<a href="./pointWrite.jsp" class="btn btn-primary">Write</a>

		</div>
		
		<!-- -------------------------------------------------------------- -->

	</div>


		<!-- -------------------------------------------------------------- -->


	<%@ include file="../temp/footer.jsp"%>



</body>
</html>