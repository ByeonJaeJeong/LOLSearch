<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
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
<script type="text/javascript">

	$(document).ready(
			function() {
				$("#profile_icon").on(
						"propertychange change keyup paste input", function() {
							if($(this).val().length>0){
								$("#in-icon-on").attr("checked","checked");
								if($(this).val().substring($(this).val().length, $(this).val().length-4)==".png" || $(this).val().substring($(this).val().length, $(this).val().length-4)==".jpg" ||$(this).val().substring($(this).val().length, $(this).val().length-4)==".gif"){
									$(".submit_btn").attr("type","submit");	
								}else{
									$(".submit_btn").attr("type","button");
									alert("jpg png gif 중에 넣어주세요")
								}
							}else{
								$(".submit_btn").attr("type","submit");	
							}
							
						});
				$("#idcheck").on("click",function(){
					var getCheck= RegExp(/^[a-zA-Z0-9가-힣]{2,10}$/);
					if(!getCheck.test($("#nickname").val())){
						$("#nickname-check").html("사용 불가능한 닉네임입니다.");
					}else{
						$("#nickname-check").html("사용 가능한 닉네임입니다.");
					}
				});
			});
</script>
<div class="content">
<form action="configAction.kr" method="post" enctype="multipart/form-data" >
<div class="nickname box">
	<div class="box_shadow">
	<input type="hidden" name="user_id" value="<%=user_id%>">
	<table>
		<tr>
			<th><label>별명</label></th>
			<td><input id="nickname" name="nickname"  type="text" maxlength="10"  value="<%=session.getAttribute("usernickName")%>">
			<input id="idcheck" type="button" value="중복확인" > 
			<p><label id="nickname-check"></label></p>
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
				<input type="file" name="profile_icon" id="profile_icon" >
				<p>
				<input type="radio" name="in-icon" value="on" id="in-icon-on">변경
				<input type="radio" name="in-icon" value="off" id="in-icon-off" checked="checked">변경하지않음</p>
				
				<p>10MB이하의 .jpg , .png, .gif파일만 가능합니다.</p>
				<p>가로 세로 96px 96px 의 사진으로 저장됩니다.</p>
				
		</tr>
	</table>
	</div>
</div>
	<div class="btn_group">
		<input class="submit_btn"  type="submit" value="확인">
		<input class="reset_btn"type="button" value="취소" onclick="javascript:self.close();">
	</div>
</form>
</div>


</body>
</html>