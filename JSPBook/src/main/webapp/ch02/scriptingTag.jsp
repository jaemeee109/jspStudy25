<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Scripting Tag</title></head>
	
	


<body>
	
	<!-- 작성 -->
	page count is
	<!-- 스크립틀릿 태그 : 메서드 호출-->
	<% out.println(myMethod(0)); %>
	
	<!-- 선언문 태그 : 메서드  -->
	<%! public int myMethod(int count) {
		return ++count; }%>
	


</body>

</html>