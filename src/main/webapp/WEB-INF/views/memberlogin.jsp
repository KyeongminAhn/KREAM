<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>memberlogin.jsp</h2>
		<form action="memberlogin" method="post">
			아이디: <input type="text" name="mid"><br>
			비밀번호: <input type="password" name="mpassword"><br>
		
			<input type="submit" value="로그인">
			<!-- 소셜로그인 √ -->
		</form>
	
	<a href="memberjoinpage">회원가입</a>
	<a href="memberidfind">이메일아이디 찾기</a>
	<a href="memberpwfind">비밀번호 찾기</a>
</body>
</html>