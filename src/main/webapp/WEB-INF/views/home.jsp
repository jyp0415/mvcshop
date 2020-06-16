<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
.good_div{padding:0.01em 16px;
    padding: 0.01em 3px;
   
    height: 100%;
    display: inline-block;
}
 .goods_col{
     padding: 0 8px;
    float: left;
    width: 100%;
    height: 30%;
 
 }

 .img{
 width: 100%;
    height: 60%;}
    
 .header{ padding:0.01em 16px}
 .header-left{ !important ;font-size:2.5rem;}
 body {
	margin: 0;
	padding: 0;
	font-family: '맑은 고딕', verdana;
}

a {
	color: #05f;
	text-decoration: none;
}
 a.title:link {color: red; text-decoration: none;}
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
/*반응형 디자인 */
@media (max-width:992px){.sidemenu{display:none}  .main {margin-left:0px;} .menu_right{display:inline;} 
.goods_col{width: 100%; } .good_div{width:49%}  .header{margin-left: 0px;}

}               
    
@media (min-width:992px){.sidemenu{display:block;}  .main {margin-left:230px;} 
.menu_right{display:none; } .header{margin-left: 230px;}
.goods_col{width: 100%; } .good_div{width:24%}
 }
.main2{
    width: 100%;
    height: 100%;
}    


 
.main{height: 100%;    
    }      
.title_bar:after{
content:"";display:table;clear:both
} 
.header{
padding: 0.01em 16px;
    height: 6%;
    }   
body.content{

}    
</style>	

<script src="https://kit.fontawesome.com/a25af36b03.js" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script> <!-- 아이콘  -->
</head>
<body class="content" style="max-width:1200px;">
	
			
			<nav class="sidemenu" style="z-index:3;width:230px" id="sidemenu">

				 <div>
					 
 				 </div>

				<div class="sidecontent">
					<%@ include file="include/nav2.jsp"%>
					<%@ include file="include/aside.jsp"%>
				</div>
				
			</nav>
			
			<header class="header">
    		<p class="header-left" style="display: inline;"><a class="title" href="/">SPRING SHOP</a>
    
   </p><div class="menu_right" style="height: 90%;float: right;">
          <i onclick="menu()" class="fas fa-bars" aria-hidden="true" style="
          font-size:3.5rem;height: 100%;"></i>      
  			<script>
  				function menu() {
  			  	var sidemenu = document.getElementById("sidemenu").style ;
  			  	if(sidemenu.display == "block"){
  			  		sidemenu.display = "none";
  			  	}else{
  			  	sidemenu.display = "block";
  			  	}
  				}
  			
  			</script>
   </div>
   
   
   </header>
			
			
			
			
			<div  class="main">
			 
			<div style="margin: 12px;" > <!-- 헤더 이미지  -->
    			<img src="/resources/images/abc.jpg" alt="munizzang" style="width:100%">
 			 </div>
			<div class="" id="">
    			<p>올 여름 50% 할인</p>
  			</div>
  			
  			<div class="main2">
    <div class="goods_col">
      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img" style="width:100%">
        <p>상품1<br><b>100원</b></p>
      </div>


      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img" style="width:100%">
        <p>상품2<br><b>100원</b></p>
      </div>
      
      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img"  style="width:100%">
        <p>상품3<br><b>100원</b></p>

      </div>
      
      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img"  style="width:100%">
        <p>상품4<br><b>100원</b></p>

      </div>
    </div>

    <div class="goods_col">
      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img" style="width:100%">
        <p>상품1<br><b>100원</b></p>
      </div>


      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img" style="width:100%">
        <p>상품2<br><b>100원</b></p>
      </div>
      
      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img"  style="width:100%">
        <p>상품3<br><b>100원</b></p>

      </div>
      
      <div class="good_div">
        <img src="/resources/images/abc.jpg" class="img"  style="width:100%">
        <p>상품4<br><b>100원</b></p>

      </div>
    </div>
    
</div>
  			
  			
  			
			</div> <!--  마지막  상품 영역  -->
			
			<!-- 밑에는 footer 적자  -->
		



		
		

	



</body>

</html>
