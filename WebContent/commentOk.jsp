<%@page import="projectDAO.CommentsDAO"%>
<%@page import="projectVO.MembersVO"%>
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
</head>
<style type="text/css">
	.onClose{
		margin-top:40px;
		margin-left:70px;
	}
	.reOk{
		font-weight: bold;
		margin-top: 20px;
		text-align: center;
	}
</style>
<body>
	<%
		MembersVO mvo = (MembersVO)session.getAttribute("vo");
		int mno = mvo.getMemberno();
		String contents = request.getParameter("comment");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		CommentsDAO cdao = new CommentsDAO();
		cdao.insertOne(bno, contents, mno);
	%>
	<div class="reOk">
		댓글 작성이 완료되었습니다.
	</div>
	<div>
		<button type="button" onclick="gogo(<%=bno %>)" class="btn btn-warning onClose" data-dismiss="modal">확인</button>
	</div>
	
	<script src="//code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			var onClose = document.getElementById("onClose");
		}
		function gogo(bno){
			opener.modalOff(bno);
			window.close();
		}
	</script>
</body>
</html>