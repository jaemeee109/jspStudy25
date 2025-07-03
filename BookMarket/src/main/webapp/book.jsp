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


<script type="text/javascript">
	function addToCart(){
		if(confirm("도서를 장바구니에 추가 하시겠습니까?")){
			document.addForm.submit();
		}else {
			document.addForm.reset();
		}
	}
</script>

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
		<%@ include file="dbconn.jsp"%>
		<%
			String bookId = request.getParameter("id");
		
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from book where b_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
		
		%>
		
	
		
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("b_filename") %>"
				style="width : 70%"/>
			</div>
			
			<div class = "col-md-6">
					<h3><b><%=rs.getString("b_name")%></b></h3>
					<p><%=rs.getString("b_description")%>%>
				<p>
					<b>도서코드 : </b><span class="badge text-bg-danger"> <%=rs.getString("b_id")%></span>
				<p>
					<b>저자</b> :
					<%=rs.getString("b_author")%>
				<p>
					<b>출판사</b> :
					<%=rs.getString("b_publisher")%>
				<p>
					<b>출판일</b> :
					<%=rs.getString("b_releaseDate")%>
				<p>
					<b>분류</b> :
					<%=rs.getString("b_category")%>
				<p>
					<b>재고수</b> :
					<%=rs.getString("b_unitsInStock")%>
					<h4><%=rs.getString("b_unitPrice")%>원
				</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_id") %>" method="post">
					<a href="#" class="btn btn-info" onclick ="addToCart()">도서주문 &raquo;</a>
					<a href="./cart.jsp" class ="btn btn-warning">장바구니 &raquo;</a>
					<a href="./books.jsp" class ="btn btn-secondary"> 도서목록 &raquo;</a>		
						</form>
			</div>
		</div>

			<%
		} // IF문 종료
		%>
	
	<!-- 바닥글 영역 -->
	<jsp:include page ="footer.jsp"/>
	</div>
	
</body>

</html>