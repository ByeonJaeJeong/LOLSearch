package net.Board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;
import net.Board.action.Action;
import net.Board.action.ActionForward;

public class insertBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String type=request.getParameter("boardType");
		System.out.println("type="+type);
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String boardType=request.getParameter("boardType");
		String pageNum=request.getParameter("pageNum");
	
		BoardBean bb= new BoardBean();
		bb.setId(id);
		bb.setNickname(nickname);
		bb.setSubject(subject);
		bb.setContent(content);
		bb.setBoardType(boardType);
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		System.out.println(bb.toString());
		BoardDAO bdao=new BoardDAO();
		int check=bdao.insertBoard(bb);
		System.out.println("check="+check);
		System.out.println("pageNum="+pageNum);
		if(check>0){
			ActionForward forward=new ActionForward();
			forward.setPath("./view.net?w_num="+check+"&pageNum="+pageNum+"&type="+URLEncoder.encode(type,"UTF-8"));
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
