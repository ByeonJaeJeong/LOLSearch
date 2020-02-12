package net.Board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Board.action.Action;
import net.Board.action.ActionForward;

public class postsController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doprocess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doprocess(req, resp);
	}
	
	protected void doprocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getRequestURL());
		request.setCharacterEncoding("UTF-8");
		String uri=request.getRequestURI();
		String name=request.getContextPath();
		String command=uri.substring(name.length());
		//처리페이지에 대한 정보 객체
		Action action= null;
		
		//페이지 이동정보 저장 객체
		ActionForward forward= null;
		
		if(command.equals("/community.net")){
			action=new communityAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/write.net")){
			forward=new ActionForward();
			forward.setPath("./posts/writeForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/writeAction.net")){
				action=new insertBoardAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/view.net")){
			action=new selectboardAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/comment.net")){
			action=new commentAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/rewrite.net")){
			forward=new ActionForward();
			forward.setPath("./posts/rewriteForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/rewriteAction.net")){
			action=new reinsertBoardAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward!=null){//페이지 이동 정보가 있을때 처리
			//페이지 이동 sendRedirect,forward
			System.out.println("path:"+forward.getPath());
			
			if(forward.isRedirect()){//true일때
				response.sendRedirect(forward.getPath());
			}else{//false일때
				
				RequestDispatcher dis=
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}//sendRedirect 인지 아닌지
		}//forward not null
		
	}//process
}//main