<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource"  
    url="jdbc:mysql://192.168.111.102:3306/concerttestdb"
    driver="com.mysql.jdbc.Driver"
    user="concert" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
    SELECT * FROM MEMBER WHERE id=? AND password=?
    <sql:param value="<%=id%>" />
    <sql:param value="<%=password%>" />
</sql:query>
<%
    if (id != null && password != null) {
        session.setAttribute("sessionId", id);
    }
%>
<c:choose>
    <c:when test="${not empty resultSet.rows}">
      
        <c:redirect url="resultMember.jsp?msg=2" />
    </c:when>
    <c:otherwise>
        <c:redirect url="loginMember.jsp?error=1" />
    </c:otherwise>
</c:choose>
