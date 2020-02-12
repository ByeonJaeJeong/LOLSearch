package net.Board.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;

public class reinsertBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

			
		
			BoardBean bb= new BoardBean();
			bb.setId(request.getParameter("id"));
			bb.setNickname(request.getParameter("nickname"));
			bb.setSubject(request.getParameter("subject"));
			bb.setContent(request.getParameter("content"));
			bb.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
			bb.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
			bb.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
			bb.setReg_date(new Timestamp(System.currentTimeMillis()));
			bb.setBoardType(request.getParameter("boardType"));
			BoardDAO bdao=new BoardDAO();
			
			int check=bdao.reInsertBoard(bb);
			if(check>0){
			ActionForward forward = new ActionForward();
			forward.setPath("./view.net?w_num="+check);
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
