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
		MembersDAO dao = new MembersDAO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean exist = dao.isExist(id, pw);
		if(exist){
			MembersVO vo = dao.selectOne(id);
			session.setAttribute("vo", vo);
			response.sendRedirect("time.jsp");
		}
		else{
	%>
	<script type="text/javascript">
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		location.href="login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>