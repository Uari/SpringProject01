<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title>로그인 / 회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<style type="text/css">
.wrap{ 
 background-image: url("http://www.matcl.com/files/attach/images/2791205/938/810/002/06a3dd5c279db6ffad841b74df080170.jpg")
} 
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	$('#id_check').on('click', function(){ 
		$.ajax({ 
			type: 'POST', 
			url: 'id_check', 
			data: { 
				u_id:$('#u_id').val() 
				}, 
			success: function(data){ 
					alert(data.check);
			},	
			error: function(){
			 		alert("error");
			} 
		}); //end ajax 
	}); //end on 
});
</script>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="login()">로그인</button>
				<button type="button" class="togglebtn" onclick="register()">회원가입</button>
			</div>
			<form id="login" action="loginProcess" class="input-group" method="post">
				<input type="text" class="input-field" name="u_id"  placeholder="User ID" required oninvalid="this.setCustomValidity('아이디를 입력해주세요.')" oninput="this.setCustomValidity('')"/> <!-- required 필수항목 안내 문구 -->
				<input type="password" class="input-field" name="u_pwd" placeholder="Password" required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')" oninput="this.setCustomValidity('')"/> 
				<input type="checkbox" class="checkbox"><span>Remember Password</span>
				<button class="submit">로그인</button>
			</form>
			<form id="register" action="join" class="input-group" method="post">
				<input type="text" class="input-field" id="u_id" name="u_id" placeholder="User ID" required oninvalid="this.setCustomValidity('아이디는 필수 항목입니다.')" oninput="this.setCustomValidity('')">
				<button type="button" id="id_check" style="float: right;">중복체크</button>
				<input type="password" class="input-field" name="u_pwd" placeholder="Password" required oninvalid="this.setCustomValidity('비밀번호는 필수 항목입니다.')" oninput="this.setCustomValidity('')" />
				<input type="text" class="input-field" name="address" placeholder="Address" required oninvalid="this.setCustomValidity('주소는 필수 항목입니다.')" oninput="this.setCustomValidity('')" /> 
				<input type="text" class="input-field" name="p_num" placeholder="Phone_Num" required oninvalid="this.setCustomValidity('전화전호는 필수 항목입니다.')" oninput="this.setCustomValidity('')" />
				<input type="checkbox" class="checkbox"><span>Terms and conditions</span>
				<button class="submit">회원가입</button>
			</form>
		</div>
	</div>
	<script>
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
		
	</script>
</body>
</html>