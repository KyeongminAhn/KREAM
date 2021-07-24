<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bidlist</title>
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
// 구매 입찰 취소
function bidDelete (number) {
	var check = confirm('입찰을 취소 하시겠습니까?');
	if (check) {
		console.log(number);
		location.href = 'biddelete?bidnumber=' + number;
		alert('최소 되었습니다.');
	} else {
		alert('삭제를 취소 합니다.');
	}
}

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
	<h1>구매 입찰 리스트 + bidlist</h1>

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
		<!-- 페이징 -->
			<table>
				<tr>
					<th>구매 입찰 제품 번호</th>
					<th>구매 입찰 가격</th>
					<th>구매 입찰 사이즈</th>
					<th>구매 입찰 수정</th>
					<th>구매 입찰 취소</th>
				</tr>
				<c:forEach var="bid" items="${bidList}">
					<tr>
						<td><a href="productview?pnumber=${bid.bidpnumber}&page=${paging.page}">${bid.bidpnumber}</a></td>
						<td>${bid.bidprice}</td>
						<td>${bid.bidsize}</td>
						<td><a href="bidupdate?bidnumber=${bid.bidnumber}">수정</a></td>
						<td><button onclick="bidDelete('${bid.bidnumber}')">취소</button></td>
					</tr>
				</c:forEach>
			</table>
	
			<c:choose>
				<c:when test="${paging.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="bidlistpage?page=${paging.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
	
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
				step="1">
				<c:choose>
					<c:when test="${i eq paging.page}">
						${i} <!-- 현재 클릭한 페이지는 클릭 못하게 -->
					</c:when>
					<c:otherwise>
						<a href="bidlistpage?page=${i}">${i}</a>
						<!-- 현재 클릭한 페이지를 제외하고 클릭 할수 있게 -->
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<c:choose>
				<c:when test="${paging.page>=paging.maxPage}">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="bidlistpage?page=${paging.page+1}">[다음]</a>
				</c:otherwise>
			</c:choose>

	</div>

</body>
</html>