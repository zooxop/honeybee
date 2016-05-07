<%@page import="projectDAO.BoardsDAO"%>
<%@page import="projectVO.BoardsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천글</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="./css/main.css" />

<style type="text/css">


</style>

</head>
<body>
	<%@ include file="UpBar.jsp"%>
	
		<%
		MembersDAO mdao = new MembersDAO();
		BoardsDAO bdao = new BoardsDAO();
		ArrayList<BoardsVO> list = new ArrayList<BoardsVO>();
		
		
		for(BoardsVO bvo : list){
		%>
			<div class="col-xs-3">
					<a href="userPage.jsp?mno=<%= bvo.getMemberno() %> #div<%= bvo.getBoardno()%>">
						<img src="<%= bvo.getImgroute() %>" alt="" class="imgRs"/>
					</a>
				</div>	
		
		<%	
		}
	%>
		
</body>
</html>