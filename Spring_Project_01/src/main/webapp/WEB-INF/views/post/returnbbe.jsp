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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	width: 50%;
	background-color: ghostwhite;
	border-radius: 16px;
	box-shadow: 0 0 8px #deb13a;
}

td {
	padding: 5px;
}

#return_BTN {
	margin-top: 30px;
	left: 45%;
	position: relative;
	font-size: 20px;
	background-color: #78EFAD;
	border: groove;
	border-radius: 10px;
}

#return_BTN:hover {
	background-color: #50C785;
	border: ridge;
}
</style>
<head>
<meta charset="UTF-8">
<title>무인택시 예약 시스템</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
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
				<%
					if (session.getAttribute("userid") == null) {
				%>

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
	<h1>반납하기페이지</h1>

<c:forEach items="BBEhistory">
	<table>
		<tr>
			<td>차종 : ${BBEhistory.taxi_kind}</td>
			<td>인원수 : ${BBEhistory.cnt}</td>
		</tr>
		<tr>
			<td colspan="2">price : ${BBEhistory.price} * 시간(분) 1000 원</td>
		</tr>
	</table>
</c:forEach>
	<input id="return_BTN" type="button" value="반납하기"
		onclick="return_BTN()">


	<script type="text/javascript">
		function return_BTN() {
			let confirmflag = confirm("정말 반납하시겠습니까?");
			if (confirmflag) {
				$.ajax({
					url : 'returntaxi',
					success : function() {
						location.reload();
					}
				});
			}
		}
	</script>
</body>
</html>