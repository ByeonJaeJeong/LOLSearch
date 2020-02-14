package net.Search.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;
import net.Search.action.Action;
import net.Search.action.ActionForward;

public class mainpostsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardDAO bdao=new BoardDAO();
		
		
		
		ArrayList<BoardBean> bbList=bdao.MainselectBoardList(1, 10);
		
		System.out.println("bbListsize="+bbList.size());
		request.setAttribute("bbList", bbList);
		ActionForward forward=new ActionForward();
		
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
}
