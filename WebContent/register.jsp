<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap-select.min.css" rel="stylesheet" />
<link href="./css/main.css" rel="stylesheet">
<link href="./css/styleRegister.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<div id="imgDiv">
			<img src="./images/HoneyBee_logo.PNG" alt="logo" class="img-rounded"/>
		</div>
		<div id="frmDiv">
			<form id="frmReg" class="form-horizontal frmCenter">
				<div class="form-group">
					<label for="emailInput">Email 주소</label><br />
					<input type="email" class="form-control" name="email" id="emailInput" placeholder="Email 주소">
					<input type="button" class="btn btn-warning pull-right" id="checkID" value="중복확인"/>
				</div>
				<div class="form-group">
					<label for="passwordInput">비밀번호</label><br />
					<input type="password" name="password" class="form-control" id="passwordInput" placeholder="비밀번호">
				</div>
				<div class="form-group">
					<label for="passwordCheckInput">비밀번호 확인</label><br />
					<input type="password" name="passwordcheck" class="form-control" id="passwordCheckInput" placeholder="비밀번호 확인">
				</div>
				<div class="form-group">
					<label for="nicknameInput">닉네임</label><br />
					<input type="text" name="nickname" class="form-control" id="nicknameInput" placeholder="닉네임">
					<input type="button" class="btn btn-warning pull-right" id="checkNick" value="중복확인"/>
				</div>
				<div class="form-group">
					<label for="phoneInput"> ('-' 없이) 폰번호</label><br />
					<input type="text" name="phone" class="form-control" id="phoneInput" placeholder="('-' 없이) 폰번호">
				</div>
				<div class="form-group">
					<label for="birthdayInput">생년월일(8자리)</label><br />
					<input type="text" name="birthday" class="form-control" id="birthdayInput" placeholder="생년월일(8자리)">
				</div>
				<div class="form-group">
					<label for="passwordKeySelect">비밀번호 찾기 힌트</label><br />
					<select name="passwordKey" id="passwordKeySelect" class="selectpicker">
						<option value="key0">비밀번호 답변</option>
						<option value="key1">보물 1호는?</option>
						<option value="key2">출신 초등학교 이름은?</option>
					</select>
				</div>
				<div class="form-group">
					<label for="passwordInput">답변 입력</label><br />
					<input type="text" class="form-control" name="answer" id="passwordInput2" placeholder="">
					<div id="submitBtn">
						<button type="button" class="btn btn-warning btn-block" id="registerOK">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	var id = false;
	var nick = false;
	$(window).on('load', function()
		{
		    $('.selectpicker').selectpicker(
		    {
		        'selectedText': 'cat'
		    });
		    var btn = document.getElementById("registerOK");
		    btn.onclick = goToRegister;
		    var checkID = document.getElementById("checkID");
		    var checkNick = document.getElementById("checkNick");
			checkID.onclick = checkIDWin;
			checkNick.onclick = checkNickWin;
			alert("데이터베이스 암호화는 일절 되어있지 않으니, 타사이트에서 자주 사용하는 아이디+비밀번호 조합은 사용을 권장하지 않습니다.");
			alert("사용하다가 해킹당해도 난몰라여 ㅋ.ㅋ")
		});
	function checkIDWin(){
		var checkID = document.getElementById("emailInput").value;
		var popupWin = window.open("emailOk.jsp?id="+checkID,"child","width=350, height=150, left=600, top=150");
	}
	function checkNickWin(){
		var checkNick = document.getElementById("nicknameInput").value;
		var popupWin = window.open("nickNameOk.jsp?nick="+checkNick, "child", "width=350, height=150, left=600, top=150");
	}
	function goToRegister(){
		var frm = document.getElementById("frmReg");  // form
		var email = document.getElementById("emailInput").value;  // email
		var password = document.getElementById("passwordInput").value;  // password
		var passwordOk = document.getElementById("passwordCheckInput").value;  // passwordOk
		var passwordKey = document.getElementById("passwordKeySelect").selectedIndex;  // passwordKey
		var passwordInput2 = document.getElementById("passwordInput2").value;  // password답변
		var phone = document.getElementById("phoneInput").value;  // 폰번호
		var birthday = document.getElementById("birthdayInput").value;  // 생일
		
		if(email == ""){
			alert("이메일을 입력해 주세요.");
			return;
		}
		if(email.indexOf('@') == -1){
			alert("이메일 형식이 잘못되었습니다.");
			return;
		}
		if(id == false){
			alert("이메일 중복검사를 해주세요.");
			return;
		}
		if(password == ""){
			alert("패스워드를 입력해 주세요.");
			return;
		}
		if(password != passwordOk){
			alert("비밀번호와 확인이 일치하지 않습니다.");
			return;
		}
		if(nick == false){
			alert("닉네임 중복검사를 해주세요.");
			return;
		}
		if(passwordKey == 0){
			alert("질문을 선택하여 주세요.")
			return;
		}
		if(passwordInput2 == ""){
			alert("비밀번호 힌트를 입력해 주세요.");
			return;
		}
		if(phone == ""){
			alert("전화번호를 입력해 주세요.");
			return;
		}
		if(birthday == ""){
			alert("생일을 입력해 주세요.");
			return;
		}
		if(birthday.length!=8){
			alert("생일은 8자리를 입력해 주세요. (주민번호 앞자리 8자리)");
			return;
		}
		if(phone.length < 10 || phone.length > 11){
			alert("전화번호는 10자리 혹은 11자리를 입력해 주세요.");
			return;
		}
		
		frm.action="registerOk.jsp";
		frm.method = "post";
		frm.submit();
	}
</script>
</body>
</html>