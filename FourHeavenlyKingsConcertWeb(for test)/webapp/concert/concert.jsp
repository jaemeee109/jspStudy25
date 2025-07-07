<%@page import="dto.Concert"%>
<%@page import="dao.ConcertRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoConcertId.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chiron+Hei+HK:ital,wght@0,200..900;1,200..900&display=swap" rel="stylesheet">

<jsp:useBean id="concertDAO" class="dao.ConcertRepository" scope="session" />




<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/info.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">







<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
	
<script type="text/javascript">
	function addToCart(){
		if(confirm("이 티켓을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else {
			document.addForm.reset();
		}
	}
</script>

<title>공연 상세 페이지</title>
</head>
<body>

<%@ include file="../menu.jsp" %>

	<div class="container py-4">


		
		 <%
		
			//DAO, DTO 처리 
			String id = request.getParameter("id"); 
			// url로 넘어온 id 값을 변수에 넣음
			
			 if (id == null || id.trim().isEmpty()) {
		        response.sendRedirect("exceptionNoConcertId.jsp");
		        return;
   				 }
			ConcertRepository dao = ConcertRepository.getInstance(); 
			
			Concert concert = dao.getConcertById(id); 
			
			 if (concert == null) {
		        response.sendRedirect("exceptionNoConcertId.jsp");
		        return;
			 }
		%> 
		<div class="container py-4">
				<h2><b><%=concert.getC_name()%></b></h2>
				
				
				
		 <div class="concert-detail-row">
	        <!-- 왼쪽  -->
	        <div class="concert-img-box">
		 		<img src="../resources/images/<%=concert.getC_filename() %>"alt ="공연이미지"/>
		 	</div>
		 	
		 	<!-- 오른쪽  -->
		 	<div class="concert-info-box">
		 	
		 	<p><b>공연일</b> : <%=concert.getC_releaseDate()%></p>
		 	
		 	<p><b>공연번호 : </b><span class="badge text-bg-danger"> <%=concert.getC_Id()%></span>							
				<p><b>출연진</b> : <%=concert.getC_artist()%>	
				<p><b>공연사</b> : <%=concert.getC_publisher()%>						
				<p><b>잔여좌석</b> : <%=concert.getC_unitsInStock()%>
		 		<p><b>가격</b> : <%=concert.getC_unitPrice()%>원
		 		<p><%=concert.getC_description()%></p>
		 		
		 	<form name="addForm" action="../cartAddAction.do" method="post">
			    <input type="hidden" name="id" value="${sessionScope.sessionId}"/>
			    <input type="hidden" name="c_id" value="<%=concert.getC_Id()%>"/>
			    <input type="hidden" name="count" value="1"/>
			    <button type="submit" class="btn btn-info">예매하기&raquo;</button>
			    <a href="./concerts.jsp" class="btn btn-secondary">공연목록 &raquo;</a>
			</form>

					</div>
					</div>
		 	
	     	<!-- 본문 -->
				<div class="concert-extra-info">
				
				
				<p>
				
					
					
	    	</div>   
	   	</div>
	   	
	
	

<%@ include file="../footer.jsp" %>
</body>
</html>