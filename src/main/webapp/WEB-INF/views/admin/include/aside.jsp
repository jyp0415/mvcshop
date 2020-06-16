<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.list_title{
  clear: both;
  font:600 35px 'nbgL';
  padding:3px;
 
}
p.list_title b{
  font:600 30px 'nbgL';
  position:relative;

  display: block;
}
p.list_title b:after{
  position:absolute;
  content:"";
  width: 42px;
  height:1px;
  background: #ffd736;
  left:0;
  bottom:-3px;
}
</style>

<p class="list_title">
	 <b>상품 관리</b>  
	</p>
	<span><a href="/admin/goods/register">상품 등록</a></span>
	<span><a href="/admin/goods/list">상품 목록</a></span>
	<p class="list_title">
	<br>
	 <b>주문 현황</b>  
	</p>
	<span><a href="/admin/shop/orderList">주문 목록</a></span>
	<p class="list_title">
	<br>
	 <b>고객 관리</b>  
	 
	</p>
	<span><a href="/admin/shop/allReply">상품 소감</a></span>
	<span><a href="">유저 목록</a></span>
	<br>
