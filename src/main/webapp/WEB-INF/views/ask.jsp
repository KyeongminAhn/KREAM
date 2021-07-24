<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
	
	// 판매 입찰 아이디 중복 확인
	function check(){
		var askid = '${sessionScope.loginMember}';
		console.log(askid);
			$.ajax({
				type: 'post', 
				url: 'askidcheck',
				data: {'askid': askid}, 
				dataType: 'text',
				success: function (result) { 
					if(result =="ok"){
						askintputform.submit();
					}else {
						alert('이미 판매입찰을 하셨습니다');
					}
				},
				error: function () {
					console.log('제대로 안돌고 있음');
				}
			});
		}
	
</script>

</head>
<body>
	<h1>판매 입찰 + ask</h1>
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
		<div id="information">
				제품번호 : ${product.pnumber}<br>
				제품명 : ${product.pname}<br>
				제품 브랜드 : ${product.pbrand}<br>
				발매가 : ${product.pretail}<br> 
				첨부파일: ${product.pfilename}<br>
				이미지 : <img src="resources/ProductImage/${product.pfilename}" height="150" width="115"> <br>
			</div>
		
			<!-- 페이징 -->
			<table>
				<tr>
					<th>판매 입찰 가격</th>
					<th>판매 입찰 사이즈</th>
				</tr>
				<c:forEach var="ask" items="${askList}">
					<tr>
						<td>${ask.askprice}</td>
						<td>${ask.asksize}</td>
					</tr>
				</c:forEach>
			</table>
	
			<c:choose>
				<c:when test="${paging.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="askpage?page=${paging.page-1}&pnumber=${product.pnumber}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
	
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
				step="1">
				<c:choose>
					<c:when test="${i eq paging.page}">
						${i} <!-- 현재 클릭한 페이지는 클릭 못하게 -->
					</c:when>
					<c:otherwise>
						<a href="askpage?page=${i}&pnumber=${product.pnumber}">${i}</a>
						<!-- 현재 클릭한 페이지를 제외하고 클릭 할수 있게 -->
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<c:choose>
				<c:when test="${paging.page>=paging.maxPage}">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="askpage?page=${paging.page+1}&pnumber=${product.pnumber}">[다음]</a>
				</c:otherwise>
			</c:choose>
			
			<div id="input">
			<c:if test="${sessionScope.loginMember != 'admin'}">
				<h5>판매 입찰 금액, 사이즈 입력</h5>
					<form action="askinput" method="post" name="askintputform">
						<input type="hidden" name="pnumber" value="${product.pnumber}" >
						<input type="hidden" name="askpnumber" value="${product.pnumber}" >
						<input type="hidden" name="askid" value="${sessionScope.loginMember}" >
						입찰 금액<input type="text" name="askprice" id="askprice" placeholder="금액을 입력하세요" />원 <br>
						240<input type="radio" id="asksize" name="asksize" value="240">
						250<input type="radio" id="asksize" name="asksize" value="250">
						260<input type="radio" id="asksize" name="asksize" value="260">
						270<input type="radio" id="asksize" name="asksize" value="270">
						<br>
						<input type="button" value="판매 입찰 등록" onclick="check()">
					</form>
			</c:if>
		</div>
	</div>
</body>
</html>