package net.Search.action;

import java.net.URLEncoder;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.User.db.UserBean;
import net.User.db.UserDAO;

public class kkaoLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");//utf-8인코딩
		String url=request.getParameter("url");
		String param_n=request.getParameter("param");
		String param="";
		if(param_n!=null || !param_n.equals("null")){
		param=URLEncoder.encode(param_n,"UTF-8").replace("+", "%20").replace("*", "%2A").replace("%7E", "~").replace("%3D","=");
		}else{
			param="";
		}
		UserDAO udao =new UserDAO();
		ActionForward forward =new ActionForward();
		int check_id=udao.idcheck(request.getParameter("id"));
		System.out.println("check_id:"+check_id);
		if(check_id!=0){//회원정보가 없을때
			forward.setPath("/kkaoInsertForm.kr");
			forward.setRedirect(false);
			return forward;
		}else{//회원정보가 있을때
			UserBean ub=udao.UserInfo(request.getParameter("id"));
			forward.setPath(url+"?"+param);
			forward.setRedirect(true);
			HttpSession session= request.getSession();
			session.setAttribute("user_id",request.getParameter("id"));
			session.setAttribute("usernickName", ub.getNickname());
			return forward;
		}
	}

}
