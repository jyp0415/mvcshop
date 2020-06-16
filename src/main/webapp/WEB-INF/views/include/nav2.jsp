<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://kit.fontawesome.com/a25af36b03.js" crossorigin="anonymous"></script>
<style>
.pcard{
margin: 2px;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)
;border-radius:4px;margin-left: 3px;
font-size:20px;
}
a {
	color: #05f;
	text-decoration: none;
}
 a.title2:link { color: red; text-decoration: none;}
 a.title2:visited { color: black; text-decoration: none;}
 a.title2:hover { color: green; text-decoration: none;}

</style>

	<c:if test="${member == null}">
	<div>
	<span><a class="title2" href="/member/signin">로그인</a></span>
	<span><a class="title2" href="/member/signup">회원가입</a></span>
	</div>	
	</c:if>

		<c:if test="${member != null}">
		

		<!-- <li class="pcard">${member.userName}님환영합니다.</li> -->
		<div>
		<span><a class="title2" href="/shop/cartList">마이 찜<i class="fas fa-cart-plus" style="font-size: 20px;"></i> </a></span>
		<span><a class="title2" href="/shop/orderList">| 주문 리스트</a></span>
		</div>
		<a class="title2" href="/member/signout">로그아웃</a>
	</c:if>
<br><br>