<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<style>
a.rigthMenu {
	margin-top: 15px;
	margin-right: 20px;
	float: right;
	color: white;
}
body {
	background-color: #E8F5FF;
}
h1 {
	text-align: center;
	font-weight: bold;
	margin-top: 50px;
	text-shadow: 0 0 10px gray;
	font-size: 50px;
}
table {
	margin: auto;
	margin-top: 30px;
	height: 300px;
	width: 50%;
	background-color: ghostwhite;
	border-radius: 16px;
	box-shadow: 0 0 8px #deb13a;
	
}

td {
	padding: 20px;
	font-size: x-large;
}

</style>
<head>
<meta charset="UTF-8">
<title>무인택시 예약 시스템</title>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
			
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"
					style="font-size: 30px"><span style="font-size: 5px;">무인택시</span>붕붕이</a>

			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="Ic_reservation">예약하기</a></li>
					<li><a href="Ic_return">반납하기</a></li>
					<li><a href="Ic_review">리뷰</a></li>
					<li><a href="Ic_history">내역보기</a></li>
				</ul>

				<!-- 				 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면) -->
				<%
					if (session.getAttribute("userid") == null) {
				%>
				<a href="login" class="rigthMenu" id="navright">회원가입</a> <a
					href="login" class="rigthMenu">로그인</a>

				<%
					} else {
				%>
				<a href="logout" class="rigthMenu">[로그아웃]</a> <a class="rigthMenu">현재
					사용자 이름 : ${sessionScope.userid }</a>
				<%
					}
				%>

			</div>
		</div>
	</nav>
	<br>
	<br>
	
	<h1>예약된 내역</h1>
	<c:forEach items="${historylist}" var="h">
	<table>
		<tr>
			<td>ID : ${h.u_id}</td>
			<td>POINT : ${h.point}</td>
		</tr>
		<tr>
			<td>차종 : ${h.taxi_kind}</td>
			<td>인원수 : ${h.cnt}</td>
		</tr>
		<tr>
			<td colspan="2">가격 : ${h.price}원 * 시간(분) 1000원</td>
		</tr>
	</table>
	</c:forEach>
	</body>
</html>