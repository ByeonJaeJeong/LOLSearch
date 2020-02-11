<%@page import="net.Board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="/LOLSearch/css/postsview.css" type="text/css" charset="utf-8"/>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String w_num=request.getParameter("w_num");
String pageNum=request.getParameter("pageNum");
BoardBean bb= (BoardBean)request.getAttribute("Boardinfo"); %>

<jsp:include page="../inc/header.jsp"/>
<div class="center">
	<jsp:include page="../inc/sidebar.jsp"/>
	<div class="mainPage">
		<div class="Posts">
			<div class="posts-header">
				<div class="subject">
				<b><%=bb.getSubject() %></b>
				</div>
				<div class="info">
				<div class="user_info info">
				<a href="write.net?type=<%=bb.getBoardType()%>"><%=bb.getBoardType() %></a> <span class="bar">|</span>
				<span><%=bb.getReg_date() %></span> <span class="bar">|</span>
				<span><%=bb.getNickname() %></span> 
				</div>
				<div class="posts_info info">
				<span><%=bb.getReadcount() %></span> <span class="bar">|</span>
				<span><%=bb.getRe_ref() %></span> <span class="bar">|</span>
				<span>추천</span>
				</div>
				</div>
				</div>
				<hr class="bar">
				<div class="content">
				<%=bb.getContent() %>
				</div>
		</div>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>