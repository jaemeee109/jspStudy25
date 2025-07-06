<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
    <title>회원 정보</title>
</head>
<body>

<div class="container py-4">
    <%@include file="../menu.jsp" %>

    <%
       /*  String sessionId = null; */
        if (session != null) {
            sessionId = (String) session.getAttribute("sessionId");
            System.out.println("세션에 저장된 sessionId: " + sessionId);
        }
        String msg = request.getParameter("msg");
    %>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <%
                if ("0".equals(msg) || "2".equals(msg) || "3".equals(msg)) {
            %>
                <h1 class="display-5 fw-bold">회원 정보</h1>
                <p class="col-md-8 fs-4">Membership Info</p>
            <%
                } else if ("1".equals(msg)) {
            %>
                <h1 class="display-5 fw-bold">회원 가입</h1>
                <p class="col-md-8 fs-4">Membership Joining</p>
            <%
                }
            %>
        </div>
    </div>

    <div class="row align-items-md-stretch text-center">
        <%
            if (msg != null) {
                if ("3".equals(msg)) {
                    out.println("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
                } else if ("1".equals(msg)) {
                    out.println("<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
                } else if ("0".equals(msg)) {
                    out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
                } else if ("2".equals(msg)) {
                    if (sessionId != null) {
                        out.println("<h2 class='alert alert-danger'>" + sessionId + "님 환영합니다</h2>");
                    } else {
                        out.println("<h2 class='alert alert-danger'>세션이 만료되었거나 로그인 정보가 없습니다.</h2>");
                    }
                }
            }
        %>
    </div>
</div>

</body>
</html>
