<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #E8F5FF;
}

h1 {
	text-align: center;
}

table {
	margin: auto;
	margin-top: 30px;
	width: 80%;
	background-color: ghostwhite;
	border-radius: 16px;
	box-shadow: 0 0 8px #deb13a;
}

td {
	padding: 5px;
}

#select {
	background-color: #E8F5FF;
	border-radius: 16px;
}
#reservation{
	margin-top:30px;
	left: 40%;
	position: relative;
	font-size: 20px;
	background-color: #78EFAD;
	border: groove ;
	border-radius: 10px;
}
#reservation:hover{
	background-color: #50C785;
	border: ridge ;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<h1>붕붕이 예약 페이지</h1>

	<table>
		<tr>
			<td><select id="select" name="select" onchange="select_kind()">
					<option selected disabled value="">차종을 입력하세요</option>

					<c:forEach items="${BBElist}" var="bbe">
						<c:choose>
							<c:when test="${bbe.state == '사용가능'}">
								<option id="kind" value="${bbe.taxi_no}" >${bbe.taxi_kind} -${bbe.state}-</option> 
							</c:when>
							<c:otherwise>
								<option disabled value="${bbe.taxi_kind}">${bbe.taxi_kind} -${bbe.state}-</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>

			</select></td>
			
			<td>인승 : <a id="cnt"></a></td>
		</tr>
		<tr>
			<td colspan="2">가격 : 기본 <a id="price"></a> 원 * 시간(분) 1000 원</td>
		</tr>
	</table>
	
	<input id="reservation" type="button" value="예약하기" onclick="reservation_BTN()" > 

	<script type="text/javascript">
		var cnt;
		var price;
		var taxi_no;
		function select_kind() {
			var select = document.getElementById("select"); 
			// select element에서 선택된 option의 value가 저장된다. 
			 taxi_no = select.options[select.selectedIndex].value;
			$.ajax({ 
				type: 'GET', 
				url: 'kind_one', 
				data: { 
					no:taxi_no  
				},
				success: function(data){ 
					cnt = data.cnt;
					price = data.price;
					document.getElementById("cnt").text = cnt; 
					document.getElementById("price").text = price; 
				},	
				error: function(){
				 		alert("error");
				} 
			}); //end ajax 
		}
		
		function reservation_BTN() {
			var select = document.getElementById("select"); 
			 taxi_no = select.options[select.selectedIndex].value;
			 if(taxi_no == ''){
				 alert('차종류를 선택하세요!');
			 }else{
				 let confirmflag = confirm("정말 예약하시겠습니까?");
				 if(confirmflag){
					$.ajax({
						url: 'reservationtaxi',
						data: "no=" + taxi_no,
						success: function(){ 
							self.close();
						}
					});
				 }
			 }
		}
	</script>
</body>
</html>