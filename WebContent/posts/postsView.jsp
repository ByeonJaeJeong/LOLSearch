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
<link rel="stylesheet" href="/LOLSearch/css/postsview.css"
	type="text/css" charset="utf-8" />
</head>
<body>
	<%
String login_id=(String)session.getAttribute("user_id");
request.setCharacterEncoding("UTF-8");
String w_num=request.getParameter("w_num");
String profile=(String)session.getAttribute("userprofileicon");
int pageNum=0;
if(request.getParameter("pageNum")==null){
	pageNum=(Integer.parseInt(w_num)-1)/10;
}else{
	pageNum=Integer.parseInt(request.getParameter("pageNum"));
}
BoardBean bb= (BoardBean)request.getAttribute("Boardinfo");
String user_id="";
String type="";
if(request.getParameter("type")==null){
	type="*";
}else{
	type=request.getParameter("type");
}
String user_nickName="";
 if(session.getAttribute("user_id")!=null){
	 user_id=(String)session.getAttribute("user_id");
	 user_nickName=(String)session.getAttribute("usernickName");
 }  

	ArrayList<commentBean> cbList=new ArrayList<commentBean>();
	if(request.getAttribute("cbList")!=null){
	cbList=(ArrayList<commentBean>)request.getAttribute("cbList");
	}
%>
	<jsp:include page="../inc/header.jsp" />
	<div class="center">
		<jsp:include page="../inc/sidebar.jsp" />
		<div class="mainPage">
			<div class="Posts box">
				<div class="posts-header">
					<div class="subject">
						<b><%=bb.getSubject()%></b>
					</div>
					<div class="info">
						<div class="user_info info">
							<a href="write.net?type=<%=bb.getBoardType()%>"><%=bb.getBoardType()%></a>
							<span class="bar">|</span> <span><%=bb.getReg_date()%></span> <span
								class="bar">|</span> <span><%=bb.getNickname()%></span>
						</div>
						<div class="posts_info info">
							<span>조회 <%=bb.getReadcount()%></span> <span class="bar">|</span>
							<span>덧글 <%=cbList.size()%></span> <span class="bar">|</span> <span>추천</span>
						</div>
					</div>
				</div>
				<hr class="bar">
				<div class="content">
					<%=bb.getContent()%>
				</div>
				<!-- content -->

			</div>
			<!-- posts -->
			<div class="comment box">
				<div class="comment_view">
					<%
						for (int i = 0; i < cbList.size(); i++) {
							commentBean cb = cbList.get(i);
					%>
					<div class="comment_view_item">
						<div class="comment-usericon">
							<img src="<%=cb.getProfile()%>" />
						</div>
						<div class="comment_userName">
							<p>
								<b><%=cb.getUser_nickname()%></b><%=cb.getReg_date()%></p>
						</div>
						<div class="comment_content">
							<p><%=cb.getContent()%></p>
						</div>
					</div>
					<hr>
					<%
						}
					%>

					<%
						if (session.getAttribute("user_id") != null) {
					%>
					<div class="comment_input_box">
						<form action="comment.net?w_num=<%=w_num%>&pageNum=<%=pageNum%>"
							method="post">
							<input type="hidden" name="profile" value="<%=profile%>">
							<input type="hidden" name="user_id" value="<%=user_id%>">
							<input type="hidden" name="user_nickName"
								value="<%=user_nickName%>">
							<textarea rows="3" cols="70" class="comment_input" name="content"></textarea>
							<input type="submit" value="댓글달기" class="comment_btn">
						</form>
					</div>
					</div>
					<%
						} else {
					%>
					<p class="logincheck">로그인 하셔야 덧글을 적으실수 있습니다.</p>
					<%
						}
					%>
				</div>

				<div class="next content_link"></div>
				<div class="prev content_link"></div>
				<div class="btn_group">
					<%
						if (bb.getId().equals(login_id)) {
					%>
					<input class="link_btn mouse" type="button" value="게시글 삭제"
						onclick="location.href='delete.net?w_num=<%=w_num%>&pageNum=<%=pageNum%>&type=<%=type%>'" />
					<%
						}
					%>
					<input class="link_btn mouse" type="button" value="글쓰기"
						onclick="location.href='write.net?pageNum=<%=pageNum%>&type=<%=type%>'">
					<input class="link_btn mouse" type="button" value="답글"
						onclick="location.href='rewrite.net?type=<%=type%>&w_num=<%=w_num%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
					<input class="link_btn mouse" type="button" value="목록"
						onclick="location.href='community.net?pageNum=<%=pageNum%>&type=<%=type%>'">
				</div>
			</div>
			<!-- mainPage -->
		</div>
		<!-- center -->
		<jsp:include page="../inc/footer.jsp" />
</body>
</html>