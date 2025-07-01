<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import= "dto.Book" %>
<%@ page import= "dao.BookRepository" %>
<%@ page errorPage ="exceptionNoBookId.jsp" %>
<jsp:useBean id="bookDAO" class ="dao.BookRepository" scope="session"/>

<!DOCTYPE html><html><head><meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>

<title>♡♥♡ 도서정보 ♡♥♡ </title></head>

<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>

	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서정보</h1>
			<p class="col-md-8 fs-4">BookInfo</p>
		</div>
	</div>
		
		<%
			String id = request.getParameter("id");
			BookRepository dao = BookRepository.getInstance();
			Book book = dao.getBookById(id);
		
		%>
		
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./resources/images/<%=book.getFilename() %>"
				style="width : 70%"/>
			</div>
			
			<div class = "col-md-6">
					<h3><b><%=book.getName() %></b></h3>
					<P><%=book.getDescription() %>
					<p><b>도서코드:</b><span class="badge text-bg-danger">
						<%=book.getBookId() %></span>
					<p><b>저자</b> : <%=book.getAuthor() %>
					<p><b>출판사</b> : <%=book.getPublisher() %>
					<p><b>출판일</b> : <%=book.getReleaseDate() %>
					<p><b>분류</b> : <%=book.getCategory() %>
					<p><b>재고수</b> : <%=book.getUnitInStock() %>
					<h4><%=book.getUnitPrice() %>원</h4>
					<p><a href="#" class="btn btn-info">도서주문 &raquo;</a>
					<a href="./books.jsp" class ="btn btn-secondary"> 도서목록 &raquo;</a>		
			</div>
		</div>

			
	
	<!-- 바닥글 영역 -->
	<jsp:include page ="footer.jsp"/>
	</div>
	
</body>

</html>