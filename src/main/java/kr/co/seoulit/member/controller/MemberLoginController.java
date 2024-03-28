package kr.co.seoulit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.seoulit.common.servlet.ModelAndView;
import kr.co.seoulit.common.servlet.mvc.Controller;
import kr.co.seoulit.member.sf.MemberServiceFacade;
import kr.co.seoulit.member.sf.MemberServiceFacadeImpl;
import kr.co.seoulit.member.to.MemberBean;
import net.sf.json.JSONObject;

public class MemberLoginController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();

	 	try {		
			MemberServiceFacade sf=MemberServiceFacadeImpl.getInstance();
			MemberBean bean=sf.login(request.getParameter("id"),request.getParameter("pw"));
			
			 json.put("msg",bean==null?"로그인실패 아이디와 비밀번호를 확인해주세요":"로그인성공");
	 		 json.put("errorCode", 0);
	 		 json.put("errorMsg", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 json.put("errorCode", -1);
			 json.put("errorMsg", e.getMessage());
		}	
	 	PrintWriter out=response.getWriter();
	 	out.write(json.toString());
		return null;
	}
}

	