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
	String insertuser;
	if(ub.getId().length()==15){
		insertuser="카카오 유저";
	}else{
		insertuser="일반 유저 ";
	}
	
	
	
%>
<script type="text/javascript">
$(document).ready(function(){
	$(".unchecked").click(function(){
		$("#moreinfomation").attr("style","display:block");
		$(".checked").attr("style","display:block");
		$(".unchecked").attr("style","display:none");
	}) ;
	$(".checked").click(function(){
		$("#moreinfomation").attr("style","display:none");
		$(".checked").attr("style","display:none");
		$(".unchecked").attr("style","display:block");
	}) ;
});
</script>
<div class="body">
	<div class="header">
</div>
<div class="content" >
	<div class="box-weight">
	<div class="box">
	<h2>회원정보 </h2>
	<img src="./img/unchecked-button.png" class="mouse unchecked">
	<img src="./img/checked-button.png" class="mouse checked">
		<table>
			<tr>
				<td>계정정보</td><td><%=insertuser %></td>
			</tr><tr>
				<td>이름</td><td><%=ub.getName() %></td>
			</tr><tr>
				<td>닉네임</td><td><%=ub.getNickname() %></td>
			</tr>
		</table>
		<table id="moreinfomation">
			<tr>
				<td>생일</td><td><%=ub.getBirth() %></td>
			</tr><tr>
				<td>성별</td><td><%=ub.getGender() %></td>
			</tr><tr>
				<td>이메일</td><td><%=ub.getEmail() %></td>
			</tr><tr>
				<td>생성일자</td><td><%=ub.getReg_date() %></td>
			</tr>
			
		</table>
		<input  type="button" value="회원정보 변경하기" class="mouse btn2">
	</div>
	<div class="box">
		<div class="pass_config">
			<h2>비밀번호 변경</h2>
			<p>비밀번호 변경하는 버튼입니다 클릭해주세요.</p>
			<input type="button" value="비밀번호 변경하기" class="mouse btn2">
		</div>
	</div>
	</div>
	<div class="box-weight"> 
	<div class="box">
		<div class="leave_member">
			<h2>회원탈퇴</h2>
			<p>회원탈퇴를 하는곳입니다. kkao유저분은 설정에서 추가로 삭제해주십시요.</p>
			<input type="button" value="삭제하기" class="mouse btn2">
		</div>
	</div>
	<div class="box2"></div>
	</div>
	
</div>	<!-- content -->
</div><!-- body -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>