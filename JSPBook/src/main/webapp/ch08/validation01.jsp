<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<script type ="text/javascript">
	
		function checkForm(){
			alert("아이디 : " + document.loginForm.id.value + "\n" +
					"비밀번호 : " + document.login.passwd.value);
			
		}
		</script>

</body>

		<form name ="loginForm">
		<p> 아이디 : <input type="text" name="id"></p>
		<p> 비밀번호 : <input type="password" name="passwd"></p>
		<p>  <input type="submit" value="전송" onclick="checkForm()"></p>
		</form>	
</html>