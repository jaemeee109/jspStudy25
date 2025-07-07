<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>    
    <head>
   
	<title> 춘식티켓</title>
	
	<div id= "header">
	<div id = "container">
	<h1 class="black-han-sans-regular">CHUNSIK's TiCkEt ! </h1>
	<h4> ~ Enjoy Your Life ~ </h4>
	</div>
	
	<!-- h1폰트코드  -->
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" 
	rel="stylesheet"> 
	
	<!-- h4폰트코드  -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
	
	
	</head>
	
<body>
	<!-- 네비게이션 바 -->
	<nav>
	<!-- 왼쪽메뉴 -->
	<div class="container">
	<ul class="leftMenu">
	
	<li class="dropBox">
	<a href="${pageContext.request.contextPath}/main.jsp"> HOME </a>
		<span class="dropmenu">
		<span><a href="#">소개</a></span>
		<span><a href="#">오시는길</a></span>
		</span>
		</li>
		
		
		<li class="dropBox">
		<a href="#"> 예매 </a>
		<span class="dropmenu">
		<span><a href="${pageContext.request.contextPath}/concert/concerts.jsp"> 콘서트 </a></span>
		<span><a href="#"> 연극/뮤지컬</a></span>
		<span><a href="#"> 영화 </a></span>
		</span>
		</li>
		
		<li class="dropBox">
		<a href="#"> 게시판</a>
		<span class="dropmenu">
		<span><a href="#">공지사항</a></span>
		<span><a href="#">직원전용 </a></span>
		<span><a href="#">후기</a></span>
		</span>
		</li>
		
		<li class="dropBox">
		<a href="#"> 기프트샵 </a>
		<span class="dropmenu">
		<span><a href="#"> 기프트카드 </a></span>
		<span><a href="#"> 굿즈 </a></span>
		</span>
		</li>
		
		<li class="dropBox">
		<a href="#"> 고객지원 </a>
		<span class="dropmenu">
		<span><a href="#">FAQ</a></span>
		<span><a href="../jsp/qna.jsp">문의게시판</a></span>
		</span>
		</li>
	</ul>
	
	<!-- 오른쪽 메뉴 -->
	
	<ul class ="rightMenu">
	<c:choose>
	<c:when test="${empty sessionId}">
		<li><a href="<c:url value='/member/addMember.jsp'/>">회원가입</a></li>
		<li><a href="<c:url value='/member/loginMember.jsp'/>">로그인</a></li>

	</c:when>
	<c:otherwise>
	<li class="username">
  		<a href="${pageContext.request.contextPath}/member/updateMember.jsp"><%=sessionId%>님</a>
	</li>


		</li>
		
		<li><a href="${pageContext.request.contextPath}/cartListAction.do">장바구니</a></li>
		<li><a href="<c:url value='/member/logoutMember.jsp'/>">로그아웃 </a></li>
		<%-- <li><a href="<c:url value='/member/updateMember.jsp'/>">회원 수정</a></li> --%>
	</c:otherwise>
	</c:choose>
	</ul>
	
	</div>
	</nav>
	
