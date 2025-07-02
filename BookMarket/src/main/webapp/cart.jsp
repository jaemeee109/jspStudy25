<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="dto.Book"%>
<%@ page import ="dao.BookRepository"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>

<% String cartId = session.getId(); %>

<title>♡♥♡ 장바구니 ♡♥♡</title></head>

<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>
		
	
	
	<!-- 중간 타이틀 영역  -->

	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">장바구니</h1>
			<p class="col-md-8 fs-4">Cart</p>
	
		</div>
	</div>
	
	<!-- 본문 영역  -->
	<div class = "row align-items-md-stretch">
		<div class="row">
			<table width="100%">
			<tr>
			<td align = "left"><a href="./deleteCart.jsp?"cartId=<%=cartId %>" class = "btn btn-danger"> 삭제하기</a></td>
			<td align = "right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class ="btn btn-success">주문하기</a></td>

			</tr>			
			</table>
		</div>
		<div style = "padding-top: 50px">
		<table class = "table table-hover">
			<tr>
				<th>도서</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>	
			
			<%
				int sum = 0;
				ArrayList<Book> cartList=(ArrayList<Book>) session.getAttribute("cartlist");
				
				if (cartList==null)
					cartList = new ArrayList<Book>();
				for (int i = 0; i < cartList.size(); i++){//상품 리스트 하나씩 출력
					Book book = cartList.get(i);
					int total = book.getUnitPrice()*book.getQuantity();
					sum=sum+total;
					
			%>
			
			<tr>
			<td><%=book.getBookId() %>-<%=book.getName() %></td>
			<td><%=book.getUnitPrice() %></td>
			<td><%=book.getQuantity()%></td>
			<td><%=total %></td>
			<td><a href="./removeCart.jsp?id=<%=book.getBookId() %>" class="badge text-bg-danger">삭제</a></td>
			</tr>
		
		
			<%
				} // for종료
			%>
			
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum %></th>
				<th></th>
			</tr>
		</table>
		<a href="./books.jsp" class= "btn btn-secondary">&raquo; 쇼핑 계속하기</a>
	</div>
	</div>
	
	
	
	<!-- 바닥글 영역 -->
	<jsp:include page ="footer.jsp"></jsp:include>
	
	</div>
</body>

</html>