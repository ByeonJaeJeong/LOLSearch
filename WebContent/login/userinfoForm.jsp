<%@page import="net.User.db.UserBean"%>
<%@page import="net.User.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/userinfoForm.css" rel="styleSheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id=(String)session.getAttribute("user_id");
	
	UserDAO udao =new UserDAO();
	UserBean ub=udao.UserInfo(user_id);
	String insertuser="";
	if(ub.getId().length()==15){
		insertuser="카카오 유저";
		%>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#pass").css("display","none");
			$("#user_pass").attr("type","hidden");
			$(".pass_config>.check_group").hide();
		});
		
		</script>
		<% 
	}else{
		insertuser="일반 유저 ";
	}
	
	
	
%>
<script type="text/javascript">
$(document).ready(function(){
	$(".hide").hide();//hide class 숨기기
	
	$(".unchecked").click(function(){
		$(this).parent().parent().children(".hide").show();
		$(this).parent().parent().children(".check_group").children(".checked").show();
		$(this).hide();
		
	}) ;
	$(".checked").click(function(){
		$(this).parent().parent().children(".hide").hide();
		$(this).parent().parent().children(".check_group").children(".unchecked").show();
		$(this).hide();
	}) ;
	$(".leave_member>.btn2").click(function(){
		var check=confirm("정말로 회원 탈퇴 하시겠습니까?");
		if(check==1){
			$("#deleteMember").submit();
		}
	});
	$("#passreplace_btn").click(function(){
		if($("#input_pass").val()==$("#input_pass2").val()){
			$("#passreplace").submit();
		}
			
	});
});


</script>
<div class="body">
	<div class="header">
</div>
<div class="content" >
	<div class="box-weight">
	<div class="box">
	<h2>회원정보 </h2>
	<div class="check_group">
			<img src="./img/unchecked-button.png" class="mouse unchecked">
			<img src="./img/checked-button.png" class="mouse checked">
			</div>
		<table>
			<tr>
				<td>계정정보</td><td><%=insertuser %></td>
			</tr><tr>
				<td>이름</td><td><%=ub.getName() %></td>
			</tr>
			<tr>
				<td>생성일자</td><td><%=ub.getReg_date()%></td>
			</tr>
		</table>
		<div class="hide">
		<form action="updateUser.kr" method="post" id="updateUser">
		<input type="hidden" name="user_id" value="<%=user_id%>">
		<table>
			<tr>
				<td>닉네임</td><td><input type="text" name="nickName" maxlength="15" value="<%=ub.getNickname() %>"></td>
			</tr>
			<tr>
				<td>생일</td><td><input maxlength="8" name="birthday" type="text" value="<%=ub.getBirth() %>"></td>
			</tr><tr>
				<td>성별</td><td><input maxlength="1" name="gender" type="text" value="<%=ub.getGender() %>"></td>
			</tr><tr>
				<td>이메일</td><td><input type="text" name="email" value="<%=ub.getEmail() %>"></td>
			</tr>
		</table>
		</form>
		</div>
		<input  type="button" value="회원정보 변경하기" class="mouse btn2" onclick="$('#updateUser').submit();">
	</div>
	<div class="box">
		<div class="pass_config">
			<h2>비밀번호 변경</h2>
			<div class="check_group">
			<img src="./img/unchecked-button.png" class="mouse unchecked">
			<img src="./img/checked-button.png" class="mouse checked">
			</div>
			<p>비밀번호 변경하는 버튼입니다 클릭해주세요.</p>
			<div class="hide">
			<form action="passreplace.kr" id="passreplace">
			<input type="hidden" name="user_id" value="<%=user_id%>">
			<p><label>현재 비밀번호 </label><br>
			<input type="password" name="user_pass"></p>
			<p><label>새  비밀번호 </label><br>
			<input type="password" name="input_pass" id="input_pass"></p>
			<p><label>비밀번호 확인</label><br>			
			<input type="password" name="input_pass2" id="input_pass2"></p>
			</form>
			</div>
			<input type="button" id="passreplace_btn" value="비밀번호 변경하기" class="mouse btn2">
		</div>
	</div>
	</div>
	<div class="box-weight"> 
	<div class="box">
		<div class="leave_member">
			<h2>회원탈퇴</h2>
			<p>회원탈퇴를 하는곳입니다.</p><p> kkao유저분은 탈퇴하시고 카카오톡 에서 추가로 삭제해주십시요.</p>
			<form action="deleteMember.kr" method="post" id="deleteMember">
			<input type="hidden" value="<%=ub.getId() %>" name="user_id">
			<label id="pass">비밀번호</label>
			<input type="password" name="user_pass" id="user_pass" <%if(ub.getId().length()==15) {%> value="<%=ub.getId().substring(0, 10)%>"<%} %>>
			</form>
			<input type="button" value="탈퇴하기" class="mouse btn2" >
		</div>
	</div>
	<div class="box2"></div>
	</div>
	
</div>	<!-- content -->
</div><!-- body -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>