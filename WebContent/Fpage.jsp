<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupF.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<style type="text/css">
	.groupList{
		text-align : center;
	}
	
	.grImg{
		width : 80px;
		height : 80px;
	}
	
	.container{
		margin : 0 auto;
		margin-top: 5%;
	}
	
	
</style>
</head>
<body>
<%@ include file="UpBar.jsp" %>
	<div class="container">
		<table class = "table table-bordered">
		<tr class="groupList">
			<td class="active"><h4>사진</h4></td>
			<td class="success"><h4>ID</h4></td>
		</tr>
		
		<tr class="groupList">
			<td class="default"><img class="grImg" src="../images/tomcat2.jpg" alt="" /></td>
			<td class="default">김탐캣</td>
		</tr>
		
		<tr class="groupList">
			<td class="default"><img class="grImg" src="../images/bono.jpg" alt="" /></td>
			<td class="default">박보노</td>
		</tr>

	</table>
	</div>
	
</body>
</html>