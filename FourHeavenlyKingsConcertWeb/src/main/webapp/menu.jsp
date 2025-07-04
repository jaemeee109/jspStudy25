<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <head>
   
	<title> 춘식티켓</title>
	
	<link rel="stylesheet" href="resources/css/index.css">
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
		<a href="menu.jsp"> 예매 </a>
		<span class="dropmenu">
		<span><a href="${pageContext.request.contextPath}/concert/concerts.jsp"> 콘서트 </a></span>
		<span><a href="#"> 연극/뮤지컬</a></span>
		<span><a href="#"> 영화 </a></span>
		</span>
		</li>
		
		<li class="dropBox">
		<a href="board.jsp"> 게시판</a>
		<span class="dropmenu">
		<span><a href="#">공지사항</a></span>
		<span><a href="#">직원전용 </a></span>
		<span><a href="#">후기</a></span>
		</span>
		</li>
		
		<li class="dropBox">
		<a href="store.jsp"> 매점 </a>
		<span class="dropmenu">
		<span><a href="#"> Food </a></span>
		<span><a href="#"> Drink </a></span>
		</span>
		</li>
		
		<li class="dropBox">
		<a href="faq.jsp"> 고객지원 </a>
		<span class="dropmenu">
		<span><a href="#">FAQ</a></span>
		<span><a href="../jsp/qna.jsp">문의게시판</a></span>
		</span>
		</li>
	</ul>
	
	<!-- 오른쪽 메뉴 -->
	
	<ul class ="rightMenu">
	<li><a href="join.jsp">회원가입</a></li>
	<li><a href="login.jsp">로그인</a></li>
	</ul>
	
	</div>
	</nav>
	
