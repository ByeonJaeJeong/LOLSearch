package com.riot.api;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@WebServlet("/riotapi")
public class okHttpServlet extends HttpServlet{
	public static String message="";
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("riotapi()호출");
		String url=request.getParameter("URL");
		String API_KEY =request.getHeader("X-Riot-Token");
		System.out.println("url:"+url+"api_key:"+API_KEY);
		try {
			OkHttpClient client = new OkHttpClient();
			Request request2 = new Request.Builder()
					.addHeader("X-Riot-Token", API_KEY)
					.url(url)
					.build(); //GET Request 
                        
                       //동기 처리시 execute함수 사용 
			Response response2 = client.newCall(request2).execute(); 
			
			//출력 
			 message = response2.body().string();
			 System.out.println(message);
			 request.setAttribute("Json",message);
				
				
		} catch (Exception e){
			System.err.println(e.toString());
		}
		RequestDispatcher dis=
				request.getRequestDispatcher("/main/riotapi.jsp");
		
		dis.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("riotapi()호출");
		
		String url = response.getHeader("URL");
		System.out.println(url);
		String API_KEY = response.getHeader("X-Riot-Token");
		System.out.println("url:"+url+"api_key:"+API_KEY);
		try {
			OkHttpClient client = new OkHttpClient();
			Request request2 = new Request.Builder()
					.addHeader("X-Riot-Token", API_KEY)
					.url(url.toString())
					.build(); //GET Request 
                        
                       //동기 처리시 execute함수 사용 
			Response response2 = client.newCall(request2).execute(); 
			
			//출력 
			 message = response2.body().string();
			 System.out.println(message);
			 request.setAttribute("Json",message);
				
				
		} catch (Exception e){
			System.err.println(e.toString());
		}
		RequestDispatcher dis=
				request.getRequestDispatcher("/main/riotapi.jsp");
		
		dis.forward(request, response);
	}

	
	
}
