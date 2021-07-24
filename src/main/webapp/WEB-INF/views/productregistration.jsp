<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 관리자만 등록할수 있게 {관리자ID : admin 관리자PW : 1234} -->
	<h1>productregistration화면</h1>
	로그인아이디: ${sessionScope.loginMember}

	<c:if test="${sessionScope.loginMember eq 'admin'}">
		<form action="productregistration" method="post"
			enctype="multipart/form-data">

			제품번호 : <input type="text" name="pnumber"><br> 제품명 : <input
				type="text" name="pname"><br> 제품브랜드 : <input
				type="text" name="pbrand"><br> 제품발매가 : <input
				type="text" name="pretail"><br> 이미지 : <input
				type="file" name="pfile"><br> <input type="submit"
				value="제품등록"><br>
		</form>
	</c:if>
</body>
</html>