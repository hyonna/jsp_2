<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>

<title>Insert title here</title>

<style type="text/css">
  
  .f1 {
  
  	width: 500px;
  	margin: 15px auto;
  	
  
  }
  
  #contents{
  
  	height: 300px;
  
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
</head>


<body>

<%@ include file="../temp/header_nav.jsp"%>

<div class="container c1">
  <h1>공지사항 작성</h1>
  <form action="./noticeWriteProcess.jsp" method="post">
  
    <div class="form-group f1">
      <label for="title">제목</label>
      <input type="text" class="form-control i1" id="title" name="title">
    </div>
    
    <div class="form-group f1 f2">
      <label for="contents">내용</label>
      <textarea class="form-control i1" id="contents" name="contents"></textarea>
    </div>
    
    <div class="form-group f1">
      <label for="name">작성자</label>
      <input type="text" class="form-control i1" id="name" name="name">
    </div>
    
   
    
   		 <button type="submit" class="btn btn-danger row1">Write</button>
    
  </form>
  
   		 
</div>



<%@ include file="../temp/footer.jsp"%>

</body>
</html>