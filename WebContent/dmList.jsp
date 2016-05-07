<%@page import="projectVO.DirectmessageVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.DirectmessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<style type="text/css">
	.container{
		margin-top: 10%;
	}
	div {
		/* border: 1px solid gray; */
		text-align: center;
	}
	img {
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
	<%
		DirectmessageDAO dao = new DirectmessageDAO();
		ArrayList<DirectmessageVO> list = dao.selectAll(10);  // 임시 매개변수
	%>
	<div class="container">
		<div class="row">
		<% for(DirectmessageVO vo : list){ %>
			<div class="col-md-4">
				<img class="img-circle" src="<%=vo.getImgroute() %>" alt="" /> <%=vo.getReceivenick() %>
			</div>
			<% } %>
		</div>
	</div>
</body>
</html>