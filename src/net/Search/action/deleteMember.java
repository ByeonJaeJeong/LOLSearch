package net.Search.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.User.db.UserDAO;

public class deleteMember implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String user_id=request.getParameter("user_id");
		String user_pass=request.getParameter("user_pass");
		UserDAO udao=new UserDAO();
		int check=udao.deleteUser(user_id, user_pass);
		System.out.println("회원탈퇴 값:"+check);
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("  alert('회원탈퇴 성공'); ");
			out.print(" location.href='./logOut.kr' ");
			out.print("</script>");
			out.close();
		
		return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("  alert('회원탈퇴 실패'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}
		
		
	}

}
