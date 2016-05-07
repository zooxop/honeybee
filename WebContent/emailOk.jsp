<%@page import="projectDAO.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<style type="text/css">
p{
margin-top:10%;
text-align:center;
font-size: 20px;
font-family: "고딕", dotum, sans-serif;
font-weight: bold;
}
#check1{
color:red;
}
#check2{
color:blue;
}
#btnGoBack{
margin-top:10%;
margin-left:160px;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<%
		MembersDAO dao = new MembersDAO();
		String id = request.getParameter("id");
		
		boolean check = dao.checkID(id);
		if(check){
	%>
		<p id="check1">사용할 수 없는 아이디입니다.</p>
		<script type="text/javascript">
			opener.id = false;
		</script>
	<%
		}
		else{
	%>
		<p id="check2">사용할 수 있는 아이디입니다.</p>
		<script type="text/javascript">
			opener.id = true;
		</script>
	<%
		}
	%>
	<input class="btn btn-warning"type="button" value="확인" id="btnGoBack" />
	
	<script type="text/javascript">
		window.onload = function(){
			document.getElementById("btnGoBack").onclick = function(){
				window.close();
			};
		}
	</script>
</body>
</html>