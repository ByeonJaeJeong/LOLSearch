package net.Board.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Comment.db.commentBean;
import net.Comment.db.commentDAO;

public class commentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int w_num=Integer.parseInt(request.getParameter("w_num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println(w_num);
		commentBean cb=new commentBean();
		cb.setBoard_num(w_num);
		cb.setUser_id(request.getParameter("user_id"));
		cb.setUser_nickname(request.getParameter("user_nickName"));
		cb.setContent(request.getParameter("content"));
		cb.setReg_date(new Timestamp(System.currentTimeMillis()));
		commentDAO cdao=new commentDAO();
		int check=cdao.insertcomment(cb);
		if(check==1){
		ActionForward forward=new ActionForward();
		forward.setPath("view.net?w_num="+w_num+"&pageNum="+pageNum);
		forward.setRedirect(true);
			return forward;
		}else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out =response.getWriter();
			out.print("<script>");
			out.print("alert('데이터입력실패');");
			out.print("history.go(-1);");
			out.print("</script>");
			return null;
		}
	}
	
}
