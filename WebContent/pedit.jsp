<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<%
 request.setCharacterEncoding("UTF-8");
 String realFolder = "";
 String filename1 = "";
 int maxSize = 1024*1024*5;
 String encType = "UTF-8";
 String savefile = "images";
 ServletContext scontext = getServletContext();
 realFolder = scontext.getRealPath(savefile);
 
 try{
  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
  Enumeration<?> files = multi.getFileNames();
     String file1 = (String)files.nextElement();
     filename1 = multi.getFilesystemName(file1);
 } catch(Exception e) {
  e.printStackTrace();
 }
 
 String fullpath = realFolder + "\\" + filename1;
 /* String shortPath = ".../.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/web/img/" + filename1; */
 String shortPath = "./images/" + filename1;
%>

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
	<script type="text/javascript"></script>
<script type="text/javascript">
window.resizeTo(510,430);
	$(function(){
		$("#cancel").on("click", function(){
			location.href = "pupload.jsp";
			window.resizeTo(330,220);
		});
		
		$("#Ok").on("click", function(){
			location.href="peditOk.jsp"
			window.resizeTo(330,220);
		});
	});
	
</script>

<style type="text/css">
	.container{
		height : 100%;
		width : 100%;
	}
	.img{
		margin-top : 4%;
		text-align : center;
		margin-bottom : 7%;
		
	}
	img{
		width : 225px;
		height : 225px;
	}
	
	#top{
	margin : 0 auto;
	margin-top : 2%;
	}

	#table{
	margin : 0 auto;
	text-align: center;
	
	}
	#table>table{
	width : 475px; 
	border : 0;
	align :center; 
	bgcolor : #dddddd;
	margin-top: 20px;
	}
	
	.row{
		text-align:center;
	}
</style>
</head>
<body>
	<form action="peditOk.jsp">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 img">
				<img class="img-rounded" src="<%=shortPath%>" name ="imgsrc" />
				<%
					session.setAttribute("imgsrc", shortPath);
				%>
			</div>
			바꾸시겠습니까?
		</div>
	</div>
	
	<div id="table">
		<table>
        	<tr>
                <td align="center" colspan="2">
            	<input type="submit" value="확인" id="Ok">
            	<input type="button" value="취소" id="cancel">
            	</td>
        	</tr>
        	</table>
        </div>
    </form>
</body>
</html>
