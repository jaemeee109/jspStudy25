<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String year=request.getParameter("birthyy");
	String month=request.getParameter("birthmm");
	String day=request.getParameter("birthdd");
	String birth=year + "/ " + month +" / " + day;
	String mail1=request.getParameter("mail1");
	String mail2=request.getParameter("mail2");
	String mail=mail1 + "@" + mail2;
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String registyear=request.getParameter("registyy");
	String registmonth=request.getParameter("registmm");
	String registday=request.getParameter("registdd");
	String regist_day=registyear + "/ " + registmonth +" / " + registday;

	PreparedStatement pstmt = null;	
	
	String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, mail);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
	pstmt.setString(9, regist_day);	
	pstmt.executeUpdate();
	
	if (pstmt != null) pstmt.close();
	if (conn != null)
		conn.close();

	session.setAttribute("sessionId", id); 
	response.sendRedirect("resultMember.jsp?msg=1");

%>