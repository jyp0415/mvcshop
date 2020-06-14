<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.sidemenu{height:100%;width:200px;background-color:#fff;position:fixed!important;z-index:1;overflow:auto}
.sidecontent{padding-top:64px!important;padding-bottom:64px!important; text-align: center;}
.good_div{padding:0.01em 16px}

 .goods_col{padding:0 8px  ;float:left ; width:24.999% }
 .header{ padding:0.01em 16px}
 .header-left{font-size:28px !important}
</style>	
<script src="https://kit.fontawesome.com/a25af36b03.js" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script> <!-- 아이콘  -->
</head>
<body class="content" style="max-width:1200px">
	

			<nav class="sidemenu" style="z-index:3;width:250px">

				 <div>
					side메뉴 상단 
 				 </div>

				<div class="sidecontent">
					<%@ include file="include/nav2.jsp"%>
					<%@ include file="include/aside.jsp"%>
				</div>
				
			</nav>
			
			<div  style="margin-left:250px">
			<header class="header">
    		<p class="header-left">SPRING SHOP</p>
    		
  			</header>
			<div > <!-- 헤더 이미지  -->
    			<img src="/resources/images/abc.jpg" alt="munizzang" style="width:100%">

 			 </div>
			<div class="" id="">
    			<p>올 여름 50% 할인</p>
  			</div>
  			
  			<div class="">
    <div class="goods_col">
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품1<br><b>100원</b></p>
      </div>


      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품2<br><b>100원</b></p>
      </div>
    </div>

    <div class="goods_col">
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품3<br><b>100원</b></p>

      </div>
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품4<br><b>100원</b></p>
      </div>
    </div>

    <div class="goods_col">
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품5<br><b>100원</b></p>
      </div>
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품6<br><b>100원</b></p>
      </div>
    </div>

    <div class="goods_col">
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품7<br><b>100원</b></p>
      </div>
      <div class="good_div">
        <img src="/resources/images/abc.jpg" style="width:100%">
        <p>상품8<br><b>100원</b></p>
      </div>
    </div>
  </div>
  			
  			
  			
			</div> <!--  마지막  상품 영역  -->
			
			<!-- 밑에는 footer 적자  -->
		



		
		

	



</body>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: '맑은 고딕', verdana;
}

a {
	color: #05f;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
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

</style>
</html>
