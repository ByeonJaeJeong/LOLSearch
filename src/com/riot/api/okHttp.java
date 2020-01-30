package com.riot.api;

import java.util.ArrayList;

import javax.xml.ws.soap.AddressingFeature.Responses;

import org.apache.catalina.User;
import org.apache.commons.collections4.SetUtils;
import org.apache.jasper.tagplugins.jstl.core.Otherwise;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class okHttp {
	public static String message="";
	private static String url = "https://kr.api.riotgames.com";
	private static String API_KEY = "RGAPI-d81e1def-0395-4d54-a9e2-df8ec2e84f31";
	private static String name;
	private static String id;
	private static String accountId;
	private static int index=3;
	private static ArrayList<String> matches=new ArrayList<String>();
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String summoner(){
		
			try {
				OkHttpClient client = new OkHttpClient();
				Request request = new Request.Builder()
						.addHeader("X-Riot-Token", API_KEY)
						.url(url+"/lol/summoner/v4/summoners/by-name/"+name)
						.build(); //GET Request 
	                        
	                       //동기 처리시 execute함수 사용 
				Response response = client.newCall(request).execute(); 
				
				//출력 
				 message = response.body().string();
			} catch (Exception e){
				System.err.println(e.toString());
			}
			//System.out.println(message);
			Gson gson =new Gson();
			JsonParser parser= new JsonParser();
			id=(String)parser.parse(message).getAsJsonObject().get("id").toString().replace("\"","");
			accountId=(String)parser.parse(message).getAsJsonObject().get("accountId").toString().replace("\"","");
		return message;
	}
	
	public String summoner_tier(){
		
		try {
			System.out.println(id);
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
					.addHeader("X-Riot-Token", API_KEY)
					.url(url+"/lol/league/v4/entries/by-summoner/"+id)
					.build(); //GET Request 
                        
                       //동기 처리시 execute함수 사용 
			Response response = client.newCall(request).execute(); 
			
			//출력 
			 message = response.body().string();
			
		} catch (Exception e){
			System.err.println(e.toString());
		}
	return message;
	}
public String summoner_game_id(){
		
		try {
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
					.addHeader("X-Riot-Token", API_KEY)
					.url(url+"/lol/match/v4/matchlists/by-account/"+accountId+"?endIndex="+index)
					.build(); //GET Request 
                        
                       //동기 처리시 execute함수 사용 
			Response response = client.newCall(request).execute(); 
			//출력 
			 message = response.body().string();
		} catch (Exception e){
			System.err.println(e.toString());
		}
		Gson gson =new Gson();
		JsonParser parser= new JsonParser();
		JsonArray matchesjson=(JsonArray)parser.parse(message).getAsJsonObject().get("matches");
		for(int i=0;i<index;i++){
			JsonObject matchjson1=(JsonObject)matchesjson.getAsJsonArray().get(i);
			String matchjson2=(String)matchjson1.getAsJsonObject().get("gameId").toString();
			matches.add(matchjson2);
		}
	return message;
	}
public ArrayList<String> summoner_game(){
	ArrayList<String> messages=new ArrayList<>();
	try {
		for(int i=0;i<matches.size();i++){
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder()
				.addHeader("X-Riot-Token", API_KEY)
				.url(url+"/lol/match/v4/matches/"+matches.get(i))
				.build(); //GET Request 
                    
                   //동기 처리시 execute함수 사용 
		Response response = client.newCall(request).execute(); 
		//출력 
		 message = response.body().string();
		 messages.add(message);
		}
	} catch (Exception e){
		System.err.println(e.toString());
	}
	System.out.println(messages.get(0).toString());
	return messages;
	}
	public static void main(String[] args) {
		okHttp okHttp =new okHttp();
		okHttp.setName("오늘도김감자");
		okHttp.summoner();
		okHttp.summoner_tier();
		okHttp.summoner_game_id();
		okHttp.summoner_game();
	}
}
