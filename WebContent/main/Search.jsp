<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../css/Search.css" rel="stylesheet">
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
$(document).ready(function(){
	Search(accountId, token);
});
	

function textLengthOverCut(txt, len, lastTxt) {
    if (len == "" || len == null) { // 기본값
        len = 4;
    }
    if (lastTxt == "" || lastTxt == null) { // 기본값
        lastTxt = ".";
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
	$.getJSON('../json/item.json', function(Item) {
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
						+"<img class='Itemimg radius' title='' alt='"+item_alt+"' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/"+item_id+".png'/>"
						+"<div class='tip'><b>"+item_alt+"</b><br><span>"+item_description+"</span><br>금액:<span  class='yellow'>"+item_gold_total+"("+item_gold_base+")</span>"
						+"</div></div>"
							); 
			}//if 문 
			else{
				$('.ItemList:eq('+i+')').append(
						"<div class='noItem radius'>"
						+"</div>"
				);
			}
			});//forEach
	});//get json
}

function champion(champnum,t1,t2,i){
	var id="";
	var name="";
	$.getJSON('../json/champion.json',function(Champ){
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
		
		
		$.each(t1,function (tdx,T1){
		$.each(Champ.data, function(idx, Champ) {
			if(Champ.key==T1){
				name=Champ.id;
				return false;
			}	
		});//each 종료
		$('.GameItemWarp:eq('+i+') .1 .ChamptionImage:eq('+tdx+')').append(
			"<img src='http://ddragon.leagueoflegends.com/cdn/10.2.1/img/champion/"+name+".png'>"		
			);
		});//t1_each
		
		$.each(t2,function (tdx,T2){
			$.each(Champ.data, function(idx, Champ) {
				if(Champ.key==T2){
					name=Champ.id;
					return false;
				}	
			});//each 종료
			$('.GameItemWarp:eq('+i+') .2 .ChamptionImage:eq('+tdx+')').append(
				"<img src='http://ddragon.leagueoflegends.com/cdn/10.2.1/img/champion/"+name+".png'>"		
				);
			});//t2_each
	}); //getJson 종료
}//champion 종료
 function spell(spellnum,i){
	var spell_id="";
	var spell_name="";
	var spell_description="";
	 
$.getJSON('../json/summoner.json', function(spell) {
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



function rune(mainRune,subRune,i){
	var rune_name="";
	var rune_icon="";
	var rune_longDesc="";
	
	$.getJSON("../json/runesReforged.json",function(rune){
		$.each(rune,function(idx,Rune){
			if(Rune.id.toString().substr(0,2)==mainRune.toString().substr(0, 2)){
		  $.each(Rune.slots[0].runes, function(idx, MainRune) {
				if(MainRune.id==mainRune){
					rune_name=MainRune.name;
					rune_icon='http://ddragon.leagueoflegends.com/cdn/img/'+MainRune.icon;
					rune_longDesc=MainRune.longDesc;
					$('.Runes:eq('+i+')>.Rune:eq(0)').append(
							"<img src='"+rune_icon+"' alt='"+rune_name+"'>"
							+"<div class='tip'><span class='yellow'>"+rune_name+"</span><span><br><br>"+rune_longDesc+"</span></div>" 
							);//
					
				}//메인룬 
			});//메인룬 위치찾기	
			}
			if(Rune.id==subRune){
				rune_name=Rune.name;
				rune_icon="http://ddragon.leagueoflegends.com/cdn/img/"+Rune.icon;
				$('.Runes:eq('+i+')>.Rune:eq(1)').append(
						"<img src='"+rune_icon+"' alt='"+rune_name+"'>"
						+"<div class='tip'><span class='yellow'>"+rune_name+"</span><span><br><br>보조룬"+"</span></div>" 
								
						);//
			}//보조룬 
		});//each종료
	});//getjson(rune)종료
			
}//rune()종료 

function Search(accountId,token){
	var riot="https://kr.api.riotgames.com";
	var userName="<%=userName%>";	
	var warpNum=2;
	$('.gameItemList').empty();
	$.ajax({
		url:"../riotapi",
		type:"GET",
	 	dataType:"json",
	 	data:{"URL":riot+"/lol/match/v4/matchlists/by-account/"+accountId+"?endIndex="+warpNum},
	 	headers:{"X-Riot-Token":token},
	 	success:function(json){
	 		l=0;
	 		item_num=0;
	 		Matches_sort=new Array();
	 		$.each(json.matches, function(idx,Matches) {
	 			Matches_sort[idx]=Matches.gameId;
	 		});
	 		Matches_sort.sort();
	 		Matches_sort.reverse();
	
		$.each(Matches_sort, function(i,ee) {
	 			 $.ajax({
	 				url:"../riotapi",
		 			type:"GET",
		 		 	dataType:"json",
		 		 	data:{"URL":riot+"/lol/match/v4/matches/"+ee},
		 		 	headers:{"X-Riot-Token":token},
		 		 	  async: false, 
		 		 	success:function(json){
		 		 			for(var e=0;e<10;e++){
		 		 			if(json.participantIdentities[e].player.accountId==accountId)
		 		 				participantId=e;
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
					case 440:
					var RankType="5vs5랭크게임"
					case 450:
					var RankType="칼바람";		
						break;
					case 840:
					var RankType="초급AI협곡"
					case 850:
					var RankType="중급AI협곡";	
						break;
					case 900:
					var RankType="우르프";
					default:
						break;
					}//switch
		 		 		var date1=new Date();//현재시간
	 		 			var date2=new Date(json.gameCreation);//게임했던시간
	 		 			var year=(date1.getYear()-date2.getYear())*365;
	 		 			var month=(date1.getMonth()-date2.getMonth())*31;
	 		 			var date=((date1.getDate()-date2.getDate())+year+month)+"일전";
	 		 			if((date1.getDate()==date2.getDate())){
	 		 				date=((date1.getHours()-date2.getHours())+"시간전")
	 		 				if(date1.getHours()==date2.getHours()){
	 		 					date=(date1.getMinutes()-date2.getMinutes())+"분전";
	 		 				}//if문
	 		 			}//if문////
	 		 			
		 		 		var GameDuration_min=Math.floor(json.gameDuration/60)+"분";
		 		 		var GameDuration_sec=Math.floor(json.gameDuration%60)+"초";
		 		 		var KDA=(json.participants[participantId].stats.deaths == 0)?'<b>Perfect</b>':
		 		 				+(Math.round((json.participants[participantId].stats.kills+json.participants[participantId].stats.assists)*100
		 		 						 /json.participants[participantId].stats.deaths)/100)+':1';
		 		 		var spell1="";
		 		 		var spell2="";
		 		 		var ks=json.participants[participantId].stats.kills+json.participants[participantId].stats.assists;
		 		 		var team1kill=0;
		 		 		var team2kill=0;
		 		 		for(t_kill=0;t_kill<10;t_kill++){
		 		 			if(json.participants[t_kill].teamId==100)
		 		 			team1kill+=json.participants[t_kill].stats.kills;
		 		 			else
		 		 			team2kill+=json.participants[t_kill].stats.kills;
		 		 		}
		 		 		console.log(team1kill+" "+team2kill);//ss
		 		 		$('.gameItemList').append(
		 		 			"<div class='GameItemWarp '>"+"<div class='GameItem "+win+"'>"  
		 		 			+"<div class='Content'>"
		 		 			+"<div class='GameStatus'>"
		 		 			+"<div class='GameType'>"+RankType+"</div>"
		 		 			+"<div class='TimeStamp'>"+date+"</div>"
		 		 			+"<div class='Bar'>"+"</div>"
		 		 			+"<div class='GameResult'>"+((win=="Win")?"승리":"패배")+"</div>"
		 		 			+"<div class='GameLength'>"+GameDuration_min+""+GameDuration_sec+"</div>"
		 		 			+"</div>"		//gameStatus 종료  
		 		 			+"<div class='GameSettingInfo'>"
		 		 			+"<div class='ChampionImageBox'>"+"</div>"
		 		 			+"<div class='SummonerSpell'>"
		 		 			+"</div>"		//SummonerSpell 종료
		 		 			+"<div class='Runes'>"
		 		 			+"<div class='Rune'></div>"
		 		 			+"<div class='Rune'></div>"
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
		 		 			+"<div class='KDARatio'>"+KDA+" 평점</div>"
		 		 			+"</div>"		// KDABox종료 
		 		 			+"<div class='Stats'>"
		 		 			+"<div class='Level'>레벨"+json.participants[participantId].stats.champLevel+"</div>"
		 		 			+"<div class='CS'>"+json.participants[participantId].stats.totalMinionsKilled+" ("
		 		 					+Math.floor(json.participants[participantId].stats.totalMinionsKilled/Math.floor(json.gameDuration/60)*10)/10+") "+"CS</div>"
		 		 			+"<div class='CKRate'>킬관여 "+((json.participants[participantId].teamId==100)?Math.floor(ks/team1kill*100):Math.floor(ks/team2kill*100))+"%</div>"
		 		 			+"</div>"
		 		 			+"<div class='Items'>"
		 		 			+"<div class='ItemList'>"+"</div>"
		 		 			+"<div class='Trinket'>"
		 		 			+"<img   alt='제어와드' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/"+"2055"+".png'/>"
		 		 			+"제어 와드 "+json.participants[participantId].stats.visionWardsBoughtInGame+"</div>"
		 		 			+"</div>" 	//Items끝
		 		 			+"<div class='FollowPlayers Names'>"
		 		 			+"<div class='Team 1'>"+"</div>"	//Team1 끝
		 		 			+"<div class='Team 2'>"+"</div>"	//Team2 끝
		 		 			+"</div>"	//FollowPlayers Names끝
		 		 			 +"<div class='StatsButton'>"
		 		 			+"<div class='Sts_content'>"
		 		 			+"<div class='rightMatch button'>"
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
			 		 			+"<div class='SummonerName' ><a href='Search.jsp?userName="+json.participantIdentities[j].player.summonerName+"'>"+textLengthOverCut(json.participantIdentities[j].player.summonerName,4,'..')+"</a></div>"
			 		 				+"</div>"
		 		 				);
			 		 				t1[t1_count]=json.participants[j].championId;
			 		 				t1_count++;
			 		 				}//if문
		 		 		if(json.participants[j].teamId=='200'){
			 		 		$('.Team.2:eq('+l+')').append(
 			 		 			"<div class='summoner' >"
 			 		 			+"<div class='ChamptionImage'>"+"</div>"
 			 		 			+"<div class='SummonerName' ><a href='Search.jsp?userName="+json.participantIdentities[j].player.summonerName+"'>"+textLengthOverCut(json.participantIdentities[j].player.summonerName,4,'..')+"</a></div>"
 			 		 				+"</div>"
			 		 				);
			 		 				t2[t2_count]=json.participants[j].championId;
	 		 						t2_count++;
			 		 			}
			 		 				}//for 문[j] if문 끝
			 		 				
			 		 				l++;
			 		 				var json_link=json.participants[participantId].stats;
			 		 				var item_number=new Array(json_link.item0,json_link.item1,json_link.item2,json_link.item6,json_link.item3,json_link.item4,json_link.item5);
			 		 				var mainRune=json_link.perk0;
			 		 				var subRune=json_link.perkSubStyle;
			 		 				rune(mainRune,subRune,item_num);//룬 추가
			 		 				item(item_number, item_num);//아이템 추가
			 		 				
			 		 				champion(json.participants[participantId].championId,t1,t2,item_num);//챔피언 이미지 추가	
			 		 				spell(json.participants[participantId].spell1Id,item_num);
			 		 				spell(json.participants[participantId].spell2Id,item_num);
			 		 				item_num++;
			 		 				
		 		 	}//Matchlist success
	 				
	 			});//게임상세 
	 				}); 
	 				//}//for문 끝 [i]
	
	 	}
	});//전적20게임 */
	
	
}
 /* $(function(){    
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
 });  */

///////////////////////////////api 키입력//////////////////
var riot="https://kr.api.riotgames.com";
var token="RGAPI-569481b5-d410-4193-a572-b44fc3b0cfe6";
var userName="<%=userName%>";
var accountId="";
var id="";
var participantId="";
var l=0;
var item_num=0;//index  

	////
$.ajax({
    url:"../riotapi",
 	type:"GET",
 	dataType:"json",
 	data:{"URL": riot+"/lol/summoner/v4/summoners/by-name/"+userName},
 	  headers:{
    "X-Riot-Token": token
    },  
    success: function(json) {
   		id=json.id;
 		accountId=json.accountId;
 		$("#summonerName").append("<span class='name'>"+json.name+"</span>");
 		$("#profileIcon").append("<img class='profileimg' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/profileicon/"+json.profileIconId+".png'>"+"<span class='summonerlevel'>"+json.summonerLevel+"</span>");
 		 $.ajax({
 		    url:"../riotapi",
 		 	type:"GET",
 		 	dataType:"json",
 		 	data:{"URL":riot+"/lol/league/v4/entries/by-summoner/"+json.id},
 		 	headers:{"X-Riot-Token":token},
 		    success: function(json) {
 		    		 $.each(json, function(i, rank) {
 		    			 switch(rank.rank) {
 		    			 case "I": var tier=1; break; //
 		    			 case "II": var tier=2; break; 
 		    			 case "III": var tier=3; break; 
 		    			 case "IV": var tier=4; break; 
 		    			 }//
 		    		 	if(rank.queueType=="RANKED_SOLO_5x5"){
 		    		 		$('#mainBox .tier_imgbox').append("<img class='image' src='https://raw.githubusercontent.com/ByeonJaeJeong/LOLSearch/master/WebContent/img/"+json[0].tier+".png'>");
 			 		 		$('#mainBox .tier_Rank').append("<span>"+rank.tier.toLowerCase() +"</span><span class='number'> "+tier+"</span>");
 			 		 		$('#mainBox .tier_info').append("<b>"+rank.leaguePoints+"LP</b><span>/"+rank.wins+"승"+rank.losses+"패</span><br>"
 			 		 				+"<span>승률"+Math.floor(rank.wins/(rank.wins+rank.losses)*100)+"%</span><br>");
 			 		 		if(rank.miniSeries){
			 		 				var winlose=new Array();
			 		 					winlose=(rank.miniSeries.progress).split("");
			 		 			$('#mainBox .tier_info').append("<div class='Series'><span>승급전 진행중</span><br></div>");
			 		 			$('#mainBox .tier_info>.Series').append("<div class='Content'></div>")
			 		 			for(var dat=0;dat<winlose.length;dat++)
			 		 			$('#mainBox .tier_info>.Series>.Content').append("<div class='"+winlose[dat]+"'>"+winlose[dat]+"</div>");
			 		 			}
 		    		 	}//솔랭일때
 		    		 	if(rank.queueType=="RANKED_FLEX_SR"){
 		    		 		$('#subBox .tier_imgbox').append("<img class='image' src='https://raw.githubusercontent.com/ByeonJaeJeong/LOLSearch/master/WebContent/img/"+json[0].tier+".png'>");
 			 		 		$('#subBox .tier_Rank').append("<span>"+rank.tier+"</span><span class='number'>"+tier+"</span>");
 			 		 		$('#subBox .tier_info').append("<b>"+rank.leaguePoints+"LP</b><span>/"+json[0].wins+"승"+json[0].losses+"패</span><br>"
 			 		 				+"<span>승률"+Math.floor(rank.wins/(rank.wins+rank.losses)*100)+"%</span><br>");//
 			 		 		if(json[0].miniSeries){
 			 		 				var winlose=new Array();
 			 		 					winlose=(rank.miniSeries.progress).split("");
 			 		 			$('#subBox .tier_info').append("<div class='Series'><span>승급전 진행중</span><br></div>");
 			 		 			$('#subBox .tier_info>.Series').append("<div class='Content'></div>")
 			 		 			for(var dat=0;dat<winlose.length;dat++)
 			 		 			$('#subBox .tier_info>.Series>.Content').append("<div class='"+winlose[dat]+"'>"+winlose[dat]+"</div>");
 			 		 			}
 		    		 	}//자랭일때//
 		    		 });//each
 		    		  if($('#mainBox .tier_Rank')[0].innerText==""){
 	 		    		$('#mainBox .tier_imgbox').append("<img class='image' src='https://raw.githubusercontent.com/ByeonJaeJeong/LOLSearch/master/WebContent/img/UNRANK.png'>");
 		 		 		$('#mainBox .tier_Rank').append("<span>Unranked</span>");
 	 		    	 }//솔랭default
 	 		    	  if($('#subBox .tier_Rank')[0].innerText==""){
 	 		    		 $('#subBox .tier_imgbox').append("<img class='image' src='https://raw.githubusercontent.com/ByeonJaeJeong/LOLSearch/master/WebContent/img/UNRANK.png'>");
 	 	 		 		$('#subBox .tier_Rank').append("<span>Unranked</span>");
 	 		    	  }//자랭default 
 		    }//success
 		});//소환사 티어 전적
 		//
 		
    },error:function(request,status,error){
        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
//

});//소환사 검색
	 		 				
	 		 			
	 		 				
	 		
	 		


</script>
<jsp:include page="../inc/header.jsp"/>
<div class="cotainer">
<div class="content-header">
<div id="profileIcon" class="profileicon"></div>
<div class="profile">
<div id="summonerName" class="summonername"></div>
<div class="Search">
<input type="button" value="전적검색" onclick="Search(accountId,token)">
</div>
</div>
</div>
<!--  header -->
<div class="menu">
<div class="content">
<div class="side_content">
<div class="tierbox box"id="mainBox">
<div class="tier_imgbox"></div>
<div class="tierRankInfo">
<div class="tier_type">솔로랭크</div>
<div class="tier_Rank"></div>
<div class="tier_info"></div>
<div class="legueName"></div></div>
</div><!-- 솔로랭크 박스 -->
<div class="tierbox box"id="subBox">
<div class="tier_imgbox"></div>
<div class="tierRankInfo">
<div class="tier_type" >자유랭크</div>
<div class="tier_Rank"></div>
<div class="tier_info"></div>
<div class="legueName"></div></div>
</div><!-- 자유랭크 박스 -->
</div><!-- side content -->
<div class="main_content">
<div class="navigation"></div>
<div class="gameItemList" id="gameItemList"></div>

</div>
</div>
</div>

</div>

<jsp:include page="../inc/footer.jsp"/>
</body>
</html>
