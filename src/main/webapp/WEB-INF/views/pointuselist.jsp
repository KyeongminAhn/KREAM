<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pointuselist</title>
<style>
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

th {
	background-color: yellow;
}
</style>
</head>
<body>
	<h1>포인트 사용 내역 + pointuselist</h1>
	
	<div id="header">
		<h6>공통 화면</h6>
		<a href="./">홈으로</a>
		<a href="noticepage">고객센터</a>
	</div>

	<div id="nav">
		<h6>nav</h6>
		<a href="pointcharge">포인트 충전</a> <br>
		<a href="pointchargelist?mid=${sessionScope.loginMember}">포인트 충전 내역</a> <br> 
		<a href="pointusepage">포인트 사용 내역</a>
	</div>

	<div id="content">
		<h6>content</h6>
		포인트 사용 내역
		
	</div>
</body>
</html>