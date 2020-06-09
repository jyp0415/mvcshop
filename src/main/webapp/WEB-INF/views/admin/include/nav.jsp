<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul>
	<c:if test="${member == null}">
		<li><a href="/member/signin">로그인</a></li>
		<li><a href="/member/signup">회원가입</a></li>
		<li></li>
	</c:if>
	<c:if test="${member != null}">
		<li>
			<A href="/">일반 화면 </A>
		</li>
		<li><a href="/member/signout">로그아웃</a></li>
	</c:if>
</ul>