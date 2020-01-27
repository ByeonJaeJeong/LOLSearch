<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../css/Search.css" rel="stylesheet">
<style>
body{
background-color: #eaeaea;
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
    position: relative;
    display: inline-block;
    text-align: left;
}
.Itemimg{
width:22px;
float:left;
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
    height: 17px;
    margin-left: 3px;
    text-align: left;
    white-space: nowrap;
}
.ChampionImageBox {
    display: inline-block;
    vertical-align: middle;
    margin-right: 3px;
}
.SummonerName {
	
    display: contents;
    max-width: 60px;
    vertical-align: middle;
    font-size: 11px;
    color: #555;
}
.SummonerName>a{
	margin-left: 5px;
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
.tip {
  	display: none;
    position: absolute;
    width: 250px;
    padding: 8px;
    left: -122px;
    z-index: 1;
    top: 37px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    background: #333;
    color: #fff;
    font-size: 13px;
}
.tip::after{
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}
.Spell .tip{
	left:0;
	top:60px;
}
.Item:hover>.tip{
  display: block;
}
.Spell:hover>.tip{
	display:block;
}
.tip>b{
color:#00cfbc;
}
.yellow{
color: #ec9b07;
}
.tip>span>unique{
    color: #11de47;}
#tip{
    position: absolute;
    width: 250px;
    padding: 8px;
    left: -122px;
    z-index: 1;
    top: 37px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    background: #333;
    color: #fff;
    font-size: 13px;
}
.ChamptionImage>img{
	background-position: 0px -1792px;
    width: 16px;
    height: 16px;
}
.ChamptionImage{
	height:16px;
	width:16px;
	display:contents;
}
 .Team>.Summoner {
    display: block;
    width: 80px;
    height: 18px;
    margin-left: 3px;
    text-align: left;
    white-space: nowrap;
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
function item(itemnumber,i){
	var item_id="";
	var item_alt="";
	var item_plaintext="";
	var item_description="";
	var item_gold_total="";
	var item_gold_base="";
	$.getJSON('http://ddragon.leagueoflegends.com/cdn/10.1.1/data/ko_KR/item.json', function(Item) {
			itemnumber.forEach(function(Itemnumber, item_index, item_array) {
				item_id=Itemnumber;
				if(item_id!=0){
				item_alt=Item.data[Itemnumber].name; 
				item_plaintext=Item.data[Itemnumber].plaintext;
				item_description=Item.data[Itemnumber].description;
				item_gold_total=Item.data[Itemnumber].gold.total;
				item_gold_base=Item.data[Itemnumber].gold.base;
			
				
					 $('.ItemList:eq('+i+')').append(
						"<div class='Item'>"
						+"<img class='Itemimg' title='' alt='"+item_alt+"' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/"+item_id+".png'/>"
						+"<div class='tip'><b>"+item_alt+"</b><br><span>"+item_description+"</span><br>금액:<span  class='yellow'>"+item_gold_total+"("+item_gold_base+")</span>"
						+"</div></div>"
							); 
			}
			});//forEach
	});//get json
}

function champion(champnum,t1,t2,i){
	var id="";
	var name="";
	$.getJSON('http://ddragon.leagueoflegends.com/cdn/10.2.1/data/ko_KR/champion.json',function(Champ){
		$.each(Champ.data, function(idx, Champ) {
			if(Champ.key==champnum){
				id=Champ.id;
				name=Champ.name
				return false;
			}
		});
		
		
		$('.ChampionImageBox:eq('+i+')').append(
				"<img class='ChampionImage' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/"+id+".png'>"	
		);
		$('.ChampionName:eq('+i+')').append(name);//해당소환사 챔피언사진 이름 출력
		for(var t_n=0;t_n>5;t_n++){
			
		$.each(Champ.data, function(idx, Champ) {
			if(Champ.key==t1[t_n]){
				name=Champ.name;
				return false;
			}	
		});//each 종료
		$('.ChamptionImage').append(
			"<img src='http://ddragon.leagueoflegends.com/cdn/10.2.1/img/champion/"+name+".png'>"		
			);
			
		}//for문 종료
	}); //getJson 종료
}//champion 종료
 function spell(spellnum,i){
	var spell_id="";
	var spell_name="";
	var spell_description="";
	 
$.getJSON('http://ddragon.leagueoflegends.com/cdn/10.1.1/data/ko_KR/summoner.json', function(spell) {
		$.each(spell.data, function(idx, Spell) {
			if(Spell.key==spellnum){
				spell_id=Spell.id;
				spell_name=Spell.name;
				spell_description=Spell.description;
				$('.SummonerSpell:eq('+i+')').append(
						"<div class='Spell'>"
						+"<img class='Image' class='' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/"+spell_id+".png'>"
						+"<div class='tip'><span class='yellow'>"+spell_name+"</span><br><br><span>"+spell_description+"</span>"+"</div>"
						+"</div>"
						);
				
				return false;
			}
		})
	
	});
}

 $(function(){    
    var title_;
    var class_;
    var imgTag;
     
    $(".tip").hover(function(e) {      // <a> hover 시 : mouseEnter
        title_ = $(this).attr("title");     // title을 변수에 저장
        class_ = $(this).attr("class");     // class를 변수에 저장
        $(this).attr("title","");           // title 속성 삭제( 기본 툴팁 기능 방지 )
     
        
     
        $("body").append("<div id='tip'></div>");   // body 내부에 div#tip 생성
         
            // class_ 값에 따라 이미지 or 텍스트 출력 구분
           
                $("#tip").css("width","300px");
                $("#tip").text(title_);
            
             
            // 툴팁이 현재 hover 한 요소의 상단에 생성되도록 설정
            var pageX = $(this).offset().left -20;
            var pageY = $(this).offset().top - $("#tip").innerHeight();
            $("#tip").css({left : pageX + "px", top : pageY + "px"}).fadeIn(500);
     
    }, function() {                         // <a> hover 시 : mouseLeave
     
        $(this).attr("title", title_);      // title 속성 반환
        $("#tip").remove();                 // div#tip 삭제
     
    });
 }); 

///////////////////////////////api 키입력//////////////////

 
 var userName="<%=userName%>";
var riot="https://kr.api.riotgames.com";
var api_key="RGAPI-e9568a1e-17f2-4196-851c-6405750e1280";
var accountId="";
var id="";
var participantId="";
var l=0;
var item_num=0;//전적검색 갯수 



$.ajax({
	    url:riot+"/lol/summoner/v4/summoners/by-name/"+userName+"?api_key="+api_key,
	 	type:"GET",
	 	dataType:"json",
	 	crossDomain:true,
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
	 			 		 		var spell1="";
	 			 		 		var spell2="";
	 			 		 		
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
	 			 		 			+"<div class='ChampionImageBox'>"/* +"<img class='ChampionImage' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/Aatrox.png'>" */+"</div>"
	 			 		 			+"<div class='SummonerSpell'>"
	 			 		 			+"</div>"		//SummonerSpell 종료
	 			 		 			+"<div class='Runes'>"
	 			 		 			+"<div class='Rune'>"+"</div>"
	 			 		 			+"<div class='Rune'>"+"</div>"
	 			 		 			+"</div>"		//Runes 종료
	 			 		 			+"<div class='ChampionName'>"+"</div>"
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
	 			 		 		var t1=new Array(5);
	 			 		 		var t2=new Array(5);
	 			 		 		var t1_count=0;
	 			 		 		var t2_count=0;
	 			 		 				for(var j=0;j<10;j++){
		 			 		 				if(json.participants[j].teamId=='100'){
	 			 		 		$('.Team.1:eq('+l+')').append(
		 			 		 			"<div class='summoner' >"
		 			 		 			+"<div class='ChamptionImage' >"+"</div>"
		 			 		 			+"<div class='SummonerName' ><a href='Search.jsp?userName="+json.participantIdentities[j].player.summonerName+"'>"+textLengthOverCut(json.participantIdentities[j].player.summonerName,5,'..')+"</a></div>"
		 			 		 				+"</div>"
	 			 		 				);
		 			 		 				t1[t1_count]=json.participants[j].championId;
		 			 		 				t1_count++;
		 			 		 				}//if문
	 			 		 		if(json.participants[j].teamId=='200'){
		 			 		 		$('.Team.2:eq('+l+')').append(
			 			 		 			"<div class='summoner' >"
			 			 		 			+"<div class='ChamptionImage'>"+"</div>"
			 			 		 			+"<div class='SummonerName' ><a href='Search.jsp?userName="+json.participantIdentities[j].player.summonerName+"'>"+textLengthOverCut(json.participantIdentities[j].player.summonerName,5,'..')+"</a></div>"
			 			 		 				+"</div>"
		 			 		 				);
		 			 		 				t2[t2_count]=json.participants[j].championId;
 			 		 						t2_count++;
		 			 		 			}
		 			 		 				}//for 문[j] if문 끝
		 			 		 				
		 			 		 				l++;
		 			 		 				var json_link=json.participants[participantId].stats;
		 			 		 				var item_number=new Array(json_link.item0,json_link.item1,json_link.item2,json_link.item6,json_link.item3,json_link.item4,json_link.item5);
		 			 		 				item(item_number, item_num);//아이템 추가
		 			 		 				champion(json.participants[participantId].championId,t1,t2,item_num);//챔피언 이미지 추가	
		 			 		 				spell(json.participants[participantId].spell1Id,item_num);
		 			 		 				spell(json.participants[participantId].spell2Id,item_num);
		 			 		 				item_num++;
		 			 		 			
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
