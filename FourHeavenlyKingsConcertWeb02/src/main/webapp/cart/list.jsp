<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="UTF-8">
  <title>장바구니</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ctx}/resources/css/cart.css" />
<link rel="stylesheet" href="${ctx}/resources/css/index.css" />

</head>
<body>

  <%@ include file="../menu.jsp" %>

  <!-- 로그인 체크 -->
  <c:if test="${empty sessionScope.sessionId}">
    <script>
      alert("회원만 예매가 가능합니다.");
      location.href = "${pageContext.request.contextPath}/main.jsp";
    </script>
  </c:if>

  <!-- 비어있을 때 -->
  <c:if test="${empty cartList}">
    <div style="text-align:center; margin:30px 0;">장바구니가 비었습니다</div>
  </c:if>

  <!-- 비어있지 않을 때 -->
  <c:if test="${not empty cartList}">
    <table class="cart-table">
      <tr>
        <th>공연명</th>
        <th>가격</th>
        <th>수량</th>
        <th>합계</th>
        <th>삭제</th>
      </tr>
      <c:forEach var="cart" items="${cartList}">
        <tr>
          <td>${cart.concert.c_name}</td>
          <td>${cart.concert.c_unitPrice}</td>
         <%--  <td>${cart.count}  ← 여기가 1인지 확인</td><!-- 테스트용  --> --%>
          <td>
           <form action="${pageContext.request.contextPath}/cartUpdateAction.do" method="post">
			  <input type="hidden" name="id"  value="${sessionScope.sessionId}" />
			  <input type="hidden" name="c_id" value="${cart.c_id}" />
			  <input type="number" name="count" value="${cart.count}" min="1" />
			  <input type="submit" value="변경" />
			</form>
           
          </td>
          <td>${cart.concert.c_unitPrice * cart.count}</td>
          <td>
            <a href="${pageContext.request.contextPath}/cartDeleteAction.do?c_id=${cart.c_id}&id=${sessionScope.sessionId}">
              삭제
            </a>
          </td>
        </tr>
      </c:forEach>
    </table>

    <div class="cart-actions">
      <a href="${pageContext.request.contextPath}/cartClearAction.do?id=${sessionScope.sessionId}">
        장바구니 전체 비우기
      </a>
      <a href="${pageContext.request.contextPath}/checkout.jsp">결제하기</a>
    </div>
  </c:if>

  <%@ include file="../footer.jsp" %>

</body>
</html>
