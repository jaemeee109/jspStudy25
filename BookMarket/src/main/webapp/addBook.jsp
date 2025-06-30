<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>


<title>♡♥♡ 도서등록 ♡♥♡</title></head>

<body>


	<fmt:setLocale value = '<%=request.getParameter("language") %>'/>
	<fmt:bundle basename = "bundle.message">
	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>
		

	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold"><fmt:message key="title"/></h1>
			<p class="col-md-8 fs-4">Book Addition</p>
	
		</div>
	</div>
	
	<!-- 본문 영역  -->
	<div class = "row align-items-md-stretch ">
	<div class = "text-end">
		<a href = "?language=ko">Korean&nbsp;</a>|<a href="?language=en">&nbsp;English</a>
	</div>
		<form name="newBook" action ="./processAddBook.jsp" method="post" 
		enctype="multipart/form-data">

		<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="bookId"/></label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control">
				</div>
		</div>
	<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control">
				</div>
		</div>	
		
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="author"/></label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="publisher"/></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form=control" placeholder="100자 이상 적어주세요"></textarea>
					</div>
			</div>
			
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
			</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> <fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="Old"> <fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="EBook"> <fmt:message key="condition_Ebook"/>
				</div>
		</div>
		<div class="col-mb-3 row">
			<label class="col-sm-2"><fmt:message key="BookImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="BookImage" class ="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="<fmt:message key="button"/>" onclick = "checkAddBook()">
				</div>
		</div>
		</form>
		</div>
			<!-- 바닥글 영역 -->
	<jsp:include page ="footer.jsp" />
	</div>	
	</fmt:bundle>
</body>

</html>