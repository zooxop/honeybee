<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="projectVO.FollowerVO"%>
<%@page import="projectDAO.FollowerDAO"%>
<%@page import="projectVO.FollowingVO"%>
<%@page import="projectDAO.FollowingDAO"%>
<%@page import="projectDAO.LikesDAO"%>
<%@page import="projectVO.CommentsVO"%>
<%@page import="projectDAO.CommentsDAO"%>
<%@page import="projectDAO.MembersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.BoardsDAO"%>
<%@page import="projectVO.BoardsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>UserPage</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<script src="//code.jquery.com/jquery.js"></script>

<link href="./css/myPage.css" rel="stylesheet">
<style type="text/css">
	.fontNick{
		font-size: 16px;
	}
	.fontNick2{
		margin-top: 30px;
	}
</style>
</head>
<body>
<%@ include file = "UpBar.jsp" %>
<%
	MembersVO userVo = (MembersVO)session.getAttribute("vo");
	String m = request.getParameter("mno");
	int mno = 0;
	if(m != null){
		mno = Integer.parseInt(m);
		if(userVo.getMemberno() == mno){
			response.sendRedirect("./myPageFix.jsp");
		}
	}
	String b = request.getParameter("bno");
	int bno = 0;
	if(b != null){
		bno = Integer.parseInt(b);
	}
	BoardsDAO bdao = new BoardsDAO();
	MembersDAO mdao = new MembersDAO();
	MembersVO mvo = mdao.selectOneNo(mno);
	CommentsDAO cdao = new CommentsDAO();
	ArrayList<CommentsVO> clist = new ArrayList<CommentsVO>();
	ArrayList<BoardsVO> blist = bdao.selectAll(mvo.getMemberno());
	
	// 날짜 관련
	Date today = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);  // 현재 시간으로 설정.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String nowTime = sdf.format(today);  // nowTime = 현재 시각
	
%>
<div id="padding60">
	
</div>
<div class="container">
	<div id="wrapper1">
		<div class="col-xs-12 myDiv">
			<img class="img-circle myImg profileImgTime" src="<%= mvo.getProfileimg() %>" alt="test"> <!-- 유저프사 -->
		</div>
		
		<div class="col-xs-12 fontNick2">
			<strong class="fontNick"><%=mvo.getNickname() %></strong>  <!-- 유저 닉네임 -->
		</div>
		<%
			FollowingDAO fdao = new FollowingDAO();
			FollowerDAO frdao = new FollowerDAO();
			if(fdao.isExist(mvo.getMemberno(), userVo.getMemberno())){
		%>
		<div class="col-xs-12 myDiv">
			<button type="button" class="btn btn-info" onclick="unFollow(<%=mvo.getMemberno() %>,<%= userVo.getMemberno()%>)">팔로우 취소</button>
		</div>
		<%
			} else{
		%>
		<div class="col-xs-12 myDiv">
			<button type="button" class="btn btn-info" onclick="follow(<%=mvo.getMemberno() %>,<%= userVo.getMemberno()%>)">팔로우</button>
		</div>
		<%
			}
		%>
		
		<!-- 팔로우, 팔로워 수 및 누가팔로우중인지 표시 -->
		
		<div class="col-xs-12 myDiv">
			<%
				ArrayList<FollowingVO> fvo = fdao.selectAll(mvo.getMemberno());
				ArrayList<FollowerVO> frvo = frdao.selectAll(mvo.getMemberno());
			%>
			<span data-toggle="modal" class="followCursor" data-target="#myModal3<%= mvo.getMemberno()%>">팔로잉 : <%= fdao.selectCount(mvo.getMemberno()) %>명 </span><br /><br />
			<span data-toggle="modal" class="followCursor" data-target="#myModal4<%= mvo.getMemberno()%>">팔로워 : <%= frdao.selectCount(mvo.getMemberno()) %>명</span>
		</div>
	</div>
