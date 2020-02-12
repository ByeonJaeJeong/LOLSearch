package net.Board.action;

import java.awt.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;
import net.Comment.db.commentBean;
import net.Comment.db.commentDAO;

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
		int[] ccount_array=new int[bbList.size()];
		commentDAO cdao=new commentDAO();
		for (int i=0; i<bbList.size();i++){
			BoardBean bb=bbList.get(i);
			ccount_array[i]=cdao.commentcount(bb.getWritenum());
		}
		System.out.println(ccount_array.toString());
		request.setAttribute("ccount_array", ccount_array);
		request.setAttribute("bbList", bbList);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./posts/community.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

	
}
