<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/reviewpopup.css">
</head>
<body>
	<h2>리뷰 작성하기</h2>
	<form name="frm" method="get" onsubmit="review_command()">
		<div class="star-rating">
			<input type="radio" id="5-stars" name="r_grade" value=5 /> 
			<label for="5-stars" class="star">★</label> 
			<input type="radio" id="4-stars" name="r_grade" value=4 /> 
			<label for="4-stars" class="star">★</label>
			<input type="radio" id="3-stars" name="r_grade" value=3 /> 
			<label for="3-stars" class="star">★</label> 
			<input type="radio" id="2-stars" name="r_grade" value=2 /> 
			<label for="2-stars" class="star">★</label>
			<input type="radio" id="1-star" name="r_grade" value=1 /> 
			<label for="1-star" class="star">★</label>
		</div>
		<div class="reviewInsert">
			<textarea rows="15" cols="65" placeholder="리뷰를 작성하세요" name="r_memo"></textarea>
		</div>
		<div id="inputBTN">
			<input type="submit" value="등록하기">
		</div>
	</form>
	<script type="text/javascript">
	function review_command()
	{
		  window.opener.name = "Ic_review"; // 부모창의 이름 설정
		  document.frm.target = "Ic_review"; // 타켓을 부모창으로 설정
		  document.frm.action = "reviewInsert";  //부모창에 호출될 url 
		  document.frm.submit();
		  self.close();
	}
	</script>
</body>
</html>