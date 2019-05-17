<%@page import="com.hyuna.notice.NoticeDTO"%>
<%@page import="com.hyuna.notice.NoticeDAO"%>
<%@page import="com.hyuna.point.PointDTO"%>
<%@page import="com.hyuna.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    NoticeDTO noticeDTO = new NoticeDTO();
    
    noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
    noticeDTO.setTitle((request.getParameter("title")));
    noticeDTO.setContents((request.getParameter("contents")));
    noticeDTO.setName((request.getParameter("name")));
    
    
    NoticeDAO noticeDAO = new NoticeDAO();
    
    int result = noticeDAO.update(noticeDTO);
    
    String msg = "update Fail";
    
    if(result > 0) {
    	
    	msg = "update Sucess";
    	
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

<h1>notice Update Process</h1>


<%@ include file="../temp/footer.jsp"%>

</body>
</html>