<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>


<title>♡♥♡ 도서편집 ♡♥♡</title></head>
	<script type = "text/javascript">
		function deleteConfirm(id){
			if (confirm("해당 도서를 삭제합니다")==ture)
				location.href="./deleteBook.jsp?id=" + id;
			else
				return;
		}
	</script>
	<%
		String edit = request.getParameter("edit");
	%>
<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>
		
	
	
	<!-- 중간 타이틀 영역  -->

	
	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서 편집</h1>
			<p class="col-md-8 fs-4">BookEditing</p>
	
		</div>
	</div>
		<%@ include file = "dbconn.jsp" %>
	<!-- 본문 영역  -->
	<div class = "row align-items-md-stretch text-center">
		<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from book";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		
		%>
		
		<div class="col-md-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("b_filename")%>" style="width: 200px; height:300px" />	
				<p><h5><b><%=rs.getString("b_name")%></b></h5>
				<p><%=rs.getString("b_author")%>
				<br> <%=rs.getString("b_publisher")%> | <%=rs.getString("b_unitPrice")%>원
				<p> <%=rs.getString("b_description").substring(0,60)%>....
				<p><%=rs.getString("b_unitPrice")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateBook.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
					
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>	
			</div>	
		</div>			
					<%
					}
					
					
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			
			%>
		
		
	</div>
	
	
	<!-- 바닥글 영역 -->
	<%@ include file ="footer.jsp" %>
	
	</div>
</body>

</html>