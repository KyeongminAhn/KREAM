<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		table,tr,th,td {
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
		}
	</style>
</head>
<body>
	<h1>productlistpaging화면 + </h1>
	
	<table>
		<tr>
			<th></th>
			<th>상품번호</th>
			<th>상품브랜드</th>
			<th>상품이름</th>

		</tr>
		<c:forEach var="product" items="${productList}">
			<tr>
				<td><img src="resources/ProductImage/${product.pfilename}" height="150" width="115"></td>
				<td>${product.pnumber}</td>
				<td>${product.pbrand}</td>
				<td><a href="productview?pnumber=${product.pnumber}&page=${paging.page}">${product.pname}</a></td>

			</tr>
		</c:forEach>
	</table>
	
	<c:choose>
		<c:when test="${paging.page<=1}">
			[이전]&nbsp;
		</c:when>
		<c:otherwise>
			<a href="productlistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
		</c:otherwise>
	</c:choose>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
				${i}
			</c:when>
			<c:otherwise>
				<a href="productlistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:choose>
		<c:when test="${paging.page>=paging.maxPage}">
			[다음]
		</c:when>
		<c:otherwise>
			<a href="productlistpaging?page=${paging.page+1}">[다음]</a>
		</c:otherwise>
	</c:choose>
	
	
	
	<a href="./">홈으로</a>
</body>
</html>