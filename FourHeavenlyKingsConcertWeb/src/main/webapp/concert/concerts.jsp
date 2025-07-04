<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ include file="dbconn.jsp" %>
<link rel="stylesheet" href="../concert/css/concert.css" />
<link rel="stylesheet" href="../resources/css/index.css" />

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title> Concert 예매 </title>
</head>	
<body>
<%@ include file="../menu.jsp" %>
<div class="container py-4">	
   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"> CONCERT </h1>   
      </div>
   </div>

<%
	if (conn == null) {
		out.println("DB 연결 실패  (conn=null)");
		return;
	}
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		String sql = "SELECT * FROM concert";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>

<div class="row align-items-md-stretch text-center">
	<div class="concert-list">
<%
		while (rs.next()) {
%>
		<div class="concert-item">
		<img src="../resources/images/<%=rs.getString("c_filename")%>" alt="공연 이미지" />
		<h5><b><%=rs.getString("c_name")%></b></h5>
		<p><%=rs.getString("c_artist")%></p>
		<p><%=rs.getString("c_publisher")%> | <%=rs.getString("c_unitPrice")%>원</p>
		<p><%=rs.getString("c_description").substring(0,20)%>...</p>
		<form action="${pageContext.request.contextPath}/cartAddAction.do" method="post">
		    <input type="hidden" name="id" value="${sessionScope.id}" />
		    <input type="hidden" name="c_id" value="<%= rs.getString("c_id") %>" />
		    <input type="hidden" name="count" value="1" />
		    <button type="submit" class="detail-btn">예매하기 &raquo;</button>
		</form>
		<!-- 예매하기 누르면 장바구니 추가 -->
	</div>
<%
		} // while 끝
%>
</div> <!-- row 끝 -->

<%
	} catch (Exception e) {
		out.println("쿼리 실행 중 오류 : " + e.getMessage());
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>

<%@ include file="../footer.jsp" %>

</body>
</html>
