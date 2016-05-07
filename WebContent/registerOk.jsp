<%@page import="projectDAO.MembersDAO"%>
<%@page import="projectVO.MembersVO"%>
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordcheck");
		String passwordKey = request.getParameter("passwordKey");
		String nickname = request.getParameter("nickname");
		String answer = request.getParameter("answer");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		
		
		
		MembersVO vo = new MembersVO(email, nickname, password, passwordKey, answer, "./images/none.jpg", phone, birthday);
		MembersDAO dao = new MembersDAO();
		
		dao.insertOne(vo);
	%>
	<script type="text/javascript">
		alert("회원가입 완료!! 환영합니다!!");
		location.href = "login.jsp";
	</script>
</body>
</html>