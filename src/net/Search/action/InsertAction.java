package net.Search.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.User.db.UserBean;
import net.User.db.UserDAO;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");//utf-8인코딩
		String birth=request.getParameter("year")+request.getParameter("month")+request.getParameter("day");
		UserBean ub= new UserBean(); //userbean 객체에 파라메타 저장
		ub.setId(request.getParameter("id"));
		ub.setPass(request.getParameter("pass"));
		ub.setName(request.getParameter("name"));
		ub.setBirth(birth);
		ub.setGender(request.getParameter("gender"));
		ub.setEmail(request.getParameter("email"));
		ub.setReg_date(new Timestamp(System.currentTimeMillis()));
		UserDAO udao =new UserDAO();
		System.out.println(ub.toString());
		int check=udao.insertMember(ub);
		System.out.println(check);
		ActionForward forward =new ActionForward();
		if(check==1){
			forward.setPath("./login.kr");
			forward.setRedirect(true);
		}else{
			System.out.println("회원가입 실패");
			forward.setPath("./MemberJoin.kr");
			forward.setRedirect(true);
		}
		return forward;
	}

}
