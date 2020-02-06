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
		insertuser="for kkao";
	}else{
		insertuser="natural";
	}
	
	
	
%>
<script type="text/javascript">

</script>
<div class="body">
<div class="header">

</div>
<div class="content" >
<div class="box">
<table>
<tr>
<td>계정정보</td><td><%=insertuser %></td>
</tr><tr>
<td>이름</td><td><%=ub.getName() %></td>
</tr><tr>
<td>닉네임</td><td><%=ub.getNickname() %></td>
</tr><tr>
<td>생일</td><td><%=ub.getBirth() %></td>
</tr><tr>
<td>성별</td><td><%=ub.getGender() %></td>
</tr><tr>
<td>이메일</td><td><%=ub.getEmail() %></td>
</tr><tr>
<td>생성일자</td><td><%=ub.getReg_date() %></td>
</tr>
</table>
</div>
</div>	<!-- content -->
</div><!-- body -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>