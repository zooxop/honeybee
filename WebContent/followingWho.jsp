<%@page import="projectVO.MembersVO"%>
<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.FollowingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="projectDAO.FollowingDAO"%>
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
		if(m != null){
			mno = Integer.parseInt(m);
		}
		FollowingDAO fdao = new FollowingDAO();
		MembersDAO mdao = new MembersDAO();
		ArrayList<FollowingVO> list = fdao.selectAll(mno);
		for(FollowingVO fvo : list){
			MembersVO mvo = mdao.selectOneNo(fvo.getFollowingmno());
	%>
		<p><%= mvo.getNickname() %></p>
	<%
		}
	%>
</body>
</html>