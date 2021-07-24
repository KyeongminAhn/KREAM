<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function memberviewAjax(mid) {
		$.ajax({
			type: 'post',
			url: 'memberviewajax',
			data: {'mid': mid},
			dataType: 'json',
			success: function(result){
				var output = "<table>";
				output += "<tr><th>ID</th> <th>PASSWORD</th> <th>NAME</th>";
				output += "<th>PHONE</th></tr>";
				output += "<tr>";
				output += "<td>"+result.mid+"</td>";
				output += "<td>"+result.mpassword+"</td>";
				output += "<td>"+result.mname+"</td>";
				output += "<td>"+result.mphone+"</td>";
				output += "</tr>";
				output += "</table>";
				
				document.getElementById('memberviewdiv').innerHTML = output; 
				
			},
			error: function(){
				console.log('에러');
			}
			
			
			
		});
	}
</script>

<style>
	table, tr, td, th {
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<h2>memberlist.jsp</h2>
	
	로그인아이디: ${sessionScope.loginMember} <br>
	
	<table>
		<tr>
			<th>이메일 아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>상세조회</th>
			<th>삭제</th>
			<th>상세조회(ajax)</th>
		</tr>
		<c:forEach var="member" items="${memberList}">
			<tr>
				<td>${member.mid}</td>
				<td>${member.mpassword}</td>
				<td>${member.mname}</td>
				<td>${member.mphone}</td>
				
				<td><a href="memberview?mid=${member.mid}">회원조회</a>
				<td><button onclick="deletefn('${member.mid}')">회원삭제</button>
				<td><button onclick="memberviewAjax('${member.mid}')">회원조회(ajax)</button>
			</tr>
		</c:forEach>
	</table>

	<div id="memberviewdiv"></div>
	
	<script>
		function deletefn(id){
			location.href="memberdelete?mid="+id;
		}
	</script>
	
	<a href="./">메인으로 돌아가기</a> <br>
	<a href="./productlist">제품목록으로 가기</a>
</body>
</html>