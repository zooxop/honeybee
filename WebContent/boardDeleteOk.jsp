<%@page import="projectVO.LikesVO"%>
<%@page import="projectDAO.LikesDAO"%>
<%@page import="projectDAO.CommentsDAO"%>
<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.MembersVO"%>
<%@page import="projectDAO.BoardsDAO"%>
<%@page import="projectVO.BoardsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.reOk{
		text-align : center;
		margin-bottom : 30px;
	}

	
</style>
</head>
<body>
	<%
		BoardsDAO bdao = new BoardsDAO();
		BoardsVO bvo = new BoardsVO();	
		CommentsDAO cdao = new CommentsDAO();
		LikesDAO ldao = new LikesDAO();
		LikesVO lvo = new LikesVO();
		
		int bno = Integer.parseInt(request.getParameter("boardn"));
		ldao.deleteAll(bno);
		cdao.deleteAll(bno);
		bdao.deleteOne(bno);
		
		
	%>
	
		<div class="reOk">
		 글이 삭제되었습니다.
		</div>
	<div class ="reOk">
		<button type="button" onclick="gogo(<%= bno %>)" class="btn btn-warning">확인</button>
	</div>
	
	<script src="//code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function gogo(Boardno){
			opener.deleteReload(Boardno);
			window.close();
		}
	</script>
	
</body>
</html>