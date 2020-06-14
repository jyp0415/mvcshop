<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.itemhide{display:none}
.itemshow{display:block!important ;
	border: 3px solid;
    border-top-color: white;
    border-left-color: aqua;
    border-right-color: aqua;
    border-bottom-color: aqua;}
.button1{padding:8px 16px;float:left;width:auto;border:none;display:block;outline:0}
.button1{width:100%;display:block;padding:8px 16px;
  text-align:left;border:none;white-space:normal;float:none;outline:0}
.button1{text-align:center}
.button2{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:inherit;
  background-color:inherit;text-align:center;cursor:pointer;white-space:nowrap}

</style>

 	<a  onclick="sprfun('spr1')" href="javascript:void(0)" class="button1 button2">
     	대목록
    </a>
    <div id="spr1" class="itemhide">
   		<a href="/shop/list?c=100&l=1" class="button1 button2">전체 보기</a>
        <a href="/shop/list?c=101&l=2" class="button1 button2">상품1</a>
        <a href="/shop/list?c=102&l=2" class="button1 button2">상품2</a>
        <a href="/shop/list?c=103&l=2" class="button1 button2">상품2</a>
    </div>
    
	<a onclick="sprfun('spr2')"  href="javascript:void(0)" class="button1 button2">
     대목록2
    </a>
    <div id="spr2" class="itemhide">
    
    	<a href="/shop/list?c=200&l=1" class="button1 button2">전체 보기</a>
        <a href="/shop/list?c=201&l=2" class="button1 button2">청바지</a>
    </div>
	
	<a href="/shop/list?c=300&l=1" onclick="sprfun()" href="javascript:void(0)" class="button1 button2">
     	액세서리
    </a>	


<script>

function sprfun(spr) {
  var x = document.getElementById(spr);
  if (x.className.indexOf("itemshow") == -1) {
    x.className += " itemshow";
    console.log('itemshow');
  } else {
    x.className = x.className.replace(" itemshow", "");
  }
}

</script>