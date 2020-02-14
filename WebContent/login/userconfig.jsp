<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.content{
	width: 460px;
    margin: 20px 20px 10px 20px;
}
form{
margin:0;
padding:0;
}

.box{
position: relative;
    border: 1px solid #e3e3e3;
    margin: 0 0 8px 0;
    zoom: 1;
    font-size: 12px;
    color: #444444;
}
.box_shadow{
    padding: 16px 12px 14px 20px;
    background: #f8f8f8;
}
.btn_group{
	display: table;
    margin: 0 auto;
}
.btn_group input{
	display: inline-block;
    border: 1px solid #d3d3d3;
    min-width: 56px;
    height: 36px;
    padding: 0 13px;
    line-height: 34px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    text-decoration: none;
    color: #222;
    font-size: 13px;
    border-radius: 1px;
}
.submit_btn{
	background-color: #46cfa7;; 
	color: white ;
}
.reset_btn{
	background-color: white; 
	color: black ;
}
th{
width:70px;
}
</style>
</head>
<body>
<%
	
	String user_id=request.getParameter("user_id");
%>
<div class="content">
<form action="configAction.kr" method="post" enctype="multipart/form-data" >
<div class="nickname box">
	<div class="box_shadow">
	<input type="hidden" name="user_id" value="<%=user_id%>">
	<table>
		<tr>
			<th><label>별명</label></th>
			<td><input  name="nickname" type="text" maxlength="15">
			<input type="button" value="중복확인"> 
			<p>한글 영어 숫자 를 혼합한 10자 이내의 닉네임을 정해주세요</p></td>
		</tr>
	</table>
	</div>
</div>
<div class="profile-icon box">
	<div class="box_shadow">
	<table>
		<tr>
			<th><label>프로필<br> 이미지</label></th>
			<td>
				<input type="file" name="profile_icon">
				<p>10MB이하의 .jpg , .png, .gif파일만 가능합니다.</p>
				<p>가로 세로 96px 96px 의 사진으로 저장됩니다.</p>
				
		</tr>
	</table>
	</div>
</div>
	<div class="btn_group">
		<input class="submit_btn" type="submit" value="확인">
		<input class="reset_btn"type="button" value="취소" onclick="javascript:self.close();">
	</div>
</form>
</div>


</body>
</html>