<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script>
<!-- 로그아웃 -->
	function logout() {
		var check = confirm('로그아웃 하시겠습니까?');
		if (check) {
			location.href = "logout";
			alert('로그아웃 성공, 초기 화면으로 돌아갑니다.');
		} else {
			alert('로그아웃 취소');
		}
	}
</script>
</head>
<body>
	<h1>productview.jsp</h1>
	
	<div id="header">
		<div id=top>
			<h6>공통 화면</h6>
			<a href="noticepage">고객센터</a> <br>
			<!-- 비 로그인시 보이는 곳 -->
			<c:if test="${sessionScope.loginMember eq null}">
				<a href="memberjoinpage">회원가입</a>
				<br>
				<a href="memberloginpage">로그인</a>
				<br>
			</c:if>

			<!-- 로그인 시 보여지는  곳 -->
			<c:if test="${sessionScope.loginMember ne null}">
				<!-- 회원에게만 보이는 -->
				<h3>${sessionScope.loginMemberName}님반갑습니다!!</h3>
				<c:if test="${sessionScope.loginMember ne 'admin'}">
					<a href="mypage">마이페이지</a>
					<br>
					<a href="pointpage">포인트</a>
				</c:if>
				<br>

				<!-- 관리자에게 보여지는 곳 -->
				<c:if test="${sessionScope.loginMember eq 'admin'}">
					<input type="button" value="제품등록(관리자전용)"
						onClick="location.href='productregistrationpage'">
					<input type="button" value="회원목록조회(관리자전용)"
						onClick="location.href='memberlist'">
				</c:if>

				<!-- 모두에게 보이는 -->
				<br>
				<button onclick="logout()">로그아웃</button>
				<br>
			</c:if>
		</div>
		<div id=low>
			<a href="./">홈으로</a> <br>
			<form action="search" method="get">
				<select name="searchtype">
					<option value="pname">제품명</option>
					<option value="pbrand">제품브랜드</option>
				</select> <input type="text" name="keyword" placeholder="검색어입력"> <input
					type="submit" value="검색">
			</form>
		</div>
	</div>

	<div id="content">
	제품번호 : ${product.pnumber}<br>
	제품명 : ${product.pname}<br>
	제품 브랜드 : ${product.pbrand}<br>
	발매가 : ${product.pretail}<br> 
	첨부파일: ${product.pfilename}<br>
	이미지 : <img src="resources/ProductImage/${product.pfilename}" height="150" width="115"> <br>
	
	<a href="paging?">목록으로 돌아가기</a> <br>
	
	<c:if test="${sessionScope.loginMember ne null}">
		<c:if test="${sessionScope.loginMember == 'admin'}">
				<a href="productupdate?pnumber=${product.pnumber}">제품 수정</a>
				<a href="productdelete?pnumber=${product.pnumber}">제품 삭제</a><br>
		</c:if>
				<div id ="order">
					<h3>구매</h3>
					<a href="bidpage?pnumber=${product.pnumber}">구매 입찰</a><br>
					<a href="bidimmediatelypage?pnumber=${product.pnumber}">즉시 구매</a><br>
					<h3>판매</h3>
					<a href="askpage?pnumber=${product.pnumber}">판매 입찰</a><br>
					<a href="askimmediatelypage?pnumber=${product.pnumber}">판매 구매</a><br>
				</div>
	</c:if>
	</div>
</body>
</html>