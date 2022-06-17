<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="../header_footer/header.jsp" />
		<jsp:include page="./mypage_sidebar.jsp" />
	</div>
 <style type="text/css">

 * { 
 	margin: 0; 
 	padding: 0; 
 } 







/* 페이 리스트 */


/* .coin_total{ */
/* 	width:100%; */
/* 	text-align:right; */
/* 	font-size: 20px; */
/* 	color: #17191d;  */
/*  	margin-bottom:10px;  */
	
/* } */

.cashTable {
 	 
/* 	border:none; */
	
	width:100%;
	font-size: 16px;
	padding-top:15px;
	padding-bottom:15px;
	
}

.cashTable th{
	border-bottom:1px solid #ccc;
	text-align: center;
	padding: 10px;
}
.cashTable td {
border-bottom:1px solid #ccc;
text-align: center;
padding: 10px;
}
 
/* 버튼 */

input[type=radio]{
 	accent-color: #a4e7ff; 
  	font-size: 15px;   
	border: 0px;
/* 	width:100%; */
/*     height: 0.3em;  */
}
.btnArea {
	text-align: center;
	width: 100%;
	margin-top:20px;
	margin-bottom:20px;
}

.btn{
 	font-size: 14px;
 	font-weight:bold;
 	padding: 4px 8px; 
	background-color: #a4e7ff;
	color: white;
	border : 2px solid #a4e7ff;
	border-radius: 2px; 
 	text-transform: uppercase; 
 	letter-spacing:1px;
  	font-family: sans-serif;  
	transition : all 0.4s;
/* 	margin: 20px; */
}

.btn:focus{
	outline: none;
}

.btn:hover{
	background-color: white;
	color:#a4e7ff;
}	


</style>

<script type="text/javascript">
   function visiblePayCheck() {
      var checkBox = document.getElementById("payCheck");
      
      if(checkBox.style.display == "" || checkBox.style.display == "none") {
         checkBox.style.display = "block";
      } else {
         checkBox.style.display = "none";
      }
      
   }
   function requestPay() {
   
        var payment = document.getElementsByName("payment");
        var payment_name;
        var payment_value;
        for(var i=0; i<payment.length; i++) {
           if(payment[i].checked) {
            payment_name = payment[i].value + "코인";
              payment_value = Number(payment[i].value);
           }
        }
        location.href="payment?payment_name=" + payment_name + "&payment_value=" + payment_value;
   }
</script>




</head>
<body>
<section class="couponSection">
   <div class ="txt">코인페이지</div>
   <div class="segment"><div class="btnArea"><button onclick="visiblePayCheck()" class="btn">코인충전</button></div>
      
<!--    <section id="payCheck" style="display: none;"> -->

      <div id="payCheck" class ="payCheck" align="center">
      <form action="payment" method="post" >
      <table class="payTable">
	      <tr><td class ="radioBtn"><input type="radio" name="payment_value" value="10000" class="radio">  &nbsp;&nbsp;10,000원&nbsp;&nbsp;</td><td class ="radioBtn"><input type="radio" name="payment_value" value="30000" class="radio">	&nbsp;&nbsp;30,000원&nbsp;&nbsp;</td></tr>
	      <tr><td class ="radioBtn"><input type="radio" name="payment_value" value="50000" class="radio">  &nbsp;&nbsp;50,000원&nbsp;&nbsp;</td><td class ="radioBtn"><input type="radio" name="payment_value" value="100000" class="radio">	 &nbsp;&nbsp;100,000원&nbsp;&nbsp;</td></tr>
        </table>
         <div class="btnArea"><input type="submit" value="결제하기" class="btn"></div>
      </form>
      </div>
      </div>
<!--    </section> -->
      
		
      
<%-- 				<div class="coin_total">사용가능한 코인 : ${coin_total}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> --%>
   		<div class="segment"><div class="cashListWrap" align="center">
			<table class="cashTable" >
			
				<tr>
					<th class="num">No.</th><th class="coin_add">적립내역</th><th class="coin_use">사용내역</th><th class="td_coin_total">보유 코인</th><th class="date">날짜</th>
				
					 <c:forEach var="coinVO" items="${coin }">
						<tr>
							<td class="num">${coinVO.coin_idx}</td>
							<td class="coin_add">${coinVO.coin_add }</td>
							<td class="coin_use">${coinVO.coin_use }</td>
							<td class="td_coin_total">${coinVO.coin_total }</td>
							<td class="date">${coinVO.coin_date }</td>
						</tr>
   					</c:forEach>
      			
	   </table>
      	
      	</div> <!-- cashListWrap 디브 -->
      	</div>
      </section>	
</body>
</html>