<%@page import="javax.websocket.Session"%>
<%@page import="projectVO.MembersVO"%>
<%@page import="projectDAO.MembersDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<style type="text/css">

	.reOk{
		text-align: center;
		font-weight: bold;
		margin-top: 20px;
		margin : 0auto;
	}
</style>
</head>
<body>

<%
	
	String img = (String)session.getAttribute("imgsrc");
	String contents = request.getParameter("contents");
	int grp = 0;
	
	MembersDAO dao = new MembersDAO();
	MembersVO vo = (MembersVO)session.getAttribute("vo");
	
	int mno = vo.getMemberno();
	
	vo.setProfileimg(img);
	
	dao.updateImg(vo);
	
%>

	<div class="reOk">
		프로필이 변경되었습니다.
	</div>
	<div class="reOk">
		<button type="button" onclick="Profile()" class="btn btn-warning onClose" data-dismiss="modal">확인</button>
	</div>
	
	<script src="//code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			var onClose = document.getElementById("onClose");
			
		}
			function Profile(){
				opener.window.location.reload();
				window.close();
		}
	</script>
	</body>
</html>