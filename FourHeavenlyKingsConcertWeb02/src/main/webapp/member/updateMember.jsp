<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
 <!DOCTYPE html>
 <html>
<head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateMember.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>

<%
	String sessionId=(String) session.getAttribute("sessionId");
%>

<sql:setDataSource var="dataSource"  
	url="jdbc:mysql://192.168.111.102:3306/concerttestdb"
	driver="com.mysql.jdbc.Driver" user="concert" password="1234" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT*FROM MEMBER WHERE id=?
	<sql:param value="<%=sessionId %>" />
</sql:query>

<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>

<title>회원 수정</title>
</head>
<body onload="init()">
<jsp:include page="/menu.jsp" />

<div class="container py-4">
  <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    <div class="container-fluid py-5">
      <h2 class="display-5 fw-bold"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
</svg>& 회원정보 수정</h2>

    </div>
  </div>

  <c:forEach var="row" items="${resultSet.rows }">
    <c:set var="mail" value="${row.mail}" />
    <c:set var="mail1" value="${mail.split('@')[0]}" />
    <c:set var="mail2" value="${mail.split('@')[1]}" />

    <c:set var="birth" value="${row.birth }" />
    <c:set var="year" value="${birth.split('/')[0]}" />
    <c:set var="month" value="${birth.split('/')[1]}" />
    <c:set var="day" value="${birth.split('/')[2]}" />

    <form name="newMember" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">아이디</label>
        <div class="col-sm-6">
          <input type="text" name="id" class="form-control" value="${row.id}" />
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">비밀번호</label>
        <div class="col-sm-6">
          <input type="text" name="password" class="form-control" value="${row.password}" />
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">비밀번호 확인</label>
        <div class="col-sm-6">
          <input type="text" name="password_confirm" class="form-control" />
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">성명</label>
        <div class="col-sm-6">
          <input type="text" name="name" class="form-control" value="${row.name}" />
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">성별</label>
        <div class="col-sm-6 pt-2">
          <input type="radio" name="gender" value="남" <c:if test="${gender.equals('남')}">checked</c:if>> 남
          <input type="radio" name="gender" value="여" <c:if test="${gender.equals('여')}">checked</c:if>> 여
        </div>
      </div>

     <div class="mb-3 row">
  <label>생년월일&nbsp;&nbsp;</label>
  <div class="birth-row">
    <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(1997)" value="${year}" />
    <input type="text" name="birthmm" maxlength="2" class="form-control" placeholder="월(07)" value="${month}" />
    <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일(02)" value="${day}" />
  </div>
</div>

     <div class="mb-3 row">
  <label>이메일&nbsp;&nbsp;</label>
  <div class="email-row">
    <input type="text" name="mail1" maxlength="50" class="form-control" value="${mail1}" />
    <span>@</span>
    <select name="mail2" id="mail2" class="form-select">
      <option>naver.com</option>
      <option>daum.net</option>
      <option>gmail.com</option>
      <option>nate.com</option>
    </select>
  </div>
</div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">전화번호</label>
        <div class="col-sm-6">
          <input type="text" name="phone" class="form-control" value="${row.phone}" />
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">주소</label>
        <div class="col-sm-6">
          <input type="text" name="address" class="form-control" value="${row.address}" />
        </div>
      </div>

      <div class="mb-3 row">
  <div class="btn-row">
    <input type="submit" class="btn btn-primary" value="회원수정" />
    <a href="submit" class="btn btn-danger">회원탈퇴</a>
  </div>
</div>
    </form>
  </c:forEach>
</div>
<jsp:include page="/footer.jsp" />
</body>
</html>
