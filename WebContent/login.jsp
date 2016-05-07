<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Honey-Bee Login</title>
	<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/styleLogin.css" rel="stylesheet">
</head>

<body>
	<%
		Object obj = session.getAttribute("vo");
		if(obj == null){
	%>
	<div class="container" id="container">
		<div class="row">
			<img src="./images/honeybee_logo3.PNG" alt="logo" class="img-rounded">
		</div>
<form action="loginOk.jsp" class="form-horizontal formWidth" role="form" method="post">
			<div class="form-group">
				<label for="idInput" class="col-xs-3">Email</label>
				<input type="email" class="form-control" name="id" id="idInput"/>
			</div>
			<div class="form-group">
				<label for="pwInput" class="col-xs-3">Password</label>
				<input type="password" class="form-control" name="pw" id="pwInput" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-warning btn-lg col-xs-12">로그인</button>
			</div>
			<div class="form-group">
				<a href="register.jsp" class="pull-left">회원가입</a>
				<a href="#" class="pull-right">&nbsp비밀번호 찾기</a>
				<a href="#" class="pull-right">아이디 /</a>
			</div>
		</form>
		
		
	</div>
	
	<div class="footer_1">
			2015.11.09 ~ 2016.03.18 에이콘아카데미 웹개발자과정 수료를 축하드립니다!<br /> 4.5개월동안 수고하셨습니다 ㅋ.ㅋ
		</div>
	
	<%
		}
		else{
			response.sendRedirect("time.jsp");
		}
	%>
	<script src="//code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
