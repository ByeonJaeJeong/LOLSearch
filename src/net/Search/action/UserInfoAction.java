package net.Search.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.User.db.UserDAO;

public class UserInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");//utf-8인코딩
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String url=request.getParameter("url");
		String user_id=(String)session.getAttribute("user_id");
		UserDAO udao=new UserDAO();
		session.setAttribute("userInfo",udao.UserInfo(user_id));
		ActionForward forward=new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}
	
	
}
