<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try {
		String URL = "jdbc:mysql://192.168.111.102:3306/concerttestdb?serverTimezone=UTC";
		String USER = "concert";
		String PASSWORD = "1234";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
	} catch (Exception e) {
		out.println("DB 연결 실패: " + e.getMessage());
	}
%>
