<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../temp/css_meta.jsp"%>
<title>Insert title here</title>
<style type="text/css">
.main {
	
	max-width: 400px;
	line-height: 15px;
	margin-top: 70px;
	margin-bottom: 500px;
}

.main>h2 {

text-align: center;
margin-bottom: 20px;
}

</style>

</head>
<body>
<%@ include file="../temp/header_nav.jsp"%>
<div class="container main">

<h2>Login</h2>
  <form action="./memberLoginProcess.jsp" name="Login" id="formBox" method="post">
  
   <div class="form-group">
      <label for="id">id:</label>
      <input type="text" class="form-control" id="id" name="id">
    </div>
    
     <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" name="pw">
    </div>
    
    <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
 	 </div>
    
    <input type="submit" class="btn btn-primary" value="Login" id="btnLogin">
    
    </form>

</div>
<%@ include file="../temp/footer.jsp"%>

</body>
</html>