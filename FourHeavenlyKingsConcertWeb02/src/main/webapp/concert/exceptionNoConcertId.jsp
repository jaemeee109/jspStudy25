<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>찾는 공연 정보가 존재하지 않습니다.</title></head><body>

	<div class="container py-4">
				
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
				<h1 class="display-5 fw-bold">해당 공연이 존재하지 않습니다.</h1>
				<p class="col-md-8 fs-4">NoConcertId</p>
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		
		 <div class="row align-items-md-stretch   text-center">
	     	<div class="col-md-12">
				<div class="h-100 p-5">
			  		<p> <%=request.getRequestURL() %>?<%=request.getQueryString() %>
			  		<!-- http://192.168.111.101:8080  ?  bookId=ISBN???????? -->
			  		<p> <a href="concerts.jsp" class="btn btn-secondary"> 공연목록 &raquo;</a>
			  		<!-- 도서목록페이지로 이동!!! -->         
		        </div>
	    	</div>   
	   	</div> <!-- 본문영역 : 중간 box --> 


</body>
</html>