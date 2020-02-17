<%@page import="net.User.db.UserBean"%>
<%@page import="net.User.db.UserDAO"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="/LOLSearch/css/header.css" rel="stylesheet" type="text/css">
<script src="./js/jquery-3.4.1.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
Kakao.init('e2464f1c7676015d97f020b788597014');
$(document).ready(function(){
		if(window.location.pathname=="/LOLSearch/main.kr"){
			$(".SearchInput").css("display","none");
		}
	  $('.btn').click(function(){
		  var number=(window.location.host+window.location.pathname).length+window.location.pathname.length;
		  var param_num=window.location.href.indexOf("?");
		  var param=window.location.href.toString();
		  var param_num2=param.split("url=");
		  if(param_num2.length>1){
			  location.href=$(this).attr("alt")+"?url="+param_num2[1];
		  }else if(param_num==-1){
			  location.href=$(this).attr("alt")+"?url="+window.location.pathname;
		  }else{
			  location.href=$(this).attr("alt")+"?url="+window.location.pathname+"&param="+window.location.href.substring(param_num+1);
		  } 
		  
		//location.href=$(this).attr("alt")+"?url="+window.location.pathname+"&param="+encodeURI(window.location.href.substring(number));
	});   
//
});
</script>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id=null;
	String usernickName=null;
	if(session.getAttribute("user_id")!=null){
	 user_id=(String)session.getAttribute("user_id");
	 
	 usernickName=(String)session.getAttribute("usernickName");
	}
%>
<div class="header">
	<div class="family-site">
		<div class="container">
			<ul>
				<li><a href="/LOLSearch">리그오브 레전드</a></li>
				<li><a href="#">전략적팀전투TFT</a></li>
				<li><a href="#">리그오브룬테라</a></li>
			</ul>
		</div>

	</div>
	<%
		if (user_id != null) {
	%>
	<div class="user_name"><%=usernickName%>님 반갑습니다.
	</div>
	<div class="ab_btn btn user_info" alt="./memberInfo.kr">회원정보</div>
	<div class="ab_btn btn logout" alt="./logOut.kr">로그아웃</div>
	<%
		}
		if (user_id == null) {
	%>
	<div class="ab_btn btn login" alt="./login.kr">로그인</div>
	<%
		}
	%>

</div>
<div class="gnb ">
	<div class="container">
		<ul>
			<li><a href="/LOLSearch">전적검색</a></li>
			<li><a href="#">챔피언 분석</a></li>
			<li><a href="#">아이템</a></li>
			<li><a href="#">랭킹</a></li>
			<li><a href="/LOLSearch/community.net">커뮤니티</a></li>
			
			<li class="SearchInput">
				<form action="/LOLSearch/Search.kr" method="get">
					<input type="text" name="userName" placeholder="소환사명 입력">
					<button type="submit">검색</button>
				</form>
			</li>
		</ul>



	</div>
</div>