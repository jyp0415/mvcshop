<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" href="/resources/css/member/view.css" />
<link rel="stylesheet" href="/resources/css/member/viewModal.css" />
<link rel="stylesheet" href="/resources/css/member/viewReply.css" />
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
							     + "</div>"
							     + "<div class='replyContent'>" + this.repCon + "</div>"
							     
							     + "<c:if test='${member != null}'>"
							     
							     + "<div class='replyFooter'>"
							     + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>M</button>"
							     + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>D</button>"
							     + "</div>"
							    
							     + "</c:if>"
							     
							     + "</li>";           
							  });
							  
							  $("section.replyList ol").html(str);  
							 });
							}
							</script>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav2.jsp"%>
			</div>
		</nav>

		<section id="container">
			<div id="container_box">

				<section id="content">
					<form role="form" method="post">
						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					</form>

					<div class="goods">
						<div class="goodsImg">
							<img src="${view.gdsImg}">
						</div>

						<div class="goodsInfo">
							<p class="gdsName">
								<span>상품명</span>${view.gdsName}</p>

							<p class="cateName">
								<span>카테고리</span>${view.cateName}</p>

							<p class="gdsPrice">
								<span>가격 </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
								원
							</p>

							<p class="gdsStock">
								<span>재고 </span>
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
								<button type="button" class="addCart_btn">카트에 담기</button>
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

						<div class="gdsDes">${view.gdsDes}</div>
					</div>

					<div id="reply">

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
				</section>

				<aside id="aside">
					<%@ include file="../include/aside.jsp"%>
				</aside>

			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>

	</div>



	<!--  <p>
		<a href="/board/list">게시물 목록</a>
	
	<a href="/board/write">게시물 작성</a>
	</p>-->
	<div class="replyModal">

		<div class="modalContent">

			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>

			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>

		</div>

		<div class="modalBackground"></div>

	</div>
	<script>
	//수정 모달의 수정 버튼 클릭시 	
	//모달은 원래 숨겨져 있는 정적인 html 이다 그래서 click 메소드 사용 가능 
	$(".modal_modify_btn").click(function(){
		 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
		 
		 if(modifyConfirm) {
		  var data = {
		     repNum : $(this).attr("data-repNum"),
		     repCon : $(".modal_repCon").val()
		    };  // ReplyVO 형태로 데이터 생성
		  
		  $.ajax({
		   url : "/shop/view/modifyReply",
		   type : "post",
		   data : data,
		   success : function(result){
		    
		    if(result == 1) {
		     replyList();
		     $(".replyModal").fadeOut(200);
		    } else {
		     alert("작성자 본인만 할 수 있습니다.");       
		    }
		   },
		   error : function(){
		    alert("로그인하셔야합니다.")
		   }
		  });
		 }
		 
		});
	
	
	
	
	
	
	
	//모달의 취소버튼 클릭시 
$(".modal_cancel").click(function(){
	 $(".replyModal").fadeOut(200);
	});</script>
</body>



</html>
