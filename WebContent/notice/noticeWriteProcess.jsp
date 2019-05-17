<%@page import="java.sql.Date"%>
<%@page import="com.hyuna.notice.NoticeDTO"%>
<%@page import="com.hyuna.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    
    NoticeDAO noticeDAO = new NoticeDAO();
    NoticeDTO noticeDTO = new NoticeDTO();
    
    noticeDTO.setTitle(request.getParameter("title"));
    noticeDTO.setContents(request.getParameter("contents"));
    noticeDTO.setName(request.getParameter("name"));
    
    int result = noticeDAO.insert(noticeDTO);
    
    String msg = "insert Fail";
    
    if(result > 0) {
    	
    	msg = "insert Sucess";
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


<body>

<%@ include file="../temp/header_nav.jsp"%>

<h1>Notice Write Process Page</h1>


<%@ include file="../temp/footer.jsp"%>

</body>
</html>