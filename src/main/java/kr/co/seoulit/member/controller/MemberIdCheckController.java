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

public class MemberIdCheckController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();

	 	try {		
			MemberServiceFacade sf=MemberServiceFacadeImpl.getInstance();
			MemberBean bean=sf.checkId(request.getParameter("id"));
			System.out.print(request.getParameter("id"));
	 		 json.put("msg",bean==null? "사용가능한 ID" :"이미 사용중인 ID");
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

