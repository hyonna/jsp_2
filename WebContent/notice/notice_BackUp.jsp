<%@page import="com.hyuna.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hyuna.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	
	/* ---------------------------------------------------- */
	
	int curPage=1;//페이지 번호 
	try {
		
		curPage = Integer.parseInt(request.getParameter("curPage"));
		if(curPage<1) {
			
			curPage=1;
			
		}
		
	} catch(Exception e) {
		
		
	}
	
	/* ------------------- 검색 부분 --------------------- */
	
	String kind = request.getParameter("kind");
	
	if(kind == null) {
		
		kind = "title";
		
	} else if(kind.equals("t")) {
		
		kind = "title";
		
	} else if(kind.equals("c")) {
		
		kind = "contents";
		
	} else if(kind.equals("w")) {
		
		kind = "name";
		
	} else {
		
		kind = "title";
		
	}
		
		
		
	String search = request.getParameter("search");
	
	if(search == null) {
		
		search = "";
	}
	
	/* ---------------------------------------------------- */
	
	int perPage = 10; //한 페이지에 출력할 글 총 갯수 ex)10
	int startRow = (curPage-1)*perPage+1; //시작 글번호
	int lastRow = curPage * perPage; //끝 글번호

	
	/* ---------------------------------------------------- */
	
	/* System.out.println("kind : " + kind);
	System.out.println("search : " + search); */
	
	/* ---------------------------------------------------- */

	//1. 총 글 갯수 구하기
	int totalCount = noticeDAO.getTotalCount(kind, search); //총 글의 갯수
	
	//2. 총 페이지 갯수 구하기
	int totalPage = totalCount / perPage; //총 글의 갯수가 1~10개면 페이지번호 1page까지, 100개면 10page까지
	
	if(totalCount % perPage != 0) {
		
		totalPage++;
		
	}
	
	
	
	try {
		
		if(curPage > totalPage) {
			
			response.sendRedirect("./notice_BackUp.jsp?curPage=1");
		}
		
	} catch(Exception e) {
		
		
	} 
	
	//3. Block당 숫자의 갯수 -> 한 페이지에 나와야하는 페이지 번호 갯수 
	// 한 페이지에 나와야하는 페이지 번호가 1~10개 라면, 1block-> 1~10page = 10개, 2block -> 11~20page = 20개
	int perBlock = 10;
	
	//4. 총 Block 수
	// 한 페이지에 페이지번호가 10개까지면 , 1Block,
	// 페이지번호가 11개 까지면 2block,
	// 페이지 번호가 40개 까지면 , 4Block
	// 페이지 번호가 41개면 5block,
	int totalBlock = totalPage / perBlock;
	
	if(totalPage % perBlock != 0) {
		
		totalBlock++;
	}
	
	//5. curPage를 이용해서 현재 block번호 찾기
	//현재 페이지가 1~10page면 1block
	// 페이지번호가 11개 까지면 2block,
	// 페이지 번호가 40개 까지면 , 4Block
	// 페이지 번호가 41개면 5block,
	int curBlock = curPage / perBlock;
	
	if(curPage % perBlock != 0) {
		
		curBlock++;
	}
	
	//6. curBlock에서 startNum과 lastNum찾기
	int startNum = (curBlock-1)*perBlock+1;
	int lastNum = curBlock * perBlock;
	
	//7. curBlock이 마지막 block일때 lastNum 다시 대입 = totalPage
    
	
	if(curBlock == totalBlock) { //현재 블록이 총 블록 수와 같다면
		
		lastNum = totalPage; //마지막 페이지 번호는 총 페이지 수와 동일
	}
    
	
	/* ---------------------------------------------------- */
	
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(kind, search, startRow, lastRow);
	
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

<style type="text/css">
.main {
	min-height: 800px;
}




</style>
</head>


<body>



<%@ include file="../temp/header_nav.jsp"%>


<div class="container main">

		<div class="row">

			<h1>Notice Page</h1>
		</div>
		
				<!-- -------------------------------------------------------------- -->


		<div>

			<table class="table table-hover">



				<tr>
					<td>NUM</td>
					<td>TITLE</td>
					<td>NAME</td>
					<td>DATE</td>
					<td>HIT</td>

				</tr>

			
					
					
					<% for(NoticeDTO noticeDTO : ar) { %>
				
					
						<tr>

						<td> <%= noticeDTO.getNum() %> </td> 
						<td><a href="./noticeSelect.jsp?num=<%= noticeDTO.getNum() %>"> <%= noticeDTO.getTitle() %> </a></td>
						<td> <%= noticeDTO.getName() %></td>
						<td> <%= noticeDTO.getReg_date() %></td>
						<td> <%= noticeDTO.getHit() %></td>
						
						</tr> 
						
						
			<% } %>


			</table>
		</div>
		
				<!-- -------------------------------------------------------------- -->
		
		
		
		<div id="form_box">
		
		
		<form action="./notice_BackUp.jsp" id="serach">
		
			<select name="kind">
			
				<option value="t">제목</option>
				<option value="w">작성자</option>
				<option value="c">내용</option>
			
			</select>
			
			<input type="text" class="" name="search" value="<%=search%>">
			
			<button>Search</button>
		
		
		</form>
		
		
</div>
		
				<!-- -------------------------------------------------------------- -->
		
		
		<div>
		
		<% if(curBlock > 1) { %>
		
			<a href="./notice_BackUp.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a>
		
		
		<% } %>
		
		
		
		
		
				<% for(int i = startNum; i <= lastNum; i++) { %>
		
						<a href="./notice_BackUp.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a>
		
				<% } %>	
				
	
				
				
				
				
			<% if(curBlock < totalBlock) { %>		
				
				<a href="./notice_BackUp.jsp?curPage=<%= lastNum+1 %>&kind=<%=kind%>&search=<%=search%>">[다음]</a>
					
			<% } %>		
					
		</div>


		<!-- -------------------------------------------------------------- -->

		<div class="row">
			<a href="./noticeWrite.jsp" class="btn btn-primary">Write</a>

		</div>
		
			<!-- -------------------------------------------------------------- -->

</div>


		<!-- -------------------------------------------------------------- -->

<%@ include file="../temp/footer.jsp"%>




</body>
</html>