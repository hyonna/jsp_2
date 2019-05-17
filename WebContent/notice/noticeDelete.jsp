<%@page import="com.hyuna.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%
         
        request.setCharacterEncoding("UTF-8");
     	response.setCharacterEncoding("UTF-8");

 		int num = Integer.parseInt(request.getParameter("num"));
	
   	 	NoticeDAO noticeDAO = new NoticeDAO();
 	
 		int result = noticeDAO.delete(num);
	
		String msg = "Delete Fail";
	
		if(result > 0) {
		
		msg = "Delete Success";
		
		}
	
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>

<title>Insert title here</title>
<script type="text/javascript">


alert('<%= msg %>');
location.href="./noticeList.jsp";



</script>
</head>


<h1>Notice Delete Process</h1>

<body>

<%@ include file="../temp/header_nav.jsp"%>




<%@ include file="../temp/footer.jsp"%>

</body>
</html>