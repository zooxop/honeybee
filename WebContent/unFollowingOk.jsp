<%@page import="projectDAO.FollowerDAO"%>
<%@page import="projectDAO.FollowingDAO"%>
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
</head>
<body>

	<%
		String fm = request.getParameter("mno");
		String um = request.getParameter("userNo");
		int followingNo = 0;
		int userNo = 0;
		if(fm != null){
			followingNo = Integer.parseInt(fm);
		}
		if(um != null){
			userNo = Integer.parseInt(um);
		}
		FollowingDAO fdao = new FollowingDAO();
		FollowerDAO frdao = new FollowerDAO();
		fdao.deleteOne(followingNo, userNo);
		frdao.deleteOne(userNo, followingNo);
	%>
	<div class="reOk">
		팔로우 취소 완료.
	</div>
	<div>
		<button type="button" onclick="gogo()" class="btn btn-warning onClose" data-dismiss="modal">확인</button>
	</div>
	
	<script src="//code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function gogo(){
			opener.likeReload();
			window.close();
		}
	</script>
</body>
</html>