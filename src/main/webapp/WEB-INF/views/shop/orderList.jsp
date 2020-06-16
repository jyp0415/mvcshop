<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<style>
section#content ul li { }
section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
.pcard2{
margin: 3px;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)
;border-radius:4px;margin-left: 3px;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

ul, lo, li {
	margin: 0;
	padding: 0;
	list-style: none;
}
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
  				<section id="content">

                    <ul class="orderList">
                        <c:forEach items="${orderList}" var="orderList">
                            <li class="pcard2">
                                <div>
                                    <p>
                                        <span>주문번호</span><a
                                            href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
                                    </p>
                                    <p>
                                        <span>수령인</span>${orderList.orderRec}</p>
                                    <p>
                                        <span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2}
                                        ${orderList.userAddr3}
                                    </p>
                                    <p>
                                        <span>가격</span>
                                        <fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" />
                                        원
                                    </p>
                                    <p> <span>상태</span> ${orderList.delivery}</p>

                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                </section>	
		
  			</div> <!-- cartList end  -->
  			
  			
  			
 

			
			<!-- 밑에는 footer 적자  -->
	
</body>
</html>
