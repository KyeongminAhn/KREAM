<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pointcharge</title>
<script>
	// 포인트 충전 시 입력하지 않은 내용 체크
	function check() {
		var maccount = document.getElementById('maccount').value;
		if (maccount .length == 0) {
			alert('충전 하실 금액을 입력 하세여요.');
		} else {
			pointform.submit();
		}
	}
</script>
</head>
<body>
	<h1>포인트 충전 + pointcharge</h1>
	
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
		<h3>충전 하실 금액을 입력하세요</h3>
		<!-- 계좌 등록 -->
			<form action="pointpluspage" method="post" name="pointform">
					<input type="hidden" name="mid" value="${sessionScope.loginMember}">
				금액 <input type="text" name="maccount" maxlength="50" id="maccount"> <br>
			<input type="button" value="충전" onclick="check()">
			</form>		
	</div>
</body>
</html>