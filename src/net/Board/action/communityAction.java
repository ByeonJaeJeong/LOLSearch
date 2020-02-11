package net.Board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;

public class communityAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageNum=1;
		int PageSize=10;
		if(request.getParameter("pageNum")!=null){
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		String type=request.getParameter("type");
		BoardDAO bdao=new BoardDAO();
		ArrayList<BoardBean> bbList=new ArrayList<BoardBean>();
		if(type==null || type.equals("*")){
		bbList=bdao.AllselectBoardList(pageNum, PageSize);
		}else{
		bbList=bdao.selectBoardList(type, pageNum, PageSize);
		}
		request.setAttribute("bbList", bbList);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./posts/community.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

	
}
