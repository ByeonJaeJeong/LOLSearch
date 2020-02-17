package net.Search.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;
import net.Comment.db.commentDAO;
import net.Search.action.Action;
import net.Search.action.ActionForward;

public class mainpostsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardDAO bdao=new BoardDAO();
		commentDAO cdao=new commentDAO();
		
		
		ArrayList<BoardBean> bbList=bdao.MainselectBoardList(1, 10);
		
		System.out.println("bbListsize="+bbList.size());
		request.setAttribute("bbList", bbList);
		
		int[] ccount_array=new int[bbList.size()];
		for (int i=0; i<bbList.size();i++){
			BoardBean bb=bbList.get(i);
			ccount_array[i]=cdao.commentcount(bb.getWritenum());
		}
		System.out.println(ccount_array.toString());
		request.setAttribute("ccount_array", ccount_array);
		
		
		ActionForward forward=new ActionForward();
		
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
}
