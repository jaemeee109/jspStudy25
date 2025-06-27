<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person"></jsp:useBean>
	<jsp:setProperty name="person" property="id" value="19970901"/>
	<jsp:setProperty name="person" property="name" value="전정국"/>
	<p>아이디: <jsp:getProperty property="id" name="person"/>
	<p>이름: <jsp:getProperty property="name" name="person"/>
</body>
</html>