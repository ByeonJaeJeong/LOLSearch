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
	var idcheck=false;
	var passcheck1=false;
	var passcheck2=false;
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,15}$/);
	$('#id').keyup(function(){
	
		var user_id=$('#id').val();
		
		if($("#id").val()==""){
			$("#id_check_value").html("아이디를 입력해주세요.");
			idcheck=false;
			return false;
		}
		if(!getCheck.test($("#id").val())){
			$("#id_check_value").html("대문자 소문자 숫자를 합친 4자~10자");
			idcheck=false;
			return false;
		}
		$.ajax({
			url:"./idcheck",
			type:"GET",
	 		data:{"user_id":user_id},
	 		success:function(data){
	 			console.log(data);
	 			if(data==2){
	 				$("#id_check_value").html("아이디를 입력해주세요.");
	 				idcheck=false;}
	 			else if(data==1){
	 				$("#id_check_value").html("사용 가능한 아이디입니다.");
	 				idcheck=true;}
	 			else{
	 				$("#id_check_value").html("사용 불가능한 아이디입니다.");
	 				idcheck=false;}
	 		}
		});
	});
	$('#pass').keyup(function(){
		if($("#pass").val()==""){
			$("#pass_check_value").html("비밀번호 를 입력해주세요.");
			passcheck1=false;
			return false;
		}
		if(!getCheck.test($("#pass").val())){
			$("#pass_check_value").html("대문자 소문자 숫자를 합친 4자~15자");
			passcheck1=false;
			return false;
		}else{
			$("#pass_check_value").html("사용할수 있는 비밀번호입니다.");
			passcheck1=true;
			return true;
		}
	});
	
	$('#pass2').keyup(function(){
			var pass1=$('#pass').val();
			var pass2=$('#pass2').val();
			if(pass1!=pass2){
				$("#pass2_check_value").html("비밀번호가 다릅니다.");
				passcheck2=false;
			}else{
				$("#pass2_check_value").html("일치합니다..");
				passcheck2=true;
			}
	});
	$("#submit_btn").click(function() {
		if(idcheck==false){
			alert("아이디 오류");
			return false;
		}
		if(passcheck1==false){
			alert("비밀번호 오류");
			return false;
		}
		if(passcheck2==false){
			alert("비밀번호 확인오류");
			return false;
		}
		if(checkz()){
		$("#join").submit();
		}
	});//submit click
});//ready 

function  checkz(){
    var hobbyCheck = false;
    var number =RegExp( /^[0-9]+$/);
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var getName= RegExp(/^[가-힣]+$/);
    var getnickName=RegExp(/^[가-힣A-Za-z0-9]{2,8}$/);
    var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
	
    if($("#name").val()==""){
    	alert("이름을 입력해주세요.");
    	$("#name").focus();
    	return false;
    }
    if(!getName.test($("#name").val())){
    	alert("한글입력만 가능합니다.");
    	$("#name").val("");
    	$("#name").focus();
    	return false;
    }
    
    if($("#nickname").val()==""){
    	alert("닉네임을 입력해주세요.");
    	$("#nickname").focus();
    	return false;
    }
    if(!getnickName.test($("#nickname").val())){
    	alert("2자~8자 한글영어숫자 사용가능");
    	$("#nickname").val("");
    	$("#nickname").focus();
    	return false;
    }
    if($("#year").val()==""){
    	alert("연도를 입력해주세요.");
    	$("#year").focus();
    	return false;
    }
    if(!number.test($("#year").val())){
    	alert("형식에 맞춰서 연도를 입력해주세요");
    	$("#year").focus();
    	return false;
    }
    
    if($("#day").val()==""){
    	alert("날짜를 입력해주세요.");
    	$("#day").focus();
    	return false;	
    }
    if(!number.test($("#day").val())){
    	alert("형식에 맞춰서 날짜를 입력해주세요");
    	$("#day").focus();
    	return false;
    }
    
    if($("#email").val()==""){
    	alert("이메일 을  입력해주세요.");
    	$("#email").focus();
    	return false;	
    }
    if(!getMail.test($("#email").val())){
    	alert("형식에 맞춰서 이메일을 입력해주세요");
    	$("#email").focus();
    	return false;
    }
    return true;
}


	

			//console.log($('input[type="submit"]').("id"));//ss
</script>

<div class="header">
<div class="logo">
<h1><a href="/LOLSearch">LOLSearch</a></h1>
</div>
</div>
<div class="content">
<form action="./MemberJoinAction.kr" id="join" method="post">
<div class="table">
<div class="row_group">
<label>*아이디</label><br>
<input id="id" type="text" name="id" class="table_cell" maxlength="10" autocomplete="off">
<br><label id="id_check_value">아이디를 입력해주세요.</label>
</div><div class="row_group">
<label>*비밀번호</label>
<input id="pass" type="password" name="pass" class="table_cell" maxlength="15">
<label id="pass_check_value"></label>
</div><div class="row_group">
<label>*비밀번호 재확인</label><br>
<input id="pass2" type="password" name="pass2" class="table_cell" maxlength="15">
<label id="pass2_check_value"></label>
</div><div class="row_group">
<label>*이름</label><br>
<input type="text" id="name" name="name" class="table_cell 3" autocomplete="off"><br>
</div><div class="row_group">
<label>*닉네임</label><br>
<input type="text" id="nickname" name="nickname" maxlength="8" class="table_cell 3" autocomplete="off"><br>
</div>
<div class="row_group">
<label>생년월일</label><br>
<div class="date" >
<input type="text" id="year" name="year" replacehoder="년(4자)" maxlength="4" class="table_cell_3 table_cell" autocomplete="off">
<select name="month" class="table_cell_3 table_cell">
<option value="" disabled="disabled">월</option>
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
<input type="text" id="day" name="day" maxlength="2" class="table_cell_3 table_cell"><br>
</div>
</div><div class="row_group">
<label>성별</label><br>
<select name="gender" class="table_cell">
<option value="" disabled="disabled">성별</option>
<option value="남">남</option>
<option value="여">여</option>
</select>
</div>
<div class="row_group">
<label>이메일</label>
<input type="text" id="email" name="email" class="table_cell" autocomplete="off">
</div>
<div class="row_group">
<input type="button" value="가입하기" class="int_btn" id="submit_btn">
</div>
</div>
</form>
</div>
</body>
</html>