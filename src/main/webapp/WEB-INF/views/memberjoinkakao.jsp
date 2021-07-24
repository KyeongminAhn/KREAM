<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaoLogin</title>
</head>
<body>
	<!-- 카카오 버튼이 생기는 a태그 -->
	<div id="kakaoLogin">  
	    <a id="kakao-login-btn"></a>
	    <a href="http://developers.kakao.com/logout"></a>
	</div>
	 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type='text/javascript'>
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('javascript key');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	          
	          //로그인 성공시, kakao API를 호출한다.(카카오에 있는 데이터 불러옴)
	          Kakao.API.request({
	              url: '/v2/user/me',
	              success: function(res){
	                  console.log(res);
	                  console.log(res.id);
	                  console.log(res.kakao_account);
	                  console.log(JSON.stringify(res.properties.nickname));
	                  console.log(JSON.stringify(res.kakao_account.email));
	                  console.log(JSON.stringify(res.kakao_account.gender));
	                  console.log(JSON.stringify(res.kakao_account.birthday));
	                 $.ajax({
	                    url:"<%=request.getContextPath()%>/member/kakaoLogin",
	                    data:{"id":res.id, "name":JSON.stringify(res.properties.nickname)},
	                    Type:"post",
	                    success:function(data){
	                        //성공적으로 하고나면 이동할 url
	                        location.href="<%=request.getContextPath()%>/";
	                    }
	                    
	                 });
	              },
	              fail: function(error){
	                  alert(JSON.stringify(error));
	              }
	          });
	         //접속된 회원의 토큰값 출력됨
	        //alert(JSON.stringify(authObj));
	        
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	</script>  
</body>
</html>