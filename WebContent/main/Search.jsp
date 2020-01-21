<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
#Ex{
	background-image: url('//cdn.lolalytics.com/image/generated/tiled/emblems.png');
	background-size: 576px 64px; */
    display: inline-block;
    width: 64px;
    height: 64px;
    background-position-x:64px;
}

.content-header{
	position: relative;
    width: 1000px;
    margin: 0 auto;
    padding: 20px 0 0 0;
}
.tierImg{
	width:100px;
	height:100px;
}
.summonerlevel{
	position: absolute;
    top: 100%;
    left: 50%;
    margin-top: -31px;
    margin-left: -476px;
    width: 44px;
    height: 24px;
    padding-top: 3px;
    box-sizing: border-box;
    background-color: rgba(25, 23, 23, 0.3);
    background-size: 100%;
    line-height: 17px;
    font-size: 14px;
    text-align: center;
    color: #eabd56;
}
.profileicon{
	display: inline-block;
    width: 100px;
    vertical-align: top;
}
.profileimg{
	display: block;
    width: 100px;
    height: 100px;

}
.profile{
	position: relative;
    display: inline-block;
    height: 100px;
    margin: 0 10px 0 5px;
    vertical-align: top;
    line-height: 1.1;
}
.name{
	color: #242929;
    font-size: 20px;
    font-weight: bold;
    margin-right: 4px;
    vertical-align: middle;	
}
.content{
	width: 1000px;
    min-height: 500px;
    margin: 0 auto;
}
.side_content{
	display: inline-block;
    width: 300px;
    font-size: 12px;
    vertical-align: top;
}
.box{
	border: 1px solid #cdd2d2;
    box-shadow: 0 1px #dcdfdf;
    background: #f2f2f2;
    border-radius: 2px;
}
.tierbox{
	display: table;
    width: 100%;
    color: #879292;
    position: relative;
    background-color: #f2f2f2;
    padding: 8px 0;
}
.tier_imgbox{
	display: table-cell;
    vertical-align: middle;
    width: 120px;
    height: 124px;
    text-align: center;
}
.image{
	width: 104px;
    height: 104px;
    margin: -5px 0 -10px 0;
}
.tierRankInfo{
	display: table-cell;
    vertical-align: middle;
    font-size: 12px;
    line-height: 1.5;
    text-align: left;
}
.GameItemWarp{
	position: relative;
    border-radius: 3px;
    margin-bottom: 8px;
}
.main_content{
	display: inline-block;
    width: 684px;
    margin-left: 10px;
    font-size: 12px;
    vertical-align: top;
}
.GameStatus{
	width: 70px;
    text-align: center;
    font-size: 11px;
    color: #555;
    line-height: 16px;
}
.GameType{
	font-weight: bold;
    width: 70px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.Bar{
	display: block;
    width: 27px;
    margin: 5px auto;
    height: 2px;
    background: #cdd2d2;
}
.GameResult{
	font-weight: bold;
}
.GameItem.Win>.Content {
    table-layout: fixed;
    background-color: #a3cfec;
    border-color: #99b9cf;
}
 .GameItem.Lose>.Content {
    table-layout: fixed;
    background-color: #e2b6b3;
    border-color: #cea7a7;
}
.GameItem>.Content>div {
    display: table-cell;
    height: 96px;
    vertical-align: middle;
}
.ChampionImage{
	display: inline-block;
    width: 46px;
    height: 46px;
    vertical-align: middle;
    border-radius: 50%;
    overflow: hidden;
}
.SummonerSpell {
    display: inline-block;
    vertical-align: middle;
    margin-left: 4px;
   	}
.Spell:first-child {
    margin-left: 0;
    }
.Spell>.Image {
    display: block;
    width: 100%;
    height: 100%;
}
.Runes {
    display: inline-block;
    vertical-align: middle;
    margin-left: 4px;
}
.Runes>.Rune:first-child {
    margin-top: 0;
}
.GameItem>.Content>.GameSettingInfo>.ChampionName {
    margin-top: 8px;
    font-size: 11px;
    color: #555;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    }
</style>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userName=request.getParameter("userName");
%>
<script>
var userName="<%=userName%>";
var riot="https://kr.api.riotgames.com";
var api_key="RGAPI-6c171014-b1bd-4256-9860-a3e5bad1cc61";
var accountId="";
var id="";
var participantId;
$.ajax({
	    url:riot+"/lol/summoner/v4/summoners/by-name/"+userName+"?api_key="+api_key,
	 	type:"GET",
	 	dataType:"json",
	    success: function(json) {
	   		id=json.id;
	 		accountId=json.accountId;
	 		$("#summonerName").append("<span class='name'>"+json.name+"</span>");
	 		$("#profileIcon").append("<img class='profileimg' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/profileicon/"+json.profileIconId+".png'>"+"<span class='summonerlevel'>"+json.summonerLevel+"</span>");
	 		$.ajax({
	 		    url:riot+"/lol/league/v4/entries/by-summoner/"+json.id+"?api_key="+api_key,
	 		 	type:"GET",
	 		 	dataType:"json",
	 		    success: function(json) {
	 		    	var tier="UNRANK";
		 		    var rank="";
	 		    	if(json[0]){
	 		    	var tier=json[0].tier;
	 		    	var rank=json[0].rank;
	 		    	}
	 		    	$('.tier_imgbox').append("<img class='image' src='https://raw.githubusercontent.com/ByeonJaeJeong/LOLSearch/master/WebContent/img/"+tier+".png'>");
	 		 		$('.tier_Rank').append("<span>"+tier+""+rank+"</span>");
	 		    	setTimeout(5);
	 		    }
	 		});//소환사 티어 전적
	 		$.ajax({
	 			url:riot+"/lol/match/v4/matchlists/by-account/"+json.accountId+"?endIndex=15&api_key="+api_key,
	 			type:"GET",
	 		 	dataType:"json",
	 		 	success:function(json){
	 		 		$('#Ex').html(json.matches[0].gameId);
	 		 		for(var i=0;i<json.matches.length;i++){
	 		 			$.ajax({
	 		 				url:riot+"/lol/match/v4/matches/"+json.matches[i].gameId+"?api_key="+api_key,
	 			 			type:"GET",
	 			 		 	dataType:"json",
	 			 		 	success:function(json){
	 			 		 			for(var i=0;i<10;i++){
	 			 		 			if(json.participantIdentities[i].player.accountId==accountId)
	 			 		 				participantId=i;
	 			 		 			}
	 			 		 		console.log(json.teams[((json.participants[participantId].teamId)/100)-1].win);
	 			 		 		if(json.teams[((json.participants[participantId].teamId)/100)-1].win=="Win")
	 			 		 		var win="Win";
	 			 		 		else
	 			 		 		var win="Lose";
	 			 		 		
	 			 		 		$('.main_content').append(
	 			 		 			"<div class='GameItemWarp'>"+"<div class='GameItem "+win+"'>"  
	 			 		 			+"<div class='Content'>"
	 			 		 			+"<div class='GameStatus'>"
	 			 		 			+"<div class='GameType'>"+"</div>"
	 			 		 			+"<div class='TimeStamp'>"+"</div>"
	 			 		 			+"<div class='Bar'>"+"</div>"
	 			 		 			+"<div class='GameResult'>"+"</div>"
	 			 		 			+"<div class='GameLength'>"+"</div>"
	 			 		 			+"</div>"		/*gameStatus 종료  */
	 			 		 			+"<div class='GameSettingInfo'>"
	 			 		 			+"<div class='ChampionImage'>"+"</div>"
	 			 		 			+"<div class='SummonerSpell'>"
	 			 		 			+"<div class='Spell'>"+"</div>"
	 			 		 			+"<div class='Spell'>"+"</div>"
	 			 		 			+"</div>"		//SummonerSpell 종료
	 			 		 			+"<div class='Runes'>"
	 			 		 			+"<div class='Rune'>"+"</div>"
	 			 		 			+"<div class='Rune'>"+"</div>"
	 			 		 			+"</div>"		//Runes 종료
	 			 		 			+"<div class='ChampionName'>"+"</div>"
	 			 		 			+"</div>"		/*GameSettingInfo 종료  */
	 			 		 				+"</div>"+"</div></div>"	/* Content GameItem GameItemWarp  */
	 			 		 		);
	 			 		 		
	 			 		 	}
	 		 				
	 		 			});//게임상세
	 		 			
	 		 		}//for문 끝 
	 		 	}
	 			
	 		});//전적20게임
	    }
});//소환사 검색

</script>
<jsp:include page="../inc/header.jsp"/>
<div class="cotainer">
<div class="content-header">
<div id="profileIcon" class="profileicon"></div>
<div class="profile">
<div id="summonerName" class="summonername"></div>
</div>
</div>
<!--  header -->
<div class="menu">
<div class="content">
<div class="side_content">
<div class="tierbox box">
<div class="tier_imgbox"></div>
<div class="tierRankInfo">
<div class="tier_type">솔로랭크</div>
<div class="tier_Rank"></div></div>
</div>
</div>
<div class="main_content">
<div class="navigation"></div>

</div>
</div>
</div>

</div>
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>
