<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvc.model.cartDTO"%>
<%@ page import="mvc.model.cartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="../cart/css/list.css" />
    <link rel="stylesheet" href="../resources/css/index.css" />
</head>
<body>

    <%@ include file="../menu.jsp" %>

    <!-- 장바구니 비어있을 경우 -->
<c:choose>
  <c:when test="${empty sessionScope.userId}">
    <script>
      alert("회원만 예매가 가능합니다.");
      window.location.href = "<%= request.getContextPath() %>/main.jsp";
    </script>
  </c:when>
  <c:otherwise>
    <c:if test="${empty cartList}">
      <div style="margin: 30px 0; text-align:center;">장바구니가 비었습니다</div>
    </c:if>
 
 </c:otherwise>
</c:choose>
   <!-- 장바구니 목록 출력 코드 -->

    <!-- 장바구니 테이블 -->
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
                    <td>
                        <form action="CartUpdateAction.do" method="post">
                            <input type="hidden" name="id" value="${cart.id}">
                            <input type="hidden" name="c_id" value="${cart.c_id}">
                            <input type="number" name="count" value="${cart.count}" min="1">
                            <input type="submit" value="변경">
                        </form>
                    </td>
                    <td>${cart.concert.unitPrice * cart.count}</td>
                    <td>
                        <a href="CartDeleteAction.do?id=${cart.id}&c_id=${cart.c_id}">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- 장바구니 비우기 / 결제하기 -->
        <div class="cart-actions">
            <a href="CartClearAction.do?id=${cartList[0].id}">장바구니 전체 비우기</a>
            <a href="checkout.jsp">결제하기</a>
        </div>
    </c:if>

    <%@ include file="../footer.jsp" %>
    
    

</body>
</html>
