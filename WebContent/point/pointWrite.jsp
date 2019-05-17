<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

   
  <%@ include file="../temp/css_meta.jsp"%>
  
  <style type="text/css">
  
  .f1 {
  
  	width: 300px;
  	margin: 0 auto;
  
  }
  
  .c1 {
  
  	margin: 0 auto;
  	height: 800px;
  	padding-top: 30px;
  	font-size: 0.9em;
  
  }
  
  .c1>h1 {
  
  text-align: center;
  letter-spacing: -3px;
  font-weight: 700;
  margin-bottom: 40px;
  font-size: 2em;
 
  
  }
  
  .row1 {
  
  	display: block;
  	text-align: center;
  	margin: 30px auto;
  
  
  }
  
  </style>
<title>Insert title here</title>
</head>
<body>

<%@ include file="../temp/header_nav.jsp"%>

<div class="container c1">
  <h1>포인트 입력</h1>
  <form action="./pointWriteProcess.jsp">
  
    <div class="form-group f1">
      <label for="name">이름</label>
      <input type="text" class="form-control i1" id="name" name="name">
    </div>
    
    <div class="form-group f1">
      <label for="kor">국어</label>
      <input type="text" class="form-control i1" id="kor" name="kor">
    </div>
    
    <div class="form-group f1">
      <label for="eng">영어</label>
      <input type="text" class="form-control i1" id="eng" name="eng">
    </div>
    
    <div class="form-group f1">
      <label for="math">수학</label>
      <input type="text" class="form-control i1" id="math" name="math">
    </div>
    
   		 <button type="submit" class="btn btn-danger row1">Write</button>
    
  </form>
  
   		 
</div>

<%@ include file="../temp/footer.jsp"%>

</body>
</html>