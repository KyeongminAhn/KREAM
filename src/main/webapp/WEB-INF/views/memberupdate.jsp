<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updatefn() {
		var passwordConfirm = document.getElementById('pwd').value; // 사용자가 입력한 비번
		var password = '${memberUp.mpassword}'; // DB에서 가져온 비번
		if(password == passwordConfirm){
			updateform.submit();
		} else {
			alert('비밀번호가 틀립니다!!');
		}
	}
</script>
</head>
<body>
	<h2>memberupdate.jsp</h2>
	<form action="updateprocess" method="post" name="updateform">
		이메일 아이디: <input type="text" name="mid" value="${memberUp.mid}" readonly><br>
		비밀번호: <input type="text" name="mpassword" id="pwd"><br>
		이름: <input type="text" name="mname" value="${memberUp.mname}"><br>
		전화번호: <input type="text" name="mphone" value="${memberUp.mphone}"><br>
	
		<input type="button" value="수정" onclick="updatefn()">
	</form>	
</body>
</html>