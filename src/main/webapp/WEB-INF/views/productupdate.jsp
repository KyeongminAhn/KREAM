<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>productupdate.jsp</h1>
	<form action="productupdateprocess" method="post" name="updateform">
		제품번호 : <input type="text" name="pnumber" value="${productUpdate.pnumber}" readonly><br>
		제품명 : <input type="text" name="pname" value="${productUpdate.pname}"><br>
		제품브랜드 : <input type="text" name="pbrand" value="${productUpdate.pbrand}"><br>
		제품발매가 : <input type="text" name="pretail" value="${productUpdate.pretail}"><br>
		<br>
		<input type="submit"  value="수정">
	</form>
	
	
	
</body>
</html>