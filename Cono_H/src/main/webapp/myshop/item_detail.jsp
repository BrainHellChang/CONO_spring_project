<%@page import="vo.ImgDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_detail.jsp</title>
</head>
<body>
	
	<div>
		<!-- 상단 부분 -->
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
	<nav>
		<ul>
			<li><a href="my_page.jsp">내 상점</a></li>
			<li><a href="ItemUploadForm.shop">상품 등록</a></li>
			<li><a href="ItemMng.shop">상품 관리</a></li>
			<li><a href="item_review_mng.jsp">상품 후기 관리</a></li>
			<li><a href="item_order_mng.jsp">상품 주문 관리</a></li>
			<li><a href="follow_shop.jsp">팔로우 상점</a></li>
		</ul>
	</nav>
	<!-------- 본문 -------->
	<h3>상품 정보 상세</h3>
	<div>
		<hr>
		<form action="ItemModifyForm.shop">
			<table border="1">
				<tr>
					<td colspan="2">
						<input type="submit" value="수정하기">
						<input type="button" value="삭제하기" onclick="location.href='ItemDelete.shop?item_idx=${itemDetail[0]}'">
						<input type="hidden" name="item_idx" value="${itemDetail[0] }">
					</td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td>
						<c:forEach items="${imgList }" var="item">
							<img src="upload/${item.getImg_real_name() }"><br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td>${itemDetail[0] }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${itemDetail[1] }</td>
				</tr>
				<tr>
					<th>상품 소개</th>
					<td>${itemDetail[2] }</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${itemDetail[3] }</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>${itemDetail[12] }</td>
				</tr>
				<tr>
					<th>상품 등록일</th>
					<td>${itemDetail[4] }</td>
				</tr>
				<tr>
					<th>판매 상태</th>
					<td>${itemDetail[5] }</td>
				</tr>
				<tr>
					<th>찜</th>
					<td>${itemDetail[6] }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${itemDetail[7] }</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>${itemDetail[8] } > ${itemDetail[9] }</td>
				</tr>
				<tr>
					<th>거래지역</th>
					<td>${itemDetail[10] }</td>
				</tr>
				<tr>
					<th>숨김</th>
					<td>${itemDetail[11] }</td>
				</tr>
			</table>
		</form>
	</div>
	<!---------------------->
	
	<div>
		<!-- 하단 부분 -->
		<jsp:include page="../HeaderFooter/bottom.jsp"/>
	</div>
</body>
</html>