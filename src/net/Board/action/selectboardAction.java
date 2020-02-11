package net.Board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;

public class selectboardAction	implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int w_num=Integer.parseInt(request.getParameter("w_num"));
		BoardDAO bdao=new BoardDAO();
		BoardBean bb=bdao.selectBoard(w_num);
		bb.toString();
		
		request.setAttribute("Boardinfo", bb);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./posts/postsView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
