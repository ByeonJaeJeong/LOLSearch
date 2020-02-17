package net.Search.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.User.db.UserDAO;

public class passreplace implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String user_id=request.getParameter("user_id");
		String user_pass=request.getParameter("user_pass");
		String input_pass=request.getParameter("input_pass");
		
		UserDAO udao=new UserDAO();
		int check=udao.replacePass(user_id, user_pass, input_pass);
		System.out.println(check);
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호 변경 성공');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}else if(check==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("  alert('비밀번호 입력 오류'); ");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.print("<script>");
			out.print("  alert('비밀번호 변경 실패!!'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			return null;
		}
		
	}
	
}
