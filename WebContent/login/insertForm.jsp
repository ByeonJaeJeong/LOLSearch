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
	var check1=false;
	var check2=false;
	$('#id').blur(function(){
	
		var user_id=$('#id').val();
	
		$.ajax({
			url:"./idcheck",
			type:"GET",
	 		data:{"user_id":user_id},
	 		success:function(data){
	 			console.log(data);
	 			if(data==2){
	 				$("#id_check_value").html("아이디를 입력해주세요.");
	 				check1=false;}
	 			else if(data==1){
	 				$("#id_check_value").html("사용 가능한 아이디입니다.");
	 				check1=true;}
	 			else{
	 				$("#id_check_value").html("사용 불가능한 아이디입니다.");
	 				check1=false;}
	 		}
		});
	});
	$('#pass2').blur(function(){
			var pass1=$('#pass').val();
			var pass2=$('#pass2').val();
			if(pass1!=pass2){
				$("#pass_check_value").html("비밀번호가 다릅니다.");
				check2=false;
			}else{
				$("#pass_check_value").html("사용 가능합니다.");
				check2=true;
			}
	});
});

			//console.log($('input[type="submit"]').("id"));//ss
</script>

<div class="header">
<div class="logo">
<h1><a href="/LOLSearch">LOLSearch</a></h1>
</div>
</div>
<div class="content">
<form action="./MemberJoinAction.kr" id="join">
<div class="table">
<div class="row_group">
<label>*아이디</label><br>
<input id="id" type="text" name="id" class="table_cell" maxlength="15" autocomplete="off">
<br><label id="id_check_value">아이디를 입력해주세요.</label>
</div><div class="row_group">
<label>*비밀번호</label>
<input id="pass" type="password" name="pass" class="table_cell" maxlength="15">
</div><div class="row_group">
<label>*비밀번호 재확인</label><br>
<input id="pass2" type="password" name="pass2" class="table_cell" maxlength="15">
<label id="pass_check_value"></label>
</div><div class="row_group">
<label>*이름</label><br>
<input type="text" name="name" class="table_cell 3" autocomplete="off"><br>
</div><div class="row_group">
<label>생년월일</label><br>
<div class="date" >
<input type="text" name="year" replacehoder="년(4자)" maxlength="4" class="table_cell_3 table_cell" autocomplete="off">
<select name="month" class="table_cell_3 table_cell">
<option value="">월</option>
<option value="01">1</option>
<option value="02">2</option>
<option value="03">3</option>
<option value="04">4</option>
<option value="05">5</option>
<option value="06">6</option>
<option value="07">7</option>
<option value="08">8</option>
<option value="09">9</option>
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
<input type="text" name="email" class="table_cell" autocomplete="off">
</div>
<div class="row_group">
<input type="submit" value="가입하기" class="int_btn" id="submit">
</div>
</div>
</form>
</div>
</body>
</html>