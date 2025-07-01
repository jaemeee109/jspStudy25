<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>


<title>※ 페이지 오류 ※</title>
</head>

<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<jsp:include page = "menu.jsp"/>
			<div class ="jumbotron">
				<div class="container">
					<h2 class ="alert alert-danger">요청하신 페이지를 찾을 수 없습니다</h2>
				</div>
			</div>
		<div class = "container">
		<p><%=request.getRequestURL() %></p>
		<p><a href="books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>
		
		</div>
		
	

</body>

</html>