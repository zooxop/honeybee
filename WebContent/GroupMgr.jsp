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
   
   .groupImg {
      width: 200px;
      height: 120px;
   }
	
</style>
</head>
<body>
<%@ include file="UpBar.jsp" %>
   <div class="container">
      <div class="row">
         <div class="col-md-4">
            <img class="groupImg" class="img-circle" src="../images/ck.PNG"alt="" /> 치사모임
         </div>
         <div class="col-md-4">
            <img class="groupImg" class="img-circle" src="../images/d86.jpg" alt="" /> 클래식카모임
         </div>
         <div class="col-md-4">
            <img class="groupImg" class="img-circle" src="../images/chile_wine.jpg" alt="" /> 와인모임
         </div>
      </div>
      <br />
      <div class="row">
         <div class="col-md-4">
            <img class="groupImg" class="img-circle" src="../images/ck.PNG"alt="" /> 치사모임
         </div>
         <div class="col-md-4">
            <img class="groupImg" class="img-circle" src="../images/d86.jpg" alt="" /> 클래식카모임
         </div>
         <div class="col-md-4">
            <img class="groupImg" class="img-circle" src="../images/chile_wine.jpg" alt="" /> 와인모임
         </div>
      </div>
      <br />
      <div class="col-md-4"></div>
		<div class="col-md-4"><input type="button" value="Group만들기" class="btn btn-info" /></div>
   </div>
</body>
</html>