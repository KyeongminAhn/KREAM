<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeview</title>
<script>
	// 공지사항 글 삭제 (관리자)
	function noticeDelete () {
		var check = confirm('공지사항 글을 삭제 하시겠습니까?');
		if (check) {
			console.log(${notice.nnumber});
			location.href = 'noticedelete?nnumber=' +${notice.nnumber};
			alert('삭제 되었습니다. 고객센터 페이지로 이동합니다.');
		} else {
			alert('삭제를 취소 합니다.');
		}
	}
</script>
</head>
<body>
	<h1>공지사항 상세 보기 + noticeview</h1>
	<div id="header">
		<a href="./">홈으로</a>
		<h6>공통 화면</h6>
		<a href="noticepage">고객센터</a>
	</div>
	
	<div id="content">
		<h6>content</h6>
		글 번호 : ${notice.nnumber}
		<br> 작성자 : ${notice.nwriter}
		<br> 제목 : ${notice.ntitle}
		<br> 내용 : ${notice.ncontents}
		<br> 작성 시간 : ${notice.ndate}
		<br>
	
		<!-- 관리자 -->
		<c:if test="${sessionScope.loginMember eq 'admin'}"> 
			<h3>관리자 전용</h3>
			<button onclick="noticeDelete()">공지사항 글 삭제</button>
		</c:if>
		<br>
	</div>

</body>
</html>