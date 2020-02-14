<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>글쓰기 페이지</title>
    <script type="text/javascript" src="<%=ctx %>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <link href="./css/writeForm.css" rel="stylesheet">
<% 
String input_type=request.getParameter("type");
String id="";
String nickname="";
String pageNum=request.getParameter("pageNum");
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("user_id")==null ||session.getAttribute("usernickName")==null){
		response.sendRedirect("./login.kr?url=./write.net");
	}else{
	id=(String)session.getAttribute("user_id");
	nickname=(String)session.getAttribute("usernickName");}
%>
</head>
	<!-- 에디터 시작 -->
			<!--  --><!-- 상하여백 -->
	<!--
		@decsription
		등록하기 위한 Form으로 상황에 맞게 수정하여 사용한다. Form 이름은 에디터를 생성할 때 설정값으로 설정한다.
	-->
<body>
<jsp:include page="../inc/header.jsp"/>
<div class="content">
<jsp:include page="../inc/sidebar.jsp"/>
<div class="body box">
<form action="./writeAction.net?pageNum=<%=pageNum %>" method="post">
	<div class="inputbox">
	<div class="title">
		<input type="hidden" name="id" value="<%= id%>">	
		<input type="hidden" name="nickname" value="<%=nickname%>">	
			<label>게시판 종류:</label>
			<select name="boardType">
			<option value="" disabled>게시판 선택</option>
			<option value="자유" <%if(input_type.equals("자유")) {%>selected<%} %>>자유</option>
			<option value="유머" <%if(input_type.equals("유머")) {%>selected<%} %> >유머</option>
			<option value="영상" <%if(input_type.equals("영상")) {%>selected<%} %> >영상</option>
			</select>
			</div>
			<div class="subject">
			<label>제목:</label>
			<input type="text" name="subject" >
			</div>
	<textarea name="content" id="ir1" rows="10" cols="100" style="width:762px; height:412px; display:none;"></textarea>
	<!--textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea-->
	</div>
	<div class="btn_group">
		<input class="submit_btn" type="button" onclick="history.back();" value="돌아가기"/>
		<input class="reset_btn" type="button" onclick="submitContents(this);" value="작성완료"/>  
	</div>
</form>

<script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 16;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}



</script>	
</div>
</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>