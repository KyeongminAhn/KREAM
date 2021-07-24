<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticewrite</title>
<script>
	// 공지사항 입력하지 않은 내용 체크
	function check() {
		var ntitle = document.getElementById('ntitle').value;
		var ncontents = document.getElementById('ncontents').value;
		if (ntitle.length == 0) {
			alert('공지사항 제목을 입력 하세여요.');
		} else if (ncontents.length == 0) {
			alert('공지사항 내용을 입력 하세요.');
		} else {
			noticeform.submit();
		}
	}
</script>
</head>
<body>
	<h1>공지사항 작성 + noticewrite</h1>
	<div id="header">
		<h6>공통 화면</h6>
		<a href="home">홈으로</a>
		<a href="noticepage">고객센터</a>
	</div>
	
	<div id="content">
		<h6>content</h6>
		<form action="noticewrite" method="post" name="noticeform">
			작성자 <input type="text" name="nwriter" value="${sessionScope.loginMember}"> <br> 
			제목 <input type="text" name="ntitle" maxlength="50" id="ntitle"> <br> 
			내용 <textarea rows="25" cols="25" name="ncontents" id="ncontents" maxlength="1000"></textarea> <br> 
			<input type="button" value="공지사항 작성" onclick="check()">
		</form>
	</div>
</body>
</html>