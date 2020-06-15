<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--<link rel="stylesheet" href="/resources/css/member/cartList.css" />-->
<!-- <script src="/resources/js/user/shop/stockBtn.js"></script> -->
<style>
.sidemenu{height:100%;width:200px;background-color:#fff;position:fixed!important;z-index:1;overflow:auto}
.sidecontent{padding-top:64px!important;padding-bottom:64px!important; text-align: center;}
.good_div{padding:0.01em 16px}
.img_size{ width: auto; height: auto;
    max-width: 100%;
    max-height: 100%; }
    
.goods_left{padding:0 8px  ;float:left ; width:50% }
.goods_info{padding:0 8px  ;float:right ; width:40% }

 .goods_col{padding:0 8px  ;float:left ; width:24.999% }
 .header{ padding:0.01em 16px}
 .header-left{font-size:28px !important}
 body {
	margin: 0;
	padding: 0;
	font-family: '맑은 고딕', verdana;
}

a {
	color: #05f;
	text-decoration: none;
}
 a.title:link { color: red; text-decoration: none;}
 a.title:visited { color: black; text-decoration: none;}
 a.title:hover { color: green; text-decoration: none;}



h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

ul, lo, li {
	margin: 0;
	padding: 0;
	list-style: none;
}
.modify,.delete{
background-color: #8ebebc;
color: #fff;
text-decoration: none;
border-radius:0.35em;
border:0;
outline:0;}

.orderInfo{
display: none;
float:left;
}
.listResult{
float:left;
padding-left: 15%;
    padding-top: 5%;
}
.listResult::after {
	content: "";
	display: block;
	
	clear: both;
}
</style>
</head>
<body class="content" style="max-width:1200px">
	

			<nav class="sidemenu" style="z-index:3;width:230px">

				 <div>
					side메뉴 상단 
 				 </div>

				<div class="sidecontent">
					<%@ include file="../include/nav2.jsp"%>
					<%@ include file="../include/aside.jsp"%>
				</div>
				
			</nav> <!-- nav 메뉴 끝  -->
			
			<div  style="margin-left:230px">
			<header class="header">
    		<p class="header-left"><a  class="title" href="/">SPRING SHOP</a></p>
  			</header>


  			</div> <!-- header div   -->
  			
  			<div class="cartList" style="margin-left:230px">
  				<section>

					<ul>
						
						<c:set var="sum" value="0" />
						
						<c:forEach items="${cartList}" var="cartList">
							<li>

								<div class="goods_left">
								
									<img class ="img_size" src="${cartList.gdsThumbImg}" />
								</div>

								<div class="goods_info">
									<p>
										<span>상품명</span>${cartList.gdsName}<br /> <span>개당 가격</span>
										<fmt:formatNumber pattern="###,###,###"
											value="${cartList.gdsPrice}" />
										원<br /> <span>구입 수량</span>${cartList.cartStock} 개<br /> <span>최종
											가격</span>
										<fmt:formatNumber pattern="###,###,###"
											value="${cartList.gdsPrice * cartList.cartStock}" />
										원
									</p>

									<div>
										<button type="button" class="delete delete_${cartList.cartNum}_btn"
											data-cartNum="${cartList.cartNum}">삭제</button>
										<script>
											$(".delete_${cartList.cartNum}_btn")
													.click(
															function() {
																var confirm_val = confirm("정말 삭제하시겠습니까?");

																if (confirm_val) {
																	var checkArr = new Array();

																	checkArr
																			.push($(
																					this)
																					.attr(
																							"data-cartNum"));

																	$
																			.ajax({
																				url : "/shop/deleteCart",
																				type : "post",
																				data : {
																					chbox : checkArr
																				},
																				success : function(
																						result) {
																					if (result == 1) {
																						location.href = "/shop/cartList";
																					} else {
																						alert("삭제 실패");
																					}
																				}
																			});
																}
															});
										</script>
									</div>
								</div>
							</li>


							<c:set var="sum"
								value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
						</c:forEach>
					</ul>
					
					

				</section><!-- 카트 리스트 끝  -->
  			
  			
  			<div class="listResult">
						<div class="sum">
							총 합계 :
							<fmt:formatNumber pattern="###,###,###" value="${sum}" />
							원
						</div>
						<br>
						<div class="orderOpne">
							<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
							<script>
							 $(".orderOpne_bnt").click(function(){
							  $(".orderInfo").slideDown();
							  $(".orderOpne_bnt").slideUp();
							 });      
							</script>
							
						</div>
					</div>

					
  			
  			
  			
  			
  			
  			
  			</div> <!-- cartList end  -->
  			<div class="orderInfo">
						<form role="form" method="post" autocomplete="off">

							<input type="hidden" name="amount" value="${sum}" />

							<div class="inputArea">
								<label for="">수령인</label> <input type="text" name="orderRec"
									id="orderRec" required="required" />
							</div>

							<div class="inputArea">
								<label for="orderPhon">수령인 연락처</label> <input type="text"
									name="orderPhon" id="orderPhon" required="required" />
							</div>
							
							
							<!-- 우편 api -->
							<p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
</p>
<p>
<input type="text" name="userAddr1" id="sample2_address" placeholder="주소"><br>
<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
</p>
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/addressAPI" > </script>


							<div class="inputArea">
								<button type="submit" class="order_btn">주문</button>
								<button type="button" class="cancel_btn">취소</button>
								<script>
								$(".cancel_btn").click(function(){
								 $(".orderInfo").slideUp();
								 $(".orderOpne_bnt").slideDown();
								});      
								</script>
							</div>

						</form>
					</div>  <!-- 주문 정보 입력 폼 끝  -->
  			
  			
 

			
			<!-- 밑에는 footer 적자  -->
	
</body>

</html>
