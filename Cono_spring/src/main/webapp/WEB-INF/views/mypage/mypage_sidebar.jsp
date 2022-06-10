<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
</head>
<body>
<div class="plus">
	<nav class="menu" tabindex="0">
		<div class="smartphone-menu-trigger"></div>
		<header class="avatar">
			<!-- 이미지 삽입 링크 -->
			<img src="${pageContext.request.contextPath}/front/img/logo.png" />
			<br>
			<h6>아기 등급</h6>
			<br>
			<h3>양윤석</h3>
		</header>
	</nav>
	<nav class="sidenav">
		<ul class="main-buttons">
			<li>나의 코노
				<ul class="hidden">
					<li>최근 본 상품</li>
					<li>나의 후기</li>
				</ul></li>
			<li>알림 및 메세지
				<ul class="hidden">
					<li>알림</li>
					<li>메시지</li>
				</ul></li>
			<li>내 정보
				<ul class="hidden">
					<li><a href="coin">코인</a></li>
					<li><a href="reserved">예약중인 상품</a></li>
					<li><a href="purchased">구매완료</a></li>
					<li><a href="basket">장바구니</a></li>
					<li><a href="wish">찜한 상품</a></li>
					<li><a href="coupon">쿠폰</a></li>
				</ul></li>
			<li><a href="follow">팔로잉 & 팔로워</a>
		</ul>
		<ul class="main-buttons2">
			<li><i class="fa fa-circle fa-1x"></i><a
				href="memberInfo_modify">회원 정보 수정</a></li>
			<li><i class="fa fa-circle fa-1x"></i><a
				href="accountInfo">계좌 정보 관리</a></li>
			<li><i class="fa fa-circle fa-1x"></i><a
				href="delete_id">회원 탈퇴</a></li>
		</ul>
	</nav>
</div>
</body>
</html>