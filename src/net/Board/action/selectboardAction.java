package net.Board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;
import net.Comment.db.commentBean;
import net.Comment.db.commentDAO;

public class selectboardAction	implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int w_num=Integer.parseInt(request.getParameter("w_num"));
		BoardDAO bdao=new BoardDAO();
		bdao.addreadCount(w_num);
		BoardBean bb=bdao.selectBoard(w_num);
		bb.toString();
		request.setAttribute("Boardinfo", bb);
		commentDAO cdao=new commentDAO();
		ArrayList<commentBean> cbList=cdao.selectcomment(w_num);
		request.setAttribute("cbList", cbList);
		ActionForward forward=new ActionForward();
		forward.setPath("./posts/postsView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
