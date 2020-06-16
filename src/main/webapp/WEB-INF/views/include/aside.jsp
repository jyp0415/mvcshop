<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
.itemhide{display:none}
.itemshow{display:block!important ;
	}
.button1{padding:8px 16px;float:left;width:auto;border:none;display:block;outline:0}
.button1{width:100%;display:block;padding:8px 16px;
  text-align:left;border:none;white-space:normal;float:none;outline:0}
.button1{text-align:center}
.button2{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:inherit;
  background-color:inherit;text-align:center;cursor:pointer;white-space:nowrap}
.bigmenu{font-size: 20px;}
.pcard{
margin: 2px;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)
;border-radius:4px;margin-left: 3px;
}
.admin{
text-align:right;
}
</style>

 	<a  onclick="sprfun('spr1')" href="javascript:void(0)" class="pcard bigmenu button1 button2">
     	상의 ▼
    </a>
    <div id="spr1" class="itemhide">
   		<a href="/shop/list?c=100&l=1" class="button1 button2">전체 보기</a>
        <a href="/shop/list?c=101&l=2" class="button1 button2">상품1</a>
        <a href="/shop/list?c=102&l=2" class="button1 button2">상품2</a>
        <a href="/shop/list?c=103&l=2" class="button1 button2">상품3</a>
    </div>
    
	<a onclick="sprfun('spr2')"  href="javascript:void(0)" class="pcard bigmenu button1 button2">
     	하의 ▼
    </a>
    <div id="spr2" class="itemhide">
    
    	<a href="/shop/list?c=200&l=1" class="button1 button2">전체 보기</a>
        <a href="/shop/list?c=201&l=2" class="button1 button2">청바지</a>
    </div>
	
	<a href="/shop/list?c=300&l=1" onclick="sprfun()" href="javascript:void(0)"
	 class="pcard bigmenu button1 button2">
     	액세서리
    </a>	

	<c:if test="${member != null}">
		<c:if test="${member.verify == 1}">
			<a class="admin"  href="/admin/index">관리자 화면</a>
		</c:if>
	</c:if>
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