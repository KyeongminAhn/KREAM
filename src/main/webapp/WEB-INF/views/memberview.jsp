<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>memberview.jsp</h2>
	이메일아이디: ${result.mid} <br>
	비밀번호: ${result.mpassword} <br>
	이름: ${result.mname} <br>
	전화번호: ${result.mphone} <br>
	잔액: ${result.maccount} <br>
	
	<a href="./">홈으로</a>
	<a href="memberlist">리스트로 돌아가기</a>
	
</body>
</html>