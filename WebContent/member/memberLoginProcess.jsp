<%@page import="javax.websocket.Session"%>
<%@page import="com.hyuna.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
    
    %>
    
    <jsp:useBean id="memberDTO" class="com.hyuna.member.MemberDTO" />
    <jsp:setProperty property="*" name="memberDTO" />
    
    <%
    
    MemberDAO memberDAO = new MemberDAO();
    
    memberDTO = memberDAO.memberLogin(memberDTO);
    
    
    if(memberDTO != null) {
    	
    	 session.setAttribute("member", memberDTO); //키는 우리 맘대로 만들기
   		 response.sendRedirect("../index.jsp");
   		 
    
    } else {
    	
   		 request.setAttribute("message", "Login Fail");
   		 request.setAttribute("path", "./memberLogin.jsp");
   		 
   		 RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
   	     view.forward(request, response);
    }
    
    
    %>
    
<%--      <jsp:forward page="../common/test/result.jsp"></jsp:forward>
 --%>     
     
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>