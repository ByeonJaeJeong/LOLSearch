package net.Search.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.User.db.UserBean;
import net.User.db.UserDAO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String user_id=request.getParameter("id");
		String user_pass=request.getParameter("pass");
		String url=request.getParameter("url");
		String param_n=request.getParameter("param");
		String param="";
		
		if(param_n!=null){
		param="?"+URLEncoder.encode(param_n,"UTF-8").replace("+", "%20").replace("*", "%2A").replace("%7E", "~").replace("%3D","=");
		}else{
			param="";
		}
		System.out.println("인코딩한url->>"+url);
		UserDAO udao=new UserDAO();
		int check=udao.LoginUser(user_id, user_pass);
		UserBean ub=udao.UserInfo(user_id);
		ActionForward forward =new ActionForward();
		if(check==1){
			HttpSession session=request.getSession();
			session.setAttribute("user_id", user_id);
			session.setAttribute("usernickName", ub.getNickname());
			session.setAttribute("userprofileicon",ub.getProfileicon());
			System.out.println("ub:"+ub.getName());
			forward.setPath(url+param);
			forward.setRedirect(true);
		}else if(check==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("  alert('비밀번호 오류입니다.'); ");
			out.print(" location.href='./login.kr'; ");
			out.print("</script>");
			out.close();

			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("  alert('존재하지 않는 아이디 입니다.'); ");
			out.print(" location.href='./login.kr'; ");
			out.print("</script>");
			out.close();
			return null;
		}
		return forward;
	}
	
}
