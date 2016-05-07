<%@page import="projectVO.MembersVO"%>
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
		String nickname = request.getParameter("newnickname");
		String password = request.getParameter("newpw");
		
		MembersDAO dao = new MembersDAO();
		MembersVO vo = (MembersVO)session.getAttribute("vo");
		
		vo.setNickname(nickname);
		vo.setPw(password);
		
		dao.updateOne(vo);
		
		// 페이지로 이동
		response.sendRedirect("myPageFix.jsp");
	%>
	<p>회원 수정 완료</p>
</body>
</html>