<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/LOLSearch/css/sidebar.css" type="text/css">
<script src="./js/jquery-3.4.1.js"></script>
<%
String type=request.getParameter("type");
String user_id = (String)session.getAttribute("user_id");
String user_nickname=(String)session.getAttribute("usernickName");
int postscount=0;
int commentcount=0;
String profileicon="";
if(session.getAttribute("userprofileicon")==null){
	profileicon="./img/no-img.png";
}else{
	profileicon=(String)session.getAttribute("userprofileicon");
}
System.out.println(profileicon);
%>

<script>

var type="<%=type%>";
$(document).ready(function() {
	if(type=="자유"){
		$("#자유").css("background-color", "#dddddd");
	}else if(type=="유머"){
		$("#유머").css("background-color", "#dddddd");
	}else if(type=="영상"){
		$("#영상").css("background-color", "#dddddd");
	}else if(type=="*"){
		$("#전체").css("background-color", "#dddddd");
	}
});
</script>
<nav>
	<div class="side_bar box">
	<div class="info">
	<%if(user_id==null) {%>
	<div class="loginBox">
	<input type="button" value="로그인" onclick="location.href='./login.kr?url=.'+window.location.href.split('LOLSearch')[1]">
	</div>
	<%}else{ %>
	<div class="userInfo">
	<a href="./config.kr?user_id=<%=user_id %>" onClick="window.open(this.href, '', 'width=500, top=300, left=700, height=430'); return false; "><img src="./img/config.png"></a>
	<div class="userInfoBox">
	<img class="user_icon" src="<%=profileicon%>">
	<p><b><%=user_nickname %></b> </p>
	<p>게시글:<%=postscount %>개</p>
	<p>덧글:<%=commentcount %>개</p>
	</div>
	<div class="btn_group">
	<input type="button" value="글쓰기" class="mouse" >
	</div>
	</div>
	<%} %>
	</div>
	<div class="board">
	<div class="board_content">
	<ul>
	<li class="title">홈</li>
	<a href="./community.net?type=*"><li class="list" id="전체">전체</li></a>
	</ul>
	</div>
	<div class="board_content">
	<ul>
	<li class="title">커뮤니티</li>
	<a href="./community.net?type=자유"><li class="list" id="자유">자유</li></a>
	<a href="./community.net?type=유머"><li class="list" id="유머">유머</li></a>
	<a href="./community.net?type=영상"><li class="list" id="영상">영상</li></a>
	</ul>
	</div>
	</div><!-- board -->
	</div><!-- side_bar -->
</nav>
