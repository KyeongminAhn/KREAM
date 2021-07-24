<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pointchargelist</title>
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
</head>
<body>
	<h1>포인트 충전 내역 + pointchargelist</h1>
	
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
		포인트 충전 내역
			
		<!-- 페이징 -->
		<table>
			<tr>
				<th>충전 금액</th>
				<th>충전 날짜</th>
			</tr>
			<c:forEach var="account" items="${accountList}">
				<tr>
					<td>${account.maccount}</td>
					<td>${account.adate}</td>
				</tr>
			</c:forEach>
		</table>

		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
				<a href="pointchargelist?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>

		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
			step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i} <!-- 현재 클릭한 페이지는 클릭 못하게 -->
				</c:when>
				<c:otherwise>
					<a href="pointchargelist?page=${i}">${i}</a>
					<!-- 현재 클릭한 페이지를 제외하고 클릭 할수 있게 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="pointchargelist?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>