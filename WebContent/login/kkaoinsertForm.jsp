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
<%
String id=(String)request.getParameter("id"); 
String pass=id.substring(0,10);
%>
<div class="header">
<div class="logo">
<h1><a href="/LOLSearch">LOLSearch</a></h1>
</div>
</div>
<div class="content">
<form action="./MemberJoinAction.kr" id="join" method="post">
<h2 style="text-align: center;">카카오 회원 추가정보</h2>
<div class="table">
<div class="row_group">
<input type="hidden" value="<%=id%>" name="id">
<input type="hidden" value="<%=pass%>" name="pass">
<label>*이름</label><br>
<input type="text" name="name" class="table_cell " autocomplete="off"><br>
</div>
<div class="row_group">
<label>*닉네임</label><br>
<input type="text" name="nickname" class="table_cell " autocomplete="off"><br>
</div>
<div class="row_group">
<label>*생년월일</label><br>
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
<label>*성별</label><br>
<select name="gender" class="table_cell">
<option value="">성별</option>
<option value="남">남</option>
<option value="여">여</option>
</select>
</div>
<div class="row_group">
<label>*이메일</label>
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