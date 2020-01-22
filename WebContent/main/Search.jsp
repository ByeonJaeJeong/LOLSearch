<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../css/Search.css" rel="stylesheet">
<style>

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
    width: 22px;
    height: 22px;
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
.Win>.Content>.GameStatus>.GameResult {
    color: #1a78ae;
}
.Lose>.Content>.GameStatus>.GameResult {
    color: #c6443e;
}
.KDABox{
	font-size: 11px;
    text-align: center;
    display: table-cell;
    height: 96px;
    vertical-align: middle;
    padding-left: 16px;
}
.KDA{
	font-size: 15px;
    font-weight: bold;
    color: #555e5e;
    white-space: nowrap;
}
.KDARaio{
	color: #555e5e;
    font-size: 12px;
    font-weight: bold;
    margin-top: 6px;
}
.deaths{
	color: #c6443e;
}
.Stats {
    width: 90px;
    font-size: 11px;
    text-align: center;
    line-height: 18px;
    color: #555e5e;
    }
.CKRate {
    color: #c6443e;
}
.Items {
    font-size: 0;
}
.ItemList {
    width: 96px;
    margin: 0 auto;
}
.Item {
    background-color: #99b9cf;
}
.GameItem>.Content>.FollowPlayers {
    width: 170px;
    font-size: 0;
}
.FollowPlayers.Names>.Team {
    float: left;
    width: 50%;
}
.Summoner {
    display: block;
    width: 80px;
    height: 18px;
    margin-left: 3px;
    text-align: left;
    white-space: nowrap;
}
.ChampionImage {
    display: inline-block;
    vertical-align: middle;
    margin-right: 3px;
}
.SummonerName {
    display: inline-block;
    max-width: 60px;
    vertical-align: middle;
    font-size: 11px;
    color: #555;
}
.SummonerName a:link { color: black; text-decoration: none;}
.SummonerName a:visited { color: black; text-decoration: none;}
.SummonerName a:hover { color: black; text-decoration: none;}
.Win>.Content>.StatsButton  {
    width: 30px;
    border: 1px solid #000;
    border-color: #4aa1d2;
    background: #64b1e4;
   
}

