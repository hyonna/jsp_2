<%@page import="com.hyuna.point.PointDTO"%>
<%@page import="com.hyuna.point.PointDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	PointDTO pointDTO = new PointDTO();

	pointDTO.setNum(Integer.parseInt(request.getParameter("num")));
	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setTotal(pointDTO.getKor() + pointDTO.getEng() + pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getTotal() / 3.0);
	
	PointDAO pointDAO = new PointDAO();
	int result = pointDAO.update(pointDTO);
	
	
	
	if(result > 0) {
		
		String msg = "Update Success";
		request.setAttribute("message", msg);
		request.setAttribute("path", "./point.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/test/result.jsp");
		view.forward(request, response);
		
		
	} else {
		
		
		response.sendRedirect("./pointUpdate.jsp?num="+pointDTO.getNum());
		
	}

	
	
	
	//수정이 성공하면 성공메세지를 alert으로 하고 point.jsp로 이동
	//수정이 실패하면 pointUpdate.jsp로 리다이렉트로 이동
	
	
%>
