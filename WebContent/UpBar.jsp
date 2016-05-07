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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style type="text/css">
	#logoImg {
	height: 50px;
	position : absolute;
	top : 3px;
	}
	#con{
		width: 1400px;
		margin: 0 auto;
		max-width: none !important;
	}
	.topPadding{
		padding-top: 0.7%;
		padding-bottom: 1%;
	}
	.paddingClear{
		padding-left: 0px;
		padding-right: 0px;
	}
	.alignOp{
		text-align: right;
	}
	#searchInput{
		border: 2px solid orange;
	}
	.rightBtn{
		margin-left: 10px;
		margin-right: 10px;
	}
	#nickName{
		vertical-align: sub;
	}
	#writeBtn{
		margin-right: 20%;
	}
	#paddingBot{
		padding-bottom: 100px;
	}
	.box{
		margin-top : 100px; 
		width:500px; 
		height: 400px; 
		border : 2px;
	}
	#hiddenSelect{
		display: none;
	}
</style>
<script type="text/javascript">
 $(function(){
	$("#my").on("click", function(){
		location.href = "myPageFix.jsp";
	});
	$("#search").on("click", function(){
		location.href = "SearchRs.jsp";
	});
	
	var writeBtn = document.getElementById("writeBtn");
	writeBtn.onclick = write;
 });
 
 
	function write(){
		var popupWrite = window.open("upload.jsp", "child", "width=330, height=220, left=600, top=200");
	}

	</script>

</head>
<body>
	<%
		Object obj = session.getAttribute("vo");
		MembersVO vo = (MembersVO)obj;
	%>
	
	<nav class="navbar navbar-default navbar-fixed-top">
 		<div class="row" id="con">
 			<div class="col-xs-2">
 				<a href="time.jsp"><img src="./images/honeybeelogo.png" id="logoImg" alt=""/></a>
			</div>
	 		<div class="col-xs-2 topPadding">
				<strong id="nickName"><%= vo.getNickname() %></strong>
	 			<button type="button" class="btn btn-warning btn-md pull-right" id="writeBtn">
	 				 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				</button>
	 		</div>	
 			<form class="col-xs-4 topPadding row" action="SearchRs.jsp" id="searchForm">
 				<div id="hiddenSelect">
 					<input type="checkbox" name="sel" value="sel1" id="sel1" checked = "checked"/>
 					<input type="checkbox" name="sel" value="sel2" id="sel2"/>
 				</div>
 				<div class="col-xs-8 paddingClear">
 					<div class="input-group">
 						<div class="input-group-btn">
 							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
 							<span id="selectWhat">@사람</span>
 							<span class="caret">
 							</span>
 							</button>
 							<ul class="dropdown-menu">
 								<li><a href="#" id="man">@사람</a></li>
 								<li><a href="#" id="hash">#태그</a></li>
 								<li class="divider"></li>
 							</ul>
 						</div>
 						<input type="text" class="form-control" id="searchInput" name="searchInput"/>
 					</div>
 				</div>
 				<div class="col-xs-4">
					<input class="btn btn-warning btn-md" type="submit" value="검색" id="search"/>
 				</div>
			</form>
			<div class="col-xs-3 topPadding alignOp">
	 			<input class="btn btn-warning rightBtn" type="button" value="My" id="my" />
	 			<input class="btn btn-warning rightBtn" type="button" id="logout2222" value="로그아웃" />
			</div>
		</div>
	</nav>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	<script type="text/javascript">
		window.onload = function(){
			var btnLogout = document.getElementById("logout");
			var selectForm = document.getElementById("selectForm");
			var recommendbtn = document.getElementById("recommend");
			
			$("#man").on("click", manClick);
			$("#hash").on("click", hashClick);
			$("#logout2222").on("click",logOutOut);
		}
		
		function logOutOut(){
			location.href = "logout.jsp";
		}
		
		
		function hashClick(){
			$("#selectWhat").html('#태그');
			$("#sel1").prop('checked', false);
	     	$("#sel2").prop('checked', true);
		}
		
		function manClick(){
			$("#selectWhat").html('@사람');
			$("#sel2").prop('checked', false);
	     	$("#sel1").prop('checked', true);
		}
		
		
	</script>
	
</body>
</html>