<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
.sidemenu{height:100%;width:200px;background-color:#fff;position:fixed!important;z-index:1;overflow:auto}
.sidecontent{padding-top:64px!important;padding-bottom:64px!important; text-align: center;}
.good_div{padding:0.01em 16px}

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

ul, lo, li,.title {
	margin: 0;
	padding: 0;
	list-style: none;
}
</style>	
</head>
<body class="content" style="max-width:1200px">
	

			<nav class="sidemenu" style="z-index:3;width:250px">

				 <div>
					side메뉴 상단 
 				 </div>

				<div class="sidecontent">
					<%@ include file="./../include/nav2.jsp"%>
					<%@ include file="./../include/aside.jsp"%>
				</div>
				
			</nav>
			
			
			<div style="margin-left:250px">
			<header class="header">
    		<p class="header-left"><a class="title" href="/">SPRING SHOP</a></p>
    		
  			</header>
			
  			
  			<div class="">
  		<c:forEach items="${list}" var="list">	
    <div class="goods_col">
      <div class="good_div">
       <a href="/shop/view?n=${list.gdsNum}"><img  src="${list.gdsThumbImg}" style="width:100%"></a> 
      <p> <a href="/shop/view?n=${list.gdsNum}">  ${list.gdsName}</a>  <br><b> ${list.gdsPrice} 원</b></p>
      </div>

    </div>
		</c:forEach>
    
  			
  			
			</div> <!--  마지막  상품 영역  -->
			
			<!-- 밑에는 footer 적자  -->
		



		
		

	



</body>
<style>

</style>
</html>
