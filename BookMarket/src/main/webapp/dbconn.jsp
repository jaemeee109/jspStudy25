
<%@ page import="java.sql.*" %>

<%
	Connection conn=null;

	try {
		String url ="jdbc:mysql://192.168.111.102:3306/BookMarket";
		String user="bookmarket";
		String password="1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,password);
		
	}catch (SQLException ex){
		out.println ("데이터베이스 연결이 실패 했습니다 <br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>