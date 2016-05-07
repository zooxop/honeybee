<%@page import="projectVO.MembersVO"%>
<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.LikesVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.LikesDAO"%>
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
	.userNick{
		color: #0D3C96;
	}
</style>
</head>
<body>

	<%
		String b = request.getParameter("bno");
		int bno = 0;
		if(b != null){
			bno = Integer.parseInt(b);
		}
		LikesDAO ldao = new LikesDAO();
		ArrayList<LikesVO> list =  ldao.selectAll(bno);
		MembersDAO mdao = new MembersDAO();
		for(LikesVO lvo : list){
			MembersVO mvo = mdao.selectOneNo(lvo.getMemberno());
	%>
		<p class="userNick"><%= mvo.getNickname()%></p>
	<%
		}
	%>
</body>
</html>