<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/login.css" rel="styleSheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>


<div class="center">
<div class="header">
<div class="logo">
<a href="../main/main.jsp"><h1>LOLSearch</h1></a>
</div>
</div>
<div class="content">
<fieldset>
<form>
<div class="int_area">
<input class="int" type="text" name="id"><br>
</div>
<div class="int_area">
<input class="int" type="password" name="pass"><br>
</div>
<input class="int_btn" type="submit" value="로그인">
<a id="custom-login-btn" href="javascript:loginWithKakao()">
<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="432"/>
</a>
<script type="text/javascript">
var access_token="";
var token_type="";
var refresh_token="";
var expires_in="";
var scope="";
	Kakao.init('e2464f1c7676015d97f020b788597014');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({
	        success: function(authObj) {
	          alert(JSON.stringify(authObj)+"성공");
	         console.log(JSON.stringify(authObj.access_token));
	        	$.ajax(kapi.kakao.com, settings)  
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err)+"실패");
	        }
	      });
	    };
</script>
</form>
</fieldset>
<hr>
<div class="find_info">
<a href="#">회원가입</a> <span class="bar">|</span>
<a href="#">아이디 찾기</a> <span class="bar">|</span>
<a href="#">비밀번호 찾기</a> <span class="bar">|</span>
</div>
</div>
</div>
</body>
</html>