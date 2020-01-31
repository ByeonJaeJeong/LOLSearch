<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/LOLSearch/css/main.css" type="text/css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/header.jsp"/>
<!-- gnb -->

<!--  헤더 -->
<div class="frontPage">
<div class="frontPage-top">
<div class="logo">

</div>
<div class="Search-box">
<form action="/LOLSearch/main/Search.jsp" >
<input type="text" name="userName" class="Search" placeholder="소환사 검색">
<input type="submit" value="검색"class="Search-btn"> 
</form>
</div>
</div>
<!-- cotent(Search) -->
<div class="community">
<div class="community-new">
<div class="community-header">
<a href="" class="community-title">최신글</a></div>
<ul>
<li class="community_item"><a href="">
<div class="rank">1</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">2</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">3</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">4</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">5</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>

</ul>
</div>
<div class="community-best">
<div class="community-header">
<a href="" class="community-title">베스트 게시글</a></div>
<ul>
<li class="community_item"><a href="">
<div class="rank">1</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">2</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">3</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">4</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>
<li class="community_item"><a href="">
<div class="rank">5</div>
<div class="title">
<span>글제목</span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item">이름</div>
<div class="sub_item">닉네임</div>
</div>
</a></li>

</ul>
</div>
</div>
<!-- 갤러리 최신글  -->
<jsp:include page="../inc/footer.jsp"/>
</div><!-- front 종료  -->
</body>
</html>