</div>
<%
	for(BoardsVO bvo : blist){
%>
<div class="container container1" id="div<%= bvo.getBoardno()%>">
	<div id="myBoards">
		<div class="row">
			<div class="col-xs-12 uploadId"  onclick="goUser(<%= mvo.getMemberno() %>)">
				<img class="img-circle img1 profileImgTime" src="<%= mvo.getProfileimg() %>" alt=""/> <strong><%= mvo.getNickname() %></strong>
			</div>
			<div class="col-xs-12 time">
				<p><%=bvo.doDiffOfDate(nowTime) %> 전</p>
			</div>
			<div class="col-xs-12">
				<img class="img-rounded img2" src="<%= bvo.getImgroute() %>" alt=""/>
			</div>
			<div class="conte col-xs-12">
				<p><span class="writerNick">@<%= mvo.getNickname() %>&nbsp&nbsp</span><%= bvo.getContents() %></p>
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
				<%= cntLike %><span data-toggle="modal" data-target="#myModal2<%= bvo.getBoardno()%>" class="likeModal"> 명이 좋아합니다.</span>
			</div>
		</div>
		
      <%
			clist = cdao.selectThree(bvo.getBoardno());
			for(int i = clist.size(); i>0; i--){
				CommentsVO cvo = clist.get(i-1);
				int cmno = cvo.getMemberno();  // 이 글에 댓글을 단 사람 ( 현재 댓글단사람 회원번호)
				MembersVO mvoComment = mdao.selectOneNo(cmno);
		%>
			<div><span class="writerNick">@<%= mvoComment.getNickname()%></span>
			<%= cvo.getContents() %>
			<div class="CommentTime"><%=cvo.doDiffOfDate(nowTime)%> 전</div><br /></div>
			<%-- <strong><%= mvoComment.getNickname()%></strong>	<%=cvo.getContents() %><br /> --%>
		<%
			}
		%>
		<button type="button" class="btn btn-warning btn-sm btnComment" data-toggle="modal" data-target="#myModal<%=bvo.getBoardno() %>">
        댓글
      	</button>
		<div>
			<br />
			<br />
			<br />
		</div>
   <!-- 모달 팝업 -->
      <div class="modal fade" id="myModal<%=bvo.getBoardno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title" id="myModalLabel">댓글달기</h4>
               </div>
                <div class="embed-responsive embed-responsive-16by9">
					<iframe src="everyComment.jsp?bno=<%=bvo.getBoardno() %>" frameborder="0" class="embed-responsive-item">
					</iframe>
				</div>
               <div class="modal-body">
                  <input type="text" placeholder="댓글.." class="form-control" id="comment<%= bvo.getBoardno()%>"/>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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
		<!-- 팔로잉 모달 -->
		<div class="modal fade" id="myModal3<%= mvo.getMemberno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel3">팔로잉</h4>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="followingWho.jsp?mno=<%=mvo.getMemberno() %>" frameborder="0" class="embed-responsive-item" name="mdFrame">
							</iframe>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<%-- <button type="button" class="btn btn-primary" onclick="commentSubmit(<%= bvo.getBoardno()%>)">전송</button> --%>
					</div>
				</div>
			</div>
		</div>
		<!-- 팔로워 모달 -->
		<div class="modal fade" id="myModal4<%=mvo.getMemberno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel4">팔로워</h4>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="followerWho.jsp?mno=<%=mvo.getMemberno() %>" frameborder="0" class="embed-responsive-item" name="mdFrame">
							</iframe>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<%-- <button type="button" class="btn btn-primary" onclick="commentSubmit(<%= bvo.getBoardno()%>)">전송</button> --%>
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
	</div>
	
	<%
	}
	%>
	<script type="text/javascript">
		var w = 200;
		var h = 130;
		var LeftPosition=(screen.width-w)/2;
		var TopPosition=(screen.height-h)/2;
		function goUser(mno){
			location.href = "userPage.jsp?mno="+mno;
		}
		function commentSubmit(Boardno){
			var commentVal = document.getElementById("comment"+Boardno).value;
			var popupComment = window.open("commentOk.jsp?comment="+commentVal+"&bno="+Boardno,self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		function modalOff(bno){
			$('#myModal'+bno).modal('hide');
			var divNum = "div"+bno;
			window.location.reload();
			location.href = "userPage.jsp?mno="+ <%=mno %> + "#" + divNum;
		}
		function boardLike(bno, mno){
			var popupComment = window.open("likeOk.jsp?bno="+bno+"&mno="+mno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		function likeReload(bno){
			var divNum = "div"+bno;
			window.location.reload();
			location.href = "userPage.jsp?mno="+ <%=mno %> + "#" + divNum;
		}
		function boardLikeDelete(bno, mno){
			var popupComment = window.open("likeOkDelete.jsp?bno="+bno+"&mno="+mno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		function follow(mno, userNo){
			var popupComment = window.open("followingOk.jsp?mno="+mno+"&userNo="+userNo, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
		function unFollow(mno, userNo){
			var popupComment = window.open("unFollowingOk.jsp?mno="+mno+"&userNo="+userNo, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
		}
	</script>
</body>
</html>
