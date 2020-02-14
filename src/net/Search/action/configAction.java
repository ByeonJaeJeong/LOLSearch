package net.Search.action;

import java.awt.Window;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.User.db.UserDAO;

public class configAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			int maxSize=10*1024*1024;//10메가
			
			String user_id="";
			String nickname="";
			String fileName="";
			String OFileName="";
			String path="/LOLSearch/img/User-profileicon/";
			
			try{
			MultipartRequest mutip=new MultipartRequest(
					request,
					request.getSession().getServletContext().getRealPath("/img/User-profileicon"),
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			
			user_id=mutip.getParameter("user_id");
			
			nickname=mutip.getParameter("nickname");
			UserDAO udao=new UserDAO();
			HttpSession session=request.getSession();
			if(nickname!=null){
				udao.updatenickname(user_id, nickname);
				session.setAttribute("usernickName",nickname);
			}
			Enumeration files=mutip.getFileNames();
			String file1=(String)files.nextElement();
			fileName=mutip.getFilesystemName(file1);
			OFileName= mutip.getOriginalFileName(file1);
			System.out.println("fileName="+fileName); 
			udao.updateprofile(user_id,path+fileName);
			System.out.println("업로드 성공");
			session.setAttribute("userprofileicon",path+fileName);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			ActionForward forward=new ActionForward();
			forward.setPath("./realoadAction.kr");
			forward.setRedirect(true);
			return forward;
			
	}

	
	
}
