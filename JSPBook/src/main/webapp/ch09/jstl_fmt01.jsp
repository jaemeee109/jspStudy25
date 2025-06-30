<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internationalization</title>
</head>
<body>

	<p> ---------- 기본 로케일 ----------</p>
	<fmt:setLocale value="ko" />
	<fmt:setBundle basename="ch09.com.bundle.myBundle" var="koBundle"/>
	<p> 제목: <fmt:message key="title" bundle="${koBundle}" /></p>
	<fmt:message key="username" var="userMsg" bundle="${koBundle}" />
	<p> 이름: ${userMsg}</p>

	<p> ---------- 영어 로케일 ----------</p>
	<fmt:setLocale value="en" />
	<fmt:setBundle basename="ch09.com.bundle.myBundle" var="enBundle"/>
	<p> 제목: <fmt:message key="title" bundle="${enBundle}" /></p>
	<p> 이름: <fmt:message key="username" bundle="${enBundle}" /></p>

</body>
</html>
