<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.BoardsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<link rel="stylesheet" href="./css/main.css" />
<style type="text/css">
	.imgRs{
		width : 250px;
		height : 250px;
	}
	.textCenter{
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="UpBar.jsp" %>
	<%
		MembersDAO mdao = new MembersDAO();
		BoardsDAO bdao = new BoardsDAO();
		String str = request.getParameter("searchInput");
		String sel = request.getParameter("sel");
		String str2 = null;
		
	%>
	<div id="paddingBot">
	</div>
	
	<div class="container">
	
	
		<div class="row">
			<%
			if(sel.equals("sel1")){
				str2 = "%"+str+"%";
				ArrayList<MembersVO> list = mdao.searchRs(str2);
				for(MembersVO mvo : list){
			%>
				<div class="col-xs-3 textCenter">
					<a href="userPage.jsp?mno=<%= mvo.getMemberno()%>">
						<img src="<%= mvo.getProfileimg() %>" alt="" class="imgRs" id="user<%= mvo.getMemberno()%>"/>
					</a>
					<label for="user<%= mvo.getMemberno()%>">
						<strong><%= mvo.getNickname() %></strong>
					</label>
				</div>
			<%
				}
			}
			else{
				str2 = "%#"+str+"%";
				ArrayList<BoardsVO> list = bdao.searchRs(str2);
				for(BoardsVO bvo : list){
			%>
				<div class="col-xs-3">
					<a href="userPage.jsp?mno=<%= bvo.getMemberno() %>#div<%= bvo.getBoardno()%>">
						<img src="<%= bvo.getImgroute() %>" alt="" class="imgRs"/>
					</a>
				</div>
			<%
				}
			}
			%>
		</div>
	</div>
		
</body>
</html>