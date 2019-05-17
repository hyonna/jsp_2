<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// 세션을 null로 만드는 방법
   		//session.setAttribute("member", null);
    
    	//session.removeAttribute("member"); //멤버라는애와 그 안에 값들을 다 지움
    
    	//session.removeValue("member"); //속성은 남겨두고 속성값만 지움
    	
    	session.invalidate(); //세션의 시간을 0으로 만듬
    	response.sendRedirect("../index.jsp");
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>