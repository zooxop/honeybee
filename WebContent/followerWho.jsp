<%@page import="projectVO.MembersVO"%>
<%@page import="projectVO.FollowerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.FollowerDAO"%>
<%@page import="projectDAO.MembersDAO"%>
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
		String m = request.getParameter("mno");
		int mno = 0;
		if(m!= null){
			mno = Integer.parseInt(m);
		}
		MembersDAO mdao = new MembersDAO();
		FollowerDAO fdao = new FollowerDAO();
		ArrayList<FollowerVO> list = fdao.selectAll(mno);
		for(FollowerVO fvo : list){
			MembersVO mvo = mdao.selectOneNo(fvo.getFollowermno());
	%>
		<p><%= mvo.getNickname() %></p>
	<%
		}
	%>
</body>
</html>