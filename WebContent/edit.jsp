<%@page import="projectVO.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<style type="text/css">
	.container{
		width : 300px;
		margin-top : 10%;
	}
</style>


</head>
<body>
	<%
	Object obj = session.getAttribute("vo");
	MembersVO vo = (MembersVO)obj;
	
	%>

	<form id="frmedit" action="myPageFix.jsp">
	<div class="container">
  	 	<fieldset disabled>
		<div class="form-group has-info">
 			<label class="control-label">현재 닉네임</label>
  			<input type="text" class="form-control" value="<%=vo.getNickname()%>" name="id" id="id">
		</div>
    	</fieldset>

		<div class="form-group has-info">
 			<label class="control-label">현재 비밀번호</label>
  			<input type="password" class="form-control" name="pw" id="pw">
		</div>
		

		<div class="form-group has-info">
  			<label class="control-label">변경 할 닉네임</label>
  			<input type="text" class="form-control" name="newnickname" id="nicknameInput">
			<input type="button" class="btn btn-warning pull-right" id="checkNick" value="중복확인"/>
		</div>

		<div class="form-group has-info">
  			<label class="control-label">변경할 비밀번호</label>
  			<input type="password" class="form-control" name ="newpw" id="newpw">
		</div>
    
    	<div class="form-group has-info">
  			<label class="control-label">비밀번호 확인</label>
  			<input type="password" class="form-control" name="checkpw" id="checkpw">
		</div>
    
    	<div>
    		<button type="button" class="btn btn-info" id="editOk">수정하기</button>
    	</div>
    
	</div>
	</form>

<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
		window.onload = function(){
		    var btn = document.getElementById("editOk");
		    var checkNick = document.getElementById("checkNick");
		    
		    checkNick.onclick = checkNickWin;
		    btn.onclick = goToEdit;
		};
	var nick = false;
	function checkNickWin(){
		var checkNick = document.getElementById("nicknameInput").value;
		var popupWin = window.open("nickNameOk.jsp?nick="+checkNick, "child", "width=300, height=300, left=300, top=300");
	}
	
	function goToEdit(){
		var frm = document.getElementById("frmedit");
		var newnickname = document.getElementById("nicknameInput").value;
		var pw = document.getElementById("pw").value;  // password
		var newpw = document.getElementById("newpw").value;  // new Password
		var checkpw = document.getElementById("checkpw").value;  // Password 확인
		
		console.log("ok");		
	
		if(pw == ""){
			alert("패스워드를 입력해 주세요.");
			return;
		}
		if(newnickname == ""){
			alert("새로운 별명을 입력 주세요.")
			return;
		}
		if(newpw == ""){
			alert("새로운 비밀번호를 입력해 주세요.");
			return;
		}
		if(newpw != checkpw){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		if(pw.length < 6){
			alert("패스워드는 6자 이상입니다.");
			return;
		}
		if(!nick){
			alert("닉네임 중복검사를 해주세요.");
			return;
		}
		
		frm.action="editOk.jsp";
		frm.method = "get";
		frm.submit();
	}
</script>
</body>
</html>