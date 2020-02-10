package net.Search.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.db.BoardBean;
import net.Board.db.BoardDAO;

public class insertBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content").replace("<p>", "").replace("</p>","<br>");
		String boardType=request.getParameter("boardType");
		
	
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
		if(check==1){
			ActionForward forward=new ActionForward();
			forward.setPath("./community.kr");
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
