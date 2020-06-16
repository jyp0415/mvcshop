<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<style>

section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }


h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}


.orderInfo {margin-bottom: 7px;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)
;border-radius:4px;margin-left: 3px;
}
.ordergood{
margin-left: 3px;
float:left;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
border-radius:4px
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
					 <div class="orderInfo">
                        <c:forEach items="${orderView}" var="orderView" varStatus="status">

                            <c:if test="${status.first}">
                                <p>
                                    <span>수령인 : </span>${orderView.orderRec}</p>
                                <p>
                                    <span>주소 : </span>(${orderView.userAddr1}) ${orderView.userAddr2}
                                    ${orderView.userAddr3}
                                </p>
                                <p>
                                    <span>가격 : </span>
                                    <fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" />
                                    원
                                </p>
                                <p> <span>배송 상태 : </span> ${orderView.delivery}</p>
                            </c:if>

                        </c:forEach>
                    </div>
                    
                    
                    <!-- 주문 하나에대한 상품 목록  -->
                    <div>
                        <c:forEach items="${orderView}" var="orderView">
                        <ul class="ordergood">
                            <li>
                                <div class="goods_left">
                                    <img class ="img_size" src="${orderView.gdsThumbImg}" />
                                </div>
                                
                                <div class="goods_info">
                                    <p>
                                        <span>상품명</span>${orderView.gdsName}<br /> <span>개당 가격</span>
                                        <fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" />
                                        원<br /> <span>구입 수량</span>${orderView.cartStock} 개<br /> <span>최종
                                            가격</span>
                                        <fmt:formatNumber pattern="###,###,###"
                                            value="${orderView.gdsPrice * orderView.cartStock}" />
                                        원                 
                                    </p>
                                </div>
                            </li>
                            </ul>
                        </c:forEach>
                    </div>

                </section>	
		
  			</div> <!-- cartList end  -->
  			
  			
  			
 

			
			<!-- 밑에는 footer 적자  -->
	
</body>
</html>
