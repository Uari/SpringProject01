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

<link rel="stylesheet" type="text/css" href="resources/css/review.css">

<head>
<meta charset="UTF-8">
<title>무인택시 예약 시스템</title>

<style type="text/css">
.star {
	color: gold;
	font-size: x-large;
}

#deleteBTN {
	font-size: 20px;
	background-color: #78EFAD;
	border: groove;
	border-radius: 10px;
	float: right;
}

#deleteBTN:hover {
	background-color: #50C785;
	border: ridge;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<h2 id="reviewtitle">사용자 리뷰</h2>

	<div>
		<input id="reviewinput" type="button" value="리뷰쓰기"
			onclick="inputReview()">
		<c:forEach items="${reviewList}" var="re">
			<table>
				<tr>
					<td>
					평점 (${re.r_grade}) : 
						<c:forEach begin="1" end="${re.r_grade}"> 
							<label class="star">★</label>
						</c:forEach>
					</td>
					<c:if test="${re.u_id eq sessionScope.userid }">
						<td><button id="deleteBTN" onclick="deleteBTN('${re.no}')">삭제</button></td>
					</c:if>
				</tr>
				<tr>
					<td colspan="2">작성자 ID : ${re.u_id} / 작성일자 : ${re.r_date}</td>
				</tr>
				<tr>
					<td colspan="2">${re.r_memo}</td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<table class="downtbl" style="text-align: center; font-size: large;">
		<!--  페이지 표시 -->
		<tr>
			<td><c:if test="${pageVO.prev}">
					<a href="Ic_review?page=${pageVO.startPage-1}">[이전]</a>
				</c:if> <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
					var="idx">
					<a href="Ic_review?page=${idx}">${idx}</a>
				</c:forEach> <c:if test="${pageVO.next}">
					<a href="Ic_review?page=${pageVO.endPage+1}">[Next]</a>
				</c:if></td>
		</tr>
	</table>

	<script type="text/javascript">
		function deleteBTN(no) {
			let confirmflag = confirm("정말 삭제하시겠습니까?");
			if (confirmflag) {
				$.ajax({
					url : 'deletereview',
					data : 'no=' + no,
					success : function() {
						location.reload();
					}
				})
			}
		}

		function inputReview() {
			window
					.open(
							'reviewpopup',
							'reviewinput',
							'width=500,height=400, left=550, top=250,staus =no,directoryies=0, location=no,toolbar=no,menubar=no');
		}
	</script>
</body>
</html>