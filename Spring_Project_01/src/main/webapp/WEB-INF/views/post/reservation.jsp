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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=016e46a83b1d4e3118fd4637a80aa628&libraries=services,clusterer,drawing"></script>

<style>
a.rigthMenu {
	margin-top: 15px;
	margin-right: 20px;
	float: right;
	color: white;
	margin-right: 20px;
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

	<h1>예약하기 페이지</h1>
	<div id="map" style="width: 1000px; height: 500px; margin: auto;"></div>

	<script>
		var map = new kakao.maps.Map(document.getElementById('map'),
				{ // 지도를 표시할 div
					center : new kakao.maps.LatLng(37.505675040057994,
							127.047883157395), // 지도의 중심좌표 
					level : 10
				// 지도의 확대 레벨 
				});

		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 6
		// 클러스터 할 최소 지도 레벨 
		});
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("resources/json/BBE2.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function (i, position) {
            var maks = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(position.x, position.y)
            });
            var content =  position.gu + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '                <div><a href="#" onclick="reservationPOP()" style="font-size: 20px;">예약하기</a></div>';

            var infowindow = new kakao.maps.InfoWindow({
                content: content,
                removable: true
            });

            kakao.maps.event.addListener(maks, 'click', makeOverListener(map, maks, infowindow));
            return maks;

        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });

    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
        infowindow.close();
        return function () {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
        return function () {
            infowindow.close();
        };
    }
    
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">내위치!</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    
    
    function reservationPOP(){
    	window.open(
				'reservationPOP',
				'reservationPOP',
				'width=500,height=400, left=550, top=250,staus =no,directoryies=0, location=no,toolbar=no,menubar=no'
				);
    	
	}
    
	</script>
</body>
</html>