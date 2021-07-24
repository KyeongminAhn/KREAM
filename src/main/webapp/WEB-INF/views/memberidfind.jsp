<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>memberidfind.jsp</h2>
 	<form action="memberidfind" method="post">
		전화번호: <input type="text" name="mphone" id="mphone" onkeyup="phoneCheck()" placeholder="가입하신 휴대폰 번호"> <br>
		
		<input type="submit" value="이메일 아이디 찾기">
		
	</form>
</body>
</html>