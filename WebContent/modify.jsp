<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
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
	#modifyImg{
		width: 100%;
	}
</style>
</head>
<body>
	<div class="container">
	<div class="row">
	<div class="col-xs-12">
		<input class="btn btn-default" type="button" value="사진첨부" />
		</div>
		<div class="col-xs-12">
		<img id="modifyImg" class="img-rounded" src="./images/dongjun.jpg" alt="" />
		</div>
		<div class="col-xs-12">
		<textarea class="form-control" rows="3"></textarea>
		</div>
		<div class="col-xs-4"> </div>
		<div class="col-xs-4">
		<input class="btn btn-default" type="submit" value="수정하기" />
		</div>
		<div class="col-xs-2"> </div>
		<div class="col-xs-2">
		<input class="btn btn-danger" type="submit" value="삭제" />
		</div>
	</div>
	</div>
</body>
</html>