<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".coin").on({
			click: function() {
				$.ajax({
					type:"GET",
					url: "Mypage_coin.mypage",
					data: {
						coin : $(".coin").val()
					},
					dataType: "text",
					success: function(msg) {
						$("#resultArea").html(msg);
					}
				});
			},

		});	
		$(".reserved_item").on("click", function() {
			$.ajax({
				type: "GET",
				url: "Mypage_reservedItem.mypage",
				data: {
					quantity : $(".reserved_item").val()
				},
				dataType:"text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		});
		
		$(".purchased_item").on("click", function() {
			$.ajax({
				type: "GET",
				url: "Mypage_purchasedItem.mypage",
				data: {
					quantity : $(".purchased_item").val()
				},
				dataType:"text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		});
		$(".basket").on("click", function() {
			$.ajax({
				type: "GET",
				url: "Mypage_basket.mypage",
				data: {
					quantity : $(".basket").val()
				},
				dataType:"text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		});
		$(".interested_item").on("click", function() {
			$.ajax({
				type: "GET",
				url: "Mypage_wishItem.mypage",
				data: {
					quantity : $(".interested_item").val()
				},
				dataType:"text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		});
		$(".coupon").on("click", function() {
			$.ajax({
				type: "GET",
				url: "Mypage_coupon.mypage",
				data: {"sId" : <%=sId%>},
				dataType: "text",
				success: function(msg) {
					$("#resultArea").html(msg);
				}
			});
		});
		
	});
</script>
</head>
<body>

	<div id="wrap">
		<jsp:include page="../HeaderFooter/top.jsp"/>
	</div>
	
<nav>
	<div class="mypage_profile">
		<div class="mypage_profile_div_img">
			<img src="" class="mypage_profile_img">img ?????????
		</div>
		<div class="mypage_profile_div_myIntro">
			<span class="mypage_profile_nickname">?????????</span>
			<span class="mypage_profile_myIntro">???????????????</span>
		</div>
	</div>
	<div>
		<table border="1">
			<tr><th>?????? ??????</th></tr>
			<tr><td><a href="MypageList_recentView.jsp">?????? ??? ??????</a></td></tr>
			<tr><td><a href="MypageListFollow.mypage">????????? & ?????????</a></td></tr>
			<tr><td><a href="MypageList_myReview.jsp">?????? ??????</a></td></tr>
			
			<tr><th>?????? ??? ?????????</th></tr>
			<tr><td><a href="mypageList_alarm.jsp">??????</a></td></tr>
			<tr><td><a href="MypageList_dm.mypage">?????????</a></td></tr>
			
			<tr><th>??? ??????</th></tr>
			<tr><td><a href="mypageList_modifyId.jsp">?????? ?????? ??????</a></td></tr>
			<tr><td><a href="MypageList_account.mypage">?????? ?????? ??????</a></td></tr>
			<tr><td><a href="mypageList_deleteId.jsp">?????? ??????</a></td></tr>
		
		</table>
	</div>
</nav>

<br>

<nav>
	<section class="mypage_info">
		<table border="1">
			<tr><th colspan="3">??? ??????</th></tr>
			<tr>
				<td>
					??????<hr>
<!-- 					<a href="" class="coin">1</a> -->
					<input type="button" class="coin" value="1">
				</td>
				<td>
					?????? ?????? ??????<hr>
					<input type="button" class=reserved_item value="2">
				</td>
				<td>
					????????????<hr>
					<input type="button" class="purchased_item" value="3">
				</td>
			</tr>
			<tr>
				<td>
					????????????<hr>
					<input type="button" class="basket" value="4">
				</td>
				<td>
					????????????<hr>
					<input type="button" class="interested_item" value="5">
				</td>
				<td>
					??????<hr>
					<input type="button" class="coupon" value="6">
				</td>
			</tr>
		</table>
	</section>
	<section class="mypage_info_detail">
		
	</section>
</nav>
<div id="resultArea"></div>

	<div class="clear">
 		<jsp:include page="../HeaderFooter/bottom.jsp" />
	</div>

</body>
</html>