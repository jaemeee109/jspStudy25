<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>


<title>♡♥♡ Login ♡♥♡</title></head>

<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>
		<%! String greeting = "도서 쇼핑몰에 오신 것을 환영합니다";
			String tagline="Welcome to Web Market";%>
		
	
	
	<!-- 중간 타이틀 영역  -->

	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">로그인</h1>
			<p class="col-md-8 fs-4">Login</p>
	
		</div>
	</div>
	
	<!-- 본문 영역  -->
	<div class = "row align-items-md-stretch text-center">
	<div class = "row justify-content-center align-items-center">
		<div class="h-100 p-5 col-md-6">
			<h3>Please sign in</h3>
			
			<%
				String error = request.getParameter("error");
			
			%>
			</div>
		</div>
	</div>
	
	
	<!-- 바닥글 영역 -->
	<%@ include file ="footer.jsp" %>
	
	</div>
</body>

</html>