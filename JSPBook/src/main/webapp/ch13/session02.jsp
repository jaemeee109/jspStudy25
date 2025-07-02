<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<%
		
	    session.setAttribute("userID", "admin");
	    session.setAttribute("userPW", "1234");
	    /* p.456 책에 없는 부분 추가 */
	    
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션의 속성 값 (1) : " + user_id + "<br>");
		out.println("설정된 세션의 속성 값 (2) : " + user_pw );
	%>
	
	
	
	
</body>
</html>