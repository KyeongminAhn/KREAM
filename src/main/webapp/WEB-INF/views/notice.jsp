<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
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
	<h1>고객센터 + 공지사항 + notice</h1>
	
	<div id="header">
		<h6>공통 화면</h6>
		<a href="./">홈으로</a>
		<a href="noticepage">고객센터</a>
	</div>
	
	<div id="nav">
		<h6>nav</h6>
		<a href="noticepage">공지사항</a> <a href="questionpage">1:1 문의</a>
	</div>
	
	<div id="content">
		<h6>content</h6>
		<!-- 관리자에게 보여지는 곳 -->
		<c:if test="${sessionScope.loginMember eq 'admin'}">
			<a href="noticewritepage">공지사항 작성하기 (관리자 전용)</a> <br>
		</c:if>
		<!-- 페이징 -->
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${notice.nnumber}</td>
					<td><a
						href="noticeview?nnumber=${notice.nnumber}&page=${paging.page}">${notice.ntitle}</a></td>
					<td>${notice.ndate}</td>
				</tr>
			</c:forEach>
		</table>

		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
				<a href="noticepage?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>

		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
			step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i} <!-- 현재 클릭한 페이지는 클릭 못하게 -->
				</c:when>
				<c:otherwise>
					<a href="noticepage?page=${i}">${i}</a>
					<!-- 현재 클릭한 페이지를 제외하고 클릭 할수 있게 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="noticepage?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>