<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>회원 로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css" />



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

</head>
<body>

    <!--상단 메뉴 -->
    <%@ include file="../menu.jsp" %>

    <!--메인 섹션 -->
    <section id="section2">
        <div class="container">

            <!-- 로그인/소셜 로그인 영역 -->
            <div class="loginBox">

                <!--로그인 박스 -->
                <div class="box login">
                 <div class="logo">
                        <h2>Login</h2>
                   </div>

                    <!-- 로그인 Form 시작 -->
                    <form action="processLoginMember.jsp" method="post">
                        
                        <!-- 에러 처리 -->
                        <%
                            String error = request.getParameter("error");
                            if (error != null) {
                        %>
                        
                            <div class="alert">아이디와 비밀번호를 확인해 주세요</div>
                            
                        <%
                            }
                        %>

                        <!-- 아이디-->
                        <div class = "form-row">                       
	                        <label for="id">ID</label>
	                        <input type="text" name="id" id="id" placeholder="아이디" required autofocus />
						</div> 
                        <!-- 비밀번호 -->
                         <div class = "form-row">    
	                        <label for="password">Password</label>
	                        <input type="password" name="password" id="password" placeholder="비밀번호" required />
						</div>
                        <!-- 로그인 버튼 -->
                        <div class = "form-row"> 
                        <button type="submit">로그인</button>
                          </div> 
                          
			 </form>
			 </div>
			    <!-- 로그인 Form 끝 -->
              
                
                <!--  소셜 로그인 박스  -->
                <div class="box social">
                    <div class="logo">
                        <h2>Social Login</h2>
                    </div>

                   
                    <div class="social">
                        <button class="kakaotalk" onclick="alert('카카오 로그인 연동 예정')">카카오톡으로 로그인</button>
                        <button class="facebook" onclick="alert('페이스북 로그인 연동 예정')">Facebook 로그인</button>
                        <button class="twitter" onclick="alert('트위터 로그인 연동 예정')">Twitter 로그인</button>
                        <button class="naver" onclick="alert('네이버 로그인 연동 예정')">네이버 로그인</button>
                    </div>
                </div>

            </div> 

        </div> 
    </section>

    <!-- 하단 -->
    <%@ include file="../footer.jsp" %>

</body>
</html>
