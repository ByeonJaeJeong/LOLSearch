package net.Search.action;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");//utf-8인코딩
		// TODO Auto-generated method stub
		String url=request.getParameter("url");
		String param_n=request.getParameter("param");
		String param="";
		if(param_n!=null){
		param=URLEncoder.encode(param_n,"UTF-8").replace("+", "%20").replace("*", "%2A").replace("%7E", "~").replace("%3D","=");
		}else{
			param="";
		}
		System.out.println("logouturl:"+url);
		ActionForward forward =new ActionForward();
		HttpSession session=request.getSession();
		session.removeAttribute("user_id");
		session.removeAttribute("usernickName");
		session.removeAttribute("userInfo");
		forward.setPath(url+"?"+param);
		forward.setRedirect(true);
		
		
		return forward;
	}
	

}
