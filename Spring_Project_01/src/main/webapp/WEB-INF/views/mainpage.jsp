<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet" type="text/css" href="resources/css/mainpage.css"> <!-- 홈페이지에서 필요한 것들만 따온 css파일  -->
<style>
a.rigthMenu {
	margin-top: 15px;
	margin-right: 20px;
	float: right;
	color: white;
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

	<!-- 메인 -->
	<section id="main_pc">
		<div class="text">
			<h1 style="font-size: 50px;">
				택시가 필요한<br> 모든 순간, 붕붕이
			</h1>
		</div>
	</section>
	<!-- 메인 끝 -->

	<section id="passport">

		<div class="text">
			<h2>이제 불안해 하며 타지마세요!</h2>
			<b1> 무인 택시 붕붕이는 불안해하는 당신을 위해 <br>
			언제나 함께 하겠습니다. </b1>
		</div>

		<div class="sw_t">
			<div class="sw_txt3">
				<img class="sw_img3"
					src="https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/21/dailylife/20210521215023721nqde.jpg"
					width="100%">
				<h2>피곤</h2>
				<br>
				<b1>피곤한 당신 <br>이제 편하게 <br>주무세요</b1>
			</div>
			<div class="sw_txt3">
				<img class="sw_img3"
					src="https://xe.obg.co.kr/files/attach/images/4199/216/004/9b9daa0df048eabc82c659bc7967670d.jpg"
					width="105%">
				<h2>안심</h2>
				<br>
				<b1>불안해하지 말고 안심하세요</b1>
			</div>
			<div class="sw_txt3">
				<img class="sw_img3"
					src="https://cdnweb01.wikitree.co.kr/webdata/editor/202005/29/img_20200529200847_32e3c487.webp"
					width="90%">
				<h2>나 혼자</h2>
				<br>
				<b1>이제 나 혼자!</b1>
			</div>
			<div class="sw_txt3">
				<img class="sw_img3"
					src="http://www.mirae.news/news/photo/202101/3370_5159_2957.jpg"
					width="105%">
				<h2>안전</h2>
				<br>
				<b1>타는 순간 <br>당신은 붕붕이가<br>지킵니다</b1>
			</div>
		</div>
	</section>


	<div class="container_coupon">
		<section id="coupon">

			<div class="text">
				<h3 style="font-weight: bold;">
					전국 어디서든<br> 부담 없는 혜택
				</h3>
				<b1>붕붕이 회원에게만 제공되는 특별 할인</b1>
			</div>
			<div class="coupon_box2">
				<b2>COUPON</b2>
				<h3>
					붕붕이 첫 예약 🎁<br> <b>1일 1만원</b>
				</h3>
			</div>
			<div class="coupon_box2" style="background: #ffffff;">
				<b2>COUPON</b2>
				<h3>
					16시간 🕒<br> <b>12,000원</b>
				</h3>
			</div>
			<div class="coupon_box2" style="background: #ffffff;">
				<b2>COUPON</b2>
				<h3>
					3일 🚙<br> <b>109,000원</b>
				</h3>
			</div>
			<div class="coupon_box2" style="background: #ffffff;">
				<b2>COUPON</b2>
				<h3>
					5일 내내 🚙<br> <b>129,000원부터</b>
				</h3>
			</div>
		</section>
	</div>


	<section id="car">

		<div class="text" data-aos="fade-up" data-aos-duration="800">
			<h3>쉽고 편한 붕붕이 이용방법</h3>
		</div>
		<div class="container4">
			<div class="sw_txt">
				<b1> <b>예약</b> </b1>
				<p></p>
				<b2> 필요한 시간만큼 내 주변 <br>
				붕붕이존에서 원하는 택시를 선택</b2>
				<img class="sw_img"
					src="https://d353obgi8xzt9w.cloudfront.net/notice/20210617/87bbdd0932e2b253520c97f425960191.png">

			</div>

			<div class="sw_txt">
				<b1> <b>운행</b> </b1>
				<p></p>
				<b2> 붕붕이 앱 스마트키로 <br>
				차량 문을 열고 드라이브 출발!</b2>
				<img class="sw_img"
					src="https://d353obgi8xzt9w.cloudfront.net/notice/20210617/60835358e8d1d1ae05f5a551c1408b61.png">

			</div>

			<div class="sw_txt">
				<b1> <b>반납</b> </b1>
				<p></p>
				<b2> 반납 시각까지 지정된 장소에 <br>
				도착 후 붕붕이 앱 반납 버튼 누르기</b2>
				<img class="sw_img"
					src="https://d353obgi8xzt9w.cloudfront.net/notice/20210617/38b58bddccb6e162d25351bcd950adf0.png">
			</div>
		</div>
	</section>

	<section id="notice">
		<div class="container">
			<b2> <b>유의사항</b></b2>
			<br>
			<div class="content">
				<ul class="check-list">
					<c2>
					<li>예약 시점 및 대여 일시, 지역 및 장소에 따라 가격이 다를 수 있습니다.</li>
					<li>패스포트 멤버십 상세 혜택 및 가입, 해지 환불 내용은 붕붕이 앱 내에서 확인해 주세요.</li>
					<li>이용 가능한 차종과 차량 수는 제한될 수 있습니다.</li>
					<li>첫 예약 1일 1만원 쿠폰은 예약 이력이 없는 경우(신규 가입 포함) 내 쿠폰으로 자동 지급됩니다.</li>
					<li>일부 쿠폰은 선착순 수량 소진 및 당사 사정에 따라 앱 내 확인이 어려울 수 있습니다.</li>
					<li>내 쿠폰에서 쿠폰별 상세 조건을 확인해 주시기 바랍니다.</li>
					<li>쿠폰 및 이벤트는 예고 없이 변경, 종료될 수 있습니다.</li>
					</c2>
				</ul>
			</div>


		</div>
	</section>
	<section id="notice2">
		<div class="container">
			<c2> <b> ㈜붕붕이 </b> <br>
			대표자: 박병현 <br>
			사업자등록번호: 123-45-67890<br>
			주소: 경기도 용인시 공세동 476-217 (공세동)<br>
			©BUNGBUNGE</c2>

		</div>
	</section>

</body>
</html>