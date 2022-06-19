<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<link href="resources/css/msg.css" rel="stylesheet" />

<script type="text/javascript">
	// 헤더 클릭시 - 성공
	function getMsgList(msgList_room, member_id) {
		var btn = document.getElementById("msgbtn");
		var msg_form = document.getElementById("msg_form");
		document.getElementById("mId").value = member_id;
		document.getElementById("rNum").value = msgList_room;
		btn.style.visibility = "visible";
		msg_form.style.visibility = "visible";
		
		
		
		MessageContentList(msgList_room, member_id);
		
	}
	
	//헤더 이름 붙이기 + msg 불러오기 - 성공
	const MessageContentList = function(msgList_room, member_id) {
		$(".sNum").html(member_id);
		$.ajax({
			type:"GET",
			// 샵 메시지 전체 가져오기
			url:"shop_getAllMsg",
			data: {
				msgList_room : msgList_room
			},
			success:function(data) {
				$(".msg_area").html(data);
			},
			error : function() {
				alert("불러오기 실패!");
			}
		});
	}
	
	// 메시지 보내기
	function sendMsg() {
			// 방번호 샵네임 저장
			var msgList_room = document.getElementById("rNum").value;
			var member_id	 = document.getElementById("mId").value;
			sendMessage(msgList_room, member_id);
		}
	//  Msg DB 저장 함수
		const sendMessage = function(msgList_room, member_id) {
			let content = $('#msgText').val();
	// 		alert("content: " + content + "msgList_room: " + msgList_room + "shop_name:" + shop_name);
			
			// 양쪽 공백 제거
			content = content.trim();
			
			if(content == "") {
				alert("메세지를 입력하세요");
			} else {
				$.ajax({
					url:"shop_setSendMsg",
					method:"GET",
					data:{
						msgList_room : msgList_room,
						member_id : member_id,
						content : content
					},
					success:function(data) {
	// 					console.log("메세지 전송 성공");
						// 메시지 입력칸 비우기
						$('#msgText').val("");
						// 메시지 내용 리로드
						MessageContentList(msgList_room, member_id);
						// 메시지 리스트 리로드
	// 					MessageList();
					},
					error : function() {
	// 					alert('전송완료 후 실패');
						MessageContentList(msgList_room, member_id);
						$('#msgText').val("");
					}
				});
			}
		}

</script>


</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp"/>
	</div>
	
	
	<div class="box">
	<div class="msg_container">
		<div class="msg_title">
			<h2> 판매 문의</h2>
		</div>
		
<!-- 		room 리스트 -->
		<ul class="msg_lists">
			<c:forEach var="msgH" items="${msgList }">
				<li class="msg_item" onclick="getMsgList('${msgH.msgList_room }', '${msgH.member_id }')">
<!-- 					room / shopname 저장  -->
					<c:set value="${msgH.msgList_room }" var="rNum"></c:set>
					<c:set value="${msgH.member_id }" var="mId"></c:set>
					<a href="#" class="room">
						<span class="area-txt">
							<span class="Htime">${msgH.msgChat_time }</span>
							<span class="Hname">${msgH.member_nick }</span>
							<span class="Htxt">	${msgH.msgChat_content }</span>
						</span>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<section class="msg_board">
		<div class="board_head">
			<div class="prof">
				<span class="sname"></span>
			</div>
			<fieldset class="msgbtn" id="msgbtn" style="visibility: hidden">
<!-- 				<button class="follwing" onclick="location.href='following'">팔로우</button> -->
				<button class="msg_out" onclick="location.href='msgDelete()'">나가기</button>
			</fieldset>
		</div>
<!-- 		메시지 내용 -->
		<div class="msg_area">
			
		</div>
<!-- 		메시지 전송 -->
		<div class="msg_form" id="msg_form" style="visibility: hidden">
			<input type="text" id="mId">
			<input type="text" id="rNum">
			<textarea rows="3" cols="75" id="msgText"></textarea>
			<button class="btn_send" onclick="sendMsg()">버튼</button>
		</div>
	</section>	
	
	
	
	</div> 
	
	
	
	<div id="wrap">
		<jsp:include page="../header_footer/footer.jsp"/>
	</div>
</body>
</html>