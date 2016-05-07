<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="projectDAO.LikesDAO"%>
<%@page import="projectVO.CommentsVO"%>
<%@page import="projectDAO.CommentsDAO"%>
<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.FollowingVO"%>
<%@page import="projectDAO.FollowingDAO"%>
<%@page import="projectVO.BoardsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Timeline</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<link rel="stylesheet" href="./css/main.css" />
<link href="./css/myPage.css" rel="stylesheet">
</head>
<body>
	<%@ include file="UpBar.jsp" %>
	<%
		MembersVO userVo = (MembersVO)session.getAttribute("vo");
		String pageValue = request.getParameter("pageValue");
		BoardsDAO dao = new BoardsDAO();
		FollowingDAO fdao = new FollowingDAO();
		ArrayList<Integer> flist = fdao.selectMemberno(vo.getMemberno()); // 내가 팔로우중인 회원번호 호출
		CommentsDAO cdao = new CommentsDAO();
		ArrayList<CommentsVO> clist = new ArrayList<CommentsVO>();
		ArrayList<BoardsVO> list = new ArrayList<BoardsVO>();
		
		// 날짜 관련
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);  // 현재 시간으로 설정.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(today);  // nowTime = 현재 시각
		
				
		if(pageValue == null){
			list = dao.selectTen(flist, 0);
		}else{
			int valval = Integer.parseInt(pageValue);
			list = dao.selectTen(flist, valval);
			if(valval != 0){
	%>
	<div id="padding60">
	
	</div>
	<div class="divn">
		<button class="btn btn-primary btn-lg col-xs-12 " onclick="getBack()" >
			이전으로
		</button>
	</div>
	<%
			}
			if(list.size() < 1){
				response.sendRedirect("time.jsp");
			}
		}
		MembersDAO mdao = new MembersDAO();
		int cnt = 0;
		for(BoardsVO bvo : list){
			vo = mdao.selectOneNo(bvo.getMemberno());
	%>
	<div id="padding60">
	
	</div>
	<div class="container container1" id="div<%= bvo.getBoardno()%>"> <!-- 게시물 관련 소스 -->
		<div class="row">
			<div class="col-xs-12 uploadId" onclick="goUser(<%= vo.getMemberno() %>)">
				<img class="img-circle img1 profileImgTime" src="<%= vo.getProfileimg() %>" alt=""/> <strong><%= vo.getNickname() %></strong>
			</div>
			<div class="col-xs-12 time">
				
				<p><%=bvo.doDiffOfDate(nowTime) %> 전</p>  <!-- 게시물 작성 시간 -->
			</div>
			<div class="col-xs-12">
				<img class="img-rounded img2" src="<%= bvo.getImgroute() %>" alt=""/>
			</div>
			<div class="conte col-xs-12">
				<p><span class="writerNick">@<%= vo.getNickname() %>&nbsp&nbsp</span><%= bvo.getContents() %></p>
			</div>
			<div class="col-xs-12 like">
				<%
					LikesDAO ldao = new LikesDAO();
					if(ldao.isExist(bvo.getBoardno(), userVo.getMemberno())){
				%>
				
				<img src="./images/honey_filled.png" alt="" class="honeyLike" onclick="boardLikeDelete(<%= bvo.getBoardno()%>,<%= userVo.getMemberno()%>)"/>
				<%
					} else{
				%>
				<img src="./images/honey_empty.png" alt="" class="honeyLike" onclick="boardLike(<%= bvo.getBoardno()%>,<%= userVo.getMemberno()%>)"/>
				<%
					}
					int cntLike = ldao.selectCount(bvo.getBoardno());
				%>
				<%= cntLike %> <span data-toggle="modal" data-target="#myModal2<%= bvo.getBoardno()%>" class="likeModal"> 명이 좋아합니다.</span>
			</div>
		</div>
		
		
		<%
			clist = cdao.selectThree(bvo.getBoardno());
			for(int i = clist.size(); i>0; i--){
				CommentsVO cvo = clist.get(i-1);
				int cmno = cvo.getMemberno();  // 이 글에 댓글을 단 사람 ( 현재 댓글단사람 회원번호)
				MembersVO mvoComment = mdao.selectOneNo(cmno);
		%>
			<%-- <img class="img-circle imgProfile img1" src="<%=mvoComment.getProfileimg() %>" alt=""/>
			<%= mvoComment.getNickname()%><p><%=cvo.getContents() %></p> --%>
			<div><span class="writerNick">@<%= mvoComment.getNickname()%></span>
			<%= cvo.getContents() %>
			<div class="CommentTime"><%=cvo.doDiffOfDate(nowTime)%> 전</div><br /></div>
		<%
			}
		%>
		<button type="button" class="btn btn-warning btn-sm btnComment" data-toggle="modal" data-target="#myModal<%= bvo.getBoardno()%>" >
			댓글
		</button>
		
	<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal<%=bvo.getBoardno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">댓글</h4>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="everyComment.jsp?bno=<%=bvo.getBoardno() %>" frameborder="0" class="embed-responsive-item" name="mdFrame">
							</iframe>
						</div>
					</div>
					<div class="modal-body">
						<input type="text" placeholder="댓글.." class="form-control" id="comment<%= bvo.getBoardno()%>"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<%-- <button type="button" class="btn btn-primary" onclick="commentSubmit(<%= bvo.getBoardno()%>)">전송</button> --%>
						<button type="button" class="btn btn-primary" onclick="commentSubmit(<%= bvo.getBoardno()%>)">전송</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 좋아요 모달 -->
		<div class="modal fade" id="myModal2<%=bvo.getBoardno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel2">좋아요</h4>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="everyLike.jsp?bno=<%=bvo.getBoardno() %>" frameborder="0" class="embed-responsive-item" name="mdFrame">
							</iframe>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
		<div>
			<br />
			<br />
			<br />
		</div>
	<!-- 버튼 -->
	
	<%
			if(cnt >= 9){  // 게시글 분할
	%>			
		<div class="divn">
			<button class="btn btn-primary btn-lg col-xs-12" onclick="tenMore()" >
				<p id="p1">더 보기</p>
			</button>
		</div>
	<%
			}
		cnt++;
		}
	%>
	
	
	
	<script type="text/javascript">	
		var w = 200;
		var h = 130;
		var LeftPosition=(screen.width-w)/2;
		var TopPosition=(screen.height-h)/2;
		var w2 = 400;
		var h2 = 260;
		var LeftPosition2=(screen.width-w2)/2;
		var TopPosition2=(screen.height-h2)/2;
		var pageValue = 0;
		
		$(document).ready(function () {
			var testval = location.href.lastIndexOf('=') + 1
            var val = location.href.substr(
				location.href.lastIndexOf('=') + 1
            );
            if(testval == 0){
            	pageValue = 0;
            }
            else{
            	pageValue = val;
            }
        });
		
		/* function everyComment(Boardno){
        	var popupComment = window.open("everyComment.jsp?bno="+Boardno ,self,"width="+w2+",height="+h2+",top="+TopPosition2+",left="+LeftPosition2);
        } */
		
		function tenMore(){
			location.href = "time.jsp?pageValue="+(parseInt(pageValue)+1);
		}
		function getBack(){
			location.href = "time.jsp?pageValue="+(parseInt(pageValue)-1);
		}
		function commentSubmit(Boardno){
			var commentVal = document.getElementById("comment"+Boardno).value;
			var popupComment = window.open("commentOk.jsp?comment="+commentVal+"&bno="+Boardno,self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		function modalOff(bno){
			$('#myModal'+bno).modal('hide');
			var divNum = "div"+bno;
			window.location.reload();
			location.href = "time.jsp#" + divNum;
		}
		
		function deleteComments(Boardno){
			var divNum = "div"+Boardno;
			window.location.reload();
			location.href = "time.jsp";
		}
		
		function commentDelete(){
			
			var popupComments = window.open("commentDeleteOk.jsp?comment="+commentVal+"&bno="+Boardno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
			
		}
		
		function goUser(mno){
			location.href = "userPage.jsp?mno="+mno;
		}
		function boardLike(bno, mno){
			var popupComment = window.open("likeOk.jsp?bno="+bno+"&mno="+mno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		function likeReload(bno){
			var divNum = "div"+bno;
			window.location.reload();
			location.href = "time.jsp#" + divNum;
		}
		function boardLikeDelete(bno, mno){
			var popupComment = window.open("likeOkDelete.jsp?bno="+bno+"&mno="+mno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		
	</script>
</body>
</html>

