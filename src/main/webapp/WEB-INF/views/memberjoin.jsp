<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	// ID 정규식 검사(이메일주소 형식의 ID)

	
	// 비밀번호 정규식 검사(8~16자리, 영문&숫자 조합)
	function pwCheck() {
	    var pw = document.getElementById('mpassword').value;
	    var pwResult = document.getElementById('pwresult');
	    var exp = /^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
	    
	    if(pw.length == 0) {
	        pwResult.style.color = 'red';
	        pwResult.innerHTML = '필수 입력 정보입니다.';
	    } else if(pw.match(exp)) {
	        pwResult.style.color = 'green';
	        pwResult.innerHTML = '유효한 형식입니다.';
	    } else {
	        pwResult.style.color = 'orange';
	        pwResult.innerHTML = '영문, 숫자 조합 8~16자리를 사용.';
	    }
	}

	// 휴대폰번호 정규식 검사(010-111(1)-1111)
	function phoneCheck() {
		var phone = document.getElementById('mphone').value;
		var phoneResult = document.getElementById('phoneresult');
		var exp = /^01([0|1|6|7|8|9]?)*-([0-9]{3,4})*-([0-9]{4})$/;
		if(phone.length == 0) {
			phoneResult.style.color = 'red';
			phoneResult.innerHTML = '필수 입력 정보입니다.';
		} else if(phone.match(exp)) {
			phoneResult.style.color = 'green';
			phoneResult.innerHTML = '유효한 형식입니다.';
	    } else {
	    	phoneResult.style.color = 'orange';
	    	phoneResult.innerHTML = '예)010-123(4)-5678';
	    }	
	}
</script>
</head>
<body>
	<h2>memberjoin.jsp</h2>	
	<form action="memberjoin" method="post">
		이메일 아이디: <input type="text" name="mid" id="mid" onkeyup="idCheck()" placeholder="예)kream@kream.co.kr"> <br>
					<span id="idresult"></span><br>
		비밀번호: <input type="password" name="mpassword" id="mpassword" onkeyup="pwCheck()" placeholder="영문,숫자 조합 8-16자"> <br>
				<span id="pwresult"></span><br>
		이름: <input type="text" name="mname"> <br>
		전화번호: <input type="text" name="mphone" id="mphone" onkeyup="phoneCheck()" placeholder="예)010-1234-5678"> <br>
				<span id="phoneresult"></span><br>
				
		<input type="submit" value="회원가입">
	</form>	
	
	<a href="memberjoinkakaopage">카카오 로그인</a>
</body>
</html>