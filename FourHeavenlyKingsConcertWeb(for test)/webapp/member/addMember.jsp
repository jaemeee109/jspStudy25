<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html><html>
<head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/join.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css" />
<%@ include file="../dbconn.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">


	function checkForm() {
		
		if(!document.newMember.id.value){
			alert("아이디를 입력하세요")
			return false;
		}
		
		if(!document.newMember.password.value){
			alert("비밀번호를 입력하세요")
			return false;
		}
		
		if(document.newMember.password.value != document.newMember.password_confirm.value){
			alert("비밀번호를 동일하게 입력하세요")
			return false;
		}
	}
</script>

<title>회원 가입 페이지</title>
</head>
<body>
	<div class="container py-4">
	<%@include file="../menu.jsp" %>
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">회원 가입</h1>
				<p class="col-md-8 fs-4">Membership Joining</p>
			</div>
		</div>
		
		 <div class="row align-items-md-stretch   text-center">
		 <form  name="newMember" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
					<div class="col-sm-5">
						<input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-5">
						<input type="text" name="password" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-5">
						<input type="text" name="password_confirm" class="form-control" placeholder="비밀번호를 한번 더 입력하세요">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">성명</label>
					<div class="col-sm-5">
						<input type="text" name="name" class="form-control" placeholder="성함을 입력하세요">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
					<div class="col-sm-5">
						<input type="radio" name="gender" value="남" />남
						<input type="radio" name="gender" value="여" />여
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">생년월일</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-2">
								<input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(1997)" size="6">
							</div>
							<div class="col-sm-2">
								<input type="text" name="birthmm" maxlength="2" class="form-control" placeholder="월(07)" size="4">
							</div>
							<div class="col-sm-2">
								<input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일(02)" size="4">
							</div>
						</div>
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-4">
								<input type="text" name="mail1" maxlength="50" class="form-control" placeholder="이메일을 입력해주세요">
							</div> @
							<div class="col-sm-3">
								 <select name="mail2" class="form-select">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>nate.com</option>
								</select>
							</div>
						</div>
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
					<div class="col-sm-5">
						<input type="text" name="phone" class="form-control" placeholder="전화번호를 입력하세요">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input type="text" name="address" class="form-control" placeholder="주소를 입력하세요">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">가입일</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-2">
								<input type="text" name="registyy" maxlength="4" class="form-control" placeholder="년" size="6">
							</div>
							<div class="col-sm-2">
								<input type="text" name="registmm" maxlength="2" class="form-control" placeholder="월" size="4">
							</div>
							<div class="col-sm-2">
								<input type="text" name="registdd" maxlength="2" class="form-control" placeholder="일" size="4">
							</div>
						</div>
					</div>
			</div>
			
	<div class="mb-3 row">
	  <div class="col-sm-offset-2 col-sm-10">
	    <input type="submit" class="btn btn-primary" value="등록" >
	    <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
	  </div>
	</div>
			
		</form>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>