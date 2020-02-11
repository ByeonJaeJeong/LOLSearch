<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/LOLSearch/css/sidebar.css" type="text/css">
<script src="./js/jquery-3.4.1.js"></script>
<%
String type=request.getParameter("type");%>
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
	<div class="board">
	<ul>
	<li class="title">홈</li>
	<a href="./community.net?type=*"><li class="list" id="전체">전체</li></a>
	</ul>
	<hr>
	<ul>
	<li class="title">커뮤니티</li>
	<a href="./community.net?type=자유"><li class="list" id="자유">자유</li></a>
	<a href="./community.net?type=유머"><li class="list" id="유머">유머</li></a>
	<a href="./community.net?type=영상"><li class="list" id="영상">영상</li></a>
	</ul>
	</div><!-- board -->
	</div><!-- side_bar -->
</nav>
