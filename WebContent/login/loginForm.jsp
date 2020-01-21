<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

a:link {color: #8e8e8e; text-decoration: none;}
 a:visited { color: #8e8e8e; text-decoration: none;}
 a:hover { color: #8e8e8e; text-decoration: none;}
.bar{
	display: inline-block;
    width: 1px;
    height: 13px;
    text-indent: -999em;
    background: #e4e4e5;
}
body{
	background-color: #bcc5b63d;
}
.header{
	padding-top:200px;
	width:768px;
	margin:0 auto;
}

.center{
width:768px;
margin:0 auto;
}
.int{
font-size: 15px;
    line-height: 16px;
    position: relative;
    z-index: 9;
    width: 100%;
    height: 16px;
    padding: 7px 0 6px;
    color: #000;
    border: none;
    background: #fff;
    -webkit-appearance: none;
}
.int_btn{
display: block;
    width: 100%;
    height: 61px;
    margin: 30px 0 14px;
    padding-top: 1px;
    border: none;
    border-radius: 0;
    background-color: #03c75a;
    cursor: pointer;
    text-align: center;
    color: #fff;
    font-size: 20px;
    font-weight: 700;
    line-height: 61px;
    -webkit-appearance: none;
}
.int_area{
	position: relative;
    height: 29px;
    margin: 0 0 14px;
    padding: 10px 35px 10px 15px;
    border: solid 1px #dadada;
    background: #fff;
}
.content{
	width:460px;
	margin:0 auto;
	padding-bottom: 30px;
}
fieldset {
	border:0;
}
.find_info{
text-align: center;
}
h1{
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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