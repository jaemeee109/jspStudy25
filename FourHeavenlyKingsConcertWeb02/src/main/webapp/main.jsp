<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvc.model.cartDTO"%>
<%@ page import="mvc.model.cartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
  <meta charset="UTF-8">
    <title>춘식극장</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css" />
</head>
 
	
	
<body>
	<!-- 상단  -->
	 <%@ include file="../menu.jsp" %>

	
	
			<!-- 레이아웃 섹션 1  -->
	
			<section id="section1">
			  <div class="container">
			    <div class="imgBox">
			      <img src="<c:url value='resources/images/images01.jpg' />" alt="콘서트예시" /> 
			    </div>
			  </div>
			</section>
			
			
	
	<!-- 하단 -->
	 <%@ include file="../footer.jsp" %>
</body>
</html>