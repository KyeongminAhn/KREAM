<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionupdate</title>
<script>
	// 1대1 문의 입력하지 않은 내용 체크
	function check() {
		var qtitle = document.getElementById('qtitle').value;
		var qcontents = document.getElementById('qcontents').value;
		if (qtitle.length == 0) {
			alert('1대1 문의 제목을 입력 하세여요.');
		} else if (qcontents.length == 0) {
			alert('1대1 문의 내용을 입력 하세요.');
		} else {
			questionform.submit();
		}
	}
</script>
</head>
<body>
	<h1>1:1 문의 글 수정 (회원 전용) + questionupdate</h1>
	<div id="header">
		<h6>공통 화면</h6>
		<a href="./">홈으로</a>
		<a href="noticepage">고객센터</a>
	</div>
	
	<div id="nav">
		<h6>nav</h6>
		<a href="noticepage">공지사항</a>
		<a href="questionpage">1:1 문의</a>
	</div>
	
	<div id="content">
		<h6>content</h6>
			<form action="questionupdateprocess" method="post" name="questionform">
				작성자 <input type="text" name="qwriter" value="${sessionScope.loginMember}"> <br> 
				제목 <input type="text" name="qtitle" maxlength="50" id="qtitle"> <br>
				내용 <textarea rows="25" cols="25" name="qcontents" id="qcontents" maxlength="1000"></textarea><br> 
				<input type="button" value="1대1 문의 글 수정" onclick="check()">
			</form>
	</div>
</body>
</html>