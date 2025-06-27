<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import= "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%-- <jsp:useBean id="bookDAO" class ="dao.BookRepository" scope="session"/>
 --%>
<!DOCTYPE html><html><head><meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet"><!-- cdn이 아닌 로컬에 저장된 css  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>


<title>♡♥♡ 도서목록 ♡♥♡ </title></head>

<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>

	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서목록</h1>
			<p class="col-md-8 fs-4">BookList</p>
		</div>
	</div>
		
		<%
			BookRepository dao = BookRepository.getInstance();
			ArrayList<Book> listOfBooks= dao.getAllBooks();
			/* 테스트용 코드
			System.out.println(listOfBooks.get(0));
			System.out.println(listOfBooks.get(1));
			System.out.println(listOfBooks.get(2));
			System.out.println(listOfBooks.get(3)); */
			
			
		%>
		
		<div class="row align-items-md-stretch text-center">
		
		<%
			for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
		
		%>
			
				<div class="col-md-4">
					<div class="h-100 p-2">
						<img src="./resources/images/<%= book.getFilename()%>" style="width:200px; height:300px"/>

							<h5><b><%= book.getName()%></b></h5>
							<p><%=book.getAuthor() %></p>
							<br><%=book.getPublisher() %>|<%=book.getReleaseDate() %>
							<p><%=book.getDescription().substring(0,100) %>...</p>
							<p><%=book.getUnitPrice() %>원</p>
							<p><a href="./book.jsp?id=<%=book.getBookId() %>"
								class ="btn btn-secondary" role="button">상세정보 &raquo;></a>
					</div>
				</div>
		<%
			} // for종료
		%>
			
	
	<!-- 바닥글 영역 -->
	<%@ include file ="footer.jsp" %>
	
	</div>
</body>

</html>