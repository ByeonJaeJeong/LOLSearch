<%@page import="java.util.List"%>
<%@page import="net.Comment.db.commentBean"%>
<%@page import="java.util.ArrayList"%>
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
BoardBean bb= (BoardBean)request.getAttribute("Boardinfo");
String user_id="";
String user_nickName="";
 if(session.getAttribute("user_id")!=null){
	 user_id=(String)session.getAttribute("user_id");
	 user_nickName=(String)session.getAttribute("usernickName");
}  
%>

<jsp:include page="../inc/header.jsp"/>
<div class="center">
	<jsp:include page="../inc/sidebar.jsp"/>
	<div class="mainPage">
		<div class="Posts box">
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
				<span>조회 <%=bb.getReadcount() %></span> <span class="bar">|</span>
				<span>덧글 <%=bb.getRe_ref() %></span> <span class="bar">|</span>
				<span>추천</span>
				</div>
				</div>
				</div>
				<hr class="bar">
				<div class="content">
				<%=bb.getContent() %>
				</div><!-- content -->
		</div><!-- posts -->
		<div class="comment box">
		<% if(session.getAttribute("user_id")!=null){  %>
		<div class="comment_input_box">
		<form action="comment.net?w_num=<%=w_num%>&pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="user_id" value="<%=user_id%>">
		<input type="hidden" name="user_nickName" value="<%=user_nickName%>">
		<textarea rows="3" cols="70" class="comment_input" name="content"></textarea>
		<input type="submit" value="댓글달기" class="comment_btn" >
		</form>
		</div>
		<%}else{ %>
		<p>로그인 하셔야 덧글을 적으실수 있습니다.</p>
		<%} %>
		<div class="comment_view">
		<% 
		ArrayList<commentBean> cbList=new ArrayList<commentBean>();
		if(request.getAttribute("cbList")!=null){
		cbList=(ArrayList<commentBean>)request.getAttribute("cbList");
		}
		System.out.println(cbList.size());
		for(int i=0;i<cbList.size();i++){
		commentBean cb=cbList.get(i);
		%>
		<hr>
		<div class="comment_view_item">
		<div class="comment_userName"><%=cb.getUser_nickname() %></div>
		<div class="comment_content"><p><%=cb.getContent() %></p></div>
		</div>
		<%} %>
		</div>
		</div>
	</div><!-- mainPage -->
</div><!-- center -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>