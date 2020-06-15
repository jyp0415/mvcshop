<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
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
</style>
<link rel="stylesheet" href="/resources/css/member/viewModal.css" />
<link rel="stylesheet" href="/resources/css/member/viewReply.css" />
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a25af36b03.js" crossorigin="anonymous"></script>
<script> 
							function replyList(){
							 var gdsNum = ${view.gdsNum};
							 $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
							  var str = "";
							  
							  $(data).each(function(){
							   
							   console.log(data);
							   
							   var repDate = new Date(this.repDate);
							   repDate = repDate.toLocaleDateString("ko-US")
							   
							   str += "<li data-gdsNum='" + this.repNum + "'>"
							     + "<div class='userInfo'>"
							     + "<span class='userName'>" + this.userName + "</span>"
							     + "<span class='date'>" + repDate + "</span>"
							     + "<span> <button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button> </span>"
							     + "<span> <button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button> </span>"
							     + "</div>"
							     + "<div class='replyContent'>" + this.repCon + "</div>"
							     
							     + "<c:if test='${member != null}'>"
							     
							     + "<div class='replyFooter'>"
							     + "</div>"
							    
							     + "</c:if>"
							     
							     + "</li>";           
							  });
							  
							  $("section.replyList ol").html(str);  
							 });
							}
							</script>
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
  			
  				<div class="goods_left">       	
  					<img class="img_size" src="${view.gdsImg}">
  				</div>
  				<div class="goods_info">       	
  					<p>
								<span>상품명 : </span>${view.gdsName}</p>
					<p>
								<span>종류 : </span>${view.cateName}</p>

					<p >
								<span>가격 : </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
								원
					</p>

					<p>
								<span>수량 : </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
								EA
					</p>
					<c:if test="${view.gdsStock!=0 }">
							<p class="cartStock">
								<span>구입 수량</span>
								<button type="button" class="plus">+</button>
								<input type="number" class="numBox" min="1"
									max="${view.gdsStock}" value="1" readonly="readonly" />
								<button type="button" class="minus">-</button>
								<!-- <input type="hidden" value="" class="" /> -->
															
								<script src="/resources/js/member/viewStockBtn.js" type="text/javascript"></script>
							</p>
							<p class="addToCart">
									<i class="fas fa-cart-plus addCart_btn" style="font-size: 25px;"></i>
							
								<script>
							  $(".addCart_btn").click(function(){
							   var gdsNum = $("#gdsNum").val();
							   var cartStock = $(".numBox").val();
							      
							   var data = {
							     gdsNum : gdsNum,
							     cartStock : cartStock
							     };
							   
							   $.ajax({
							    url : "/shop/view/addCart",
							    type : "post",
							    data : data,
							    success : function(result){
							    if(result ==1){
							     alert("카트 담기 성공");
							     $(".numBox").val("1");
							    }else {
							    	alert("회원만 사용 가능합니다.")
							    	$(".numBox").val("1");
							    }
							    },
							    error : function(){
							     alert("카트 담기 실패");
							    }
							   });
							  });
							 </script>
							</p>
							
							
							</c:if>
							<c:if test="${view.gdsStock==0}">
							<p>
							재고가 없습니다.
							</p>
							</c:if>
													
  				</div>
  			
  			<div class="goods_left">${view.gdsDes}</div>
  			<!-- 상품 설명  -->
  			
  			
  			<div class="goods_left">

						<c:if test="${member == null }">
							<p>
								소감을 남기시려면 <a href="/member/signin">로그인</a>해주세요
							</p>
						</c:if>

						<c:if test="${member != null}">
							<section class="replyForm">
								<form role="form" method="post" autocomplete="off">
									<input type="hidden" name="gdsNum" id="gdsNum"
										value="${view.gdsNum}">
									<div class="input_area">
										<textarea name="repCon" id="repCon"></textarea>
									</div>

									<div class="input_area">
										<button type="button" id="reply_btn">확인</button>
									</div>
									<script>
									 $("#reply_btn").click(function(){
									  
									  var formObj = $(".replyForm form[role='form']");
									  var gdsNum = $("#gdsNum").val();
									  var repCon = $("#repCon").val()
									  
									  var data = {
									    gdsNum : gdsNum,
									    repCon : repCon
									    };
									  
									  $.ajax({
									   url : "/shop/view/registReply",
									   type : "post",
									   data : data,
									   success : function(){
									    replyList();
									    $("#repCon").val("");
									   }
									  });
									 });
									</script>
								</form>
							</section>
						</c:if>

						<section class="replyList">
							<ol>

							</ol>
							<script>replyList();</script>
							 
							<script> // 댓글의 수정 버튼 클릭 시 
							$(document).on("click", ".modify", function(){
								 $(".replyModal").fadeIn(200);
								 
								 var repNum = $(this).attr("data-repNum");
								 var repCon = $(this).parent().parent().children(".replyContent").text();
								 
								 $(".modal_repCon").val(repCon);
								 $(".modal_modify_btn").attr("data-repNum", repNum);
								 
								}); //댓글의 수정버튼 클릭 끝
								
						
							
							//댓글 삭제
							 $(document).on("click", ".delete", function(){
							  var deleteConfirm = confirm("삭제 하십니까");
							 if(deleteConfirm){
							  var data = {repNum : $(this).attr("data-repNum")};
							   
							  $.ajax({
							   url : "/shop/view/deleteReply",
							   type : "post",
							   data : data,
							   success : function(result){
								   
								   if(result == 1) {
								    replyList();
								   } else {
								    alert("작성자 본인만 할 수 있습니다.");     
								   }
								  },
								  error : function(){
										 alert("로그인이 필요합니다.");
									 }
							  });
							  
							 } // delete Confirm 
							
							 }                 );
							</script>
							 
						</section>
					</div>
  			
  			
  			</div> <!-- 최 하단 div  -->
  			
  			
  			
  			
 

			
			<!-- 밑에는 footer 적자  -->
	
</body>



</html>