.Lose>.Content>.StatsButton {
    width: 30px;
    border: 1px solid #000;
    border-color: #d67b77;
    background: #e89d99;
}
.GameItem>.Content {
    display: table;
    width: 689px;
    border-collapse: collapse;
    border: 1px solid #cdd2d2;
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
function textLengthOverCut(txt, len, lastTxt) {
    if (len == "" || len == null) { // 기본값
        len = 20;
    }
    if (lastTxt == "" || lastTxt == null) { // 기본값
        lastTxt = "...";
    }
    if (txt.length > len) {
        txt = txt.substr(0, len) + lastTxt;
    }
    return txt;
}


var userName="<%=userName%>";
var riot="https://kr.api.riotgames.com";
var api_key="RGAPI-9e721a2b-c0f5-42a6-b411-3beb291cfa15";
var accountId="";
var id="";
var participantId;
var l=0;
/* var ItemJson=JSON.parse(URL('http://ddragon.leagueoflegends.com/cdn/10.1.1/data/en_US/ item.json'));
var spellJson=JSON.parse('http://ddragon.leagueoflegends.com/cdn/10.1.1/data/en_US/ summoner.json');
var championJson=JSON.parse('http://ddragon.leagueoflegends.com/cdn/10.1.1/data/en_US/ champion.json'); */
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
	 			url:riot+"/lol/match/v4/matchlists/by-account/"+json.accountId+"?endIndex=3&api_key="+api_key,
	 			type:"GET",
	 		 	dataType:"json",
	 		 	success:function(json){
	 		 		for(var i=0;i<json.matches.length;i++){
	 		 			$.ajax({
	 		 				url:riot+"/lol/match/v4/matches/"+json.matches[i].gameId+"?api_key="+api_key,
	 			 			type:"GET",
	 			 		 	dataType:"json",
	 			 		 	success:function(json){
	 			 		 			for(var ii=0;ii<10;ii++){
	 			 		 			if(json.participantIdentities[ii].player.accountId==accountId)
	 			 		 				participantId=ii;
	 			 		 			}	//for문
	 			 		 		if(json.teams[((json.participants[participantId].teamId)/100)-1].win=="Win")
	 			 		 		var win="Win";
	 			 		 		else
	 			 		 		var win="Lose";
	 			 		 		
	 			 		 		switch (json.queueId) {
								case 420:
								var RankType="솔랭";
									break;
								case 430:
								var RankType="일반";	
									break;
								case 450:
								var RankType="칼바람";		
									break;
								case 900:
								var RankType="우르프";	
									break;
								default:
									break;
								}//switch
	 			 		 		var date1=new Date();//현재시간
	 		 		 			var date2=new Date(json.gameCreation);//게임했던시간
	 		 		 			var date=(date1.getDate()-date2.getDate())+"일전";
	 		 		 			if((date1.getDate()==date2.getDate())){
	 		 		 				 date=((date1.getHours()-date2.getHours())+"시간전")
	 		 		 				if(date1.getHours()==date2.getHours()){
	 		 		 					 date=(date1.getMinutes()-date2.getMinutes())+"분전";
	 		 		 				}//if문
	 		 		 			}//if문
	 			 		 		var GameDuration_min=Math.floor(json.gameDuration/60)+"분";
	 			 		 		var GameDuration_sec=Math.floor(json.gameDuration%60)+"초";
	 			 		 		var KDA=Math.round((json.participants[participantId].stats.kills+json.participants[participantId].stats.assists)/json.participants[participantId].stats.deaths*100)/100;
	 			 		 		$('.main_content').append(
	 			 		 			"<div class='GameItemWarp'>"+"<div class='GameItem "+win+"'>"  
	 			 		 			+"<div class='Content'>"
	 			 		 			+"<div class='GameStatus'>"
	 			 		 			+"<div class='GameType'>"+RankType+"</div>"
	 			 		 			+"<div class='TimeStamp'>"+date+"</div>"
	 			 		 			+"<div class='Bar'>"+"</div>"
	 			 		 			+"<div class='GameResult'>"+((win=="Win")?"승리":"패배")+"</div>"
	 			 		 			+"<div class='GameLength'>"+GameDuration_min+""+GameDuration_sec+"</div>"
	 			 		 			+"</div>"		//gameStatus 종료  
	 			 		 			+"<div class='GameSettingInfo'>"
	 			 		 			+"<div class='ChampionImage'>"+"<img class='ChampionImage' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/Aatrox.png'>"+"</div>"
	 			 		 			+"<div class='SummonerSpell'>"
	 			 		 			+"<div class='Spell'>"+"<img class='Image'  src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/SummonerFlash.png'>"+"</div>"
	 			 		 			+"<div class='Spell'>"+"<img class='Image'  src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/SummonerFlash.png'>"+"</div>"
	 			 		 			+"</div>"		//SummonerSpell 종료
	 			 		 			+"<div class='Runes'>"
	 			 		 			+"<div class='Rune'>"+"</div>"
	 			 		 			+"<div class='Rune'>"+"</div>"
	 			 		 			+"</div>"		//Runes 종료
	 			 		 			+"<div class='ChampionName'>"+'아트록스'+"</div>"
	 			 		 			+"</div>"		//GameSettingInfo 종료  
	 			 		 			+"<div class='KDABox'>"
	 			 		 			+"<div class='KDA'>"+"<span class='kills'>"+json.participants[participantId].stats.kills+"</span>"
	 			 		 			+"/"
	 			 		 			+"<span class='deaths'>"+json.participants[participantId].stats.deaths+"</span>"
	 			 		 			+"/"
	 			 		 			+"<span class='assists'>"+json.participants[participantId].stats.assists+"</span>"
	 			 		 			+"</div>"		//KDA종료
	 			 		 			+"<div class='KDARatio'>"+KDA+":1 평점</div>"
	 			 		 			+"</div>"		// KDABox종료 
	 			 		 			+"<div class='Stats'>"
	 			 		 			+"<div class='Level'>레벨"+json.participants[participantId].stats.champLevel+"</div>"
	 			 		 			+"<div class='CS'>"+json.participants[participantId].stats.totalMinionsKilled+" ("
	 			 		 					+Math.floor(json.participants[participantId].stats.totalMinionsKilled/Math.floor(json.gameDuration/60)*10)/10+") "+"CS</div>"
	 			 		 			+"<div class='CKRate'>킬관여"+"</div>"
	 			 		 			+"</div>"
	 			 		 			+"<div class='Items'>"
	 			 		 			+"<div class='ItemList'>"
	 			 		 			+"<div class='Item'>"+"</div>"
	 			 		 			+"</div>"	//ItemList끝
	 			 		 			+"</div>" 	//Items끝
	 			 		 			+"<div class='FollowPlayers Names'>"
	 			 		 			+"<div class='Team 1'>"+"</div>"	//Team1 끝
	 			 		 			+"<div class='Team 2'>"+"</div>"	//Team2 끝
	 			 		 			+"</div>"	//FollowPlayers Names끝
	 			 		 			 +"<div class='StatsButton'>"
	 			 		 			+"<div class='Sts_content'>"
	 			 		 			+"<div class='rightMatch'>"
	 			 		 			+"<span class='ON'>"+"</span>"
	 			 		 			+"<span class='OFF'>"+"</span>"
	 			 		 			+"</div>"
	 			 		 			+"</div>"
	 			 		 			+"</div>" 
	 			 		 				+"</div>"+"</div></div>"	// Content GameItem GameItemWarp  
	 			 		 		);//main content append 끝
	 			 		 		
	 			 		 				for(var j=0;j<10;j++){
	 			 		 					console.log(json.participants[j].teamId);
		 			 		 				if(json.participants[j].teamId=='100'){
	 			 		 		$('.Team.1:eq('+l+')').append(
		 			 		 			+"<div class='summoner' >"
		 			 		 			+"<div class='ChamptionImage' >"+"</div>"
		 			 		 			+"<div class='SummonerName' ><a href='Search.jsp?userName="+json.participantIdentities[j].player.summonerName+"'>"+textLengthOverCut(json.participantIdentities[j].player.summonerName,5,'..')+"</a></div>"
		 			 		 				+"</div>"
	 			 		 				);
		 			 		 				}//if문
	 			 		 		if(json.participants[j].teamId=='200'){
		 			 		 		$('.Team.2:eq('+l+')').append(
			 			 		 			+"<div class='summoner' >"
			 			 		 			+"<div class='ChamptionImage' >"+"</div>"
			 			 		 			+"<div class='SummonerName' ><a href='Search.jsp?userName="+json.participantIdentities[j].player.summonerName+"'>"+textLengthOverCut(json.participantIdentities[j].player.summonerName,5,'..')+"</a></div>"
			 			 		 				+"</div>"
		 			 		 				);
		 			 		 				}}//for 문[j] if문 끝
		 			 		 				l++;
	 			 		 	}//Matchlist success
	 		 				
	 		 			});//게임상세
	 		 			setTimeout(5);
	 		 		}//for문 끝 [i]
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
