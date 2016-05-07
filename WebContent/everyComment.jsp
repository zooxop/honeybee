<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="projectVO.MembersVO"%>
<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.CommentsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.CommentsDAO"%>
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
	.CommentTime{
		float: right;
		font-size: 12px;
		color:gray;
	}
	.btndel{
		visibility: hidden;
	}
	.commentStyle:hover > .btndel{
		visibility: visible;
	}
	.textComment{
		color: #0D3C96;
	}
</style>

</head>
<body>
	<%
	
		Object obj = session.getAttribute("vo");
		MembersVO vo = (MembersVO)obj;
		
		// 날짜 관련
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);  // 현재 시간으로 설정.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(today);  // nowTime = 현재 시각
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		CommentsDAO dao = new CommentsDAO();
		ArrayList<CommentsVO> list = dao.selectAll(bno);
		for(CommentsVO cvo : list){
			int cmno = cvo.getMemberno();  // 이 글에 댓글을 단 사람 ( 현재 댓글단사람 회원번호)
			MembersDAO mdao = new MembersDAO();
			MembersVO mvoComment = mdao.selectOneNo(cmno);
		%>
		<%-- <div class="commentHeight">
			<strong><%= mvoComment.getNickname()%></strong>	<%=cvo.getContents() %>
			<% if(vo.getMemberno() == cvo.getMemberno()){%>
				<button class = "btn btn-xs btn-danger" id="btndel" onclick="deleteCo(<%= cvo.getAdminnum() %>)">댓삭</button>
			<%
			}
			%>
		</div>
		<br /> --%>
		
		<div class="commentStyle"><span class="textComment">@<%= mvoComment.getNickname()%></span>	<%=cvo.getContents() %>
		<% 
			if(vo.getMemberno() == cvo.getMemberno()){
		%>
				<button class = "btn btn-xs btn-danger btndel" onclick="deleteCo(<%= cvo.getAdminnum() %>)">X</button>
			<%
			}
			%>
				<div class="CommentTime"><%=cvo.doDiffOfDate(nowTime)%> 전</div><br /></div>
	<%
		}
	%>
	
	<script src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	var w = 200;
	var h = 130;
	var LeftPosition=(screen.width-w)/2;
	var TopPosition=(screen.height-h)/2;

	function deleteCo(cno){
		var popupComment = window.open("commentDeleteOk.jsp?cno="+cno,self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
	}
	

</script>
	
</body>
</html>