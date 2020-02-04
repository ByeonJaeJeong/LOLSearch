package net.Search.action;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.Search.action.Action;
import net.Search.action.ActionForward;

public class SearchFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}

	
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("실행");
			String uri=request.getRequestURI();
			String name=request.getContextPath();
			
			String command=uri.substring(name.length());
			System.out.println(command);
			//처리페이지에 대한 정보 객체
			Action action= null;
			
			//페이지 이동정보 저장 객체
			ActionForward forward= null;
			
			if(command.equals("/main.kr")){
				forward=new ActionForward();
				forward.setPath("./main/main.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/Search.kr")){
				forward=new ActionForward();
				forward.setPath("./main/Search.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/login.kr")){
				forward=new ActionForward();
				forward.setPath("./login/loginForm.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/MemberJoin.kr")){
				forward=new ActionForward();
				forward.setPath("./login/insertForm.jsp");
				forward.setRedirect(false);
			}else if(command.equals("/MemberJoinAction.kr")){
				action=new InsertAction();
				try{
					forward=action.execute(request, response);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(forward!=null){//페이지 이동 정보가 있을때 처리
				//페이지 이동 sendRedirect,forward
				if(forward.isRedirect()){//true일때
					response.sendRedirect(forward.getPath());
				}else{//false일때
					RequestDispatcher dis=
							request.getRequestDispatcher(forward.getPath());
					dis.forward(request, response);
				}
			}
		
	}
	
}
