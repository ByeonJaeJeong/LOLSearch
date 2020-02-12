<%@page import="net.Board.db.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.Board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LOLSearch/css/community.css" type="text/css" charset="utf-8"/>
</head>
<body>
<%
String type="*";
int PageSize=10;
if(request.getParameter("type")!=null){
type=request.getParameter("type");
}
BoardDAO bdao=new BoardDAO();
int count=bdao.countBoard(type);
String pageNum = request.getParameter("pageNum");

if (pageNum == null) {
	pageNum = "1"; //페이지 정보가 없을경우 1로 만듬
}
//첫행 계산

int currentPage = Integer.parseInt(pageNum);//String 을 int로 형변환 
int startRow = (currentPage - 1) * PageSize + 1; //1-1 * 15+1;// 0+1  //15+1
%>

<jsp:include page="../inc/header.jsp"/>
<div class="center">
	<jsp:include page="../inc/sidebar.jsp"/>
	<div class="mainPage">
	<div class="community box">
	<div class="community-header">
	<div class="community-header-title"><%=(type.equals("*")?"전체":type)%>(<%=count %>)</div>
	<div class="right_write"><a href="./write.net?pageNum=<%=pageNum%>"><img src="https://talk.op.gg/images/icon-write@2x.png"></a></div>
	</div><!--  community-header -->
	<% 
ArrayList<BoardBean> bbList=null;
if(count!=0){
bbList=(ArrayList<BoardBean>)request.getAttribute("bbList");
	System.out.println(bbList.size());
	System.out.println(startRow+","+PageSize);
	int[] ccount_array=(int[])request.getAttribute("ccount_array");
	for(int j=0;j<bbList.size();j++){
		BoardBean bb= new BoardBean();
		bb=bbList.get(j);
%>
	<li class="community_item"><a href="view.net?w_num=<%=bb.getWritenum()%>&pageNum=<%=pageNum%>&type=<%=bb.getBoardType() %>">
	<div class="rank"><%=bb.getWritenum() %></div>
	<div class="title">
	<span><%for(int ii=1;ii<bb.getRe_lev();ii++){%><img src="./img/level.gif"><%}%>
	<%if(bb.getRe_seq()>0) {%>
	<img src="./img/re.gif">
	<%} %>
	<%=bb.getSubject() %>
	
	</span>
	<em>[<%=ccount_array[j] %>]</em>
	</div>
	<div class="sub">
	<div class="sub_item"><%=bb.getBoardType() %>  </div> <span class="bar">|</span>
	<div class="sub_item"><%=bb.getNickname() %></div>
	</div>
	</a></li>	<!--  커뮤니티 item -->	
	<%
	}
	}%>
	</div><!-- 커뮤니티 시작 -->
	<div id="page_control">
				<%
					////////////////////////////////////////////
					//페이징 처리
					//글이 있을때만 처리
					if (count != 0) {
						//전체 페이지수 계산

						int pageCount = count / PageSize + (count % PageSize == 0 ? 0 : 1);
						//한페이지에서 보여줄 페이지수를 설정
						int pageBlock = 5;
						//시작하는 페이지번호 계산
						int StartPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						//끝나는 페이지 번호 계산
						int endPage = StartPage + pageBlock - 1;

						if (endPage > pageCount) {
							endPage = pageCount;
						}

						///////////////////////////////////
						//이전
						if (StartPage > pageBlock) {
				%>
				<a href="community.net?type=<%=type %>&pageNum=<%=StartPage - pageBlock%>">[이전]</a>
				<%
					}
						//숫자	1~10,11~20
						for (int i = StartPage; i <= endPage; i++) {
				%>
				<a href="community.net?type=<%=type %>&pageNum=<%=i%>"><%=i%></a>
				<%
					}
						//다음
						if (endPage < pageCount) {
				%>
				<a href="community.net?type=<%=type %>&pageNum=<%=StartPage + pageBlock%>">[다음]</a>
				<%
					}
					}
				%>
				
			</div>
	</div><!-- mainpage -->
</div><!-- body center -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>