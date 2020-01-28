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
						+"</div>"///
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
	 
$.getJSON('../json/summoner', function(spell) {
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
var api_key="RGAPI-efd0423f-219b-4f54-bca9-e343460501c8";
var accountId="";
var id="";
var participantId="";
var l=0;
var item_num=0;//index  
var warpNum=3;//전적 검색 갯수 ;


$.ajax({
	    url:riot+"/lol/summoner/v4/summoners/by-name/"+userName,
	 	type:"GET",
	 	dataType:"json",
	 	headers:{
	    "X-Riot-Token": "RGAPI-efd0423f-219b-4f54-bca9-e343460501c8",
	    "Accept-Language": "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7",
	    },
	    success: function(json) {
	   		id=json.id;
	 		accountId=json.accountId;
	 		$("#summonerName").append("<span class='name'>"+json.name+"</span>");
	 		$("#profileIcon").append("<img class='profileimg' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/profileicon/"+json.profileIconId+".png'>"+"<span class='summonerlevel'>"+json.summonerLevel+"</span>");
	 		$.ajax({
	 		    url:riot+"/lol/league/v4/entries/by-summoner/"+json.id+"?api_key="+api_key,
	 		 	type:"GET",
	 		 	dataType:"json",
	 		 	headers:{"X-Riot-Token":api_key,
	 		 		'Access-Control-Allow-Origin':'*'
	 		 		},
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
	 			url:riot+"/lol/match/v4/matchlists/by-account/"+json.accountId+"?endIndex="+warpNum,
	 			type:"GET",
	 		 	dataType:"json",
	 		 	headers:{"X-Riot-Token":api_key},
	 		 	success:function(json){
	 		 		Matches_sort=new Array();
	 		 		$.each(json.matches, function(idx,Matches) {
	 		 			Matches_sort[idx]=Matches.gameId;
	 		 		});
	 		 	
				
					$.each(Matches_sort, function(i,ee) {
						
	 		 			$.ajax({
	 		 				url:riot+"/lol/match/v4/matches/"+Matches_sort[i],
	 			 			type:"GET",
	 			 		 	dataType:"json",
	 			 		 	headers:{"X-Riot-Token":api_key,
	 			 		 		'Access-Control-Allow-Origin':'*'
	 			 		 		},
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
								case 450:
								var RankType="칼바람";		
									break;
								case 850:
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
	 			 		 		var KDA=(json.participants[participantId].stats.deaths == 0)?'<b>Perfect</b>':
	 			 		 				+(Math.round((json.participants[participantId].stats.kills+json.participants[participantId].stats.assists)
	 			 		 						+""+json.participants[participantId].stats.deaths*100)/100)+':1';
	 			 		 		var spell1="";
	 			 		 		var spell2="";
	 			 		 		
	 			 		 		$('.main_content').append(
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
	 			 		 			+"<div class='ChampionImageBox'>"/* +"<img class='ChampionImage' src='http://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/Aatrox.png'>" */+"</div>"
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
	 		 			setTimeout(5);
	 		 				}); 
	 		 				//}//for문 끝 [i]
	 		
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
