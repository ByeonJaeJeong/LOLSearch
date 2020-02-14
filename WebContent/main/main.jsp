<%@page import="java.util.ArrayList"%>
<%@page import="net.Board.db.BoardBean"%>
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
<form action="/LOLSearch/Search.kr" >
<input type="text" name="userName" class="Search" placeholder="소환사 검색">
<input type="submit" value="검색"class="Search-btn"> 
</form>
</div>
</div>
<!-- cotent(Search) -->
<div class="community">
<div class="community-header">
<a href="" class="community-title">최신글</a>
</div>
<ul>
<%
	ArrayList<BoardBean> bbList=new ArrayList<BoardBean>();
	bbList=(ArrayList<BoardBean>)request.getAttribute("bbList");
	System.out.println(bbList.size());
	for(int i=0;i<bbList.size();i++){
		BoardBean bb=bbList.get(i);
	
%>
<li class="community_item"><a href="view.net?w_num=<%=bb.getWritenum()%>">
<div class="rank"><%=i+1 %></div>
<div class="title">
<span><%=bb.getSubject() %></span>
<em>[덧글수]</em>
</div>
<div class="sub">
<div class="sub_item"><%=bb.getBoardType()%></div>
<div class="sub_item"><%=bb.getNickname() %></div>
</div>
</a>
<%} %>
</ul>
</div>
<!-- 갤러리 최신글  -->
<jsp:include page="../inc/footer.jsp"/>
</div><!-- front 종료  -->
</body>
</html>