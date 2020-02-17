package net.Search.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.User.db.UserBean;
import net.User.db.UserDAO;

public class updateUser implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String user_id=request.getParameter("user_id");
		String nickname=request.getParameter("nickName");
		String birthday=request.getParameter("birthday");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		
		UserDAO udao=new UserDAO();
		UserBean ub= new UserBean();
		ub.setId(request.getParameter("user_id"));
		ub.setNickname(request.getParameter("nickName"));
		ub.setBirth(request.getParameter("birthday"));
		ub.setGender(request.getParameter("gender"));
		ub.setEmail(request.getParameter("email"));
		
		int check=udao.updateUser(ub);
		if(check==1){
		HttpSession session=request.getSession();
		session.setAttribute("usernickName", ub.getNickname());
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.print("<script>");
		out.print(" alert('회원정보 변경성공!'); ");
		out.print(" location.href='./memberInfo.kr' ");
		out.print("</script>");
		out.close();
		return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print(" alert('회원정보 변경실패!'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}
			
	
	}

}
