<%@page import="projectDAO.CommentsDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		String c = request.getParameter("cno");
		int cno = 0;
		if(c != null){
			cno = Integer.parseInt(c);
		}
		CommentsDAO cdao = new CommentsDAO();
		cdao.deleteOne(cno);		
	%>

	<div class="reOk">
			댓글이 삭제되었습니다.
	</div>
	
	<div>
		<button type="button" onclick="deleteCom(<%=cno %>)" class="btn btn-warning onClose">확인</button>
	</div>
	
	<script src="//code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function deleteCom(){
			opener.location.reload();
			window.close();
		}
		
		
	</script>
</body>
</html>