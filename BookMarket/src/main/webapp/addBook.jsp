<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<!--  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
 -->

<title>♡♥♡ 도서등록 ♡♥♡</title></head>

<body>

	<!-- 상단 : 메뉴영역  -->
	<div class = "container py-4">
		<%@ include file = "menu.jsp" %>
		

	<div class = "p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서등록</h1>
			<p class="col-md-8 fs-4">Book Addition</p>
	
		</div>
	</div>
	
	<!-- 본문 영역  -->
	<div class = "row align-items-md-stretch ">
		<form name="newBook" action ="./processAddBook.jsp" class ="form-horizontal" 
		method="post" enctype="multipart/form-data">

		<div class="col-mb-3 row">
			<label class="col-sm-2">도서코드</label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control">
				</div>
		</div>
	<div class="col-mb-3 row">
			<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control">
				</div>
		</div>	
		
			<div class="col-mb-3 row">
			<label class="col-sm-2">저자</label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2">출판일</label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form=control" placeholder="100자 이상 적어주세요"></textarea>
					</div>
			</div>
			
			<div class="col-mb-3 row">
			<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
			</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2">재고</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> 신규도서
					<input type="radio" name="condition" value="Old"> 중고도서
					<input type="radio" name="condition" value="EBook"> E-Book
				</div>
		</div>
		<div class="col-mb-3 row">
			<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="BookImage" class ="form-control">
				</div>
		</div>
			<div class="col-mb-3 row">
			<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
		</div>
		</form>
		</div>
			<!-- 바닥글 영역 -->
	<jsp:include page ="footer.jsp" />
	</div>	
</body>

</html>