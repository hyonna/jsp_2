<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
	int num = Integer.parseInt(request.getParameter("num"));

	//1. 4가지 정보

	String user = "user03";
	String password = "user03";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String driver = "oracle.jdbc.driver.OracleDriver";

	//2. driver 메모리에 로딩

	Class.forName(driver);

	//3. 로그인 Connection

	Connection con = DriverManager.getConnection(url, user, password);

	//4. SQL문 생성

	String sql = "select * from point where num=?";

	//5. 미리 전송
	PreparedStatement st = con.prepareStatement(sql);
	st.setInt(1, num);

	//6. 최종 전송 후 처리
	ResultSet rs = st.executeQuery(); 
 
 	rs.next();
 	
 	%>
    
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
  <form action="./pointUpdateProcess.jsp">
  
  
  	
      <input type="hidden" class="form-control i1" id="num" name="num" value="<%=rs.getString("num")%>">
    
 
  
    <div class="form-group f1">
      <label for="name">이름</label>
      <input type="text" class="form-control i1" id="name" name="name" value="<%=rs.getString("name")%>">
    </div>
    
    <div class="form-group f1">
      <label for="kor">국어</label>
      <input type="text" class="form-control i1" id="kor" name="kor" value="<%=rs.getString("kor")%>">
    </div>
    
    <div class="form-group f1">
      <label for="eng">영어</label>
      <input type="text" class="form-control i1" id="eng" name="eng" value="<%=rs.getString("eng")%>">
    </div>
    
    <div class="form-group f1">
      <label for="math">수학</label>
      <input type="text" class="form-control i1" id="math" name="math" value="<%=rs.getString("math")%>">
    </div>
    
  <% 
  
	rs.close();
	st.close();
	con.close(); 
	
	%>
    
   		 <button type="submit" class="btn btn-danger row1">Update</button>
   		 
   		
    
  </form>
  
   		 
</div>

<%@ include file="../temp/footer.jsp"%>

</body>
</html>