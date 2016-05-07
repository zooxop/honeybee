<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="projectDAO.FollowerDAO"%>
<%@page import="projectDAO.FollowingDAO"%>
<%@page import="projectVO.FollowerVO"%>
<%@page import="projectVO.FollowingVO"%>
<%@page import="projectDAO.LikesDAO"%>
<%@page import="projectDAO.CommentsDAO"%>
<%@page import="projectVO.CommentsVO"%>
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
<title>My Page</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/favi.png" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<script src="//code.jquery.com/jquery.js"></script>
<link href="./css/main.css" rel="stylesheet">
<link href="./css/myPage.css" rel="stylesheet">

</head>
<body>
<%@ include file = "UpBar.jsp" %>
<%
	MembersVO userVo = (MembersVO)session.getAttribute("vo");
	BoardsDAO bdao = new BoardsDAO();
	ArrayList<BoardsVO> blist = bdao.selectAll(vo.getMemberno());
	MembersDAO mdao = new MembersDAO();
	CommentsDAO cdao = new CommentsDAO();
	ArrayList<CommentsVO> clist = new ArrayList<CommentsVO>();
	FollowingDAO fdao = new FollowingDAO();
	FollowerDAO frdao = new FollowerDAO();
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
			<img class="img-circle myImg profileImgTime" src="<%= vo.getProfileimg() %>" alt="test">
		</div>
		
		<div class="col-xs-12 myDiv edit">
		<button type="button" class="btn btn-primary btn-xs edit" id="profile" >edit</button>
		</div>
				
		<div class="col-xs-12 myDiv">
			<button type="button" class="btn btn-warning" id="setup">환경설정</button>
		</div>
		<div class="col-xs-12 myDiv">
			<%
				ArrayList<FollowingVO> fvo = fdao.selectAll(userVo.getMemberno());
				ArrayList<FollowerVO> frvo = frdao.selectAll(userVo.getMemberno());
			%>
			<span data-toggle="modal" class="followCursor" data-target="#myModal3<%= vo.getMemberno()%>">팔로잉 : <%= fdao.selectCount(vo.getMemberno()) %>명 </span><br /><br />
			<span data-toggle="modal" class="followCursor" data-target="#myModal4<%= vo.getMemberno()%>">팔로워 : <%= frdao.selectCount(vo.getMemberno()) %>명</span>
		</div>

	</div>
</div>
<%
	for(BoardsVO bvo : blist){
%>
<div class="container container1">
	<div id="myBoards" class="myBoards">
		<div class="row">
			<div class="col-xs-12 uploadId">
				<img class="img-circle img1" src="<%= vo.getProfileimg() %>" alt=""/> <strong><%= vo.getNickname() %></strong>
				<button type="button" class="btn btn-danger btn-sm btnDelete" onclick="boardDelete(<%=bvo.getBoardno()%>)">
				삭제
				</button>
			</div>
			<div class="col-xs-12 time">
				<p><%=bvo.doDiffOfDate(nowTime) %> 전</p>
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
				<%-- <button type="button" class="btn btn-default btn-sm" onclick="boardLike(<%= bvo.getBoardno()%>,<%= userVo.getMemberno()%>)"> --%>
		 			<img src="./images/honey_empty.png" alt="" class="honeyLike" onclick="boardLike(<%= bvo.getBoardno()%>,<%= userVo.getMemberno()%>)"/>
				<!-- </button> -->
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
			<%-- <strong><%= mvoComment.getNickname()%></strong>	<%=cvo.getContents() %><br /> --%>
			<div><span class="writerNick">@<%= mvoComment.getNickname()%></span>
			<%= cvo.getContents() %>
			<div class="CommentTime"><%=cvo.doDiffOfDate(nowTime)%> 전</div><br /></div>
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
		<div class="modal fade" id="myModal3<%= vo.getMemberno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel3">팔로잉</h4>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="followingWho.jsp?mno=<%=vo.getMemberno() %>" frameborder="0" class="embed-responsive-item" name="mdFrame">
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
		<div class="modal fade" id="myModal4<%=vo.getMemberno() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel4">팔로워</h4>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe src="followerWho.jsp?mno=<%=vo.getMemberno() %>" frameborder="0" class="embed-responsive-item" name="mdFrame">
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
	
	var w2 = 400;
	var h2 = 260;
	var LeftPosition2=(screen.width-w2)/2;
	var TopPosition2=(screen.height-h2)/2;
	
	var w3 = 300;
	var h3 = 160;
	var LeftPosition3=(screen.width-w3)/2;
	var TopPosition3=(screen.height-h3)/2;
	
	var pageValue = 0;

	$(function(){
	$("#setup").on("click", function(){
			location.href = "edit.jsp";
		});
		
		var profile = document.getElementById("profile");
		profile.onclick = pupload;
	});
	
	function pupload(){
		var popupProfile = window.open("pupload.jsp", "child", "width=340, height=220, left=600, top=200");
	}
	
	
	function commentSubmit(Boardno){
		var commentVal = document.getElementById("comment"+Boardno).value;
		var popupComment = window.open("commentOk.jsp?comment="+commentVal+"&bno="+Boardno,self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
	}
	
	function modalOff(bno){
		$('#myModal'+bno).modal('hide');
		var divNum = "div"+bno;
		window.location.reload();
		location.href = "myPageFix.jsp#" + divNum;
	}
	
	function boardDelete(Boardno){
		var popupComments = window.open("boardDeleteOk.jsp?boardn="+Boardno, self, "width="+w3+", height="+h3+", top="+TopPosition3+",left="+LeftPosition3);
		
	}
	
	function deleteReload(Boardno){
		var divNum = "div"+Boardno;
		window.location.reload();
		location.href = "myPageFix.jsp";
	}

	
	function boardLike(bno, mno){
		var popupComment = window.open("likeOk.jsp?bno="+bno+"&mno="+mno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
	}
	function likeReload(bno){
		var divNum = "div"+bno;
		window.location.reload();
		location.href = "myPageFix.jsp#" + divNum;
	}
	function boardLikeDelete(bno, mno){
		var popupComment = window.open("likeOkDelete.jsp?bno="+bno+"&mno="+mno, self,"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
	}
</script>
</body>
</html>
