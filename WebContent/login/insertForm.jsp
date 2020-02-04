<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/insert.css" rel="styleSheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	
$('#id').blur(function(){
	
	var user_id=$('#id').val();
	console.log(user_id);
	
	
	});
});
</script>

<div class="header">
<div class="logo">
<h1><a href="/LOLSearch">LOLSearch</a></h1>
</div>
</div>
<div class="content">
<form action="">
<div class="table">
<div class="row_group">
<label>아이디</label><br>
<input id="id" type="text" name="id" class="table_cell" maxlength="15">
</div><div class="row_group">
<label>비밀번호</label>
<input type="password" name="pw1" class="table_cell" maxlength="15">
</div><div class="row_group">
<label>비밀번호 재확인</label><br>
<input type="password" name="pw2" class="table_cell" maxlength="15">
</div><div class="row_group">
<label>이름</label><br>
<input type="text" name="name" class="table_cell 3"><br>
</div><div class="row_group">
<label>생년월일</label><br>
<div class="date" >
<input type="text" name="year" replacehoder="년(4자)" maxlength="4" class="table_cell_3 table_cell">
<select name="month" class="table_cell_3 table_cell">
<option value="">월</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>
<input type="text" name="day" maxlength="2" class="table_cell_3 table_cell"><br>
</div>
</div><div class="row_group">
<label>성별</label><br>
<select name="gender" class="table_cell">
<option value="">성별</option>
<option value="남">남</option>
<option value="여">여</option>
</select>
</div>
<div class="row_group">
<label>이메일</label>
<input type="text" name="email" class="table_cell">
</div>
<div class="row_group">
<input type="submit" value="가입하기" class="int_btn">
</div>
</div>
</form>
</div>
</body>
</html>