package net.Board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardDAO;
import net.Comment.db.commentDAO;

public class deleteBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int w_num=Integer.parseInt(request.getParameter("w_num"));
		String pageNum=request.getParameter("pageNum");
		String type=request.getParameter("type");
		
		BoardDAO bdao=new BoardDAO();
		
		int check=bdao.deleteBoard(w_num);
		commentDAO cdao=new commentDAO();
		cdao.deletecomment(w_num);
		if(check==1){
			ActionForward forward= new ActionForward();
			forward.setPath("./community.net?pageNum="+pageNum+"&type="+URLEncoder.encode(type,"UTF-8"));
			forward.setRedirect(true);
			return forward;
		}else{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out =response.getWriter();
			out.print("<script>");
			out.print("alert('삭제실패');");
			out.print("history.go(-1);");
			out.print("</script>");
			return null;
		}
	}

	
}
