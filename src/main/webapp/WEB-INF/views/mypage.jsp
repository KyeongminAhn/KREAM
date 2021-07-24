<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<h2>mypage.jsp</h2>
<body>
	<a href="memberupdate">회원정보수정</a> <br>
	<a href="addresswritepage">주소 등록</a> <br>
	<a href="addressview?id=${sessionScope.loginMember}">주소 확인</a> <br>
	<a href="bidlistpage?bidid=${sessionScope.loginMember}">구매 입찰 내역</a> <br>
	<a href="asklistpage?askid=${sessionScope.loginMember}">판매 입찰 내역</a> <br>
	<a href="bidimmediatelylistpage?bidid=${sessionScope.loginMember}">구매 내역</a> <br>
	<a href="askimmediatelylistpage?askid=${sessionScope.loginMember}">판매 내역</a> <br>
</body>
</html>