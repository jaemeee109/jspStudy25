<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>춘식극장</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
</head>
<body>
  <%@ include file="../menu.jsp" %>

  <div class="page-wrapper">
    <div id="main-content">
      <!-- 왼쪽 컬럼 -->
      <div id="left-column">
        <div id="ranking-box" class="box">
          <h3>⭐ 실시간 랭킹</h3>
          <div class="rank-list">
            <div class="rank-item">
              <img src="<c:url value='/resources/images/images01.jpg' />" alt="REVERIE" />
              <div class="title">BAEKHYUN WorldTour 'REVERIE'</div>
            </div>
            <div class="rank-item">
              <img src="<c:url value='/resources/images/images02.JPG' />" alt="DEADLINE" />
              <div class="title">BlackPink WorldTour 'DEADLINE'</div>
            </div>
            <div class="rank-item">
              <img src="<c:url value='/resources/images/images03.JPG' />" alt="Aladin" />
              <div class="title">BroadwayMusical 'Aladin'</div>
            </div>
          </div>
        </div>
      </div>

      <!-- 오른쪽 컬럼 -->
      <div id="right-column">
        <div id="notice-box" class="box">
          <h3>⚡ 공지사항</h3>
          <ul>
            <li>* 2025 러브썸머페스티벌 당첨 이벤트</li>
            <li>* 2025년 8월 오픈예정 공연 리스트 안내</li>
            <li>* 뮤지컬/연극 관람 유의사항 안내 </li>
          </ul>
        </div>

        <div id="md-pick-box" class="box">
          <h3>👍 이달의 MD’s Pick</h3>
          <div class="md-grid">
            <div class="md-item"><img src="<c:url value='/resources/images/goods01.JPG'/>" /></div>
            <div class="md-item"><img src="<c:url value='/resources/images/goods02.JPG'/>" /></div>
            <div class="md-item"><img src="<c:url value='/resources/images/goods03.JPG'/>" /></div>
            <div class="md-item"><img src="<c:url value='/resources/images/goods04.JPG'/>" /></div>
          </div>
        </div>
      </div>
    </div>

    <%@ include file="../footer.jsp" %>
  </div>
</body>
</html>
