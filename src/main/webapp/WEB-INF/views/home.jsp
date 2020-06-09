<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="include/header.jsp" %>
		</div>
	
	</header>
	<nav id="nav2">
		<div id="nav_box">
		<%@ include file="include/nav2.jsp" %></div>
	</nav>
	
	<section id="container">
		<div id="container_box">
		본문 영역</div>
	</section>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="include/footer.jsp" %>
		</div>
	
	</footer>
	

</div>
<p><a href="/board/list">게시물 목록</a></p>
<a href="/board/write">게시물 작성</a>
</body>
</html>
