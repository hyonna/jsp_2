<%@page import="com.hyuna.member.MemberDTO"%>
<%@page import="com.hyuna.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
    
    %>
    
     <!-- Bean = 자바객체 -->
   <!-- (com.hyuna.member.MemberDTO) == (MemberDTO memberDTO = new MemberDTO()) -->
   <jsp:useBean id="memberDTO" class="com.hyuna.member.MemberDTO" scope="page" />
   <jsp:setProperty property="*" name="memberDTO" />
   <!-- property에 * 은 모든 값을 의미함 -->
   
   
   
   <%-- <jsp:setProperty property="id" name="memberDTO" />
   <jsp:setProperty property="pw" name="memberDTO" />
   <jsp:setProperty property="name" name="memberDTO" />
   <jsp:setProperty property="phone" name="memberDTO" />
   <jsp:setProperty property="email" name="memberDTO" />
   <jsp:setProperty property="age" name="memberDTO"/> --%>
   
    
    <%

    MemberDAO memberDAO = new MemberDAO();
/*  MemberDTO memberDTO = new MemberDTO() */
    
   /*  memberDTO.setId(request.getParameter("id"));
    memberDTO.setPw(request.getParameter("pw"));
    memberDTO.setName(request.getParameter("name"));
    memberDTO.setPhone(request.getParameter("phone"));
    memberDTO.setEmail(request.getParameter("email"));
    memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
     */
    
    int result = memberDAO.memberJoin(memberDTO);
    
    String msg = "Join Fail";
    
    if(result > 0) {
    	
    	msg = "Join Sucess";
    }
    
    
    request.setAttribute("message", msg);
    request.setAttribute("path", "../index.jsp");
    
  /*   RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
    view.forward(request, response); */
    
    
        
    %>
   
   <!--  위 포워드 코드와 동일 단, 자바 코드 밑에서 jsp 액션 코드로 입력해야함 -->
    <jsp:forward page="../common/test/result.jsp"></jsp:forward>
    
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>

<script type="text/javascript">


alert('<%= msg %>');
location.href="./memberMyPage.jsp";



</script>
</head>
<body>

<h1>Member Join Process Page</h1>

</body>
</html>