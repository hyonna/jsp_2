<%@page import="com.hyuna.member.MemberDTO"%>
<%@page import="com.hyuna.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	  
    
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>
<style type="text/css">
.main {
	
	max-width: 400px;
	line-height: 15px;
	margin: 70px auto;
}

</style>

</head>
<body>
<%@ include file="../temp/header_nav.jsp"%>

<div class="container main">

		  <h2>Join form</h2>
  <form action="./memberJoinProcess.jsp" name="join" id="formBox" method="post">
  
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text"  class="form-control" id="id" placeholder="10자 미만" name="id">
      <input type="hidden" id="idc" value="1">
      <input type="button" class="btn btn-primary" value="중복확인" id="idOk" style="margin-top: 5px;"><!--  중복확인 누르면 팝업창 뜨면서 아이디 입력하고 확인 버튼 누르면 창 꺼짐 / value값에 입력한 아이디 입력되어짐 / 중복확인 했다 라는 표시를 어딘가에는 해놔야함 -->
    </div>
    
    <div id="idChk">
    
    </div>
    
	<!-- 비밀번호 입력란 start -->
    
    
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" placeholder="6자 이상" name="pw">
    </div>
    
     <div class="form-group">
      <label for="pw2">Password:</label>
      <input type="password" class="form-control" id="pw2" placeholder="둘다 일치" name="pw2">
    </div>
    
   <div id="pwdChk">
   
   </div>
    
   
    
    
    <!-- 비밀번호 입력란 end -->
    
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    
     <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    
     <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
    </div>
    
    <div class="form-group">
      <label for="age">Age:</label>
      <input type="text" class="form-control" id="age" placeholder="Enter age" name="age">
    </div>
    
    
    <input type="submit" class="btn btn-primary" value="Join" id="btnJoin"> <!-- 모두 비어있으면 버튼 X -->
  </form>
		


</div>
<%@ include file="../temp/footer.jsp"%>

<script type="text/javascript">
  
  $(function() {
	  
	  
	  
	  
	  $('#idOk').click(function() {
		
		  open("../jquery/jquery7-1.html","_blank","top=200, left=200, width=300, height=250");
		  
	});
	  
	  
	 /*  아이디 중복확인 */
	  
	  $('#id').on('keyup', function() {
		  
		  if($('#id').val() == '') {
			  
			  $('#idChk').html('<p id="idOver" style="color:red; font-weight:700; margin:20px 0;">아이디 중복확인 해야함</p>');
		  }
		
	});
	  
	  
	 /* 
	  $('#id').change(function() {
		  
		  $('#idc').val('0');
		
	});
	   */
	  
		  
	  
	 /*  입력란이 전부 null일때 */
	 
	 $('#btnJoin').click(function() {
		 
		 	var result = true;
		 
		 $('.form-control').each(function() {
			
			 if($(this).prop('value') == '') {
				 
				 result = false;
				 
			 }
				
		});
		 
		 if(result && $('#idc').val() == '1') {
			 
			 $('#formBox').submit();
			 
		 } else {
			 
			 $('#idChk').html('<p id="idOver" style="color:red; font-weight:700; margin:20px 0;">아이디 중복확인 해야함</p>');
			 alert("모두 입력하세요");
		 }
		  
		 
	});
	 

	
	
	 $('#pw').on('keyup', function() {
		 
		  if($(this).val().length > 6) {
			  
			  $(this).val($(this).val().substring(0, 6));
			  $('#pwdChk').html('<p id="pwOver" style="color:red; font-weight:700; margin:20px 0;">비밀번호 6자 미만 가능</p>');
			  
			  
		  }
	});
	 
	 $('#pw2').on('keyup', function() {
		 
		 
		 if($('#pw').val() == $('#pw2').val()) {
			 
			 $('#pwdChk').html('<p id="pwChk" style="color:blue; font-weight:700; margin:20px 0;">비밀번호 일치</p>');
			 
		 } else {
			 
			 $('#pwdChk').html('<p id="pwNot"style="color:red; font-weight:700; margin:20px 0;">비밀번호가 일치하지 않습니다.</p>');
			 
		 }
		
	})
	 
	 
	 
   
  });
  
  
  
  
  </script>
  

</body>
</html>