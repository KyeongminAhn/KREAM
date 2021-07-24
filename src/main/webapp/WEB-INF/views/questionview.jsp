<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionview</title>

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

	// 1대1 문의 글 삭제
	function questionDelete () {
		var check = confirm('1대1 문의 글을 삭제 하시겠습니까?');
		if (check) {
			console.log(${question.qnumber});
			location.href = 'questiondelete?qnumber=' +${question.qnumber};
			alert('삭제 되었습니다. 1대1 문의로 이동합니다.');
		} else {
			alert('삭제를 취소 합니다.');
		}
	}
	
	//댓글 내용
	$(document).ready(function(){
		$("#cwrite-btn").click(function(){
			var cwriter = document.getElementById('cwriter').value;
			var ccontents = document.getElementById('ccontents').value;
			var cbnumber = '${question.qnumber}';
			var loginUser = '<c:out value = "${sessionScope.loginMember}" />';
			console.log(cwriter);
			console.log(ccontents);
			console.log(cbnumber);
			console.log(loginUser);
			if (ccontents.length == 0) {
				alert('댓글을 입력 하세요.');
				} else {
					$.ajax({
						type: 'post',
						url: 'commentwrite',
						data:{
							'cwriter': cwriter,
							'ccontents': ccontents,
							'cbnumber': cbnumber},
						dataType: 'json',
						success: function(list){
							console.log(list);
							var output = "<table border='1'>";
							output += "<tr><th>작성자</th>";
							output += "<th>내용</th>";
							output += "<th>날짜</th>";
							output += "<th>삭제</th></tr>";
								console.log(cwriter);
								console.log(loginUser);
							for(var i in list){
								console.log(list[i].cwriter);
									output += "<tr>";
									output += "<td>"+list[i].cwriter+"</td>";
									output += "<td>"+list[i].ccontents+"</td>";
									output += "<td>"+list[i].cdate+"</td>";
									if (list[i].cwriter == loginUser) {
										output += "<td><button onclick=commentDelete("+"'"+list[i].cnumber+"'"+")>삭제</button></td>";										
									}
									output += "</tr>";
							}
							output += "</table>";
							document.getElementById('comment-list').innerHTML = output;
							document.getElementById('cwriter').value='${sessionScope.loginMember}';
							document.getElementById('ccontents').value='';
						},
						error: function(){
							console.log('문제있음.');
						}
					});
				}
			});
		});
	
	// 댓글 삭제
	function commentDelete(cnumber) {
		var cbnumber = '${question.qnumber}';
		var loginUser = '<c:out value = "${sessionScope.loginMember}" />';
		console.log(cnumber);
		console.log(cbnumber);
		if(confirm('댓글을 삭제 하시겠습니까?')){
		$.ajax({
			type: 'post',
			url: 'commentDelete',
			data:{
				'cnumber': cnumber,					
				'cbnumber': cbnumber
				},
			dataType: 'json',
			success: function(list){
				console.log(list);
				var output = "<h5>댓글 목록</h5> <table>";
				output += "<tr><th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>날짜</th>";
				output += "<th>삭제</th></tr>";
				for(var i in list){
					output += "<tr>";
					output += "<td>"+list[i].cwriter+"</td>";
					output += "<td>"+list[i].ccontents+"</td>";
					output += "<td>"+list[i].cdate+"</td>";
					if (list[i].cwriter == loginUser) {
						output += "<td><button onclick=commentDelete("+"'"+list[i].cnumber+"'"+")>삭제</button></td>";										
					}
					output += "</tr>";
				}
				output += "</table>";
				document.getElementById('comment-list').innerHTML = output;
				document.getElementById('cwriter').value='${sessionScope.loginMember}';
				document.getElementById('ccontents').value='';
			},
			error: function(){
				console.log('문제있음.');
				console.log('삭제 실패.');
				alert('삭제하지 못했습니다.');
			}
		});
	   }
	}
	
</script>
</head>
<body>
	<h1>1:1 문의 상세 보기 + questionview</h1>
	<div id="header">
		<h6>공통 화면</h6>
		<a href="./">홈으로</a> <a href="noticepage">고객센터</a>
	</div>

	<div id="nav">
		<h6>nav</h6>
		<a href="noticepage">공지사항</a> <a href="questionpage">1:1 문의</a>
	</div>

	<div id="content">
		<h6>content</h6>
		글 번호 : ${question.qnumber} <br> 작성자 : ${question.qwriter} <br>
		제목 : ${question.qtitle} <br> 내용 : ${question.qcontents} <br>
		작성 시간 : ${question.qdate} <br>

		<div id="comment">
			<h5>댓글 작성</h5>
			<div id="comment-write">
				작성자 : <input type="text" id="cwriter" readonly="readonly" value="${sessionScope.loginMember}"> <br> 
				내용 : <input type="text" id="ccontents" maxlength="100"> <br>
				<button id="cwrite-btn">댓글 등록</button>
			</div>
		</div>
		<div id="comment-list">
			<h5>댓글 목록</h5>
			<table>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>날짜</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="comment" items="${commentList}">
					<tr>
						<td>${comment.cwriter}</td>
						<td>${comment.ccontents}</td>
						<td>${comment.cdate}</td>
						<td>
							<!-- 작성자전용 --> 
							<c:if test="${sessionScope.loginMember == comment.cwriter}">
								<button onclick="commentDelete('${comment.cnumber}')">삭제</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- 작성자전용 -->
		<c:if test="${sessionScope.loginMember == question.qwriter}">
			<h3>작성자전용</h3>
			<button onclick="questionDelete()">1대1 문의 글 삭제</button>
			<a href="questionupdate?qnumber=${question.qnumber}">1대1 문의 글 수정</a>
			<br>
		</c:if>
	</div>

</body>
</html>